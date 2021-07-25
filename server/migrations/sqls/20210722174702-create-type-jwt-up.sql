CREATE TYPE chat.jwt AS
(
    role      text,
    person_id integer,
    exp       bigint
);
