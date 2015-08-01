-- ----------------------------------------------------------------------------
-- Debugging Hardware Error Conditions
-- ----------------------------------------------------------------------------

select * from xsr.pmr_hw_eci_message_log ml where eci_id = '7777777' and src_id = '08XY4E5OP1' with ur;
select * from xsr.pmr_hw_eci_message_log ml where eci_id = '7777777' and src_id = '09AO5LYOP2' with ur;
select * from xsr.pmr_hw_eci_message_log ml where src_id = '09AJKE8ZP2' with ur;
--08XW9MDXP1 - machine type error
--0T56W4CPHZ
--09AKV1SRP2
--0B2A8LSBUI
--09AJKE8ZP2

select * from xsr.pmr_hw_header_2_6 where src_tran_id = '09AO5LYO4H' with ur;

select * from cam.customer_cntry_list_xref where eci_id = '7777777' with ur;
select * from cam.hw_machine_sn_required where type in ('4693', '8750', '2615') with ur;


select * from xsr.pmr_hw_eci_message_log ml where message like '%E076%' and date(ml.create_datetime) > (current date - 14 days) with ur;
select * from xsr.pmr_hw_eci_message_log ml where eci_id = '0920991'  and src_id = '02LPETBYP3' --and prob_num = 'DJLKZQS' and message like '%BLACK%'  
with ur;


select * from xsr.pmr_hw_header_2_6 ph where src_tran_id = '02LPETBYQZ' with ur;


-- HW MPR's by State
select s.state, s.name, count(*) from xsr.pmr_hw_header_2_6 ph 
   inner join xsr.pmr_state s on (ph.state = s.state)
where date(ph.create_datetime) > (current date - 14 days) 
group by s.state, s.name
with ur;


-- Reasons for errors
select distinct ph.src_id, e.eci_error_code,
   case
      when eci_msg like '%E076%' then 'SN Error'
      when eci_msg like '%E102%' then 'Prioirty Error'      --alpha numeric
      when eci_msg like '%E006%' then 'Zipcode Error'       --alpha numeric
      when eci_msg like '%E008%' then 'Contact phone number Error'       --alpha numeric
      when eci_msg like '%E009%' then 'Machine Type Error'  --alpha numeric
      when eci_msg like '%E010%' then 'Customer phone number Error'           --character
      when eci_msg like '%E011%' then 'Customer location phone number Error'   --character
      when eci msg like '%E036%' then 'Contact name'
      else 'unknown'    
   end as error, 
   e.error_message,
   e.eci_msg
from xsr.pmr_hw_header_2_6 ph 
   --inner join xsr.pmr_hw_eci_message_log ml on (ph.src_id = ml.src_id)
   inner join xsr.pmr_hw_error e on (ph.src_id = e.src_id)
where state = 4 and date(ph.create_datetime) > (current date - 14 days) 
--and ph.eci_id = '0613072' and ph.src_id = '02LPEALRP3' 
with ur;


select ph.src_id, ml.*
from xsr.pmr_hw_header_2_6 ph 
   inner join xsr.pmr_hw_eci_message_log ml on (ph.src_id = ml.src_id)
where state = 4 and date(ph.create_datetime) > (current date - 14 days) 
and ph.src_id not in 
   (select src_id from xsr.pmr_hw_eci_message_log ml 
    where (message like '%E076%' or message like '%E102%' or message like '%E006%') and date(ml.create_datetime) > (current date - 14 days))
with ur;


select eci_error_code, log_text from xsr.pmr_hw_log 
where eci_error_code <> '0000' order by create_datetime desc fetch first 1000 rows only;

select eci_error_code, count(*) from xsr.pmr_hw_log 
where eci_error_code <> '0000' group by eci_error_code;

select count(*) from xsr.pmr_hw_eci_info_3_1 where lower(email_address) = 'scvar@au1.ibm.com' with ur;