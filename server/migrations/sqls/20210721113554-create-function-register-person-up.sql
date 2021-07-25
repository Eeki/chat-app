CREATE FUNCTION chat.register_person (username text, email text, password text)
    RETURNS chat.person AS $$
DECLARE
    person chat.person;
BEGIN
    INSERT INTO chat.person (username, picture)
    VALUES (register_person.username, '')
    RETURNING * INTO person;

    INSERT INTO chat_private.person_account (person_id, email, password_hash)
    VALUES (person.id, register_person.email, crypt(password, gen_salt('bf')));

    RETURN person;
END;
$$
    LANGUAGE plpgsql
    STRICT
    SECURITY DEFINER;
