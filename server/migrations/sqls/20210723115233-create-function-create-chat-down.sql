REVOKE EXECUTE ON FUNCTION chat.create_chat(integer[], text) FROM chat_person;
DROP FUNCTION chat.create_chat(integer[], text);

DROP FUNCTION chat.create_chat_person(integer, integer, text);
