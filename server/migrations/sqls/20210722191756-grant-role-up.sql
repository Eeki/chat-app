ALTER DEFAULT privileges REVOKE EXECUTE ON functions FROM public;

GRANT usage ON SCHEMA chat TO chat_anonymous, chat_person;

GRANT EXECUTE ON FUNCTION chat.register_person (text, text, text) TO chat_anonymous;
GRANT EXECUTE ON FUNCTION chat.authenticate (text, text) TO chat_anonymous, chat_person;

GRANT ALL privileges ON TABLE chat.person TO chat_person;

GRANT SELECT, DELETE ON TABLE chat.chat TO chat_person;
