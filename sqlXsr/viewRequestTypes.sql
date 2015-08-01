-- ---------------------------------------------------------------------------- 
-- Get Request Types and Sub-Request Types for Hardware Calls
-- ----------------------------------------------------------------------------
select rtg.req_type_group_id as grp_id, rtg.class, 
       rtgx.req_type_id, rtgx.req_sub_type_id, rt.description,
       rt.req_type_code,
       rst.req_sub_type_code, rst.description
  from xsr.request_type_group rtg
   inner join xsr.request_type_group_xref rtgx on rtg.req_type_group_id = rtgx.req_type_group_id
   inner join xsr.request_type rt on rt.req_type_id = rtgx.req_type_id
   inner join xsr.request_sub_type rst on rst.req_sub_type_id = rtgx.req_sub_type_id
where rtg.class = 'Default'
order by rtgx.req_type_id, rtgx.req_sub_type_id;

-- Default
select rtg.req_type_group_id as grp_id, rtg.class, 
       rtgx.req_type_id, rtgx.req_sub_type_id,
       rt.req_type_code,
       rst.req_sub_type_code
  from xsr.request_type_group rtg
   inner join xsr.request_type_group_xref rtgx on rtg.req_type_group_id = rtgx.req_type_group_id
   inner join xsr.request_type rt on rt.req_type_id = rtgx.req_type_id
   inner join xsr.request_sub_type rst on rst.req_sub_type_id = rtgx.req_sub_type_id
where rtg.class = 'Default'
--  and (
--         (rt.req_type_code = '10' and rst.req_sub_type_code in ('00','10','Z0'))
--         or (rt.req_type_code = '30' and rst.req_sub_type_code in ('40','10','16','12','15','45','30','0A','1A','1P','20','4A','4F','4G','4H','4M','4N','99','Z0'))
--         or (rt.req_type_code = '90' and rst.req_sub_type_code in ('00','09'))
--      )
order by rtgx.req_type_id, rtgx.req_sub_type_id;

-- AIR
select rtg.req_type_group_id as grp_id, rtg.class, 
       rtgx.req_type_id, rtgx.req_sub_type_id,
       rt.req_type_code,
       rst.req_sub_type_code
  from xsr.request_type_group rtg
   inner join xsr.request_type_group_xref rtgx on rtg.req_type_group_id = rtgx.req_type_group_id
   inner join xsr.request_type rt on rt.req_type_id = rtgx.req_type_id
   inner join xsr.request_sub_type rst on rst.req_sub_type_id = rtgx.req_sub_type_id
where rtg.class = 'AIR'
--  and (
--         (rt.req_type_code = '1X' and rst.req_sub_type_code in ('00','Z1'))
--         or (rt.req_type_code = '3X' and rst.req_sub_type_code in ('10','12','14','15','16','17','19','1A','1P','20','30','40','42','45','4A','4F','4G','4H','4M','4N','60','61','62','63','65','66','68','70','71','99','0A','D1','D2','D3','D4','D5','D6','D7','D8','D9','Z0'))
--      )
order by rtgx.req_type_id, rtgx.req_sub_type_id;

-- CAIR
select rtg.req_type_group_id as grp_id, rtg.class, 
       rtgx.req_type_id, rtgx.req_sub_type_id,
       rt.req_type_code,
       rst.req_sub_type_code
  from xsr.request_type_group rtg
   inner join xsr.request_type_group_xref rtgx on rtg.req_type_group_id = rtgx.req_type_group_id
   inner join xsr.request_type rt on rt.req_type_id = rtgx.req_type_id
   inner join xsr.request_sub_type rst on rst.req_sub_type_id = rtgx.req_sub_type_id
where rtg.class = 'CAIR'
  and (rt.req_type_code = '3X' and rst.req_sub_type_code in ('10','15','17','40','42','60','61','71','99','Z0'))
order by rtgx.req_type_id, rtgx.req_sub_type_id;

-- AIRGSIS
select rtg.req_type_group_id as grp_id, rtg.class, 
       rtgx.req_type_id, rtgx.req_sub_type_id,
       rt.req_type_code,
       rst.req_sub_type_code
  from xsr.request_type_group rtg
   inner join xsr.request_type_group_xref rtgx on rtg.req_type_group_id = rtgx.req_type_group_id
   inner join xsr.request_type rt on rt.req_type_id = rtgx.req_type_id
   inner join xsr.request_sub_type rst on rst.req_sub_type_id = rtgx.req_sub_type_id
where rtg.class = 'AIRGSIS'
  and (
         (rt.req_type_code = '1X' and rst.req_sub_type_code in ('00','Z1'))
         or (rt.req_type_code = '3X' and rst.req_sub_type_code in ('10','15','16','1A','45','66','68','99','0A','D1','D2','D7','D8','Z0'))
      )
order by rtgx.req_type_id, rtgx.req_sub_type_id;


-- Load request_type_group_xref from the log table
--insert into xsr.request_type_group_xref
--	(req_type_group_id, req_type_id, req_sub_type_id, active, create_user)
--select distinct req_type_group_id, req_type_id, req_sub_type_id, active, 'sallred'
--from xsr.request_type_group_xref_log l
--where date(update_datetime) >= (current date - 1 day) and action_flag = 'D'
--and exists (select 1 from xsr.request_type_group g where g.REQ_TYPE_GROUP_ID = l.REQ_TYPE_GROUP_ID)
--and exists (select 1 from xsr.request_type rt where rt.REQ_TYPE_ID = l.REQ_TYPE_ID)
--and exists (select 1 from xsr.request_sub_type rst where rst.REQ_SUB_TYPE_ID = l.REQ_SUB_TYPE_ID);