-- ----------------------------------------------------------------------------
-- HW Reports
-- ----------------------------------------------------------------------------
--select * from xsr.pmr_state;
--select * from xsr.hw_origination_code;

-- HW Call by Date By Support Group
select
  date(ph.create_datetime) "Date",
  char(sg.description,20) "Support group",
  count(*) "Count of hw pmrs opened through SR"
from
  xsr.pmr_hw_header_2_6 ph
  join xsr.pmr_hw_eci_info_3_1 phe on (ph.src_tran_id, ph.src_appl, ph.src_node) = (phe.src_tran_id, phe.src_appl, phe.src_node)
  join cam.customer_profile cp on ph.eci_id = cp.eci_id
  join cam.support_group sg on cp.support_group_id = sg.support_group_id
  join xsr.pmr_state ps on (ph.state = ps.state)
where phe.orig_code = 'S'
  and ph.src_appl = 'XSR'  -- added 8/7/2014 by Scott.  
  and ph.create_datetime > '2014-08-26 23:00:00'
group by 
  date(ph.create_datetime),
  sg.description
order by 
   1,2,3
with ur;


-- HW Calls by Date By State
select
  week(ph.create_datetime) "Date", phe.orig_code,
  ps.name,
  count(*) "Count"
from
  xsr.pmr_hw_header_2_6 ph
  join xsr.pmr_hw_eci_info_3_1 phe on (ph.src_tran_id, ph.src_appl, ph.src_node) = (phe.src_tran_id, phe.src_appl, phe.src_node)
  join xsr.pmr_state ps on (ph.state = ps.state)
where phe.orig_code in ('I','S')
--  and ph.src_appl = 'XSR'
  and year(ph.create_datetime) = '2014' and week(ph.create_datetime) >= week(current timestamp)
group by 
  week(ph.create_datetime), phe.orig_code,
  ps.name
order by 
   1,2
with ur;



-- HW Calls by Date by Support Group By State
select
  date(ph.create_datetime) "Date",
  char(sg.description,20) "Support group",
  ps.name,
  sum(case when ph.prob_num is null then 1 else 0 end) "Prob Num Null",
  count(*) "Count of hw pmrs opened through SR"
from
  xsr.pmr_hw_header_2_6 ph
  join xsr.pmr_hw_eci_info_3_1 phe on (ph.src_tran_id, ph.src_appl, ph.src_node) = (phe.src_tran_id, phe.src_appl, phe.src_node)
  join cam.customer_profile cp on ph.eci_id = cp.eci_id
  join cam.support_group sg on cp.support_group_id = sg.support_group_id
  join xsr.pmr_state ps on (ph.state = ps.state)
where phe.orig_code = 'S'
  and ph.src_appl = 'XSR'  -- added 8/7/2014 by Scott.  
--  and ph.create_datetime > '2014-08-26 17:00:00'
  and ph.create_datetime >= '2014-09-01 17:00:00'  
group by 
  date(ph.create_datetime),
  sg.description,
  ps.name
order by 
   1,2,3
with ur;


-- HW PMR's YTD by User Type
with temp (acct_registered, self_registered) as
(
select 0, count(*)
from
  xsr.pmr_hw_header_2_6 ph
  join xsr.pmr_hw_eci_info_3_1 phe on (ph.src_tran_id, ph.src_appl, ph.src_node) = (phe.src_tran_id, phe.src_appl, phe.src_node)
  join cam.customer_profile cp on ph.eci_id = cp.eci_id
  join cam.support_group sg on cp.support_group_id = sg.support_group_id
  join xsr.pmr_state ps on (ph.state = ps.state)
where cp.eci_id = '5555555'
  and date(ph.create_datetime) >= '2014-01-01'
union
select count(*), 0
from
  xsr.pmr_hw_header_2_6 ph
  join xsr.pmr_hw_eci_info_3_1 phe on (ph.src_tran_id, ph.src_appl, ph.src_node) = (phe.src_tran_id, phe.src_appl, phe.src_node)
  join cam.customer_profile cp on ph.eci_id = cp.eci_id
  join cam.support_group sg on cp.support_group_id = sg.support_group_id
  join xsr.pmr_state ps on (ph.state = ps.state)
where cp.eci_id != '5555555'
  and date(ph.create_datetime) >= '2014-01-01'
)
select sum(acct_registered) as acct_reg, sum(self_registered) as self_reg
from temp
with ur;


-- Detail Research
select phe.orig_code, phe.severity, ph.*, phe.* 
--select distinct eci_id
from xsr.pmr_hw_header_2_6 ph 
   inner join xsr.pmr_hw_eci_info_3_1 phe on (ph.src_tran_id, ph.src_appl, ph.src_node) = (phe.src_tran_id, phe.src_appl, phe.src_node)
--   inner join xsr.pmr_hw_cust_location cl on (ph.src_tran_id, ph.src_appl, ph.src_node) = (phe.src_tran_id, phe.src_appl, phe.src_node)
where ph.create_datetime >= '2014-09-15 00:00:00'
  and phe.orig_code = 'S'
  and ph.src_appl = 'XSR'
--  and ph.state = 2
  and ph.eci_id in ('0560907', '1108070');








select
  ps.name,
  count(*) "Count of hw pmrs opened through SR"
from
  xsr.pmr_hw_header_2_6 ph
  join xsr.pmr_hw_eci_info_3_1 phe on (ph.src_tran_id, ph.src_appl, ph.src_node) = (phe.src_tran_id, phe.src_appl, phe.src_node)
  join cam.customer_profile cp on ph.eci_id = cp.eci_id
  join cam.support_group sg on cp.support_group_id = sg.support_group_id
  join xsr.pmr_state ps on (ph.state = ps.state)
where phe.orig_code = 'S'
  and ph.src_appl = 'XSR'  -- added 8/7/2014 by Scott.  
--  and ph.create_datetime > '2014-08-26 17:00:00'
  and date(ph.create_datetime) between '2014-09-15' and '2014-09-21'
group by 
  ps.name
order by 
   1
with ur;