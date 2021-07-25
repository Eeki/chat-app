# chat-app
Real time chat app

TODO add this as part of the dev-server:

Need to give password to user "chat_postgraphile" e.g:
```postgresql
DO $$
    BEGIN
        IF NOT EXISTS (
            SELECT passwd
            FROM pg_shadow
            WHERE usename = 'chat_postgraphile') THEN
        ALTER USER chat_postgraphile
            WITH LOGIN PASSWORD 'secret_password123';
        END IF;
    END
$$;
```
