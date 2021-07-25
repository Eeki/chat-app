ALTER DEFAULT privileges GRANT EXECUTE ON functions TO public;

ReVOKE usage ON SCHEMA chat FROM chat_anonymous, chat_person;

REVOKE EXECUTE ON FUNCTION chat.register_person (text, text, text) FROM chat_anonymous;
REVOKE EXECUTE ON FUNCTION chat.authenticate (text, text) FROM chat_anonymous, chat_person;

REVOKE ALL privileges ON TABLE chat.person FROM chat_person;

REVOKE SELECT, DELETE ON TABLE chat.chat FROM chat_person;
