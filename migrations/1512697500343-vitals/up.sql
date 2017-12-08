-- 1512697500343-vitals/up.sql
-- write your new migration here

CREATE TABLE vitals (
  id serial PRIMARY KEY,
  event_id integer REFERENCES events(id) ON DELETE CASCADE,
  time_rec time,
  measurement text,
  value numeric,
  interval integer,
  notes text,
  created_at timestamp with time zone DEFAULT now(),
  updated_at timestamp with time zone DEFAULT now()
);