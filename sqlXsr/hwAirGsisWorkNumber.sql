
select ph.eci_id, ph.prob_num, ph.src_id from xsr.pmr_hw_header_2_6 ph
inner join cam.customer_profile cp on ph.eci_id=cp.eci_id
inner join xsr.pmr_hw_air_cair pac on ph.src_tran_id=pac.src_tran_id
--inner join xsr.pmr_hw_eci_message_log peml on ph.src_id=peml.src_id and ph.eci_id=peml.eci_id
where cp.support_group_id=7
and pac.work_num is null
--and peml.record_type='0001'
--and peml.message like '%01410005%' 
order by ph.eci_id, ph.prob_num, ph.src_id 
with ur;



select ph.prob_num, ph.src_id, ph.eci_id, ph.create_datetime, peml.message from xsr.pmr_hw_header_2_6 ph
inner join cam.customer_profile cp on ph.eci_id=cp.eci_id
inner join xsr.pmr_hw_air_cair pac on ph.src_tran_id=pac.src_tran_id
inner join xsr.pmr_hw_eci_message_log peml on ph.src_id=peml.src_id and ph.eci_id=peml.eci_id
where cp.support_group_id=7
and pac.work_num is null
and peml.record_type='0001'
--and peml.message like '%01410005%'  
with ur;