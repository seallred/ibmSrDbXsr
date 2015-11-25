-- ---------------------------------------------------------
-- VIEW ALL CONFIG VALUES
-- testing a change to another file
-- ---------------------------------------------------------
set isolation to dirty read;


with temp (schema, scope, sort_order, node, key, value, properties_id)
as (
-- GLOBAL
select 'XSR', 'GLOBAL' as scope, substr(key,9,91) as sort_order, ' default' as node, key, value, properties_id
  from xsr.cfg_properties
 where lower(key) like lower('acucomp%')
UNION
select 'XSR', 'GLOBAL' as scope, key as sort_order, ' default' as node, key, value, properties_id
  from xsr.cfg_properties
 where (lower(key) not like lower('acunode%')
   and lower(key) not like lower('acucomp%')
   and lower(key) not like lower('off.%'))  -- need to filter out developers entries
UNION
select 'XSR', 'PROD' as scope, substr(key,16,84) as sort_order, substr(key,1,14) as node, key, value, properties_id
  from xsr.cfg_properties
 where lower(key) like lower('acunode.v%')
UNION
select 'XSR', 'PROD-SPPP' as scope, substr(key,16,84) as sort_order, substr(key,1,14) as node, key, value, properties_id
  from xsr.cfg_properties
 where lower(key) like lower('acunode.w20016%')
    or lower(key) like lower('acunode.w30011%')
UNION
select 'XSR', 'DEV' as scope, substr(key,17,30) as sort_order, substr(key,1,18) as node, key, value, properties_id
  from xsr.cfg_properties
 where lower(key) like lower('acunode.sr-wasd%')
UNION
select 'XSR', 'TEST' as scope, substr(key,18,81) as sort_order, substr(key,1,17) as node, key, value, properties_id
  from xsr.cfg_properties
 where lower(key) like lower('acunode.sr-wast1%') or lower(key) like lower('acunode.sr-wast2%')
UNION
select 'XSR', 'TEST SPPP' as scope, substr(key,18,81) as sort_order, substr(key,1,17) as node, key, value, properties_id
  from xsr.cfg_properties
 where lower(key) like lower('acunode.sr-wast3%')
UNION
select 'XSR', 'PRE-PROD' as scope, substr(key,16,84) as sort_order, substr(key,1,14) as node, key, value, properties_id
  from xsr.cfg_properties
 where lower(key) like lower('acunode.w30041%')
UNION
select 'XSR', 'PRE-PROD-SPPP' as scope, substr(key,16,84) as sort_order, substr(key,1,14) as node, key, value, properties_id
  from xsr.cfg_properties
 where lower(key) like lower('acunode.w30037%')
UNION
select 'CAM', 'GLOBAL' as scope, substr(key,9,91) as sort_order, ' default' as node, key, value, properties_id
  from cam.cfg_properties
 where lower(key) like lower('acucomp%')
UNION
select 'CAM', 'GLOBAL' as scope, key as sort_order, ' default' as node, key, value, properties_id
  from cam.cfg_properties
 where (lower(key) not like lower('acunode%')
   and lower(key) not like lower('acucomp%')
   and lower(key) not like lower('off.%'))  -- need to filter out developers entries
UNION
select 'CAM', 'PROD' as scope, substr(key,16,84) as sort_order, substr(key,1,14) as node, key, value, properties_id
  from cam.cfg_properties
 where lower(key) like lower('acunode.v%')
UNION
select 'CAM', 'PROD-SPPP' as scope, substr(key,16,84) as sort_order, substr(key,1,14) as node, key, value, properties_id
  from cam.cfg_properties
 where lower(key) like lower('acunode.w20016%')
    or lower(key) like lower('acunode.w30011%')
UNION
select 'CAM', 'DEV' as scope, substr(key,17,30) as sort_order, substr(key,1,18) as node, key, value, properties_id
  from cam.cfg_properties
 where lower(key) like lower('acunode.sr-wasd%')
UNION
select 'CAM', 'TEST' as scope, substr(key,18,81) as sort_order, substr(key,1,17) as node, key, value, properties_id
  from cam.cfg_properties
 where lower(key) like lower('acunode.sr-wast1%') or lower(key) like lower('acunode.sr-wast2%')
UNION
select 'CAM', 'TEST SPPP' as scope, substr(key,18,81) as sort_order, substr(key,1,17) as node, key, value, properties_id
  from cam.cfg_properties
 where lower(key) like lower('acunode.sr-wast3%')
UNION
select 'CAM', 'PRE-PROD' as scope, substr(key,16,84) as sort_order, substr(key,1,14) as node, key, value, properties_id
  from cam.cfg_properties
 where lower(key) like lower('acunode.w30041%')
UNION
select 'CAM', 'PRE-PROD-SPPP' as scope, substr(key,16,84) as sort_order, substr(key,1,14) as node, key, value, properties_id
  from cam.cfg_properties
 where lower(key) like lower('acunode.w30037%')
UNION
select 'CAMDF', 'GLOBAL' as scope, substr(key,9,91) as sort_order, ' default' as node, key, value, properties_id
  from camdf.cfg_properties
 where lower(key) like lower('acucomp%')
UNION
select 'CAMDF', 'GLOBAL' as scope, key as sort_order, ' default' as node, key, value, properties_id
  from camdf.cfg_properties
 where (lower(key) not like lower('acunode%')
   and lower(key) not like lower('acucomp%')
   and lower(key) not like lower('off.%'))  -- need to filter out developers entries
UNION
select 'CAMDF', 'PROD' as scope, substr(key,16,84) as sort_order, substr(key,1,14) as node, key, value, properties_id
  from camdf.cfg_properties
 where lower(key) like lower('acunode.v%')
UNION
select 'CAMDF', 'PROD-SPPP' as scope, substr(key,16,84) as sort_order, substr(key,1,14) as node, key, value, properties_id
  from camdf.cfg_properties
 where lower(key) like lower('acunode.w20016%')
    or lower(key) like lower('acunode.w30011%')
UNION
select 'CAMDF', 'DEV' as scope, substr(key,17,30) as sort_order, substr(key,1,18) as node, key, value, properties_id
  from camdf.cfg_properties
 where lower(key) like lower('acunode.sr-wasd%')
UNION
select 'CAMDF', 'TEST' as scope, substr(key,18,81) as sort_order, substr(key,1,17) as node, key, value, properties_id
  from camdf.cfg_properties
 where lower(key) like lower('acunode.sr-wast1%') or lower(key) like lower('acunode.sr-wast2%')
UNION
select 'CAMDF', 'TEST SPPP' as scope, substr(key,18,81) as sort_order, substr(key,1,17) as node, key, value, properties_id
  from camdf.cfg_properties
 where lower(key) like lower('acunode.sr-wast3%') 
UNION
select 'CAMDF', 'PRE-PROD' as scope, substr(key,16,84) as sort_order, substr(key,1,14) as node, key, value, properties_id
  from camdf.cfg_properties
 where lower(key) like lower('acunode.w30041%')
UNION
select 'CAMDF', 'PRE-PROD-SPPP' as scope, substr(key,16,84) as sort_order, substr(key,1,14) as node, key, value, properties_id
  from camdf.cfg_properties
 where lower(key) like lower('acunode.w30037%')
UNION
select 'TROLLEY', 'GLOBAL' as scope, substr(key,9,91) as sort_order, ' default' as node, key, value, properties_id
  from trolley.cfg_properties
 where lower(key) like lower('acucomp%')
UNION
select 'TROLLEY', 'GLOBAL' as scope, key as sort_order, ' default' as node, key, value, properties_id
  from trolley.cfg_properties
 where (lower(key) not like lower('acunode%')
   and lower(key) not like lower('acucomp%')
   and lower(key) not like lower('off.%'))  -- need to filter out developers entries
UNION
select 'TROLLEY', 'PROD' as scope, substr(key,16,84) as sort_order, substr(key,1,14) as node, key, value, properties_id
  from trolley.cfg_properties
 where lower(key) like lower('acunode.v%')
UNION
select 'TROLLEY', 'PROD-SPPP' as scope, substr(key,16,84) as sort_order, substr(key,1,14) as node, key, value, properties_id
  from trolley.cfg_properties
 where lower(key) like lower('acunode.w20016%')
    or lower(key) like lower('acunode.w30011%')
UNION
select 'TROLLEY', 'DEV' as scope, substr(key,17,30) as sort_order, substr(key,1,18) as node, key, value, properties_id
  from trolley.cfg_properties
 where lower(key) like lower('acunode.sr-wasd%')
UNION
select 'TROLLEY', 'TEST' as scope, substr(key,18,81) as sort_order, substr(key,1,17) as node, key, value, properties_id
  from trolley.cfg_properties
 where lower(key) like lower('acunode.sr-wast1%') or lower(key) like lower('acunode.sr-wast2%')
UNION
select 'TROLLEY', 'TEST SPPP' as scope, substr(key,18,81) as sort_order, substr(key,1,17) as node, key, value, properties_id
  from trolley.cfg_properties
 where lower(key) like lower('acunode.sr-wast3%')
UNION
select 'TROLLEY', 'PRE-PROD' as scope, substr(key,16,84) as sort_order, substr(key,1,14) as node, key, value, properties_id
  from trolley.cfg_properties
 where lower(key) like lower('acunode.w30041%')
UNION
select 'TROLLEY', 'PRE-PROD-SPPP' as scope, substr(key,16,84) as sort_order, substr(key,1,14) as node, key, value, properties_id
  from trolley.cfg_properties
 where lower(key) like lower('acunode.w30037%')
)
select schema, substr(scope,1,13) as scope, substr(key,1,50) as key, substr(value,1,20) as value, properties_id
  from temp t1
 where lower(key) like lower('%.timer.enabled%') and
       (lower(scope) = 'global' or lower(scope) like ('dev%'))
   and schema = 'CAMDF'
--    and value != 'false'
--   and lower(key) like '%iee%'
order by schema, sort_order, node;

