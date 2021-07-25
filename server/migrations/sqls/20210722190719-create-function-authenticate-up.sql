CREATE FUNCTION chat.authenticate (email text, password text)
    RETURNS chat.jwt AS $$
DECLARE
    account chat_private.person_account;
BEGIN
    SELECT
        * INTO account
    FROM chat_private.person_account
    WHERE
            person_account.email = authenticate.email;
    IF account.password_hash = crypt(authenticate.password, account.password_hash) THEN
        RETURN (
                'chat_person',
                account.person_id,
                extract(epoch FROM (now() + interval '30 days'))
            )::chat.jwt;
    ELSE
        RETURN NULL;
    END IF;
END;
$$

LANGUAGE plpgsql
STRICT
SECURITY DEFINER
