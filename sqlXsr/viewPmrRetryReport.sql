-- PmrRetryMonitor
-- Watch for issues with the retry process.
-- Retry runs on v30015, so it's best to run the sql and point XAT to p3

select pr.create_datetime, pr.src_node, pr.create_user, prri.submit_type, pr.entitled, pr.src_tran_id, 
   pr.pmr_num, pr.branch, pr.retain_cntry_code, ic.description, rcc.retain_node, pr.retry_cnt, 
   pr.stage, prri.queue, prri.center, prri.severity
from xsr.pmr_retry pr
inner join xsr.pmr_retry_retain_info prri on pr.src_tran_id=prri.src_tran_id
inner join xsr.retain_cntry_code rcc on pr.retain_cntry_code=rcc.retain_cntry_code
left outer join cam.iso_cntry ic on pr.retain_cntry_code=ic.retain_cntry_code
where ic.description not in ('Jersey', 'Guernsey') or ic.description is null
order by pr.create_datetime desc 
with ur;

