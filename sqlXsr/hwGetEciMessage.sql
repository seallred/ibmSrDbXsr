select 
   l.hw_eci_message_id,
	substr(message,1,8) as "RecordId",
	substr(message,9,4) as "RecordType",
	substr(message,13,8) as "RecordLen",
   substr(message,21,8) as "NumFields",
   substr(message,29,4) as "ErrCode",
   substr(message,33,10) as "EciId",
   case when posstr(message,'ACMREC') > 0 then substr(message,43,3) end as "CntryCode",
   case when posstr(message,'ECIRECE') > 0 then substr(message,43,8) end as "CreateDate",

   case when posstr(message,'ACMREC') > 0 then substr(message,46,8) end as "CreateDate",
   case when posstr(message,'ECIRECE') > 0 then substr(message,51,6) end as "CreateTime",

   case when posstr(message,'ACMREC') > 0 then substr(message,54,6) end as "CreateTime",
   case when posstr(message,'ECIRECE') > 0 then substr(message,57,53) end as "Reserved",
   
   case when posstr(message,'ACMREC') > 0 then substr(message,60,10) end as "VendorId",

   case when posstr(message,'ACMREC') > 0 then substr(message,70,10) end as "BrokerId",
   
   case when posstr(message,'ACMREC') > 0 then substr(message,80,10) end as "CallMgrId",
   
   case when posstr(message,'ACMREC') > 0 then substr(message,90,4) end as "Version",
   
   case when posstr(message,'ACMREC') > 0 then substr(message,94,5) end as "GmtOffSet",
   
   case when posstr(message,'ACMREC') > 0 then substr(message,99,2) end as "LangCode",

   case when posstr(message,'ACMREC') > 0 then substr(message,101,69) end as "Reserved",

--   locate('0003',message,170) as "locate",
--   (170+8+int(substr(message,(locate('0002', message, 170)+4),4))) as "start",
--   substr(message,(locate('0003', message, (170+int(substr(message,(locate('0002', message, 170)+4),4))))+4),4) as "length",
--   int(substr(message,(locate('0003', message, 170)+4),4)) as "length2",
   
   case when (posstr(message,'ACMREC') > 0) and (substr(message,9,4) = '0001') then 
      case when locate('0001', message, 170) > 0 then
         substr(message,(locate('0001', message, 170)+8),int(substr(message,(locate('0001', message, 170)+4),4)))
      end
   end as "PhoneNum",     
   
   case when (posstr(message,'ACMREC') > 0) and (substr(message,9,4) = '0001') then 
      case when locate('0002', message, 170) > 0 then
         substr(message,(locate('0002', message, 170)+8),int(substr(message,(locate('0002', message, 170)+4),4)))
      end
   end as "CompanyName",     

   case when (posstr(message,'ACMREC') > 0) and (substr(message,9,4) = '0001') then 
      case when locate('0003', message, 170) > 0 then
         substr(message,(locate('0003', message, 170)+8),int(substr(message,(locate('0003', message, 170)+4),4)))
      end
   end as "Address",     

   case when (posstr(message,'ACMREC') > 0) and (substr(message,9,4) = '0001') then 
      case when locate('0004', message, 170) > 0 then
         substr(message,(locate('0004', message, 170)+8),int(substr(message,(locate('0004', message, 170)+4),4)))
      end
   end as "City",     

--   case when (posstr(message,'ACMREC') > 0) and (substr(message,9,4) = '0001') then 
--      case when locate('0005', message, 170) > 0 then
--         substr(message,(locate('0005', message, 170)+8),int(substr(message,(locate('0005', message, 170)+4),4)))
--      end
--   end as "State",     

--   case when (posstr(message,'ACMREC') > 0) and (substr(message,9,4) = '0001') then 
--      case when locate('0006', message, 170) > 0 then
--         substr(message,(locate('0006', message, 170)+8),int(substr(message,(locate('0006', message, 170)+4),4)))
--      end
--   end as "Zip",     

	message
 from xsr.pmr_hw_eci_message_log l
--where l.hw_eci_message_id = 311 

--substr(message,1,8) = 'ACMREC' and substr(message,9,4) = '0001' and substr(message,43,3) != 'JP'

with ur;


--select 
--	substr(message)
--	case when posstr(lower(NENT),'cair') > 0 then 6 
--		 when posstr(lower(NENT),'air-gsis') > 0 then 7 
--		 when posstr(lower(NENT),'air') > 0 then 5 
--		 else 8 				-- set to NAIR by default
--	end as support_group_id,	
--	case
--		when FSVCBROK = 'Y' then 'S' 
--		when FLMTSVCB = 'Y' then 'L'
--		else '?'
--	end as broker_type,
--	rtrim(NENT),
--	rtrim(TENTADDR),
--	rtrim(NENTCITY),
--	rtrim(NENTST),
--	rtrim(NENTZIP),
--	case
--      when CNTRYNM = 'USA' then 'US'
--      when CNTRYNM = 'US' then 'US'
--      when CNTRYNM = 'UNITED STATES' then 'US'       
--	end as iso_cntry_code_2,
--	rtrim(NENTPHON),
--	rtrim(NENTCNTC),
--	case when purgeintvl = 0 then 120 else purgeintvl end as purge_interval,  -- PURGEINTVL, defaulting to 120 for now.  Need to fix load error.
--	'ESC+Migration'
--	
--	