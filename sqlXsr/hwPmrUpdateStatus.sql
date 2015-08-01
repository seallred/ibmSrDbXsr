-- Updating tickets with 0012 Error
-- 0 - Active, 2 - In-progress, 4 - Error, 5 - Closed
-- Status that close a call
-- CX = Cleared - Physical fix has been performed,  CA = Call Cancelled,  CL = Call Cleared

-- Update header to closed
select * from xsr.pmr_hw_header_2_6 where src_id = '' or src_tran_id = '' or prob_num = 'DJKZPTC';
update xsr.pmr_hw_header_2_6 set state = 5, update_user = 'usda-issue' where src_tran_id = '02JQ7L77L0';

-- Update status on eci_info record
select * from xsr.pmr_hw_eci_info_3_1 where src_tran_id = '025CWMNQW8';
update XSR.PMR_HW_ECI_INFO_3_1 set STATUS = 'CA', UPDATE_USER = 'rt-22942' where src_tran_id = '025CWMNQW8';

-- Insert text record with CX status
select * from xsr.pmr_hw_text_3_1 where src_tran_id = '025CWMNQW8';
insert into XSR.PMR_HW_TEXT_3_1
	(PMR_HW_TEXT_ID, SRC_TRAN_ID, SRC_APPL, SRC_NODE, TEXT_BLOCK, 
	SRC_CREATE_DATE, SRC_CREATE_TIME, STATUS, CREATE_USER, MESSAGE_TYPE)
values
   (nextval for xsr.seq_pmr_hw_text_id, '025CWMNQW8', 'XSR', 'prNode5', null, 
   '2015-03-11', '13:00:00', 'CX', 'rt-22942', '0002');
