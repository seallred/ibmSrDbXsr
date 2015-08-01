-- ----------------------------------------------------------------------------
-- PMR HW Service Request Clean-up - used to remove problems in error state
-- ----------------------------------------------------------------------------

--select * from xsr.pmr_state;
--select * from xsr.hw_origination_code;
--select max(purge_interval) from cam.customer_profile
--select count(*) from xsr.pmr_hw_text_3_1 with ur;
--select count(*) from xsr.pmr_hw_header_2_6 where state = 6 with ur;

-- SQL to get HW Service Request created in SR, in Error State and older than 5 days
-- 284287 (closed)
-- 164331
select h.src_tran_id, h.src_appl, h.src_node, h.eci_id, h.prob_num, date(h.create_datetime) as create_datetime, x.sr_create_date , x.sr_update_date, x.status
--select count(*)
from xsr.pmr_hw_header_2_6 h 
   inner join xsr.pmr_hw_eci_info_3_1 x on (h.src_tran_id, h.src_appl, h.src_node) = (x.src_tran_id, x.src_appl, x.src_node)
where h.state = 5    -- closed
and x.status in ('CA', 'CL', 'CX', 'CLO', 'CCO', 'CCC', 'CCI', 'CCH', 'CCF', 'CCL')
and x.sr_update_date < (current date - 120 days)  
--order by h.create_datetime
--fetch first 1000 rows only
with ur;


-- Prep) Update the header records so you will know which ones to delete at the end.
update  xsr.pmr_hw_header_2_6 b set b.state = 6, b.update_user = 'manual_purge'
where exists
(
   select h.src_tran_id, h.src_appl, h.src_node
   from xsr.pmr_hw_header_2_6 h 
      inner join xsr.pmr_hw_eci_info_3_1 x on (h.src_tran_id, h.src_appl, h.src_node) = (x.src_tran_id, x.src_appl, x.src_node)
   where h.state = 5 and x.sr_update_date < (current date - 120 days) 
   and (h.src_tran_id, h.src_appl, h.src_node) = (b.src_tran_id, b.src_appl, b.src_node)
   fetch first 10000 rows only
);

update  xsr.pmr_hw_header_2_6 b set b.state = 6, b.update_user = 'manual_purge'
where exists
(
   select 1 from xsr.pmr_hw_eci_info_3_1 x 
   where x.sr_update_date < (current date - 120 days) 
   and x.status in ('CA', 'CL', 'CX', 'CLO', 'CCO', 'CCC', 'CCI', 'CCH', 'CCF', 'CCL')
   and (x.src_tran_id, x.src_appl, x.src_node) = (b.src_tran_id, b.src_appl, b.src_node)
   fetch first 10000 rows only
)
with ur;

-- ----------------------------------------------------------------------------
-- 1) Insert xsr.pmr_hw_text into Archive and the Delete record
delete from xsr.pmr_hw_text_3_1
where (src_tran_id, src_appl, src_node) in 
(
   select cl.src_tran_id, cl.src_appl, cl.src_node from xsr.pmr_hw_cust_location cl where (src_tran_id, src_appl, src_node) in 
   (
      select h.src_tran_id, h.src_appl, h.src_node
      from xsr.pmr_hw_header_2_6 h 
         inner join xsr.pmr_hw_eci_info_3_1 x on (h.src_tran_id, h.src_appl, h.src_node) = (x.src_tran_id, x.src_appl, x.src_node)
      where h.state = 6
      and x.sr_update_date < (current date - 120 days)
      order by h.create_datetime
   )
   fetch first 50000 rows only
);

-- ----------------------------------------------------------------------------
-- 2) Insert xsr.pmr_hw_cust_location into Archive and the Delete record
delete from xsr.pmr_hw_cust_location
where (src_tran_id, src_appl, src_node) in 
(
   select cl.src_tran_id, cl.src_appl, cl.src_node from xsr.pmr_hw_cust_location cl where (src_tran_id, src_appl, src_node) in 
   (
      select h.src_tran_id, h.src_appl, h.src_node
      from xsr.pmr_hw_header_2_6 h 
         inner join xsr.pmr_hw_eci_info_3_1 x on (h.src_tran_id, h.src_appl, h.src_node) = (x.src_tran_id, x.src_appl, x.src_node)
      where h.state = 6
      and x.sr_update_date < (current date - 120 days)
      order by h.create_datetime
   )
   fetch first 50000 rows only
);

