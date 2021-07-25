GRANT SELECT ON TABLE chat.chat TO chat_person;

ALTER TABLE chat.chat enable ROW level SECURITY;

CREATE POLICY select_chat ON chat.chat FOR SELECT TO chat_person USING
    (chat.is_chat_participant(id))
