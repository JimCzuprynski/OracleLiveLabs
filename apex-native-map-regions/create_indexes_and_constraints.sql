/*
|| Script:  Create_CHARGING_POINTS.sql
|| Purpose: Creates all related objects for table DOT_DISADVANTAGE_LAYERS
|| Author:  Jim Czuprynski (Zero Defect Computing, Inc.)
*/

/*
|| Script:  create_indexes_and_constraints.sql
|| Purpose: Creates all remaining database objects
|| Author:  Jim Czuprynski (Zero Defect Computing, Inc.)
*/

--------------------------------------------------------
-- Add spatial index on GC_GEOMETRY SDO_GEOMETRY column
--------------------------------------------------------
CREATE INDEX hol23c.charging_points_gc_geometry_spidx 
  ON hol23c.CHARGING_POINTS (gc_geometry) 
  INDEXTYPE IS MDSYS.SPATIAL_INDEX_V2 ;


--------------------------------------------------------
-- Add PK constraint
--------------------------------------------------------
ALTER TABLE hol23c.charging_points 
  ADD CONSTRAINT charging_points_pk 
    PRIMARY KEY (cp_id)
    USING INDEX (
      CREATE UNIQUE INDEX hol23c.charging_points_pk_idx 
        ON hol23c.charging_points (cp_id) 
        COMPUTE STATISTICS 
        TABLESPACE DATA);
           

--------------------------------------------------------
-- Add spatial index on GEOM SDO_GEOMETRY column
--------------------------------------------------------
CREATE INDEX hol23c.dot_disadvantage_layers_geom_spidx
   ON hol23c.dot_disadvantage_layers (geom) 
   INDEXTYPE IS MDSYS.SPATIAL_INDEX_V2 ;


--------------------------------------------------------
-- Add PK constraint
--------------------------------------------------------
ALTER TABLE hol23c.dot_disadvantage_layers 
  ADD CONSTRAINT dot_disadvantage_layers_pk 
  PRIMARY KEY (fips)
   USING INDEX (
     CREATE UNIQUE INDEX hol23c.dot_disadvantage_layers_pk_idx 
       ON hol23c.dot_disadvantage_layers (fips) 
       TABLESPACE DATA
  );
  