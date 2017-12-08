-- 1512697331109-mort-necropsy/up.sql
-- write your new migration here

CREATE TABLE mortalities (
  id serial PRIMARY KEY,
  event_id integer REFERENCES events(id) ON DELETE CASCADE,
  investigator text,
  cause_of_death text,
  sub_cause text,
  certainty_of_cause integer,
  carcass_age integer,
  femur_index integer,
  gross_diagnoses text,
  description text,
  created_at timestamp with time zone DEFAULT now(),
  updated_at timestamp with time zone DEFAULT now()
);

CREATE TABLE necropsies (
  id serial PRIMARY KEY,
  event_id integer REFERENCES events(id) ON DELETE CASCADE,
  necropsy_date date,
  mort_date date,
  general_condition text,
  integument text,
  musculoskeletal text,
  body_cavities text,
  hemolymphatic text,
  respiratory text,
  cardiovascular text,
  digestive text,
  urinary text,
  reproductive text,
  endocrine text,
  nervous text,
  sensory text,
  studies text,
  created_at timestamp with time zone DEFAULT now(),
  updated_at timestamp with time zone DEFAULT now()
);