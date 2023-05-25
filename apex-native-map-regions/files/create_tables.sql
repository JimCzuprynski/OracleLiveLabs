/*
|| Script:  create_tables.sql
|| Purpose: Creates all required tables 
|| Author:  Jim Czuprynski (Zero Defect Computing, Inc.)
*/

DROP TABLE IF EXISTS hol23c.charging_points;
CREATE TABLE IF NOT EXISTS hol23c.charging_points (	
   cp_id           NUMBER(8,0)
	,cp_name         VARCHAR2(60) NOT NULL
	,cp_address      VARCHAR2(40) NOT NULL
	,cp_city         VARCHAR2(40) NOT NULL
	,cp_state_abbr   VARCHAR2(2) NOT NULL
	,cp_zip_code     CHAR(5) NOT NULL
	,cp_status       CHAR(3) NOT NULL
	,cp_bus_type     VARCHAR2(3) NOT NULL
	,cp_chg_type     VARCHAR2(4) NOT NULL
	,cp_chg_avail    VARCHAR2(4) NOT NULL
	,cp_potentiality NUMBER(8,6) 
	,gc_geometry     SDO_GEOMETRY)  
     VARRAY GC_GEOMETRY.SDO_ELEM_INFO STORE AS SECUREFILE LOB 
     VARRAY GC_GEOMETRY.SDO_ORDINATES STORE AS SECUREFILE LOB;
;

DROP TABLE IF EXISTS hol23c.dot_disadvantage_layers;
CREATE TABLE IF NOT EXISTS hol23c.dot_disadvantage_layers (	
  st            VARCHAR2(2) 
, state         VARCHAR2(254) 
, county_fip    VARCHAR2(5) 
, st_abbr       VARCHAR2(2)
, county        VARCHAR2(254)
, fips          VARCHAR2(254)
, location      VARCHAR2(254)
, area_sqmi     NUMBER
, e_totpop      NUMBER(38,0)
, total_work    NUMBER 
, non_transi    NUMBER 
, transit_us    NUMBER(38,0) 
, est_vmiles    NUMBER 
, est_annual    NUMBER 
, avg_annual    NUMBER 
, five_year_    NUMBER 
, highway_mp    NUMBER 
, mean_annua    NUMBER(38,0) 
, mean_ann_1    NUMBER 
, average_au    NUMBER 
, average_an    NUMBER 
, average__1    NUMBER 
, travel_tim    NUMBER 
, average__2    NUMBER 
, transporta    NUMBER 
, zero_vehic    NUMBER 
, epl_noveh     NUMBER 
, one_vehicl    NUMBER 
, two_vehicl    NUMBER 
, three_vehi    NUMBER 
, epl_commut    NUMBER 
, epl_tcb       NUMBER 
, nwki          NUMBER 
, epl_nwki      NUMBER 
, transp_th     NUMBER 
, epl_age65     NUMBER 
, ep_uninsur    NUMBER 
, epl_uninsu    NUMBER 
, epl_disabl    NUMBER 
, health_th     NUMBER 
, epl_nohsdp    NUMBER 
, b25003_c_2    NUMBER 
, epl_renter    NUMBER 
, epl_unemp     NUMBER 
, epl_pci       NUMBER 
, epl_pov       NUMBER 
, gini          NUMBER 
, epl_gini      NUMBER 
, b25106_001    NUMBER 
, b25106_002    NUMBER 
, b25106_006    NUMBER 
, b25106_010    NUMBER 
, b25106_014    NUMBER 
, b25106_018    NUMBER 
, b25106_022    NUMBER 
, b25106_024    NUMBER 
, b25106_028    NUMBER 
, b25106_032    NUMBER 
, b25106_036    NUMBER 
, b25106_040    NUMBER 
, b25106_044    NUMBER 
, p_hucb        NUMBER 
, epl_hucb      NUMBER 
, economy_th    NUMBER 
, epl_limeng    NUMBER 
, equity_th     NUMBER 
, resilience    NUMBER 
, p_ldpnt       NUMBER 
, p_dslpm       NUMBER 
, p_cancr       NUMBER 
, p_resp        NUMBER 
, p_ozone       NUMBER 
, p_pm25        NUMBER 
, enviro_th     NUMBER 
, transpor_1    NUMBER(38,0) 
, healthdis     NUMBER(38,0) 
, economydis    NUMBER(38,0) 
, equitydis     NUMBER(38,0) 
, resilien_1    NUMBER(38,0) 
, envirodis     NUMBER(38,0) 
, sumdis        NUMBER(38,0) 
, overalldis    NUMBER(38,0) 
, shape_leng    NUMBER 
, shape_area    NUMBER 
, count         NUMBER 
, geom SDO_GEOMETRY
   ) TABLESPACE DATA  
     VARRAY GEOM.SDO_ELEM_INFO STORE AS SECUREFILE LOB 
     VARRAY GEOM.SDO_ORDINATES STORE AS SECUREFILE LOB;
