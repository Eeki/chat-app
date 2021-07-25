CREATE TABLE chat.chat_person
(
    chat_id   integer REFERENCES chat.chat (id)   NOT NULL,
    person_id integer REFERENCES chat.person (id) NOT NULL,
    is_admin  boolean                             NOT NULL,
    PRIMARY KEY (chat_id, person_id)
);

CREATE INDEX message_chat_person_person_idx ON chat.chat_person (person_id);
CREATE INDEX message_chat_person_chat_idx ON chat.chat_person (chat_id);
