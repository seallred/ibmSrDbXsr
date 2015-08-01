-- Check for quads submitted on PMRs
select ri.prod_id, ri.prod_id_version, ri.comp_id, ri.comp_id_release, count(*) 
  from xsr.pmr_retain_info ri
      left outer join cam.prod_version pv on ri.prod_id = pv.prod_id and ri.prod_id_version = pv.prod_id_version
group by ri.prod_id, ri.prod_id_version, ri.comp_id, ri.comp_id_release
having count(*) > 50
order by 5 desc
fetch first 100 rows only
with ur;

-- Get description for products submited on pmrs
select a.*, pv.description_sr 
from (
select ri.prod_id, ri.prod_id_version, ri.comp_id, ri.comp_id_release, count(*) as cnt
  from xsr.pmr_retain_info ri
group by ri.prod_id, ri.prod_id_version, ri.comp_id, ri.comp_id_release
) a
left outer join cam.prod_version pv on ri.prod_id = pv.prod_id and ri.prod_id_version = pv.prod_id_version
having count(*) > 50
order by 5 desc
fetch first 100 rows only
with ur;

select * from cam.prod_version pv where pv.prod_id = '5724V66' with ur;

