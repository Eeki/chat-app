CREATE TABLE chat.chat
(
    id         serial PRIMARY KEY,
    picture    text NOT NULL,
    created_at timestamptz DEFAULT now(),
    type       text CHECK ( type IN ('PERSONAL', 'GROUP') )
);
