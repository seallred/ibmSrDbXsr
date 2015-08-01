with temp (src_tran_id, src_appl, src_node, attach_cnt) as
(
select ph.src_tran_id, ph.src_appl, ph.src_node, count(attachment_id)
  from xsr.pmr_header ph, XSR.PMR_ATTACHMENT p, xsr.pmr_xsr_info pxi, xsr.pmr_retain_info pri
 where (ph.SRC_TRAN_ID = p.SRC_TRAN_ID AND ph.SRC_APPL = p.SRC_APPL AND ph.SRC_NODE = p.SRC_NODE)
   and (ph.SRC_TRAN_ID = pri.SRC_TRAN_ID AND ph.SRC_APPL = pri.SRC_APPL AND ph.SRC_NODE = pri.SRC_NODE)
   and (ph.SRC_TRAN_ID = pxi.SRC_TRAN_ID AND ph.SRC_APPL = pxi.SRC_APPL AND ph.SRC_NODE = pxi.SRC_NODE)
group by ph.src_tran_id, ph.src_appl, ph.src_node
)
select 'total_pmrs', count(*)
  from temp
union
select 'pmrs_no_attach', count(*)
  from temp t
 where t.attch_cnt = 0
union
select 'pmrs_w_attach', count(*)
  from temp t
 where t.attch_cnt > 0
with ur;

-- Number of attachments per month 
select year(pa.create_datetime) as yr, month(pa.create_datetime) as mth, count(*)
  from xsr.pmr_attachment pa 
 where date(pa.create_datetime) >= '2013-10-01'
group by year(pa.create_datetime), month(pa.create_datetime)
with ur;

-- Number of attachments per month, per week, per day by host and upload_repository
select year(pa.create_datetime) as yr, month(pa.create_datetime) as mth, week(pa.create_datetime) as wk, 
   DAYOFWEEK(pa.create_datetime) as dwk, DAYNAME(pa.create_datetime) as day,
   substr(drop_host,1,2) as host, upload_repository,
   count(*), sum(file_size) as file_size
  from xsr.pmr_attachment pa 
 where date(pa.create_datetime) >= '2014-01-01'
   and upload_repository is not null
group by year(pa.create_datetime), month(pa.create_datetime), week(pa.create_datetime), DAYOFWEEK(pa.create_datetime), DAYNAME(pa.create_datetime),
   substr(drop_host,1,2), upload_repository
order by 1,2,3,4
with ur;


-- Number of attachments per month, per week, per day by host and upload_repository
with temp (wk, dwk, wkday, file_cnt, p1_file_size, p2_file_size, p3_file_size) as (
select week(pa.create_datetime) as wk, DAYOFWEEK(pa.create_datetime) as dwk, DAYNAME(pa.create_datetime) as day,
      count(*), sum(file_size) as p1_file_size, 0  as p2_file_size, 0 as p3_file_size
  from xsr.pmr_attachment pa 
 where date(pa.create_datetime) >= '2014-03-02'
   and upload_repository is not null
   and substr(drop_host,1,2) = 'v1'
group by week(pa.create_datetime), DAYOFWEEK(pa.create_datetime), DAYNAME(pa.create_datetime)
union
select week(pa.create_datetime) as wk, DAYOFWEEK(pa.create_datetime) as dwk, DAYNAME(pa.create_datetime) as day,
      count(*), 0 as p1_file_size, sum(file_size) as p2_file_size, 0 as p3_file_size
  from xsr.pmr_attachment pa 
 where date(pa.create_datetime) >= '2014-03-02'
   and upload_repository is not null
   and substr(drop_host,1,2) = 'v2'
group by week(pa.create_datetime), DAYOFWEEK(pa.create_datetime), DAYNAME(pa.create_datetime)
union
select week(pa.create_datetime) as wk, DAYOFWEEK(pa.create_datetime) as dwk, DAYNAME(pa.create_datetime) as day,
      count(*), 0 as p1_file_size, 0 as p2_file_size, sum(file_size) as p3_file_size
  from xsr.pmr_attachment pa 
 where date(pa.create_datetime) >= '2014-03-02'
   and upload_repository is not null
   and substr(drop_host,1,2) = 'v3'
group by week(pa.create_datetime), DAYOFWEEK(pa.create_datetime), DAYNAME(pa.create_datetime)
order by 1,2,3,4
)
select wk, dwk, wkday, sum(p1_file_size)/1073741824 as p1_file_size, sum(p2_file_size)/1073741824 as p2_file_size, sum(p3_file_size)/1073741824 as p3_file_size
   from temp
group by wk, dwk, wkday
order by wk, dwk
with ur;



-- Number of attachments per month, per week, per day by host and upload_repository
with temp (wk, dwk, wkday, ecurep_file_size, tc_file_size) as (
select week(pa.create_datetime) as wk, DAYOFWEEK(pa.create_datetime) as dwk, DAYNAME(pa.create_datetime) as day,
      sum(file_size) as ecurep_file_size, 0  as tc_file_size
  from xsr.pmr_attachment pa 
 where date(pa.create_datetime) >= '2014-03-02'
   and upload_repository is not null
   and upload_repository = 'ecurep.mainz.de.ibm.com'
group by week(pa.create_datetime), DAYOFWEEK(pa.create_datetime), DAYNAME(pa.create_datetime)
union
select week(pa.create_datetime) as wk, DAYOFWEEK(pa.create_datetime) as dwk, DAYNAME(pa.create_datetime) as day,
      0 as ecurep_file_size, sum(file_size) as tc_file_size
  from xsr.pmr_attachment pa 
 where date(pa.create_datetime) >= '2014-03-02'
   and upload_repository is not null
   and upload_repository = 'testcase.boulder.ibm.com'
group by week(pa.create_datetime), DAYOFWEEK(pa.create_datetime), DAYNAME(pa.create_datetime)
order by 1,2,3,4
)
select wk, dwk, wkday, sum(ecurep_file_size)/1073741824 as ecurep_file_size, sum(tc_file_size)/1073741824 as tc_file_size
   from temp
group by wk, dwk, wkday
order by wk, dwk
with ur;

select distinct upload_repository from xsr.pmr_attachment pa where date(pa.create_datetime) >= '2014-03-02'