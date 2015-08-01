-- --------------------------------------------------------------------------
-- Testing / Troubleshooting Hardware Problems
-- --------------------------------------------------------------------------

-- Lookup tables for hardware
select * from xsr.pmr_state;
select * from xsr.pmr_hw_status;
select * from xsr.hw_failing_element_code;
select * from xsr.hw_origination_code;
select * from xsr.request_sub_type;
select * from cam.support_group;
select * from cam.caller_type;
select * from cam.customer_profile where eci_id in ('9596901','9476711');

-- ALL CREATE/VIEW
select * from xsr.v_hw_create where prob_num='DJLFYNL';
select * from xsr.v_hw_create where cust_type='AIR';
select * from xsr.v_hw_create where src_tran_id = 'KJTMKInV75';
select * from xsr.v_hw_create where eci_id_h6 = '0820011' with ur;
select * from xsr.v_hw_create where eci_id_h6 = '1111222' and phh_create_datetime > (current timestamp - 4 hours) with ur;

-- AIR CREATE/VIEW
select * from xsr.v_hw_air_create where prob_num='FJTVDVD';
select * from xsr.v_hw_air_create where src_tran_id = '085Z50URLE';
select * from xsr.v_hw_air_create where date(call_create_date) = current date;

-- CAIR CREATE/VIEW
select * from xsr.v_hw_cair_create where prob_num='FJTWJVR';
select * from xsr.v_hw_cair_create where src_tran_id = '085Z50URLE';
select * from xsr.v_hw_cair_create where date(call_create_date) = current date;
select * from xsr.v_hw_cair_create where eci_id = '0820011' with ur;

-- STATUS RECS
select * from xsr.v_hw_status where prob_num='FJTVDVD';
select * from xsr.v_hw_status where cust_type='AIR';
select * from xsr.v_hw_status where src_tran_id = '08VMZXG2C3';

select * from xsr.pmr_hw_text_2_6 where src_tran_id = '08VMZXG2C3';

-- --------------------------------------------------------------------------
-- View ECI Message Logs 
-- --------------------------------------------------------------------------
select * from xsr.pmr_hw_eci_message_log ml fetch first 10 rows only;
select * from xsr.pmr_hw_eci_message_log ml where eci_id = '0741455' and message like '%D6XsVE7StX%' with ur;
select * from xsr.pmr_hw_eci_message_log ml where eci_id = '1111222' and create_datetime > (current timestamp - 2 hours) order by create_datetime with ur;
select * from xsr.pmr_hw_eci_message_log l where eci_id = '1111222' and prob_num = 'FJTVDYK' with ur;
select * from xsr.pmr_hw_eci_message_log l where prob_num = 'DJLWSJQ' with ur;
select * from xsr.pmr_hw_eci_message_log l where message like '%ENTE1067890%' with ur;
select * from xsr.pmr_hw_eci_message_log ml where eci_id = '1111222' and create_datetime > (current timestamp - 4 hours) with ur;
-- checking for a particular src_id
select * from xsr.pmr_hw_eci_message_log ml where eci_id = '9235868' and src_id = '02I72CTIP1' with ur;
select * from xsr.pmr_hw_eci_message_log ml where eci_id = '9235868' and src_id = '02I72C4NP1' with ur;
select * from xsr.pmr_hw_eci_message_log ml where eci_id = '9235868' and src_id = '02I72B29P1' with ur;

-- checking for a particular status message
select * from xsr.pmr_hw_eci_message_log ml where eci_id = '9200732' and src_id = '025GLXOMP3' and message like '%00190002AT%' with ur;


select * from xsr.pmr_hw_eci_message_log ml 
where message like 'ECIRECE 0001%'
  and message like '%0075%' fetch first 100 rows only with ur;

-- PMR_HW_HEADER_2_6 
select * from xsr.pmr_hw_header_2_6 
 where src_tran_id in ('0266R4NUHS', '0266B8V88C', '02IXP30Q61', '0265UVA90K', '0265USB4IG')
