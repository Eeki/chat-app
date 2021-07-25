CREATE TABLE chat.person
(
    id         serial PRIMARY KEY,
    username   text NOT NULL,
    picture    text NOT NULL,
    created_at timestamptz DEFAULT now()
);
