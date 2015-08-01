--select year(update_datetime), month(update_datetime), status, count(*) 
--from xsr.pmr_retain_info group by year(update_datetime), month(update_datetime), status order by 1,2
--with ur;
--
--select count(*) 
--from xsr.pmr_retain_info 
--where status like 'CL%' and date(update_datetime) < (current date - 558 days)
--with ur;

-- ----------------------------------------------------------------------------
-- xsr.pmr_retain_info
insert into xsr.pmr_retain_info_arc
select 
	SRC_TRAN_ID, SRC_APPL, SRC_NODE, SW_HD, RETAIN_NODE, STATUS, RETAIN_CALLER_TYPE,
	IBM_CUST_NUM, CUST_NAME_NLS, CONTACT_NAME_NLS, PHONE_NUM, PHONE_EXT, ALT_PHONE_NUM,
	ALT_PHONE_EXT, SUPPORT_LEVEL, QUEUE, CENTER, NEXT_QUEUE, NEXT_CENTER, REQUEST_TYPE_ID,
	PROD_ID, PROD_ID_VERSION, COMP_ID, COMP_ID_RELEASE, RELEASE_LEVEL, SEVERITY,
	SYSTEM_DOWN, APAR_NUM, PRIORITY_PG, CALL_CAT, CUPRIMD, PMR_CREATE_DATE,
	PMR_UPDATE_DATE, PMR_UPDATE_TIME, CREATE_USER, CREATE_DATETIME, UPDATE_USER,
	UPDATE_DATETIME, PMR_CREATE_TIME, HAD_CRCA, CRCA_UPDATE_DATETIME, ROUTING_ID,
	PREMIUM_RESPONSE, PMR_FUP_DATE, ENG_SUPPORT_FLAG
from xsr.pmr_retain_info x where exists
(
   select 1
   from xsr.pmr_retain_info i
   where status like 'CL%' and date(update_datetime) < (current date - 558 days)
   and x.src_tran_id = i.src_tran_id and x.src_appl = i.src_appl and x.src_node = i.src_node
   order by pmr_update_date, pmr_update_time, src_tran_id, src_appl, src_node
)
fetch first 50000 rows only
with ur;
commit work;

delete from xsr.pmr_retain_info where (src_tran_id, src_appl, src_node) in 
(select src_tran_id, src_appl, src_node from xsr.pmr_retain_info_arc); 

-- ----------------------------------------------------------------------------
-- xsr.pmr_xsr_info
insert into xsr.pmr_xsr_info_arc
select
	SRC_TRAN_ID, SRC_APPL, SRC_NODE, SUPPORT_ID, SUPPORT_OFFERING_ID, MACHINE_ID,
	PLATFORM_ID, TITLE, DESCRIPTION, CONTACT_METHOD, OPERSYS_ID, CUST_TRACKING_NUM,
	OTHER_COMP_DSCR, INITIAL_SEVERITY, SEVERITY_DESCRIPTION, PMR_CREATE_SRC_APPL, LOCALE,
	OPEN_COUNT, CREATE_CONTACT_ID, UPDATE_CONTACT_ID, CREATE_USER, CREATE_DATETIME,
	UPDATE_USER, UPDATE_DATETIME, DAC_TYPE_ID, OWNER_CONTACT_ID, PROVISIONAL_PMR,
	SUPPORT_GROUP_ID
--	, REQUIRES_REGISTRATION
from xsr.pmr_xsr_info x where exists
(
   select 1
   from xsr.pmr_retain_info_arc i
   where status like 'CL%' and date(update_datetime) < (current date - 558 days)
   and x.src_tran_id = i.src_tran_id and x.src_appl = i.src_appl and x.src_node = i.src_node
   order by pmr_update_date, pmr_update_time, src_tran_id, src_appl, src_node
)
fetch first 100000 rows only
with ur;
commit work;

delete from xsr.pmr_xsr_info where (src_tran_id, src_appl, src_node) in 
(select src_tran_id, src_appl, src_node from xsr.pmr_xsr_info_arc); 

-- ----------------------------------------------------------------------------
-- xsr.pmr_text
insert into xsr.pmr_text_arc
select --count(*)
	PMR_TEXT_ID, SRC_TRAN_ID, SRC_APPL, SRC_NODE, SIG_LINE, TEXT_BLOCK, CREATE_USER,
	CREATE_DATETIME, UPDATE_USER, UPDATE_DATETIME, x.user
