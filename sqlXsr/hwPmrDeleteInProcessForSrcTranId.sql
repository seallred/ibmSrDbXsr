-- ----------------------------------------------------------------------------
-- PMR HW Service Request Clean-up - used to remove problems in-process
-- Delete by src_tran_id
-- NOTE: DO NOT DELETE IN-PROCESS ITEMS UNTIL YOU HAVE CONFIRMED THEY 
-- NEVER MADE IT TO THE BACK END CALL MANAGEMENT SYSTEMS!!!!!
-- 
-- STATE = 2 FOR In-process records
-- ----------------------------------------------------------------------------
--select * from xsr.pmr_state;

-- SQL to get HW Service Request created in SR, in Error State and older than 5 days
select 
   h.src_tran_id, h.src_appl, h.src_node, h.src_id, h.eci_id, h.prob_num, 
   h.state, date(h.create_datetime) as create_datetime
from xsr.pmr_hw_header_2_6 h where h.state = 2    -- In-process
   and h.eci_id = '0560907'
--   and SRC_TRAN_ID IN ('02I7IIOK5L')
order by h.create_datetime
with ur;


select distinct ph.eci_id, ph.src_tran_id, ph.src_id, ph.prob_num, ph.iso_cntry_code_2, ph.state, ei.status, ph.create_datetime
   ,max(e.eci_error_code) as eci_error_code
   ,ei.sr_create_date
   ,max(date(ml.reprocess_datetime)) as reprocess_dte
from xsr.pmr_hw_header_2_6 ph 
   inner join xsr.pmr_hw_eci_info_3_1 ei on (ph.src_tran_id = ei.src_tran_id)
   left outer join xsr.pmr_hw_eci_message_log ml on (ph.src_id = ml.src_id)
   left outer join xsr.pmr_hw_error e on (ph.src_id = e.src_id)
where ph.state = 4
--and ph.src_tran_id in ('0257SVYUNT','024WRN75MX','024T3LGLPS')
  and ph.eci_id = '0560907'
group by ph.eci_id, ph.src_tran_id, ph.src_id, ph.prob_num, ph.iso_cntry_code_2, ph.state, ei.status, ph.create_datetime, ei.sr_create_date
with ur;

--select * from xsr.pmr_hw_text_3_1 where SRC_TRAN_ID IN ('PEgREelezd');
--select * from xsr.pmr_hw_eci_message_log ml where ml.src_id = '0L0TSXB908' with ur;

-- ----------------------------------------------------------------------------
-- 1) Insert xsr.pmr_hw_text into Archive and the Delete record
insert into xsr.pmr_hw_text_3_1_arc
(
   pmr_hw_text_id, src_tran_id, src_appl, src_node, text_block, src_create_date,
   src_create_time, status_date, status_time, status, comments_attach, create_user,
   create_datetime, update_user, update_datetime, eci_error_code, gmt_offset,
   ibm_login_id, message_type
)
select pmr_hw_text_id, src_tran_id, src_appl, src_node, text_block, src_create_date,
      src_create_time, status_date, status_time, status, comments_attach, create_user,
      create_datetime, update_user, update_datetime, eci_error_code, gmt_offset,
      ibm_login_id, message_type
from xsr.pmr_hw_text_3_1 t
where (src_tran_id, src_appl, src_node) in 
(
   select h.src_tran_id, h.src_appl, h.src_node
   from xsr.pmr_hw_header_2_6 h 
where h.state = 2
   and h.SRC_TRAN_ID IN ('024T3LGLPS','024WRN75MX','0257SVYUNT','025DUSZ2D0','025E81I4B1','025E83AHYH','025E8839YF')
   order by h.create_datetime
)
and not exists
(select 1 from xsr.pmr_hw_text_3_1_arc a where t.pmr_hw_text_id = a.pmr_hw_text_id)
fetch first 1000 rows only;


delete from xsr.pmr_hw_text_3_1
where (src_tran_id, src_appl, src_node) in 
(
   select h.src_tran_id, h.src_appl, h.src_node
   from xsr.pmr_hw_header_2_6 h 
   where h.state = 2
   and h.SRC_TRAN_ID IN ('024T3LGLPS','024WRN75MX','0257SVYUNT','025DUSZ2D0','025E81I4B1','025E83AHYH','025E8839YF')
   order by h.create_datetime
);

-- ----------------------------------------------------------------------------
-- 2) Insert xsr.pmr_hw_cust_location into Archive and the Delete record
insert into xsr.pmr_hw_cust_location_arc
(
   src_tran_id, src_appl, src_node, cam_cust_loc_id, cust_loc_alias, cust_add_1,
   cust_add_2, cust_city, cust_state, cust_zip, cust_loc, cust_loc_phone_no,
   cust_loc_phone_no_ext, create_user, create_datetime, update_user, update_datetime
)
select src_tran_id, src_appl, src_node, cam_cust_loc_id, cust_loc_alias, cust_add_1,
   cust_add_2, cust_city, cust_state, cust_zip, cust_loc, cust_loc_phone_no,
   cust_loc_phone_no_ext, create_user, create_datetime, update_user, update_datetime
