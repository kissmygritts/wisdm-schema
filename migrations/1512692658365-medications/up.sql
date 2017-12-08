-- 1512692658365-medications/up.sql
-- write your new migration here

CREATE TABLE medications (
  id serial PRIMARY KEY,
  event_id integer REFERENCES events(id) ON DELETE CASCADE,
  medications text,
  med_time time,
  med_dose numeric,
  med_unit text,
  med_method text,
  med_notes text,
  created_at timestamp with time zone DEFAULT now(),
  updated_at timestamp with time zone DEFAULT now()
);