-- --------------------------------------------------------------------------
-- Testing / Troubleshooting AIR/CAIR
-- --------------------------------------------------------------------------

-- Lookup tables for hardware
select * from xsr.pmr_hw_status;
select * from xsr.hw_failing_element_code;
select * from xsr.hw_origination_code;
select * from xsr.request_sub_type;
select * from cam.support_group;
select * from cam.caller_type;
select * from cam.customer_profile where eci_id in ('9596901','9476711');

-- ALL CREATE/VIEW
select * from xsr.v_hw_create where prob_num='DSCLLRJ';
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
-- HW Users
-- --------------------------------------------------------------------------
select * from cam.caller_type with ur;


select cnt.contact_id, cnt.email_address, cnt.login, cnt.caller_type_id, sg.description, cp.eci_id
--select distinct cp.eci_id
from cam.customer_profile cp 
   inner join cam.support_group sg on cp.support_group_id = sg.support_group_id
   left outer join 
   (select c.contact_id, c.email_address, c.login, chx.caller_type_id, chx.eci_id, chx.support_group_id
      from cam.contact_hw_xref chx 
      inner join cam.contact c on c.contact_id = chx.contact_id ) cnt
      on cnt.eci_id = cp.eci_id and cnt.support_group_id = cp.support_group_id
--where lower(sg.description) like 'air-gsis%'
-- where cp.eci_id = '0820011'
-- where cp.eci_id in ('7777777','5555555','0820011','1111222','0451658','6666333','7777999','7777888')
--and cnt.email_address is not null
--group by email_address having count(distinct login) > 1
with ur;

select cx.eci_id, sg.description, c.contact_id, c.login, c.ibm_uid, c.verified_email_address, ct.description, sg.*
--select distinct cx.eci_id
  from cam.contact c 
       inner join cam.contact_hw_xref cx on c.contact_id = cx.contact_id
       inner join cam.caller_type ct on cx.caller_type_id = ct.caller_type_id
       inner join cam.customer_profile cp on cx.eci_id = cp.eci_id
       inner join cam.support_group sg on cp.support_group_id = sg.support_group_id
 where sg.support_group_id in (5,6,7)
  and  c.login in ('gsisa2@us.ibm.com')
order by eci_id, login
with ur;

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
select * from xsr.pmr_hw_eci_message_log ml where eci_id = '3159178' and src_id = '027MPJOZP2' with ur;


select * from xsr.pmr_hw_eci_message_log ml 
where message like 'ECIRECE 0001%'
  and message like '%0075%' fetch first 100 rows only with ur;

-- PMR_HW_HEADER_2_6 
select * from xsr.pmr_hw_header_2_6 
 where src_tran_id = '027MPJOZQQ'
-- and update_datetime > (current timestamp - 4 hours) 
order by update_datetime
with ur;

select * from xsr.pmr_hw_header_2_6 ph
 where ph.prob_num = 'DSCLLRJ'
--   and eci_id = '0820011' 
--   and update_datetime > (current timestamp - 48 hours) 
order by update_datetime
with ur;

update xsr.pmr_hw_header_2_6 set state = where ph.prob_num = 'FJTVDYQ';

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
 where -- orig_code = 'S'
  src_tran_id = '027MPJOZQQ'
--   and update_datetime > (current timestamp - 1 hour) 
order by update_datetime
with ur;

-- PMR_HW_XSR_INFO 
select * from xsr.pmr_hw_xsr_info 
 where src_tran_id = '027MPJOZQQ'
-- and update_datetime > (current timestamp - 1 day) 
order by update_datetime
with ur;

-- PMR_HW_TEXT_3_1
select * from xsr.pmr_hw_text_3_1 
 where src_tran_id = '027MPJOZQQ'
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


-- --------------------------------------------------------------------------
-- Checking the CROSS Customer Location Feed
-- --------------------------------------------------------------------------
select * from camdf.cross_customer_location where eci_id = '1108070' with ur;
select * from camdf.cross_customer_location where create_datetime > (current timestamp - 1 day) with ur;
select * from camdf.cross_customer_location_message where create_datetime > (current timestamp - 1 day) with ur;

