-- ----------------------------------------------------------------------------
-- Debugging Hardware Error Conditions
-- ----------------------------------------------------------------------------


-- ECI ID: 0000613
-- 2 In-process Pending
-- 5 In-process Error      - All Error Code 0007
select distinct ph.src_tran_id, ph.src_id, ph.prob_num, 
   e.eci_error_code,
   case      
      when e.eci_error_code = '0007' then 'Reject. Required fields are invalid or not present.'
      when e.eci_error_code = '0008' then 'Optional field errors have occurred but were minor.  An informational message is returned to sender and the record is processed. An example: The field was longer than specified.  The field is truncated and the record is processed.'
      when e.eci_error_code = '0017' then 'Optional field was sent on a record that was not specified in the ECI profile.  The field was ignored'
      when e.eci_error_code = '0012' then 'Reject. Unable to apply the specified status to call. The record was not processed.'
      when e.eci_error_code = '0023' then 'Reject. ECCO could not place call against customer record. The customer record is associated to another ECCO customer.'
   end as err_type,
   case
      when e.eci_msg like '%E076%' then 'SN Error'
      when e.eci_msg like '%E102%' then 'Prioirty Error'   
      when e.eci_msg like '%E006%' then 'Zipcode Error' 
      when e.eci_msg like '%E008%' then 'Contact phone number Error' 
      when e.eci_msg like '%E009%' then 'Machine Type Error'
      when e.eci_msg like '%E010%' then 'Customer phone number Error' 
      when e.eci_msg like '%E011%' then 'Customer location phone number Error' 
      when e.eci_msg like '%E036%' then 'Contact name'
      else 'unknown'       
   end as error
--   ph.create_datetime
from xsr.pmr_hw_header_2_6 ph 
   --inner join xsr.pmr_hw_eci_message_log ml on (ph.src_id = ml.src_id)
   inner join xsr.pmr_hw_error e on (ph.src_id = e.src_id)
where ph.eci_id = '0000613'
with ur;


-- ECI ID: 0525062
-- 2 In-process Pending
-- 5 In-process Error      - All Error Code 0007
select distinct ph.eci_id, ph.src_tran_id, ph.src_id, ph.prob_num, 
   e.eci_error_code,
   case      
      when e.eci_error_code = '0007' then 'Reject. Required fields are invalid or not present.'
      when e.eci_error_code = '0008' then 'Optional field errors have occurred but were minor.  An informational message is returned to sender and the record is processed. An example: The field was longer than specified.  The field is truncated and the record is processed.'
      when e.eci_error_code = '0017' then 'Optional field was sent on a record that was not specified in the ECI profile.  The field was ignored'
      when e.eci_error_code = '0012' then 'Reject. Unable to apply the specified status to call. The record was not processed.'
      when e.eci_error_code = '0023' then 'Reject. ECCO could not place call against customer record. The customer record is associated to another ECCO customer.'
   end as err_type,
   case
      when e.eci_msg like '%E076%' then 'SN Error'
      when e.eci_msg like '%E102%' then 'Prioirty Error'   
      when e.eci_msg like '%E006%' then 'Zipcode Error' 
      when e.eci_msg like '%E008%' then 'Contact phone number Error' 
      when e.eci_msg like '%E009%' then 'Machine Type Error'
      when e.eci_msg like '%E010%' then 'Customer phone number Error' 
      when e.eci_msg like '%E011%' then 'Customer location phone number Error' 
      when e.eci_msg like '%E036%' then 'Contact name'
      when e.eci_msg like '%E147%' then 'Status Code'
      else 'unknown'       
   end as error,
   e.create_datetime
from xsr.pmr_hw_header_2_6 ph 
   --inner join xsr.pmr_hw_eci_message_log ml on (ph.src_id = ml.src_id)
   inner join xsr.pmr_hw_error e on (ph.src_id = e.src_id)
where  ph.state = 4
  and e.eci_error_code is not null
-- and ph.eci_id = '0525062'
order by eci_id, src_id, e.create_datetime desc
with ur;

select * from xsr.pmr_hw_error where src_id = '0M1S6MN1RS' with ur;

