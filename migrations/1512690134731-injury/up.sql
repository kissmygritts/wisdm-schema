-- 1512690134731-injury/up.sql
-- write your new migration here

CREATE TABLE injuries (
  id serial PRIMARY KEY,
  event_id integer REFERENCES events(id) ON DELETE CASCADE,
  injury_side text,
  injury_location text,
  injury_type text,
  injury_description text,
  injury_treatment text,
  created_at timestamp with time zone DEFAULT now(),
  updated_at timestamp with time zone DEFAULT now()
);