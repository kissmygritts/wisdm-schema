-- 1512600467926-devices-table/up.sql
-- write your new migration here

CREATE TABLE devices (
  id serial PRIMARY KEY,
  serial_number text UNIQUE,
  frequency real,
  vendor text,
  model text,
  device_type text,
  network text,
  mfg_date date,
  vhf_lot text,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT now(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT now(),
  created_by text,
  updated_by text
);

COMMENT ON TABLE devices IS 'All the devices owned by NDOW.';

-- deployments table
CREATE TABLE deployments (
  id serial PRIMARY KEY,
  element_id UUID REFERENCES elements(id),
  frequency real,
  serial_num text,
  type text,
  inservice date,
  outservice date,
  created_at timestamp with time zone DEFAULT now(),
  updated_at timestamp with time zone DEFAULT now()
);

COMMENT ON TABLE deployments IS 'Animal-device associations to track when and on who a collar is deployed.';

ALTER TABLE deployments
ADD CONSTRAINT unq_deployment_constraint
UNIQUE (element_id, serial_num, frequency);