-- and update_datetime > (current timestamp - 4 hours) 
order by update_datetime
with ur;

select * from xsr.pmr_hw_header_2_6_arc 
 where src_tran_id in ('b111nHzsNn', 'AdBlLaowqL', 'tYRiJ2cKIB')
-- and update_datetime > (current timestamp - 4 hours) 
order by update_datetime
with ur;

select * from xsr.pmr_hw_header_2_6 ph
 where ph.prob_num = 'DJLFYNL'
--   and eci_id = '0820011' 
--   and update_datetime > (current timestamp - 48 hours) 
order by update_datetime
with ur;

--update xsr.pmr_hw_header_2_6 set state = where ph.prob_num = 'FJTVDYQ';

-- PMR_HW_AIR_CAIR
select * from xsr.pmr_hw_air_cair
 where update_datetime > (current timestamp - 1 hour)
order by update_datetime
with ur;

select contract_end_date, length(contract_end_date) 
from xsr.pmr_hw_air_cair where src_tran_id = '085YLV8T5D'

-- PMR_HW_CUST_LOCATION 
select * from xsr.pmr_hw_cust_location 
 where update_datetime > (current timestamp - 1 hour) 
order by update_datetime
with ur;

-- PMR_HW_ECI_INFO_3_1 
select src_tran_id, prod_error_code, a.* from xsr.pmr_hw_eci_info_3_1 a
 where src_tran_id = 'b111nHzsNn'
--    and orig_code = 'S'
--   and update_datetime > (current timestamp - 1 hour) 
order by update_datetime
with ur;

-- PMR_HW_XSR_INFO 
select * from xsr.pmr_hw_xsr_info 
 where src_tran_id = '025GLXOMJI'
-- and update_datetime > (current timestamp - 1 day) 
order by update_datetime
with ur;

-- PMR_HW_TEXT_3_1
select * from xsr.pmr_hw_text_3_1 
 where src_tran_id = 'b111nHzsNn'
-- and update_datetime > (current timestamp - 1 day) 
order by update_datetime
with ur;

select * from xsr.pmr_hw_text_3_1_arc
 where src_tran_id = 'b111nHzsNn'
-- and update_datetime > (current timestamp - 1 day) 
order by update_datetime
with ur;


select * from xsr.pmr_hw_text_2_6 where src_tran_id = '0Y1M3K6QHT' 

select max(text_block), max(src_create_date), max(src_create_time), max(status_date), max(status_time),
   max(status), max(message_type), max(ibm_login_id)
 from xsr.pmr_hw_text_2_6 
-- where update_datetime > (current timestamp - 1 day) 
-- where src_tran_id = 'wEuCv1NMTA'
 where src_tran_id = 'ehYbjFt8w'
--order by update_datetime
with ur;


-- PMR_HW_ERROR 
select * from xsr.pmr_hw_error 
 where update_datetime > (current timestamp - 1 day) 
order by update_datetime
with ur;

-- PMR_HW_PART 
select * from xsr.pmr_hw_part 
 where src_tran_id = '08W9Y6DN6Z' 
-- and update_datetime > (current timestamp - 1 day) 
order by update_datetime
with ur;

-- PMR_HW_ATTACHMENT
select * from xsr.pmr_hw_attachment
 where update_datetime > (current timestamp - 1 day) 
order by update_datetime
with ur;


-- BASIC HARDWARE
select * from xsr.pmr_hw_header_2_6 phh
   inner join xsr.pmr_hw_eci_info_2_6 phei on phh.src_tran_id=phei.src_tran_id
   inner join xsr.pmr_hw_xsr_info phxi on phh.src_tran_id=phxi.src_tran_id
   left outer join xsr.pmr_hw_air_cair phac on phh.src_tran_id=phac.src_tran_id
where phh.prob_num='FJTWJZJ';

