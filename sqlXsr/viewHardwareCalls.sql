-- -----------------------------------------------------------------------------
-- HARDWARE RECORDS
-- -----------------------------------------------------------------------------
with t (table, date, count) as (
select 'pmr_hw_header_2_6', date(ph.create_datetime), count(*) from xsr.pmr_hw_header_2_6 ph group by date(ph.create_datetime)
union
select 'pmr_hw_eci_info_2_6', date(ph.create_datetime), count(*) from xsr.pmr_hw_eci_info_2_6 ph group by date(ph.create_datetime)
union
select 'pmr_hw_air_cair', date(ph.create_datetime), count(*) from xsr.pmr_hw_air_cair ph group by date(ph.create_datetime)
union
select 'pmr_hw_attachment', date(ph.create_datetime), count(*) from xsr.pmr_hw_attachment ph group by date(ph.create_datetime)
union
select 'pmr_hw_cust_location', date(ph.create_datetime), count(*) from xsr.pmr_hw_cust_location ph group by date(ph.create_datetime)
union
select 'pmr_hw_part', date(ph.create_datetime), count(*) from xsr.pmr_hw_part ph group by date(ph.create_datetime)
union
select 'pmr_hw_text_2_6', date(ph.create_datetime), count(*) from xsr.pmr_hw_text_2_6 ph group by date(ph.create_datetime)
union
select 'pmr_hw_xsr_info', date(ph.create_datetime), count(*) from xsr.pmr_hw_xsr_info ph group by date(ph.create_datetime)
union
select 'pmr_hw_eci_message_log', date(ph.create_datetime), count(*) from xsr.pmr_hw_eci_message_log ph group by date(ph.create_datetime)
)
select * from t where date = current date order by 1,2


select * from xsr.pmr_hw_header_2_6 where date(create_datetime) = current date;
select * from xsr.pmr_hw_eci_info_2_6  where date(create_datetime) = current date;
select * from xsr.pmr_hw_air_cair  where date(create_datetime) = current date;
--select * from xsr.pmr_hw_attachment  where date(create_datetime) = current date;
select * from xsr.pmr_hw_cust_location  where date(create_datetime) = current date;
select * from xsr.pmr_hw_eci_message_log  where date(create_datetime) = current date;
select * from xsr.pmr_hw_error  where date(create_datetime) = current date;
select * from xsr.pmr_hw_part  where date(create_datetime) = current date;
select * from xsr.pmr_hw_text_2_6  where date(create_datetime) = current date;
select * from xsr.pmr_hw_xsr_info  where date(create_datetime) = current date;

select status_cd, description from xsr.pmr_hw_status s where s.status_cd in ('TG', 'RC');


select ml.hw_eci_message_id, locate('0007', message), message from xsr.pmr_hw_eci_message_log ml where locate('0007', message) > 0;


select * from cam.support_group;
select * from cam.customer_profile;

-- Get 
select distinct h.*,
--       ei.*
--       ac.*
--       cl.*,
--       p.*,
       t.*
--       xi.*
from xsr.pmr_hw_header_2_6 h
   left outer join xsr.pmr_hw_eci_info_2_6 ei on h.src_tran_id = ei.src_tran_id and h.src_appl = ei.src_appl and h.src_node = ei.src_node
   left outer join xsr.pmr_hw_air_cair ac on h.src_tran_id = ac.src_tran_id and h.src_appl = ac.src_appl and h.src_node = ac.src_node
   left outer join xsr.pmr_hw_cust_location cl on h.src_tran_id = cl.src_tran_id and h.src_appl = cl.src_appl and h.src_node = cl.src_node
--   left outer join xsr.pmr_hw_part p on h.src_tran_id = p.src_tran_id and h.src_appl = p.src_appl and h.src_node = p.src_node
   left outer join xsr.pmr_hw_text_2_6 t on h.src_tran_id = t.src_tran_id and h.src_appl = t.src_appl and h.src_node = t.src_node
   left outer join xsr.pmr_hw_xsr_info xi on h.src_tran_id = xi.src_tran_id and h.src_appl = xi.src_appl and h.src_node = xi.src_node
where (h.src_tran_id = 'b4bhtVJMbv' and h.src_appl = 'ECISYNC' and h.src_node = 'ECIMQ')
   or h.eci_id = ''
   or h.prob_num = ''
with ur;