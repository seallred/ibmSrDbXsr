-- ----------------------------------------------------------------------------
-- Views to help with config tables
-- ----------------------------------------------------------------------------

--select * from xsr.pmr_state;
--select * from xsr.pmr_hw_status;
--select * from xsr.request_type;
--select "work_num 0141 (1, 7)" from xsr.v_hw_create where prob_num='FJTWJZJ';
--select * from xsr.v_hw_create where phh_create_datetime > (current timestamp - 4 hours);
--select * from xsr.pmr_hw_header_2_6 phh  --where phh.src_tran_id = '085Z50URLE';
--   inner join xsr.pmr_hw_eci_info_2_6 phei on phh.src_tran_id = phei.src_tran_id
--   inner join xsr.pmr_hw_xsr_info phxi on phh.src_tran_id=phxi.src_tran_id
--   inner join xsr.pmr_hw_cust_location phcl on phh.src_tran_id=phcl.src_tran_id
--   inner join xsr.request_type rt on phei.request_type=rt.req_type_code
--   inner join xsr.request_sub_type rst on phei.sub_request_type=rst.req_sub_type_code and rt.req_type_id=rst.req_type_id   
-- where phh.src_tran_id = '085Z50URLE';
--select * from xsr.v_hw_create where src_tran_id = '085Z50URLE'

drop view xsr.v_hw_create;
create view xsr.v_hw_create as 
select phh.src_tran_id, phh.src_appl, phh.src_node
       ,phh.eci_id as eci_id_h6, phh.iso_cntry_code_2 as iso_cc
       ,phh.src_id as src_id_40
       ,sg.description as cust_type
       ,phh.prob_num, ps.name || ' (' || rtrim(char(phh.state)) || ')' as state 
       ,phh.entitled
       ,phh.create_user as phh_create_user, phh.create_datetime as phh_create_datetime
       ,phh.update_user as phh_update_user, phh.update_datetime as phh_update_datetime
       
       ,phs.description || ' (' || rtrim(phei.status) || ')'  as status_19
       ,phei.acct_profile 
       ,rt.description || ' (' || rtrim(phei.request_type) || ')' as req_type_106_1_2
       ,rst.description || ' (' || rtrim(phei.sub_request_type) || ')' as sub_req_type_106_3_2
       ,phei.contract_num as contract_num_16, phei.cust_tracking_num as cust_tracking_num_7, phei.cust_name as cust_name_2
       ,phei.contact_name as contact_name_36, phei.phone_num as phone_num_1, phei.phone_ext as phone_ext_10
       ,phei.email_address as email_address_133, phei.severity as severity_25
       ,hoc.name || ' (' || rtrim(phei.orig_code) || ')' as orig_code_41
       ,phei.mach_type as mach_type_9, phei.mach_model as mach_model_35, phei.mach_serial_num as mach_serial_num_76, phei.gmt_offset
       ,phei.sr_create_date as sr_create_date_h7, phei.sr_create_time as sr_create_time_h8
       ,phei.sr_update_date, phei.sr_update_time, phei.future_date as future_date_23
       ,phei.future_time as future_time_24, phei.language, phei.special_bid, phei.part_id as part_id_32, phei.fail_element
       ,phei.prod_error_code as error_code_33
       ,phei.serv_rep_name, phei.call_sync_status, phei.national_lang_flag, phei.territory, phei.ibm_login_id as ibm_login_id
       ,phei.create_user as phei_create_user, phei.create_datetime as phei_create_datetime
       ,phei.update_user as phei_update_user, phei.update_datetime as phei_update_datetime
       
       ,phxi.is_oem, phxi.title, phxi.description, phxi.contact_method
	    ,phxi.create_contact_id, phxi.update_contact_id, phxi.owner_contact_id, phxi.provisional_pmr
	    ,phxi.initial_severity, phxi.locale as locale_145_84_5, phxi.prob_type, phxi.requires_registration
	    ,phxi.create_user as phxi_create_user, phxi.create_datetime as phxi_create_datetime
	    ,phxi.update_user as phxi_update_user, phxi.update_datetime as phxi_update_datetime 
              
       ,phcl.cam_cust_loc_id, phcl.cust_loc_alias, phcl.cust_add_1, phcl.cust_add_2
       ,phcl.cust_city, phcl.cust_state, phcl.cust_zip, phcl.cust_loc
       ,phcl.cust_loc_phone_no, phcl.cust_loc_phone_no_ext
       
       ,phac.work_num as work_num_141_1_7, phac.wkna_activity_num, phac.bill_code
       ,phac.eca_num, phac.acct_code, phac.fixed_price
       ,phac.contract_end_date, phac.planned_work_force, phac.service_code
       ,phac.activity_code, phac.firm_schedule, phac.response_sla
       ,phac.planned_onsite_duration, phac.planned_travel_duration
       ,phac.acct_trained_skill, phac.num_of_techs_a, phac.skill_level_a
       ,phac.num_of_techs_b, phac.skill_level_b, phac.skill_definition
       ,phac.request_ref_num, phac.cso_due_date, phac.cso_rpmes_num
       ,phac.cso_plant_order_num
       ,phac.create_user as phac_create_user, phac.create_datetime as phac_create_datetime
       ,phac.update_user as phac_update_user, phac.update_datetime as phac_update_datetime
  from xsr.pmr_hw_header_2_6 phh
   inner join xsr.pmr_hw_eci_info_2_6 phei on phh.src_tran_id=phei.src_tran_id
   inner join xsr.pmr_hw_xsr_info phxi on phh.src_tran_id=phxi.src_tran_id
   inner join xsr.pmr_hw_cust_location phcl on phh.src_tran_id=phcl.src_tran_id
   left outer join xsr.pmr_state ps on phh.state = ps.state
   left outer join xsr.pmr_hw_status phs on phs.status_cd = phei.status
   left outer join xsr.pmr_hw_air_cair phac on phh.src_tran_id=phac.src_tran_id
   left outer join xsr.request_type rt on phei.request_type=rt.req_type_code
   left outer join xsr.request_sub_type rst on phei.sub_request_type=rst.req_sub_type_code and rt.req_type_id=rst.req_type_id   
   left outer join (select cp.eci_id, sg.description from cam.customer_profile cp
      inner join cam.support_group sg on cp.support_group_id = sg.support_group_id) sg on phh.eci_id = sg.eci_id      
   left outer join xsr.hw_origination_code hoc on hoc.code = phei.orig_code
--where phh.prob_num='FJTWJZJ';
;

GRANT SELECT ON TABLE xsr.v_hw_create TO GROUP DB2US;
GRANT SELECT ON TABLE xsr.v_hw_create TO USER XSRIBMUS;



