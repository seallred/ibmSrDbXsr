select coalesce(upa.read_flag, 0) as read_flag, a.*
from 
(
select ph.src_tran_id, ph.src_appl, ph.src_node, ph.pmr_num, ph.branch, ph.retain_cntry_code,
ph.state, ph.entitled, ph.partner_init, ph.create_user, ph.create_datetime, ph.update_user, ph.update_datetime, pri.sw_hd, pri.retain_node,
pri.status, pri.retain_caller_type, pri.ibm_cust_num, pri.cust_name_nls, pri.contact_name_nls, pri.phone_num, pri.phone_ext, pri.alt_phone_num,
pri.alt_phone_ext, pri.support_level, pri.queue, pri.center, pri.next_queue, pri.next_center, pri.request_type_id, pri.prod_id, pri.prod_id_version,
pri.comp_id, pri.comp_id_release, pri.severity, pri.system_down, pri.eng_support_flag, pri.apar_num, pri.priority_pg, pri.call_cat, pri.cuprimd, pri.pmr_create_date,
pri.pmr_create_time, pri.pmr_update_date, pri.pmr_update_time, pri.had_crca, pri.pmr_fup_date, pri.crca_update_datetime, pri.routing_id, pri.premium_response,
pxi.support_id, pxi.machine_id, pxi.title, pxi.description, pxi.contact_method, pxi.opersys_id, pxi.initial_severity, pxi.severity_description, pxi.locale, pxi.open_count,
pxi.create_contact_id, pxi.update_contact_id, pxi.cust_tracking_num, pxi.pmr_create_src_appl, pxi.other_comp_dscr, pxi.dac_type_id, pxi.owner_contact_id, pxi.provisional_pmr, up.contact_id
from xsr.pmr_header ph, 
   xsr.pmr_retain_info pri, 
   xsr.pmr_xsr_info pxi,
   xsr.user_profile up, 
   xsr.user_pmr_xref upx
where ph.src_tran_id=pri.src_tran_id and pri.src_tran_id=pxi.src_tran_id and ph.src_appl=pri.src_appl and pri.src_appl=pxi.src_appl 
and ph.src_node=pri.src_node and pri.src_node=pxi.src_node
and up.contact_id = 2290350 and upx.src_tran_id = ph.src_tran_id and upx.src_appl = ph.src_appl and upx.src_node = ph.src_node 
and (pri.status not like 'C%' or pri.status is null)
and (
   (ph.retain_cntry_code='000' and pri.ibm_cust_num='1763768') 
--   or (ph.retain_cntry_code='000' and pri.ibm_cust_num='5009052') 
--   or (ph.retain_cntry_code='000' and pri.ibm_cust_num='TEST202') or (ph.retain_cntry_code='000' and pri.ibm_cust_num='5274367') 
--   or (ph.retain_cntry_code='000' and pri.ibm_cust_num='3333333') or (ph.retain_cntry_code='000' and pri.ibm_cust_num='SRTEST7') 
--   or (ph.retain_cntry_code='866' and pri.ibm_cust_num='0996474') or (ph.retain_cntry_code='000' and pri.ibm_cust_num='SRTEST1')
   ) 
and up.contact_id = upx.contact_id) a 
left outer join xsr.user_pmr_action upa on a.src_tran_id = upa.src_tran_id and a.src_appl = upa.src_appl and a.src_node = upa.src_node and a.contact_id = upa.contact_id
;


select *
from xsr.pmr_header ph
   inner join xsr.pmr_retain_info pri on ph.src_tran_id = pri.src_tran_id and ph.src_appl=pri.src_appl
   inner join xsr.pmr_xsr_info pxi on ph.src_tran_id = pxi.src_tran_id and ph.src_appl = pxi.src_appl 
where ph.retain_cntry_code = '000' and pri.ibm_cust_num='7777777' and pri.status not like 'C%' 
;


select * 
from xsr.pmr_header ph
   inner join xsr.user_pmr_xref px on ph.src_tran_id = px.src_tran_id and ph.src_appl=px.src_appl
   inner join xsr.pmr_retain_info pri on px.src_tran_id = pri.src_tran_id and px.src_appl=pri.src_appl
where px.contact_id = 2071132
and pri.status not like 'C%' 