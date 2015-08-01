select date(create_datetime), count(*) 
  from xsr.pmr_sync_log 
 where action_flag='I' 
   and date(create_datetime) > (current date - 30 days)
group by date(create_datetime) 
order by date(create_datetime) 
with ur;