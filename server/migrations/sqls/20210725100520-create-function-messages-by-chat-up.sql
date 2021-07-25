CREATE FUNCTION chat.messages_by_chat(chat_id integer)
RETURNS SETOF chat.message AS $$
    SELECT m
    FROM chat.message m
    INNER JOIN chat.chat c
        ON m.chat_id = c.id
    INNER JOIN chat.chat_person cp
        ON c.id = cp.chat_id
    WHERE cp.person_id = chat.current_person_id() AND cp.chat_id = messages_by_chat.chat_id;
$$
    LANGUAGE sql
    SECURITY DEFINER
    STABLE;

GRANT EXECUTE ON FUNCTION chat.messages_by_chat(integer) TO chat_person;
