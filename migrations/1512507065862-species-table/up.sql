-- 1512507065862-species-table/up.sql
-- write your new migration here

CREATE TABLE species (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  common_name text NOT NULL,
  species_name text NOT NULL,
  alpha_code text,
  genus text,
  species text,
  gbif_key integer,
  t_phylum text,
  t_class text,
  t_order text,
  t_family text,
  grouping text,
  ndow_code integer,
  attributes jsonb,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT now(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT now(),
  created_by text,
  updated_by text
);

COMMENT ON TABLE species IS 'All the species that occur in the state of Nevada.';

-- column comments
COMMENT ON COLUMN species.common_name IS 'English name for the species, the most common colloquial name.';
COMMENT ON COLUMN species.species_name IS 'Latin species epithet for the species.';
COMMENT ON COLUMN species.alpha_code IS '4 or 6 digit alpha code for this species.';
COMMENT ON COLUMN species.genus IS 'The taxonomic genus of this species';
COMMENT ON COLUMN species.species IS 'The taxonomic species of this species';
COMMENT ON COLUMN species.gbif_key IS 'The Global Biodiversity Information Facilitly key for this species';
COMMENT ON COLUMN species.t_phylum IS 'The taxonomic phylum of this species';
COMMENT ON COLUMN species.t_class IS 'The taxonomic class of this species';
COMMENT ON COLUMN species.t_family IS 'The taxonomic family of this species';
COMMENT ON COLUMN species.grouping IS 'A relevant species grouping for the Nevada Dept. of Wildlife.';
COMMENT ON COLUMN species.ndow_code IS 'The NDOW species code from the element occurences database.';
