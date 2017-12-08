-- 1512581525259-events-table/up.sql
-- write your new migration here

CREATE TABLE events (
  id serial PRIMARY KEY,
  element_id UUID REFERENCES elements(id) ON DELETE CASCADE,
  activity_id UUID REFERENCES activities(id) ON DELETE RESTRICT,
  x real NOT NULL,
  y real NOT NULL,
  location text,
  geom geometry(Point, 4326),
  status text DEFAULT 'unk',
  age text DEFAULT 'unk',
  event_date date NOT NULL,
  enc_method text,
  enc_reason text,
  source_app text,
  capture_time time,
  start_time time,
  end_time time,
  reencounter boolean DEFAULT false,
  relocated boolean DEFAULT false,
  rel_location text,
  rel_x real,
  rel_y real,
  rel_geom geometry(Point, 4326),
  tag_number text,
  folder_url text,
  qaqc_flag boolean DEFAULT false,
  enc_id_tmp integer,
  animal_id_temp integer,
  comments text,
  created_at timestamp with time zone DEFAULT now(),
  updated_at timestamp with time zone DEFAULT now(),
  created_by text,
  updated_by text
);

COMMENT ON TABLE events IS 'All encounter events of animals.';