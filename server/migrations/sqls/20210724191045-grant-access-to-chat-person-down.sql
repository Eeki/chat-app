ALTER TABLE chat.chat_person disable ROW level SECURITY;

REVOKE SELECT ON TABLE chat.chat_person FROM chat_person;

DROP POLICY select_chat_person ON chat.chat_person;
