select * from xsr.pmr_header fetch first 10 rows only;

select * from xsr.pmr_log fetch first 10 rows only;
select * from xsr.pmr_route_log fetch first 10 rows only;


with temp (src_appl, src_tran_id, src_node, pmr_num, branch, retain_cntry_code,
--   pmr_log_id,
   route_log_id)
as (
select distinct ph.src_appl, ph.src_tran_id, ph.src_node, ph.pmr_num, ph.branch, ph.retain_cntry_code,
--       pl.pmr_log_id,
       prl.route_log_id
  from xsr.pmr_header ph
       left outer join xsr.pmr_log pl
         on (ph.src_appl = pl.src_appl and ph.src_tran_id = pl.src_tran_id and ph.src_node = pl.src_node)
       left outer join xsr.pmr_route_log prl
         on (ph.src_appl = prl.src_appl and ph.src_tran_id = prl.src_tran_id and ph.src_node = prl.src_node)
) select * from temp where src_appl = 'XSR' and route_log_id is null;
select src_appl, count(*) from temp where pmr_log_id is null group by src_appl
select src_appl, count(*) from temp where route_log_id is null group by src_appl
--fetch first 100 rows only;


select distinct ph.*,
        pl.pmr_log_id,
        prl.route_log_id
  from xsr.pmr_header ph
        left outer join xsr.pmr_log pl
          on (ph.src_appl = pl.src_appl and ph.src_tran_id = pl.src_tran_id and ph.src_node = pl.src_node)
        left outer join xsr.pmr_route_log prl
          on (ph.src_appl = prl.src_appl and ph.src_tran_id = prl.src_tran_id and ph.src_node = prl.src_node)
 where ph.pmr_num in ('20249','20257','20265','20266','20273','20323')
   and ph.branch = '004'
   and ph.retain_cntry_code = '000';

select *


with temp (src_appl, src_tran_id, src_node, pmr_num, branch, retain_cntry_code, create_date,
   pmr_log_id,
   route_log_id)
as (
select distinct ph.src_appl, ph.src_tran_id, ph.src_node, ph.pmr_num, ph.branch, ph.retain_cntry_code,
       date(ph.create_datetime),
       pl.pmr_log_id,
       prl.route_log_id
  from xsr.pmr_header ph
       left outer join xsr.pmr_log pl
         on (ph.src_appl = pl.src_appl and ph.src_tran_id = pl.src_tran_id and ph.src_node = pl.src_node)
       left outer join xsr.pmr_route_log prl
         on (ph.src_appl = prl.src_appl and ph.src_tran_id = prl.src_tran_id and ph.src_node = prl.src_node)
) select create_date, src_node, count(*) from temp
 where src_appl = 'XSR' and create_date >= '2008-12-01'
 group by create_date, src_node;

