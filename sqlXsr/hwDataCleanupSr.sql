-- ----------------------------------------------------------------------------
-- Clean-up HW PMRs open that should be closed
-- Purge closed PMRs older than 120 days
-- ----------------------------------------------------------------------------
--select * from xsr.pmr_state;


-- Update HW records where state is out of sync - should be closed
update  xsr.pmr_hw_header_2_6 b set b.state = 5, b.update_user = 'manual_update'
--select count(*) from xsr.pmr_hw_header_2_6 b
where b.state != 5
and exists
(
   select 1 from xsr.pmr_hw_eci_info_3_1 x 
   where x.status in ('CA', 'CL', 'CX', 'CLO', 'CCO', 'CCC', 'CCI', 'CCH', 'CCF', 'CCL')
   and (x.src_tran_id, x.src_appl, x.src_node) = (b.src_tran_id, b.src_appl, b.src_node)
);


-- To be deleted - HW records closed and older than 120 days
update  xsr.pmr_hw_header_2_6 b set b.state = 6, b.update_user = 'to be deleted'
--select count(*) from xsr.pmr_hw_header_2_6 b
where b.state = 5
and exists
(
   select 1 from xsr.pmr_hw_eci_info_3_1 x 
   where x.status in ('CA', 'CL', 'CX', 'CLO', 'CCO', 'CCC', 'CCI', 'CCH', 'CCF', 'CCL')
   and (x.src_tran_id, x.src_appl, x.src_node) = (b.src_tran_id, b.src_appl, b.src_node)
   and x.sr_update_date < (current date - 120 days)  
);


-- 1) Insert xsr.pmr_hw_text into Archive and the Delete record
delete from xsr.pmr_hw_text_3_1
--select count(*) from xsr.pmr_hw_text_3_1
where (pmr_hw_text_id) in 
(
   select distinct x.pmr_hw_text_id from xsr.pmr_hw_text_3_1 x
   where (src_tran_id, src_appl, src_node) in 
      (select distinct h.src_tran_id, h.src_appl, h.src_node from xsr.pmr_hw_header_2_6 h where h.state = 6)    -- to be deleted
--   fetch first 100000 rows only
) with ur;

-- ----------------------------------------------------------------------------
-- 2) Insert xsr.pmr_hw_cust_location into Archive and the Delete record
delete from xsr.pmr_hw_cust_location
-- select count(*) from xsr.pmr_hw_cust_location
where (src_tran_id, src_appl, src_node) in 
(
   select h.src_tran_id, h.src_appl, h.src_node from xsr.pmr_hw_header_2_6 h where h.state = 6
   order by h.create_datetime
   fetch first 50000 rows only
)
with ur;

-- ----------------------------------------------------------------------------
-- 3) Insert xsr.pmr_hw_part into Archive and the Delete record
delete from xsr.pmr_hw_part
-- select count(*) from xsr.pmr_hw_part
where (src_tran_id, src_appl, src_node) in 
(
   select h.src_tran_id, h.src_appl, h.src_node from xsr.pmr_hw_header_2_6 h where h.state = 6
   order by h.create_datetime
   fetch first 50000 rows only
)
with ur;

-- ----------------------------------------------------------------------------
-- 4) Insert xsr.pmr_hw_air_cair into Archive and the Delete record
delete from xsr.pmr_hw_air_cair
-- select count(*) from xsr.pmr_hw_air_cair
where (src_tran_id, src_appl, src_node) in 
(
   select h.src_tran_id, h.src_appl, h.src_node from xsr.pmr_hw_header_2_6 h where h.state = 6
   order by h.create_datetime
   fetch first 50000 rows only
)
with ur;


-- ----------------------------------------------------------------------------
-- 5) Insert xsr.pmr_hw_xsr_info into Archive and the Delete record
delete from xsr.pmr_hw_xsr_info
-- select count(*) from xsr.pmr_hw_xsr_info
where (src_tran_id, src_appl, src_node) in 
(
   select h.src_tran_id, h.src_appl, h.src_node from xsr.pmr_hw_header_2_6 h where h.state = 6
   order by h.create_datetime
   fetch first 50000 rows only
)
with ur;


-- ----------------------------------------------------------------------------
-- 6) Insert xsr.pmr_hw_eci_info_3_1 into Archive and the Delete record
delete from xsr.pmr_hw_eci_info_3_1
-- select count(*) from xsr.pmr_hw_eci_info_3_1
where (src_tran_id, src_appl, src_node) in 
(
   select h.src_tran_id, h.src_appl, h.src_node from xsr.pmr_hw_header_2_6 h where h.state = 6
   order by h.create_datetime
   fetch first 50000 rows only
)
with ur;


-- ----------------------------------------------------------------------------
-- 7) Insert xsr.pmr_hw_header_2_6 into Archive and the Delete record
delete from xsr.pmr_hw_header_2_6
-- select count(*) from xsr.pmr_hw_header_2_6
where (src_tran_id, src_appl, src_node) in 
(
   select h.src_tran_id, h.src_appl, h.src_node from xsr.pmr_hw_header_2_6 h where h.state = 6
   order by h.create_datetime
   fetch first 50000 rows only
)
with ur;

