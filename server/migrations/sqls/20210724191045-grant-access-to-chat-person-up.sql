GRANT SELECT ON TABLE chat.chat_person TO chat_person;

ALTER TABLE chat.chat_person enable ROW level SECURITY;

CREATE POLICY select_chat_person ON chat.chat_person FOR SELECT TO chat_person USING
    (person_id = chat.current_person_id());
