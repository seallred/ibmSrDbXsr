-- ----------------------------------------------------------------------------
-- Check PMR HW tables for records by problem number
-- ----------------------------------------------------------------------------

select 'pmr_hw_header' from xsr.pmr_hw_header_2_6
where prob_num = '${prob_num}$'
union
select 'pmr_hw_eci_info_3_1' from xsr.pmr_hw_eci_info_3_1 ei
where exists
   (select 1 from xsr.pmr_hw_header_2_6 h where prob_num = '${prob_num}$' and (h.src_tran_id, h.src_appl, h.src_node) = (ei.src_tran_id, ei.src_appl, ei.src_node))
union
select 'pmr_hw_xsr_info' from xsr.pmr_hw_xsr_info ei
where exists
   (select 1 from xsr.pmr_hw_header_2_6 h where prob_num = '${prob_num}$' and (h.src_tran_id, h.src_appl, h.src_node) = (ei.src_tran_id, ei.src_appl, ei.src_node))
union
select 'pmr_hw_air_cair' from xsr.pmr_hw_air_cair ei
where exists
   (select 1 from xsr.pmr_hw_header_2_6 h where prob_num = '${prob_num}$' and (h.src_tran_id, h.src_appl, h.src_node) = (ei.src_tran_id, ei.src_appl, ei.src_node))
union
select 'pmr_hw_cust_location' from xsr.pmr_hw_cust_location ei
where exists
   (select 1 from xsr.pmr_hw_header_2_6 h where prob_num = '${prob_num}$' and (h.src_tran_id, h.src_appl, h.src_node) = (ei.src_tran_id, ei.src_appl, ei.src_node))
union
select 'pmr_hw_text_3_1' from xsr.pmr_hw_text_3_1 ei
where exists
   (select 1 from xsr.pmr_hw_header_2_6 h where prob_num = '${prob_num}$' and (h.src_tran_id, h.src_appl, h.src_node) = (ei.src_tran_id, ei.src_appl, ei.src_node))
union
select 'pmr_hw_part' from xsr.pmr_hw_part ei
where exists
   (select 1 from xsr.pmr_hw_header_2_6 h where prob_num = '${prob_num}$' and (h.src_tran_id, h.src_appl, h.src_node) = (ei.src_tran_id, ei.src_appl, ei.src_node))
union
select 'pmr_hw_attachment' from xsr.pmr_hw_attachment ei
where exists
   (select 1 from xsr.pmr_hw_header_2_6 h where prob_num = '${prob_num}$' and (h.src_tran_id, h.src_appl, h.src_node) = (ei.src_tran_id, ei.src_appl, ei.src_node))
union
select 'user_pmr_hw_xref' from xsr.user_pmr_hw_xref ei
where exists
   (select 1 from xsr.pmr_hw_header_2_6 h where prob_num = '${prob_num}$' and (h.src_tran_id, h.src_appl, h.src_node) = (ei.src_tran_id, ei.src_appl, ei.src_node))
with ur;

