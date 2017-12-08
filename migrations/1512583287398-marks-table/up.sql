-- 1512583287398-marks-table/up.sql
-- write your new migration here

CREATE TABLE marks (
  id serial PRIMARY KEY,
  element_id UUID REFERENCES elements(id) ON DELETE CASCADE,
  mark_type text NOT NULL,
  mark_id text NOT NULL,
  mark_color text NOT NULL,
  mark_location text,
  date_given date,
  date_removed date,
  notes text,
  created_at timestamp with time zone DEFAULT now(),
  updated_at timestamp with time zone DEFAULT now()
);

COMMENT ON TABLE marks IS 'Any marks (ear tag, bands, PIT) given to a captured animal';

ALTER TABLE marks
ADD CONSTRAINT unq_mark_constraint
UNIQUE (element_id, mark_id, mark_location);