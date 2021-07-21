CREATE TABLE chat.chat_user
(
    chat_id  integer REFERENCES chat.chat (id) NOT NULL,
    user_id  integer REFERENCES chat.user (id) NOT NULL,
    is_admin boolean                           NOT NULL,
    PRIMARY KEY (chat_id, user_id)
);

CREATE INDEX message_chat_user_user_idx ON chat.chat_user (user_id);
