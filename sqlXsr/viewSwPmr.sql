
-- View PMR by PMR Number
select * from xsr.pmr_header ph where ph.pmr_num = '24290' and ph.branch = '999' and ph.retain_cntry_code = '760' with ur;


select pmr_num, branch, ph.retain_cntry_code, ph.src_tran_id, ph.src_appl, ph.src_node, ibm_cust_num 
from xsr.pmr_header ph
   inner join xsr.pmr_retain_info ri on ph.src_tran_id = ri.src_tran_id and ph.src_appl = ri.src_appl and ph.src_node = ri.src_node
where ph.pmr_num = '24290' and ph.branch = '999' and ph.retain_cntry_code = '760' 
with ur;


-- View PMR Log information
select count(*) from xsr.pmr_log with ur;
select * from xsr.pmr_log ph where ph.pmr_num = '40556' and ph.branch = '689' and ph.retain_cntry_code = '864' with ur;
select * from xsr.pmr_log_2_2 ph where ph.pmr_num = '40556' and ph.branch = '689' and ph.retain_cntry_code = '864' with ur;




-- View PMR attachment
select * from xsr.pmr_attachment where SRC_TRAN_ID = '33031424333386119' AND SRC_APPL = 'XSR' AND SRC_NODE IN 'prNode3' with ur;

-- View PMR Attachment Log
select * from xsr.pmr_attachment_log where pmr_attachment_id in (
select attachment_id from xsr.pmr_attachment where SRC_TRAN_ID = '33031424333386119' AND SRC_APPL = 'XSR' AND SRC_NODE IN 'prNode3'
) with ur;