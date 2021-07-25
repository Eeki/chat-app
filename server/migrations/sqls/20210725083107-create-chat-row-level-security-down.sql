ALTER TABLE chat.chat disable ROW level SECURITY;
REVOKE SELECT ON TABLE chat.chat FROM chat_person;
DROP POLICY select_chat ON chat.chat;




