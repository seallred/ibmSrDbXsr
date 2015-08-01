-- ----------------------------------------------------------------------------
-- PMR HW Service Request Clean-up - used to remove problems in error state
-- ----------------------------------------------------------------------------

--select * from xsr.pmr_state;
--select * from xsr.hw_origination_code;
--select * from xsr.pmr_hw_header_2_6 where state = 2 and eci_id = '4469900';

-- SQL to get HW Service Request created in SR, in Error State and older than 5 days
select --u.contact_id, 
      h.src_tran_id, h.src_appl, h.src_node, h.eci_id, h.prob_num, 
      h.state, date(h.create_datetime) as create_datetime --, x.sr_create_date 
from xsr.pmr_hw_header_2_6 h 
--   left outer join xsr.pmr_hw_eci_info_3_1 x on (h.src_tran_id, h.src_appl, h.src_node) = (x.src_tran_id, x.src_appl, x.src_node)
--   inner join xsr.user_pmr_hw_xref u on (h.src_tran_id, h.src_appl, h.src_node) = (u.src_tran_id, u.src_appl, u.src_node)
where h.state in (4)    -- error
and h.eci_id = '0228791'
--and u.contact_id = 3029079
order by h.create_datetime
with ur;



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
where h.state = 4
and h.eci_id = '0228791'
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
      inner join xsr.pmr_hw_eci_info_3_1 x on (h.src_tran_id, h.src_appl, h.src_node) = (x.src_tran_id, x.src_appl, x.src_node)
   where h.state = 4
--   and x.orig_code = 'S'
and h.eci_id = '0228791'
--   and sr_create_date < (current date - 5 days)
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
   where h.state = 4
and h.eci_id = '0228791'
   order by h.create_datetime
);

delete from xsr.pmr_hw_cust_location
where (src_tran_id, src_appl, src_node) in (
   select h.src_tran_id, h.src_appl, h.src_node
   from xsr.pmr_hw_header_2_6 h 
   where h.state = 4
and h.eci_id = '0228791'
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
   where h.state = 4
and h.eci_id = '0228791'
   order by h.create_datetime
);

delete from xsr.pmr_hw_part
where (src_tran_id, src_appl, src_node) in (
   select h.src_tran_id, h.src_appl, h.src_node
   from xsr.pmr_hw_header_2_6 h 
   where h.state = 4
and h.eci_id = '0228791'
   and sr_create_date < (current date - 5 days)
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
   where h.state = 4
and h.eci_id = '0228791'
   order by h.create_datetime
);				

delete from xsr.pmr_hw_air_cair
where (src_tran_id, src_appl, src_node) in (
   select h.src_tran_id, h.src_appl, h.src_node
   from xsr.pmr_hw_header_2_6 h 
   where h.state = 4
and h.eci_id = '0228791'
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
   where h.state = 4
and h.eci_id = '0228791'
   order by h.create_datetime
);

delete from xsr.pmr_hw_xsr_info
where (src_tran_id, src_appl, src_node) in (
   select h.src_tran_id, h.src_appl, h.src_node
   from xsr.pmr_hw_header_2_6 h 
   where h.state = 4
and h.eci_id = '0228791'
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
   where h.state = 4
and h.eci_id = '0228791'
   order by h.create_datetime
);

delete from xsr.pmr_hw_eci_info_3_1
where (src_tran_id, src_appl, src_node) in (
   select h.src_tran_id, h.src_appl, h.src_node
   from xsr.pmr_hw_header_2_6 h 
   where h.state = 4
and h.eci_id = '0228791'
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
      inner join xsr.pmr_hw_eci_info_3_1_arc x on (h.src_tran_id, h.src_appl, h.src_node) = (x.src_tran_id, x.src_appl, x.src_node)
   where h.state = 4
and h.eci_id = '0228791'
   order by h.create_datetime
);

delete from xsr.pmr_hw_header_2_6
where (src_tran_id, src_appl, src_node) in (
   select h.src_tran_id, h.src_appl, h.src_node
   from xsr.pmr_hw_header_2_6 h 
      inner join xsr.pmr_hw_eci_info_3_1_arc x on (h.src_tran_id, h.src_appl, h.src_node) = (x.src_tran_id, x.src_appl, x.src_node)
   where h.state = 4
and h.eci_id = '0228791'
   order by h.create_datetime
);
