-- 1512577801874-projects-table/up.sql
-- write your new migration here

-- create activities table
CREATE TABLE activities (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  act_type text,
  act_name text,
  act_category text,
  act_desc text,
  act_start date,
  act_duration integer,
  time_frame text,
  attributes jsonb,
  created_at timestamp with time zone DEFAULT now(),
  updated_at timestamp with time zone DEFAULT now(),
  created_by text,
  updated_by text
);

-- comment on table
COMMENT ON TABLE activities IS 'All the activites that result in the capture or observation of wildlife.';

-- comment on columns
COMMENT ON COLUMN activities.id IS 'Globally unique identifier for activities, Primary Key';
COMMENT ON COLUMN activities.act_type IS 'An activity type, such as capture, aerial survey, etc.';
COMMENT ON COLUMN activities.act_name IS 'The name of the activity.';
COMMENT ON COLUMN activities.act_category IS 'Category of the activity, such as disease, population monitoring, etc.';
COMMENT ON COLUMN activities.act_desc IS 'Short description of the activity.';
COMMENT ON COLUMN activities.act_start IS 'Start date of the activity';
COMMENT ON COLUMN activities.act_duration IS 'Duration of the activity';
COMMENT ON COLUMN activities.time_frame IS 'What is the time frame for the activity duration.';

-- create associative entities for activity species
CREATE TABLE activity_species (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  species_id UUID REFERENCES species(id) ON DELETE CASCADE,
  activity_id UUID REFERENCES activities(id) ON DELETE CASCADE,
  created_at timestamp with time zone DEFAULT now(),
  updated_at timestamp with time zone default now()
);

-- comment on table
COMMENT ON TABLE activity_species IS 'An associative entity to resolve many to many relationships for the species encountered during a certain activity';

-- create associative entity for activity locations
CREATE TABLE activity_locations (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  activity_id UUID REFERENCES activities(id) ON DELETE CASCADE,
  created_at timestamp with time zone DEFAULT now(),
  updated_at timestamp with time zone DEFAULT now()
);

COMMENT ON TABLE activity_locations IS 'An associative entity to resolve many to many relationship for the locations and activity occurs.';
