CREATE ROLE chat_postgraphile;
CREATE ROLE chat_anonymous;
CREATE ROLE chat_person;

GRANT chat_anonymous TO chat_postgraphile;
GRANT chat_person TO chat_postgraphile;