-- ----------------------------------------------------------------------------
-- 3) Insert xsr.pmr_hw_part into Archive and the Delete record
delete from xsr.pmr_hw_part
where (src_tran_id, src_appl, src_node) in 
(
   select cl.src_tran_id, cl.src_appl, cl.src_node from xsr.pmr_hw_cust_location cl where (src_tran_id, src_appl, src_node) in 
   (
      select h.src_tran_id, h.src_appl, h.src_node
      from xsr.pmr_hw_header_2_6 h 
         inner join xsr.pmr_hw_eci_info_3_1 x on (h.src_tran_id, h.src_appl, h.src_node) = (x.src_tran_id, x.src_appl, x.src_node)
      where h.state = 6
      and x.sr_update_date < (current date - 120 days)
      order by h.create_datetime
   )
   fetch first 50000 rows only
);

-- ----------------------------------------------------------------------------
-- 4) Insert xsr.pmr_hw_air_cair into Archive and the Delete record
delete from xsr.pmr_hw_air_cair
where (src_tran_id, src_appl, src_node) in 
(
   select cl.src_tran_id, cl.src_appl, cl.src_node from xsr.pmr_hw_cust_location cl where (src_tran_id, src_appl, src_node) in 
   (
      select h.src_tran_id, h.src_appl, h.src_node
      from xsr.pmr_hw_header_2_6 h 
         inner join xsr.pmr_hw_eci_info_3_1 x on (h.src_tran_id, h.src_appl, h.src_node) = (x.src_tran_id, x.src_appl, x.src_node)
      where h.state = 6
      and x.sr_update_date < (current date - 120 days)
      order by h.create_datetime
   )
   fetch first 50000 rows only
);


-- ----------------------------------------------------------------------------
-- 5) Insert xsr.pmr_hw_xsr_info into Archive and the Delete record
delete from xsr.pmr_hw_xsr_info
where (src_tran_id, src_appl, src_node) in 
(
   select cl.src_tran_id, cl.src_appl, cl.src_node from xsr.pmr_hw_cust_location cl where (src_tran_id, src_appl, src_node) in 
   (
      select h.src_tran_id, h.src_appl, h.src_node
      from xsr.pmr_hw_header_2_6 h 
         inner join xsr.pmr_hw_eci_info_3_1 x on (h.src_tran_id, h.src_appl, h.src_node) = (x.src_tran_id, x.src_appl, x.src_node)
      where h.state = 6
      and x.sr_update_date < (current date - 120 days)
      order by h.create_datetime
   )
   fetch first 50000 rows only
);


-- ----------------------------------------------------------------------------
-- 6) Insert xsr.pmr_hw_eci_info_3_1 into Archive and the Delete record
delete from xsr.pmr_hw_eci_info_3_1
where (src_tran_id, src_appl, src_node) in 
(
   select cl.src_tran_id, cl.src_appl, cl.src_node from xsr.pmr_hw_cust_location cl where (src_tran_id, src_appl, src_node) in 
   (
      select h.src_tran_id, h.src_appl, h.src_node
      from xsr.pmr_hw_header_2_6 h 
         inner join xsr.pmr_hw_eci_info_3_1 x on (h.src_tran_id, h.src_appl, h.src_node) = (x.src_tran_id, x.src_appl, x.src_node)
      where h.state = 6
      and x.sr_update_date < (current date - 120 days)
      order by h.create_datetime
   )
   fetch first 50000 rows only
);


-- ----------------------------------------------------------------------------
-- 7) Insert xsr.pmr_hw_header_2_6 into Archive and the Delete record
delete from xsr.pmr_hw_header_2_6
where (src_tran_id, src_appl, src_node) in 
(
   select h.src_tran_id, h.src_appl, h.src_node
   from xsr.pmr_hw_header_2_6 h 
   where h.state = 6 
   order by h.create_datetime
   fetch first 50000 rows only
);

