-- Audit Log

select * from xsr.audit_log fetch first 1000 rows only;

select * from xsr.audit_log where app_id = 1 and action_id = 2 and obj_type_id = 6
and description like '%CNBNLMM%'
with ur;

select * from xsr.audit_obj_type;

-- action_id = 1 - for insert
-- action_id = 2 - for update
-- action_id = 3 - for deletes
-- action_id = 6 - for select
select * from xsr.audit_log where app_id = 1 and action_id = 3 and obj_type_id = 6
and time_stamp between '2015-03-09 00:00:01' and '2015-03-19 23:59:59'
with ur;

select * from xsr.audit_log where description like 'insert%'
and time_stamp between '2015-03-01 00:00:01' and '2015-03-27 23:59:59'
with ur;


select * from xsr.audit_log where time_stamp between '2015-03-09 00:00:01' and '2015-03-27 23:59:59'
with ur;
