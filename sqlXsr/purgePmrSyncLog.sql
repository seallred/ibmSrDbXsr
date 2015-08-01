-- ----------------------------------------------------------------------------

-- PROD
-- pmr_sync_log: p1:    128,889,281 (2/21/14)
-- pmr_sync_log: p2:    129,016,727 (2/21/14)
-- pmr_sync_log: p3:    129,044,822 (2/21/14)
-- pmr_sync_log: sppp2:    
-- pmr_sync_log: sppp3: 11,125,883 (2/21/14)

-- ----------------------------------------------------------------------------
-- TEST
-- pmr_sync_log:     9274
 

-- ----------------------------------------------------------------------------
-- DEV
-- pmr_sync_log:     6505
select count(*) from xsr.pmr_sync_log;
select year(update_datetime), month(update_datetime), count(*) from xsr.pmr_sync_log group by year(update_datetime), month(update_datetime) order by 1,2;


select count(*)
from xsr.pmr_sync_log
where date(update_datetime) <= (current date - 90 days)
--order by update_datetime, pmr_sync_log_id
--fetch first 50000 rows only
with ur;

delete from xsr.pmr_sync_log where pmr_sync_log_id in 
(
select pmr_sync_log_id
from xsr.pmr_sync_log
where date(update_datetime) < '2013-06-01'
order by update_datetime, pmr_sync_log_id
fetch first 1000000 rows only
)

select * from xsr.pmr_sync_log where pmr_sync_log in 
(27846810,27846815,27846820,27846825,27846830,27846835,27846840,27846845,27846850,27846855,27846860,27846865,27846870,27846875,27846880,27846885,27846890,27846895,27846900,27846905,27846910,27846915,27846920,27846925,27846930,27846935,27846940,27846945,27846950,27846955,27846960,27846965,27846970,27846975,27846980,27846985,27846990,27846995,27847000,27847005,27847010,27847015,27847020,27847025,27847030,27847035,27847040,27847045,27847050,27847055,27847060,27847065,27847070,27847075,27847080,27847085,27847090,27847095,27847100,27847105,27847110,27847115,27847120,27847125,27847130,27847135,27847140,27847145,27847150,27847155,27847160,27847165,27847170,27847175,27847180,27847185,27847190,27847195,27847200,27847205,27847210,27847215,27847220,27847225,27847230,27847235,27847240,27847245,27847250,27847255,27847260,27847265,27847270,27847275,27847280,27847285,27847290,27847295,27847300,27847305)
with ur;


-- PMR_LOG_2_2
select year(update_datetime), month(update_datetime), count(*) from xsr.pmr_log_2_2 group by year(update_datetime), month(update_datetime) order by 1,2;

insert into xsr.pmr_log_2_2_arc
select --count(*)
	PMR_LOG_ID, SRC_TRAN_ID, SRC_APPL, SRC_NODE, ROUTE_RULE, PMR_NUM, BRANCH,
	RETAIN_CNTRY_CODE, CONTACT_ID, ESR_CONTACT_ID, PMR_CREATE_DATE, EMM_REQUEST, QUEUE,
	CENTER, SEVERITY, PRIORITY, COMP_ID, SUPPORT_LEVEL, LOG_TEXT, LOCALE, COMM_METHOD,
	SDI_PORT, SDI_IP, ROUTE_REASON, NODE, PROD_SELECTION, PROCESSING_NODE, USER_TYPE,
	PMR_IN_PROCESS, ENTMT_SYSTEM, IS_ENTITLED, ENTMT_ERROR_CODE, RETAIN_ERROR_CODE,
	BROWSER_LOCALE, CCSID_USED, STAGE_TIME_1, STAGE_TIME_2, STAGE_TIME_3, STAGE_TIME_4,
	STAGE_TIME_5, STAGE_TIME_6, STAGE_TIME_7, STAGE_TIME_8, STAGE_TIME_9, STAGE_TIME_10,
	STAGE_TIME_11, STAGE_TIME_12, STAGE_TIME_13, STAGE_TIME_14, STAGE_TIME_15, 
	CREATE_USER, CREATE_DATETIME, UPDATE_USER, UPDATE_DATETIME, ROUTE_RULE_2
from xsr.pmr_log_2_2
--where date(update_datetime) <= '2010-12-31'
where date(update_datetime) < (current date - 558 days)
order by update_datetime, pmr_log_id
fetch first 100000 rows only
with ur;
commit work;

delete from xsr.pmr_log_2_2 where pmr_log_id in (select pmr_log_id from xsr.pmr_log_2_2_arc );
commit work;

select count(*) from xsr.pmr_log_2_2
where date(update_datetime) < (current date - 558 days) with ur;

select count(*) from xsr.pmr_log_2_2_arc with ur;

