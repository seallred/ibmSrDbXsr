-- ----------------------------------------------------------------------------
-- viewSearchPmrMetrics
-- ----------------------------------------------------------------------------
with temp (total, keyword, severity, component_id, include_archive, show_open, show_closed, open_and_closed, date_range, machine_type, pmr_num)
as (
select count(*) as total, 0 as keyword, 0 as severity, 0 as component_id, 0 as include_archive, 0 as show_open, 0 as show_closed, 0 as open_and_closed, 0 as date_range, 0 as machine_type, 0 as pmr_num
from xsr.user_profile_search_criteria_metrics

union
select 0 as total, count(*) as keyword, 0 as severity, 0 as component_id, 0 as include_archive, 0 as show_open, 0 as show_closed, 0 as open_and_closed, 0 as date_range, 0 as machine_type, 0 as pmr_num
from xsr.user_profile_search_criteria_metrics
where keywords is not null

union
select 0 as total, 0 as keyword, count(*) as severity, 0 as component_id, 0 as include_archive, 0 as show_open, 0 as show_closed, 0 as open_and_closed, 0 as date_range, 0 as machine_type, 0 as pmr_num
from xsr.user_profile_search_criteria_metrics
where severity is not null

union
select 0 as total, 0 as keyword, 0 as severity, count(*) as component_id, 0 as include_archive, 0 as show_open, 0 as show_closed, 0 as open_and_closed, 0 as date_range, 0 as machine_type, 0 as pmr_num
from xsr.user_profile_search_criteria_metrics
where component_id is not null

union
select 0 as total, 0 as keyword, 0 as severity, 0 as component_id, count(*) as include_archive, 0 as show_open, 0 as show_closed, 0 as open_and_closed, 0 as date_range, 0 as machine_type, 0 as pmr_num
from xsr.user_profile_search_criteria_metrics
where include_archived > 0


-- Open/Closed Flag
-- 0=open & closed, 1=open only, 2=closed only
union
select 0 as total, 0 as keyword, 0 as severity, 0 as component_id, 0 as include_archive, count(*) as show_open, 0 as show_closed, 0 as open_and_closed, 0 as date_range, 0 as machine_type, 0 as pmr_num
from xsr.user_profile_search_criteria_metrics
where open_closed = 1

union
select 0 as total, 0 as keyword, 0 as severity, 0 as component_id, 0 as include_archive, 0 as show_open, count(*) as show_closed, 0 as open_and_closed, 0 as date_range, 0 as machine_type, 0 as pmr_num
from xsr.user_profile_search_criteria_metrics
where open_closed = 2

union
select 0 as total, 0 as keyword, 0 as severity, 0 as component_id, 0 as include_archive, 0 as show_open, 0 as show_closed, count(*) as open_and_closed, 0 as date_range, 0 as machine_type, 0 as pmr_num
from xsr.user_profile_search_criteria_metrics
where open_closed = 0

union
select 0 as total, 0 as keyword, 0 as severity, 0 as component_id, 0 as include_archive, 0 as show_open, 0 as show_closed, 0 as open_and_closed, count(*) as date_range, 0 as machine_type, 0 as pmr_num
from xsr.user_profile_search_criteria_metrics
where date_range > 0

--union
--select 0 as total, 0 as keyword, 0 as severity, 0 as component_id, 0 as include_archive, 0 as show_open, 0 as show_closed, 0 as date_range, count(*) as machine_type, 0 as pmr_num
--from xsr.user_profile_search_criteria_metrics
--where serial_number is not null

union
select 0 as total, 0 as keyword, 0 as severity, 0 as component_id, 0 as include_archive, 0 as show_open, 0 as show_closed, 0 as open_and_closed, 0 as date_range, 0 as machine_type, count(*) as pmr_num
from xsr.user_profile_search_criteria_metrics
where pmr_num is not null
)
select sum(total) as total, sum(keyword) as keyword, sum(severity) as severity, sum(component_id) as component_id, 
       sum(include_archive) as include_archive, sum(show_open) as show_open, sum(show_closed) as show_closed, 
       sum(open_and_closed) as open_and_closed, sum(date_range) as date_range, sum(machine_type) as machine_type, 
       sum(pmr_num) as pmr_num
from temp
with ur;

--select search_type, count(*) from xsr.user_profile_search_criteria_metrics group by search_type;

