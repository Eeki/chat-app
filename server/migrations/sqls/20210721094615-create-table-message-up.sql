CREATE TABLE chat.message
(
    id         serial PRIMARY KEY,
    type       text CHECK ( type IN ('TEXT', 'IMAGE') ),
    value      json                              NOT NULL,
    created_at timestamptz DEFAULT now(),
    user_id    integer REFERENCES chat.user (id) NOT NULL,
    chat_id    integer REFERENCES chat.chat (id) NOT NULL
);

CREATE INDEX message_chat_idx ON chat.message (chat_id);