select * from xsr.pmr_hw_text_3_1 where src_tran_id = 'S0pPsQ3oEy' with ur;
select * from xsr.pmr_hw_eci_message_log ml where ml.src_id = '025H15ARP3' with ur;

-- Reprocessed: Yes
select * from xsr.pmr_hw_text_3_1 where src_tran_id = 'bISGs2nfwc' with ur;
select * from xsr.pmr_hw_eci_message_log ml where ml.src_id = '025GL2YJP3' with ur;

-- Reprocessed: Yes
select * from xsr.pmr_hw_text_3_1 where src_tran_id = 'ozU2Qp2QOT' with ur;
select * from xsr.pmr_hw_eci_message_log ml where ml.src_id = '025K8W21P3' with ur;



-- Query to troubleshoot problems with Error 0012
select distinct ph.eci_id, ph.src_tran_id, ph.src_id, ph.prob_num, ph.iso_cntry_code_2, ph.state, 
   e.eci_error_code, ei.sr_create_date, ph.create_datetime, max(date(ml.reprocess_datetime)) as reprocess_dte
from xsr.pmr_hw_header_2_6 ph 
   inner join xsr.pmr_hw_eci_info_3_1 ei on (ph.src_tran_id = ei.src_tran_id)
   inner join xsr.pmr_hw_eci_message_log ml on (ph.src_id = ml.src_id)
   inner join xsr.pmr_hw_error e on (ph.src_id = e.src_id)
where e.eci_error_code = '0012' and ph.state = 4
group by ph.eci_id, ph.src_tran_id, ph.src_id, ph.prob_num, ph.iso_cntry_code_2, ph.state, e.eci_error_code, ei.sr_create_date, ph.create_datetime
with ur;


-- 491
select count(*) from xsr.pmr_hw_text_3_1 where eci_error_code = '0012' with ur;
-- 77 ECI ID's
select ph.eci_id, count(*)
from xsr.pmr_hw_header_2_6 ph 
   inner join xsr.pmr_hw_text_3_1 t on (ph.src_tran_id = t.src_tran_id)
where t.eci_error_code = '0012'
group by ph.eci_id with ur;


select distinct ph.eci_id, ph.src_tran_id, ph.src_id, ph.prob_num, ph.state, ph.create_datetime
from xsr.pmr_hw_header_2_6 ph 
   inner join xsr.pmr_hw_text_3_1 t on (ph.src_tran_id = t.src_tran_id)
where t.eci_error_code = '0012' with ur;



select distinct ph.src_tran_id, ph.src_id, ph.prob_num, ph.create_datetime, ph.state,
   e.eci_error_code,
   case      
      when e.eci_error_code = '0007' then 'Reject. Required fields are invalid or not present.'
      when e.eci_error_code = '0008' then 'Optional field errors have occurred but were minor.  An informational message is returned to sender and the record is processed. An example: The field was longer than specified.  The field is truncated and the record is processed.'
      when e.eci_error_code = '0017' then 'Optional field was sent on a record that was not specified in the ECI profile.  The field was ignored'
      when e.eci_error_code = '0012' then 'Reject. Unable to apply the specified status to call. The record was not processed.'
      when e.eci_error_code = '0023' then 'Reject. ECCO could not place call against customer record. The customer record is associated to another ECCO customer.'
   end as err_type,
   case
      when e.eci_msg like '%E076%' then 'SN Error'
      when e.eci_msg like '%E102%' then 'Prioirty Error'   
      when e.eci_msg like '%E006%' then 'Zipcode Error' 
      when e.eci_msg like '%E008%' then 'Contact phone number Error' 
      when e.eci_msg like '%E009%' then 'Machine Type Error'
      when e.eci_msg like '%E010%' then 'Customer phone number Error' 
      when e.eci_msg like '%E011%' then 'Customer location phone number Error' 
      when e.eci_msg like '%E036%' then 'Contact name'
      else 'unknown'       
   end as error, 
   ph.create_datetime
from xsr.pmr_hw_header_2_6 ph 
   --inner join xsr.pmr_hw_eci_message_log ml on (ph.src_id = ml.src_id)
   inner join xsr.pmr_hw_error e on (ph.src_id = e.src_id)
where ph.eci_id = '0916111' and ph.state = 4 --and eci_error_code = '0012'
with ur;