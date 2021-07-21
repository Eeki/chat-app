CREATE TABLE chat.user
(
    id         serial PRIMARY KEY,
    username   text NOT NULL,
    first_name text NOT NULL,
    last_name  text NOT NULL,
    picture    text NOT NULL,
    created_at timestamptz DEFAULT now()
);