from xsr.pmr_text x where exists
(
   select 1
   from xsr.pmr_retain_info_arc i
   where status like 'CL%' and date(update_datetime) < (current date - 558 days)
   and x.src_tran_id = i.src_tran_id and x.src_appl = i.src_appl and x.src_node = i.src_node
   order by pmr_update_date, pmr_update_time, src_tran_id, src_appl, src_node
)
fetch first 1000000 rows only
with ur;
commit work;

delete from xsr.pmr_text where pmr_text_id in (select pmr_text_id from xsr.pmr_text_arc); 

-- ----------------------------------------------------------------------------
-- xsr.user_pmr_xsr
insert into xsr.user_pmr_xref_arc
select
	CONTACT_ID, SRC_TRAN_ID, SRC_APPL, SRC_NODE, COM_SRC_APPL, CREATE_USER,
	CREATE_DATETIME, UPDATE_USER, UPDATE_DATETIME
from xsr.user_pmr_xref x where exists
(
   select 1
   from xsr.pmr_retain_info i
   where status like 'CL%' and date(update_datetime) < (current date - 558 days)
   and x.src_tran_id = i.src_tran_id and x.src_appl = i.src_appl and x.src_node = i.src_node
   order by pmr_update_date, pmr_update_time, src_tran_id, src_appl, src_node
)
fetch first 50000 rows only
with ur;
commit work;

delete from xsr.user_pmr_xref where (contact_id, src_tran_id, src_appl, src_node) in 
(select contact_id, src_tran_id, src_appl, src_node from xsr.user_pmr_xref_arc); 

-- ----------------------------------------------------------------------------
-- xsr.user_pmr_action
--insert into xsr.user_pmr_action_arc
--select 
--	CONTACT_ID, SRC_TRAN_ID, SRC_APPL, SRC_NODE, READ_FLAG, CREATE_USER, CREATE_DATETIME,
--	UPDATE_USER, UPDATE_DATETIME
--from xsr.user_pmr_action x where exists
--(
--   select 1
--   from xsr.pmr_retain_info i
--   where status like 'CL%' and date(update_datetime) < (current date - 558 days)
--   and x.src_tran_id = i.src_tran_id and x.src_appl = i.src_appl and x.src_node = i.src_node
--   order by pmr_update_date, pmr_update_time, src_tran_id, src_appl, src_node
--)
--fetch first 50000 rows only
--with ur;
--commit work;
--
--delete from xsr.user_pmr_action where (src_tran_id, src_appl, src_node) in 
--(select src_tran_id, src_appl, src_node from xsr.user_pmr_action_arc); 

-- ----------------------------------------------------------------------------
-- xsr.bp_site_pmr_xref
-- TODO: No archive table
insert into xsr.bp_site_pmr_xref_arc
select
	BP_SITE_ID, SUPPORT_ID, SRC_TRAN_ID, SRC_APPL, SRC_NODE, SUPPORT_RELATIONSHIP_TYPE,
	CREATE_USER, CREATE_DATETIME, UPDATE_USER, UPDATE_DATETIME
from xsr.bp_site_pmr_xref x where exists
(
   select 1
   from xsr.pmr_retain_info i
   where status like 'CL%' and date(update_datetime) < (current date - 558 days)
   and x.src_tran_id = i.src_tran_id and x.src_appl = i.src_appl and x.src_node = i.src_node
   order by pmr_update_date, pmr_update_time, src_tran_id, src_appl, src_node
)
fetch first 50000 rows only
with ur;
commit work;

delete from xsr.bp_site_pmr_xref where (src_tran_id, src_appl, src_node) in 
(select src_tran_id, src_appl, src_node from xsr.bp_site_pmr_xref_arc); 

-- ----------------------------------------------------------------------------
-- xsr.pmr_header
insert into xsr.pmr_header_arc
select
	SRC_TRAN_ID, SRC_APPL, SRC_NODE, PMR_NUM, BRANCH, RETAIN_CNTRY_CODE, STATE, ENTITLED,
	CREATE_USER, CREATE_DATETIME, UPDATE_USER, UPDATE_DATETIME, PARTNER_INIT
from xsr.pmr_header x where exists
(
   select 1
   from xsr.pmr_retain_info_arc i
   where status like 'CL%' and date(update_datetime) < (current date - 558 days)
   and x.src_tran_id = i.src_tran_id and x.src_appl = i.src_appl and x.src_node = i.src_node
   order by pmr_update_date, pmr_update_time, src_tran_id, src_appl, src_node
)
fetch first 50000 rows only
with ur;
commit work;

delete from xsr.pmr_header where (src_tran_id, src_appl, src_node) in 
(select src_tran_id, src_appl, src_node from xsr.pmr_header_arc); 

