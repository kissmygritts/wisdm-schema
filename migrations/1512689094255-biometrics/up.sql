-- 1512689094255-biometrics/up.sql
-- write your new migration here

CREATE TABLE biometrics (
  id serial PRIMARY KEY,
  event_id integer REFERENCES events(id) ON DELETE CASCADE,
  measurement text,
  value numeric,
  units text,
  description text,
  notes text,
  created_at timestamp with time zone DEFAULT now(),
  updated_at timestamp with time zone DEFAULT now()
);