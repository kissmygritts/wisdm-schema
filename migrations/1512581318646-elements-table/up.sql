-- 1512581318646-elements-table/up.sql
-- write your new migration here

CREATE TABLE elements (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  animal_id integer UNIQUE,
  species_id UUID REFERENCES species(id),
  sex text DEFAULT 'unk',
  animal_key_whdb integer,
  ndow_species_code integer,
  alpha_code text,
  created_at timestamp with time zone DEFAULT now(),
  updated_at timestamp with time zone DEFAULT now(),
  created_by text,
  updated_by text
);

COMMENT ON TABLE elements IS 'All the animals entered into the database.';