-- 1512690381377-labids/up.sql
-- write your new migration here

CREATE TABLE samples (
  id serial PRIMARY KEY,
  event_id integer REFERENCES events(id) ON DELETE CASCADE,
  sample text,
  destination text,
  test text,
  notes text,
  created_at timestamp with time zone DEFAULT now(),
  updated_at timestamp with time zone DEFAULT now()
);

CREATE TABLE lab_ids (
  id serial PRIMARY KEY,
  event_id integer REFERENCES events(id) ON DELETE CASCADE,
  lab_id text UNIQUE,
  created_at timestamp with time zone DEFAULT now(),
  updated_at timestamp with time zone DEFAULT now()
);