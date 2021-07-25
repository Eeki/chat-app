CREATE TABLE chat_private.person_account
(
    person_id     integer PRIMARY KEY REFERENCES chat.person (id) ON DELETE CASCADE,
    email         text NOT NULL UNIQUE CHECK (email ~* '^.+@.+\..+$'),
    password_hash text NOT NULL
);

CREATE INDEX person_account_email_idx ON chat_private.person_account (email);
