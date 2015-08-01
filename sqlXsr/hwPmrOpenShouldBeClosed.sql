-- Lookup open HW records that should be closed
-- 1759267 records
select date(ph.update_datetime), count(*) from xsr.pmr_hw_header_2_6 ph
inner join xsr.pmr_hw_eci_info_3_1 pei on ph.src_tran_id=pei.src_tran_id
where ph.state != 5 
and pei.status in ('CA', 'CL', 'CX', 'CLO', 'CCO', 'CCC', 'CCI', 'CCH', 'CCF', 'CCL')
group by date(ph.update_datetime)
order by date(ph.update_datetime) desc;

select count(*) from xsr.pmr_hw_header_2_6 ph
inner join xsr.pmr_hw_eci_info_3_1 pei on ph.src_tran_id=pei.src_tran_id
where ph.state != 5 and pei.status in ('CA', 'CL', 'CX', 'CLO', 'CCO', 'CCC', 'CCI', 'CCH', 'CCF', 'CCL')
with ur; 

-- pmr_hw_text_3_1 records associated with hw problems that where state is open but should be closed
-- 18434230 records
select count(*) from xsr.pmr_hw_text_3_1 where src_tran_id in (
select ph.src_tran_id from xsr.pmr_hw_header_2_6 ph
inner join xsr.pmr_hw_eci_info_3_1 pei on ph.src_tran_id=pei.src_tran_id
where ph.state != 5 and pei.status in ('CA', 'CL', 'CX', 'CLO', 'CCO', 'CCC', 'CCI', 'CCH', 'CCF', 'CCL'));  

select date(ph.update_datetime), pei.status, count(*) from xsr.pmr_hw_header_2_6 ph
inner join xsr.pmr_hw_eci_info_3_1 pei on ph.src_tran_id=pei.src_tran_id
where ph.state != 5 
and pei.status in ('CA', 'CL', 'CX', 'CLO', 'CCO', 'CCC', 'CCI', 'CCH', 'CCF', 'CCL')
group by date(ph.update_datetime), pei.status
order by date(ph.update_datetime) desc;

-- --------------------------------------------------------------------------------------------
-- FIX
-- --------------------------------------------------------------------------------------------
update  xsr.pmr_hw_header_2_6 b set b.state = 5, b.update_user = 'manual_update'
--select count(*) from xsr.pmr_hw_header_2_6 b
where b.state != 5
and exists
(
   select 1 from xsr.pmr_hw_eci_info_3_1 x 
   where x.status in ('CA', 'CL', 'CX', 'CLO', 'CCO', 'CCC', 'CCI', 'CCH', 'CCF', 'CCL')
   and (x.src_tran_id, x.src_appl, x.src_node) = (b.src_tran_id, b.src_appl, b.src_node)
);

update  xsr.pmr_hw_header_2_6 b set b.state = 6, b.update_user = 'manual_update'
--select count(*) from xsr.pmr_hw_header_2_6 b where b.state = 6
where b.state != 5
and exists
(
   select 1
   from xsr.pmr_hw_header_2_6 ph
      left outer join xsr.pmr_hw_text_3_1 l on ph.src_tran_id = l.src_tran_id
      left outer join xsr.pmr_hw_cust_location c on ph.src_tran_id = c.src_tran_id
      left outer join xsr.pmr_hw_xsr_info x on ph.src_tran_id = x.src_tran_id
      left outer join xsr.pmr_hw_eci_info_3_1 e on ph.src_tran_id = e.src_tran_id
      left outer join xsr.pmr_hw_part p on ph.src_tran_id = p.src_tran_id
   where (ph.src_tran_id, ph.src_appl, ph.src_node) = (b.src_tran_id, b.src_appl, b.src_node)
   and ph.create_datetime between '2014-08-01 00:00:00.000000' and '2014-11-20 00:00:00.000000' 
   and l.src_tran_id is null
   and x.src_tran_id is null
   and e.src_tran_id is null
   and c.src_tran_id is null
   --and p.src_tran_id is null
)
with ur;
