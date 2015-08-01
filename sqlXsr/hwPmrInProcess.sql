-- ----------------------------------------------------------------------------
-- Working HW Problems In-process
-- Step 1: Pull list and send it to Debra so she can see what they have in ESC+

-- ----------------------------------------------------------------------------

-- Step 1: Pull list of data to provide Debra
select distinct ph.eci_id, ph.src_tran_id, ph.src_id, ph.prob_num, ph.iso_cntry_code_2, ph.state, ph.create_datetime
   ,max(e.eci_error_code) as eci_error_code
   ,ei.sr_create_date
   ,max(date(ml.reprocess_datetime)) as reprocess_dte
from xsr.pmr_hw_header_2_6 ph 
   left outer join xsr.pmr_hw_eci_info_3_1 ei on (ph.src_tran_id = ei.src_tran_id)
   left outer join xsr.pmr_hw_eci_message_log ml on (ph.src_id = ml.src_id)
   left outer join xsr.pmr_hw_error e on (ph.src_id = e.src_id)
where ph.state = 2
and date(ph.create_datetime) = '2015-05-05'
--and ph.eci_id = '5555555'
--and ei.ibm_login_id = 'benjamin.ang@jpmorgan.com'
group by ph.eci_id, ph.src_tran_id, ph.src_id, ph.prob_num, ph.iso_cntry_code_2, ph.state, ph.create_datetime, ei.sr_create_date
with ur;

select * from xsr.pmr_hw_eci_message_log where SRC_ID IN ('02IETIEBP2','02IF9KIHP2','02IGNFM0P2','025TVDSPP2') with ur;
select * from xsr.pmr_hw_eci_message_log where SRC_ID IN ('025FN63JP2') with ur;
select * from xsr.pmr_hw_eci_message_log where SRC_ID IN ('025CH9GXP3','025H1M14P3','025H1S4RP3','02IAQA9FP2','025PBFY2P3','025PBI5LP3','02IKDXMNP3','02IKE2BMP3','02IKE2SKP3') with ur;
select * from xsr.pmr_hw_eci_message_log where SRC_ID IN ('02HK2LXQP2','02HKZUQPP2','0254MJRUP1','02IDXM7UP1','025G2EQGP1')  with ur;


select * from xsr.pmr_hw_log where SRC_ID IN ('02I4QTA6P2','025DDG29P1')
select * from xsr.pmr_hw_log where SRC_TRAN_ID IN ('02I4QTA67B','025DDG299Y') with ur;


select distinct ph.eci_id, ph.src_tran_id, ph.src_id, ph.prob_num, ph.iso_cntry_code_2, ph.state, ei.status, ph.create_datetime
   ,max(e.eci_error_code) as eci_error_code
   ,ei.sr_create_date
   ,max(date(ml.reprocess_datetime)) as reprocess_dte
from xsr.pmr_hw_header_2_6 ph 
   inner join xsr.pmr_hw_eci_info_3_1 ei on (ph.src_tran_id = ei.src_tran_id)
   left outer join xsr.pmr_hw_eci_message_log ml on (ph.src_id = ml.src_id)
   left outer join xsr.pmr_hw_error e on (ph.src_id = e.src_id)
where ph.state = 4
--and ph.src_tran_id in ('0257SVYUNT','024WRN75MX','024T3LGLPS')
  and ph.eci_id = '0560907'
group by ph.eci_id, ph.src_tran_id, ph.src_id, ph.prob_num, ph.iso_cntry_code_2, ph.state, ei.status, ph.create_datetime, ei.sr_create_date
with ur;






select distinct ph.eci_id, ph.src_tran_id, ph.src_id, ph.prob_num, ph.iso_cntry_code_2, ph.state, ph.create_datetime
   ,max(e.eci_error_code) as eci_error_code
   ,ei.sr_create_date
   ,max(date(ml.reprocess_datetime)) as reprocess_dte
from xsr.pmr_hw_header_2_6 ph 
   left outer join xsr.pmr_hw_eci_info_3_1 ei on (ph.src_tran_id = ei.src_tran_id)
   left outer join xsr.pmr_hw_eci_message_log ml on (ph.src_id = ml.src_id)
   left outer join xsr.pmr_hw_error e on (ph.src_id = e.src_id)
where ph.state = 2
  and ml.hw_eci_message_id is null
--and ph.eci_id = '5555555'
--and ei.ibm_login_id = 'benjamin.ang@jpmorgan.com'
group by ph.eci_id, ph.src_tran_id, ph.src_id, ph.prob_num, ph.iso_cntry_code_2, ph.state, ph.create_datetime, ei.sr_create_date
with ur;


select * from camdf.entmt_cust where ibm_cust_num = '0105923' and cntry_code = '618'