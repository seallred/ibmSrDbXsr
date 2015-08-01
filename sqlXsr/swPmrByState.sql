-- --------------------------------------------------------------------------------------------
-- Software Calls by State
-- --------------------------------------------------------------------------------------------


select * from xsr.pmr_state with ur;

select h.state, ri.severity, count(*) from xsr.pmr_header h 
   inner join xsr.pmr_retain_info ri on h.src_tran_id = ri.src_tran_id
where date(h.create_datetime) >= '2015-04-27'
group by h.state, ri.severity
with ur;