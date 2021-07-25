CREATE FUNCTION chat.create_chat_person(chat_id integer, person_id integer, chat_type text)
RETURNS void AS $$
    DECLARE
        is_admin boolean = false;
    BEGIN
        IF chat_type = 'PERSONAL' OR create_chat_person.person_id = chat.current_person_id() THEN
            is_admin = true;
        END IF;

        INSERT INTO chat.chat_person (chat_id, person_id, is_admin)
        VALUES (create_chat_person.chat_id, create_chat_person.person_id, is_admin);
    END
$$
LANGUAGE plpgsql;


CREATE FUNCTION chat.create_chat(other_persons_id integer[], picture text)
    RETURNS chat.chat AS $$
DECLARE
    new_chat chat.chat;
    all_chat_person_ids integer[] = array_append(other_persons_id, chat.current_person_id());
    chat_type text;
BEGIN
    -- Create a new chat
    IF array_length(all_chat_person_ids, 1) > 2 THEN
        chat_type = 'GROUP';
    ELSE
        chat_type = 'PERSONAL';
    END IF;

    INSERT INTO chat.chat (picture, type)
    VALUES (create_chat.picture, chat_type)
    RETURNING * INTO new_chat;

    -- Create chat_person relations
    PERFORM chat.create_chat_person(new_chat.id, person_id, chat_type)
    FROM unnest(all_chat_person_ids) AS person_id;

    RETURN new_chat;
END;
$$
LANGUAGE plpgsql
STRICT
SECURITY DEFINER;

GRANT EXECUTE ON FUNCTION chat.create_chat (integer[], text) TO chat_person;
