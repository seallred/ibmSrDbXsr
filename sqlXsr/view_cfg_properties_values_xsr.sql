-- ---------------------------------------------------------
-- VIEW XSR CONFIG VALUES
-- ---------------------------------------------------------
set isolation to dirty read;
with temp (scope, sort_order, node, key, value, properties_id)
as (
-- GLOBAL
select 'GLOBAL' as scope, substr(key,9,91) as sort_order, ' default' as node, key, value, properties_id
  from xsr.cfg_properties
 where lower(key) like lower('acucomp%')
UNION
select 'GLOBAL' as scope, key as sort_order, ' default' as node, key, value, properties_id
  from xsr.cfg_properties
 where (lower(key) not like lower('acunode%')
   and lower(key) not like lower('acucomp%')
   and lower(key) not like lower('off.%'))  -- need to filter out developers entries
UNION
select 'PROD' as scope, substr(key,16,84) as sort_order, substr(key,1,14) as node, key, value, properties_id
  from xsr.cfg_properties
 where lower(key) like lower('acunode.v%')
UNION
select 'PROD-SPPP' as scope, substr(key,16,84) as sort_order, substr(key,1,14) as node, key, value, properties_id
  from xsr.cfg_properties
 where lower(key) like lower('acunode.w20016%')
    or lower(key) like lower('acunode.w30011%')
UNION
select 'DEV' as scope, substr(key,20,80) as sort_order, substr(key,1,18) as node, key, value, properties_id
  from xsr.cfg_properties
 where lower(key) like lower('acunode.etlbdesr04%')
UNION
select 'TEST' as scope, substr(key,19,81) as sort_order, substr(key,1,17) as node, key, value, properties_id
  from xsr.cfg_properties
 where lower(key) like lower('acunode.sr-wast1%') or lower(key) like lower('acunode.sr-wast2%') 
UNION
select 'PRE-PROD' as scope, substr(key,16,84) as sort_order, substr(key,1,14) as node, key, value, properties_id
  from xsr.cfg_properties
 where lower(key) like lower('acunode.w30041%')
UNION
select 'PRE-PROD-SPPP' as scope, substr(key,16,84) as sort_order, substr(key,1,14) as node, key, value, properties_id
  from xsr.cfg_properties
 where lower(key) like lower('acunode.w30037%')
)
select scope, node, key, value, properties_id from temp
--  where lower(key) like lower('%sdi%') or
--        lower(key) like lower('%addRelationshipBy.earlyAdopter%') or
--        lower(key) like lower('%ReportGenerationTool%') or
--        lower(key) like lower('%liveAssistance%')
order by lower(sort_order), node;