from xsr.pmr_hw_cust_location
where (src_tran_id, src_appl, src_node) in (
   select h.src_tran_id, h.src_appl, h.src_node
   from xsr.pmr_hw_header_2_6 h 
   where h.state = 2
   and h.SRC_TRAN_ID IN ('024T3LGLPS','024WRN75MX','0257SVYUNT','025DUSZ2D0','025E81I4B1','025E83AHYH','025E8839YF')
   order by h.create_datetime
);

delete from xsr.pmr_hw_cust_location
where (src_tran_id, src_appl, src_node) in (
   select h.src_tran_id, h.src_appl, h.src_node
   from xsr.pmr_hw_header_2_6 h 
   where h.state = 2
and SRC_TRAN_ID IN ('024T3LGLPS','024WRN75MX','0257SVYUNT','025DUSZ2D0','025E81I4B1','025E83AHYH','025E8839YF')
   order by h.create_datetime
);

-- ----------------------------------------------------------------------------
-- 3) Insert xsr.pmr_hw_part into Archive and the Delete record
insert into xsr.pmr_hw_part_arc
(
   part_number, src_tran_id, src_appl, src_node, src_update_timestamp, qty,
   create_user, create_datetime, update_user, update_datetime
)
select part_number, src_tran_id, src_appl, src_node, src_update_timestamp, qty,
   create_user, create_datetime, update_user, update_datetime
from xsr.pmr_hw_part
where (src_tran_id, src_appl, src_node) in (
   select h.src_tran_id, h.src_appl, h.src_node
   from xsr.pmr_hw_header_2_6 h 
   where h.state = 2
   and h.SRC_TRAN_ID IN ('024T3LGLPS','024WRN75MX','0257SVYUNT','025DUSZ2D0','025E81I4B1','025E83AHYH','025E8839YF')
   order by h.create_datetime
);

delete from xsr.pmr_hw_part
where (src_tran_id, src_appl, src_node) in (
   select h.src_tran_id, h.src_appl, h.src_node
   from xsr.pmr_hw_header_2_6 h 
   where h.state = 2
   and h.SRC_TRAN_ID IN ('024T3LGLPS','024WRN75MX','0257SVYUNT','025DUSZ2D0','025E81I4B1','025E83AHYH','025E8839YF')
   order by h.create_datetime
);

-- ----------------------------------------------------------------------------
-- 4) Insert xsr.pmr_hw_air_cair into Archive and the Delete record
insert into xsr.pmr_hw_air_cair_arc
(
   src_tran_id, src_appl, src_node, work_num, wkna_activity_num, bill_code, eca_num,
   acct_code, fixed_price, contract_end_date, planned_work_force, service_code,
   activity_code, firm_schedule, response_sla, planned_onsite_duration,
   planned_travel_duration, acct_trained_skill, num_of_techs_a, skill_level_a,
   num_of_techs_b, skill_level_b, skill_definition, request_ref_num, cso_due_date,
   cso_rpmes_num, cso_plant_order_num, create_user, create_datetime, update_user,
   update_datetime
)
select src_tran_id, src_appl, src_node, work_num, wkna_activity_num, bill_code, eca_num,
   acct_code, fixed_price, contract_end_date, planned_work_force, service_code,
   activity_code, firm_schedule, response_sla, planned_onsite_duration,
   planned_travel_duration, acct_trained_skill, num_of_techs_a, skill_level_a,
   num_of_techs_b, skill_level_b, skill_definition, request_ref_num, cso_due_date,
   cso_rpmes_num, cso_plant_order_num, create_user, create_datetime, update_user,
   update_datetime
from xsr.pmr_hw_air_cair
where (src_tran_id, src_appl, src_node) in (
   select h.src_tran_id, h.src_appl, h.src_node
   from xsr.pmr_hw_header_2_6 h 
   where h.state = 2
   and h.SRC_TRAN_ID IN ('024T3LGLPS','024WRN75MX','0257SVYUNT','025DUSZ2D0','025E81I4B1','025E83AHYH','025E8839YF')
   order by h.create_datetime
);				

delete from xsr.pmr_hw_air_cair
where (src_tran_id, src_appl, src_node) in (
   select h.src_tran_id, h.src_appl, h.src_node
   from xsr.pmr_hw_header_2_6 h 
   where h.state = 2
   and h.SRC_TRAN_ID IN ('024T3LGLPS','024WRN75MX','0257SVYUNT','025DUSZ2D0','025E81I4B1','025E83AHYH','025E8839YF')
   order by h.create_datetime
);


-- ----------------------------------------------------------------------------
-- 5) Insert xsr.pmr_hw_xsr_info into Archive and the Delete record
insert into xsr.pmr_hw_xsr_info_arc
(
   src_tran_id, src_appl, src_node, is_oem, title, description, contact_method,
   create_contact_id, update_contact_id, owner_contact_id, provisional_pmr,
   initial_severity, locale, prob_type, create_user, create_datetime, update_user,
   update_datetime, requires_registration
)
select src_tran_id, src_appl, src_node, is_oem, title, description, contact_method,
   create_contact_id, update_contact_id, owner_contact_id, provisional_pmr,
   initial_severity, locale, prob_type, create_user, create_datetime, update_user,
   update_datetime, requires_registration
