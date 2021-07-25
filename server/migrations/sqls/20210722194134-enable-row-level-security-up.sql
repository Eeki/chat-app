CREATE FUNCTION chat.current_person_id() RETURNS integer AS $$
    SELECT nullif(current_setting('jwt.claims.person_id', TRUE),'')::integer;
$$
LANGUAGE sql
STABLE;

CREATE FUNCTION chat.is_chat_participant(chat_id integer) RETURNS boolean AS $$
BEGIN
    RETURN EXISTS(
        SELECT *
        FROM chat.chat_person
        WHERE chat_person.chat_id = is_chat_participant.chat_id AND person_id = chat.current_person_id()
    );
END;
$$
LANGUAGE plpgsql
STABLE;

GRANT EXECUTE ON FUNCTION chat.current_person_id () TO chat_person;
GRANT EXECUTE ON FUNCTION chat.is_chat_participant (integer) TO chat_person;

GRANT UPDATE, DELETE, INSERT ON TABLE chat.message TO chat_person;

ALTER TABLE chat.message enable ROW level SECURITY;

CREATE POLICY update_message ON chat.message FOR UPDATE TO chat_person USING
    (person_id = chat.current_person_id());

CREATE POLICY delete_message ON chat.message FOR DELETE TO chat_person USING
    (person_id = chat.current_person_id());

CREATE POLICY create_message ON chat.message FOR INSERT TO chat_person WITH CHECK
    (chat.is_chat_participant(message.chat_id))

-- Getting messages is done trough function messages_by_chat to improve performance
