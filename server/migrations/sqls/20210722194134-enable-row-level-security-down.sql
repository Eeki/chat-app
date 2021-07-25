ALTER TABLE chat.message disable ROW level SECURITY;

DROP POLICY update_message ON chat.message;
DROP POLICY delete_message ON chat.message;
DROP POLICY create_message ON chat.message;

REVOKE EXECUTE ON FUNCTION chat.current_person_id() FROM chat_person;
REVOKE EXECUTE ON FUNCTION chat.is_chat_participant(integer) FROM chat_person;

DROP FUNCTION chat.current_person_id();
DROP FUNCTION chat.is_chat_participant(integer);