-- --------------------------------------------------------------------------
-- Pulling attribute names from sys tables
-- --------------------------------------------------------------------------
--select lower(rtrim(table_name) || '.' || rtrim(column_name)) as attribute, c.*
select distinct table_name
from sysibm.columns c
where table_schema = 'XSR' and table_name like 'PMR_HW_%'
--order by ordinal_position
with ur;

select lower(rtrim(table_name) || '.' || rtrim(column_name)) as attribute, c.*
from sysibm.columns c
where table_schema = 'XSR' and column_name = 'DESCRIPTION'
order by ordinal_position
with ur;

-- --------------------------------------------------------------------------
-- Clean-up PMR HW Header Tables
-- --------------------------------------------------------------------------
delete from XSR.PMR_HW_ATTACHMENT
delete from XSR.PMR_HW_PART
delete from XSR.PMR_HW_TEXT_2_6
delete from XSR.PMR_HW_AIR_CAIR;
delete from XSR.PMR_HW_CUST_LOCATION
delete from XSR.PMR_HW_XSR_INFO
delete from XSR.PMR_HW_ECI_INFO_2_6
delete from XSR.PMR_HW_HEADER_2_6
--delete from XSR.PMR_HW_ECI_MESSAGE_LOG
--delete from XSR.PMR_HW_ERROR

-- --------------------------------------------------------------------------
-- Get messages by message type
-- --------------------------------------------------------------------------
select substr(message,1,12), count(*) from xsr.pmr_hw_eci_message_log l group by substr(message,1,12) with ur;

-- --------------------------------------------------------------------------
-- Coming up with a fix for gmt-offset and testing it.
-- --------------------------------------------------------------------------
select distinct src_tran_id, gmt_offset, length(gmt_offset), '+000' || substr(gmt_offset,1,1) as fix 
from xsr.pmr_hw_eci_info_2_6 where src_tran_id = '0H0IzfPT9l' --or gmt_offset = '0';
select distinct src_tran_id, gmt_offset, length(gmt_offset), '-0' || substr(gmt_offset,2,3) as fix 
from xsr.pmr_hw_eci_info_2_6 where src_tran_id = 'bt6QGlI8e9' --substr(gmt_offset,1,1) = '-' and length(gmt_offset) = 4;
select distinct gmt_offset, length(gmt_offset), '' || substr(gmt_offset,1,5) as fix 
from xsr.pmr_hw_eci_info_2_6 where substr(gmt_offset,1,1) = '-' and length(gmt_offset) = 5;
select distinct src_tran_id, gmt_offset, length(gmt_offset), '+0' || substr(gmt_offset,1,3) as fix 
from xsr.pmr_hw_eci_info_2_6 where src_tran_id = '07TWGR8bJ9' --length(gmt_offset) = 3;
select distinct src_tran_id, gmt_offset, length(gmt_offset), '+' || substr(gmt_offset,1,4) as fix 
from xsr.pmr_hw_eci_info_2_6 where src_tran_id = '18IN9CD8RJ'; --substr(gmt_offset,1,1) != '-' and length(gmt_offset) = 4;
select distinct src_tran_id, gmt_offset, length(gmt_offset), '-0' || substr(gmt_offset,2,3) as fix 
from xsr.pmr_hw_eci_info_2_6 where gmt_offset is null;


update xsr.pmr_hw_eci_info_2_6 set gmt_offset = '+0000' where gmt_offset = '0' and src_tran_id = '0H0IzfPT9l';

update xsr.pmr_hw_eci_info_2_6 set gmt_offset = '-0' || substr(gmt_offset,2,3) 
where substr(gmt_offset,1,1) = '-' and length(gmt_offset) = 4 and src_tran_id = 'bt6QGlI8e9';

update xsr.pmr_hw_eci_info_2_6 set gmt_offset = '+0' || substr(gmt_offset,1,3) 
where length(gmt_offset) = 3 and src_tran_id = '07TWGR8bJ9';

update xsr.pmr_hw_eci_info_2_6 set gmt_offset = '+' || substr(gmt_offset,1,4) 
where substr(gmt_offset,1,1) != '-' and length(gmt_offset) = 4 and src_tran_id = '18IN9CD8RJ';

select distinct gmt_offset from xsr.pmr_hw_text_2_6 