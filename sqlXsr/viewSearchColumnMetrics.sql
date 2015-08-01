select * from xsr.user_profile_report 
where ((rpt_col1 is not null or length(rtrim(rpt_col1)) > 0)
   or rpt_col2 is not null or length(rtrim(rpt_col2)) > 0)
fetch first 100 rows only;

-- pbc (service request#), ibmCustomerNumber, title, severity, contactName, createDate, updateDate, 
-- status, aparNum, componentDscr (product)
with temp (pmr_num, icn, title, severity, status, component, contact, apar, create_date, update_date)
as (
select count(*) as pmr_num, 0 as ibmCustNum, 0 as title, 0 as severity, 0 as status, 0 as component, 
       0 as contactName, 0 as aparNum, 0 as createDate, 0 as updateDate
from xsr.user_profile_report 
where (coalesce(rpt_col1,'') = 'pbc' or coalesce(rpt_col2,'') = 'pbc' or coalesce(rpt_col3,'') = 'pbc' 
      or coalesce(rpt_col4,'') = 'pbc' or coalesce(rpt_col5,'') = 'pbc' or coalesce(rpt_col6,'') = 'pbc' 
      or coalesce(rpt_col7,'') = 'pbc' or coalesce(rpt_col8,'') = 'pbc' or coalesce(rpt_col9,'') = 'pbc' 
      or coalesce(rpt_col10,'') = 'pbc')

union
select 0 as pmr_num, count(*) as ibmCustNum, 0 as title, 0 as severity, 0 as status, 0 as component, 
       0 as contactName, 0 as aparNum, 0 as createDate, 0 as updateDate
from xsr.user_profile_report 
where (coalesce(rpt_col1,'') = 'ibmCustomerNumber' or coalesce(rpt_col2,'') = 'ibmCustomerNumber' or coalesce(rpt_col3,'') = 'ibmCustomerNumber' 
      or coalesce(rpt_col4,'') = 'ibmCustomerNumber' or coalesce(rpt_col5,'') = 'ibmCustomerNumber' or coalesce(rpt_col6,'') = 'ibmCustomerNumber' 
      or coalesce(rpt_col7,'') = 'ibmCustomerNumber' or coalesce(rpt_col8,'') = 'ibmCustomerNumber' or coalesce(rpt_col9,'') = 'ibmCustomerNumber' 
      or coalesce(rpt_col10,'') = 'ibmCustomerNumber')

union
select 0 as pmr_num, 0 as ibmCustNum, count(*) as title, 0 as severity, 0 as status, 0 as component, 
       0 as contactName, 0 as aparNum, 0 as createDate, 0 as updateDate
from xsr.user_profile_report 
where (rpt_col1 = 'title' or rpt_col2 = 'title' or rpt_col3 = 'title' or rpt_col4 = 'title' or rpt_col5 = 'title'
      or rpt_col6 = 'title' or rpt_col7 = 'title' or rpt_col8 = 'title' or rpt_col9 = 'title' or rpt_col10 = 'title')

union
select 0 as pmr_num, 0 as ibmCustNum, 0 as title, count(*) as severity, 0 as status, 0 as component, 
       0 as contactName, 0 as aparNum, 0 as createDate, 0 as updateDate
from xsr.user_profile_report 
where (rpt_col1 = 'severity' or rpt_col2 = 'severity' or rpt_col3 = 'severity' or rpt_col4 = 'severity' or rpt_col5 = 'severity'
      or rpt_col6 = 'severity' or rpt_col7 = 'severity' or rpt_col8 = 'severity' or rpt_col9 = 'severity' or rpt_col10 = 'severity')

union
select 0 as pmr_num, 0 as ibmCustNum, 0 as title, 0 as severity, count(*) as status, 0 as component, 
       0 as contactName, 0 as aparNum, 0 as createDate, 0 as updateDate
from xsr.user_profile_report 
where (rpt_col1 = 'status' or rpt_col2 = 'status' or rpt_col3 = 'status' or rpt_col4 = 'status' or rpt_col5 = 'status'
      or rpt_col6 = 'status' or rpt_col7 = 'status' or rpt_col8 = 'status' or rpt_col9 = 'status' or rpt_col10 = 'status')

union
select 0 as pmr_num, 0 as ibmCustNum, 0 as title, 0 as severity, 0 as status, count(*) as component, 
       0 as contactName, 0 as aparNum, 0 as createDate, 0 as updateDate
from xsr.user_profile_report 
where (rpt_col1 = 'componentDscr' or rpt_col2 = 'componentDscr' or rpt_col3 = 'componentDscr' or rpt_col4 = 'componentDscr' or rpt_col5 = 'componentDscr'
      or rpt_col6 = 'componentDscr' or rpt_col7 = 'componentDscr' or rpt_col8 = 'componentDscr' or rpt_col9 = 'componentDscr' or rpt_col10 = 'componentDscr')

union
select 0 as pmr_num, 0 as ibmCustNum, 0 as title, 0 as severity, 0 as status, 0 as component, 
       count(*) as contactName, 0 as aparNum, 0 as createDate, 0 as updateDate
from xsr.user_profile_report 
where (rpt_col1 = 'contactName' or rpt_col2 = 'contactName' or rpt_col3 = 'contactName' or rpt_col4 = 'contactName' or rpt_col5 = 'contactName'
      or rpt_col6 = 'contactName' or rpt_col7 = 'contactName' or rpt_col8 = 'contactName' or rpt_col9 = 'contactName' or rpt_col10 = 'contactName')

union
select 0 as pmr_num, 0 as ibmCustNum, 0 as title, 0 as severity, 0 as status, 0 as component, 
       0 as contactName, count(*) as aparNum, 0 as createDate, 0 as updateDate
from xsr.user_profile_report 
where (rpt_col1 = 'aparNum' or rpt_col2 = 'aparNum' or rpt_col3 = 'aparNum' or rpt_col4 = 'aparNum' or rpt_col5 = 'aparNum'
      or rpt_col6 = 'aparNum' or rpt_col7 = 'aparNum' or rpt_col8 = 'aparNum' or rpt_col9 = 'aparNum' or rpt_col10 = 'aparNum')

union
select 0 as pmr_num, 0 as ibmCustNum, 0 as title, 0 as severity, 0 as status, 0 as component, 
       0 as contactName, 0 as aparNum, count(*) as createDate, 0 as updateDate
from xsr.user_profile_report 
where (coalesce(rpt_col1,'') = 'createDate' or coalesce(rpt_col2,'') = 'createDate' or coalesce(rpt_col3,'') = 'createDate' 
      or coalesce(rpt_col4,'') = 'createDate' or coalesce(rpt_col5,'') = 'createDate' or coalesce(rpt_col6,'') = 'createDate' 
      or coalesce(rpt_col7,'') = 'createDate' or coalesce(rpt_col8,'') = 'createDate' or coalesce(rpt_col9,'') = 'createDate' 
      or coalesce(rpt_col10,'') = 'createDate')

union
select 0 as pmr_num, 0 as ibmCustNum, 0 as title, 0 as severity, 0 as status, 0 as component, 
       0 as contactName, 0 as aparNum, 0 as createDate, count(*) as updateDate
from xsr.user_profile_report 
where (coalesce(rpt_col1,'') = 'updateDate' or coalesce(rpt_col2,'') = 'updateDate' or coalesce(rpt_col3,'') = 'updateDate' 
      or coalesce(rpt_col4,'') = 'updateDate' or coalesce(rpt_col5,'') = 'updateDate' or coalesce(rpt_col6,'') = 'updateDate' 
      or coalesce(rpt_col7,'') = 'updateDate' or coalesce(rpt_col8,'') = 'updateDate' or coalesce(rpt_col9,'') = 'updateDate' 
      or coalesce(rpt_col10,'') = 'updateDate')
)
select sum(pmr_num) as pmr_num, sum(icn) as icn, sum(title) as title, sum(severity) as severity, 
       sum(status) as status, sum(component) as component, sum(contact) as contact, sum(apar) as apar, 
       sum(create_date) as create_date, sum(update_date) as update_date
  from temp
with ur;

