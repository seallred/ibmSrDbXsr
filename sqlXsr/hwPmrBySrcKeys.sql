-- ----------------------------------------------------------------------------
-- Check PMR HW tables for records by source keys
-- ----------------------------------------------------------------------------

select 'pmr_hw_header' from xsr.pmr_hw_header_2_6
where (src_tran_id, src_appl, src_node) = ('${srcTranId}$', '${srcAppl}$', '${srcNode}$')
union
select 'pmr_hw_eci_info_3_1' from xsr.pmr_hw_eci_info_3_1
where (src_tran_id, src_appl, src_node) = ('${srcTranId}$', '${srcAppl}$', '${srcNode}$')
union
select 'pmr_hw_xsr_info' from xsr.pmr_hw_xsr_info
where (src_tran_id, src_appl, src_node) = ('${srcTranId}$', '${srcAppl}$', '${srcNode}$')
union
select 'pmr_hw_air_cair' from xsr.pmr_hw_air_cair
where (src_tran_id, src_appl, src_node) = ('${srcTranId}$', '${srcAppl}$', '${srcNode}$')
union
select 'pmr_hw_cust_location' from xsr.pmr_hw_cust_location
where (src_tran_id, src_appl, src_node) = ('${srcTranId}$', '${srcAppl}$', '${srcNode}$')
union
select 'pmr_hw_text_3_1' from xsr.pmr_hw_text_3_1
where (src_tran_id, src_appl, src_node) = ('${srcTranId}$', '${srcAppl}$', '${srcNode}$')
union
select 'pmr_hw_part' from xsr.pmr_hw_part
where (src_tran_id, src_appl, src_node) = ('${srcTranId}$', '${srcAppl}$', '${srcNode}$')
union
select 'pmr_hw_attachment' from xsr.pmr_hw_attachment
where (src_tran_id, src_appl, src_node) = ('${srcTranId}$', '${srcAppl}$', '${srcNode}$')
union
select 'user_pmr_hw_xref' from xsr.user_pmr_hw_xref
where (src_tran_id, src_appl, src_node) = ('${srcTranId}$', '${srcAppl}$', '${srcNode}$');