from xsr.pmr_hw_xsr_info
where (src_tran_id, src_appl, src_node) in (
   select h.src_tran_id, h.src_appl, h.src_node
   from xsr.pmr_hw_header_2_6 h 
   where h.state = 2
   and h.SRC_TRAN_ID IN ('024T3LGLPS','024WRN75MX','0257SVYUNT','025DUSZ2D0','025E81I4B1','025E83AHYH','025E8839YF')
   order by h.create_datetime
);

delete from xsr.pmr_hw_xsr_info
where (src_tran_id, src_appl, src_node) in (
   select h.src_tran_id, h.src_appl, h.src_node
   from xsr.pmr_hw_header_2_6 h 
   where h.state = 2
   and h.SRC_TRAN_ID IN ('024T3LGLPS','024WRN75MX','0257SVYUNT','025DUSZ2D0','025E81I4B1','025E83AHYH','025E8839YF')
   order by h.create_datetime
);


-- ----------------------------------------------------------------------------
-- 6) Insert xsr.pmr_hw_eci_info_3_1 into Archive and the Delete record
insert into xsr.pmr_hw_eci_info_3_1_arc
(
   src_tran_id, src_appl, src_node, status, acct_profile, request_type,
   sub_request_type, contract_num, cust_tracking_num, cust_name, contact_name,
   phone_num, phone_ext, email_address, severity, orig_code, mach_type, mach_model,
   mach_serial_num, gmt_offset, sr_create_date, sr_create_time, sr_update_date,
   sr_update_time, future_date, future_time, language, special_bid, part_id,
   fail_element, prod_error_code, serv_rep_name, call_sync_status, national_lang_flag,
   territory, ibm_login_id, create_user, create_datetime, update_user, update_datetime
)
select src_tran_id, src_appl, src_node, status, acct_profile, request_type,
   sub_request_type, contract_num, cust_tracking_num, cust_name, contact_name,
   phone_num, phone_ext, email_address, severity, orig_code, mach_type, mach_model,
   mach_serial_num, gmt_offset, sr_create_date, sr_create_time, sr_update_date,
   sr_update_time, future_date, future_time, language, special_bid, part_id,
   fail_element, prod_error_code, serv_rep_name, call_sync_status, national_lang_flag,
   territory, ibm_login_id, create_user, create_datetime, update_user, update_datetime
from xsr.pmr_hw_eci_info_3_1
where (src_tran_id, src_appl, src_node) in (
   select h.src_tran_id, h.src_appl, h.src_node
   from xsr.pmr_hw_header_2_6 h 
   where h.state = 2
   and h.SRC_TRAN_ID IN ('024T3LGLPS','024WRN75MX','0257SVYUNT','025DUSZ2D0','025E81I4B1','025E83AHYH','025E8839YF')
   order by h.create_datetime
);

delete from xsr.pmr_hw_eci_info_3_1
where (src_tran_id, src_appl, src_node) in (
   select h.src_tran_id, h.src_appl, h.src_node
   from xsr.pmr_hw_header_2_6 h 
   where h.state = 2
   and h.SRC_TRAN_ID IN ('024T3LGLPS','024WRN75MX','0257SVYUNT','025DUSZ2D0','025E81I4B1','025E83AHYH','025E8839YF')
   order by h.create_datetime
);


-- ----------------------------------------------------------------------------
-- 7) Insert xsr.pmr_hw_header_2_6 into Archive and the Delete record
insert into xsr.pmr_hw_header_2_6_arc
(
   src_tran_id, src_appl, src_node, eci_id, src_id, prob_num, iso_cntry_code_2, state,
   entitled, create_user, create_datetime, update_user, update_datetime, partner_init
)
select src_tran_id, src_appl, src_node, eci_id, src_id, prob_num, iso_cntry_code_2, state,
   entitled, create_user, create_datetime, update_user, update_datetime, partner_init
from xsr.pmr_hw_header_2_6
where (src_tran_id, src_appl, src_node) in (
   select h.src_tran_id, h.src_appl, h.src_node
   from xsr.pmr_hw_header_2_6 h 
   where h.state = 2
   and h.SRC_TRAN_ID IN ('024T3LGLPS','024WRN75MX','0257SVYUNT','025DUSZ2D0','025E81I4B1','025E83AHYH','025E8839YF')
   order by h.create_datetime
);

delete from xsr.pmr_hw_header_2_6
where (src_tran_id, src_appl, src_node) in (
   select h.src_tran_id, h.src_appl, h.src_node
   from xsr.pmr_hw_header_2_6 h 
   where h.state = 2
   and SRC_TRAN_ID IN ('024T3LGLPS','024WRN75MX','0257SVYUNT','025DUSZ2D0','025E81I4B1','025E83AHYH','025E8839YF')
   order by h.create_datetime
);
