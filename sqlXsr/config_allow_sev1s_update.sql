select t1.iso_cntry_code_2, retain_cntry_code
  from cam.locale t1, cam.iso_cntry t2
 where t1.iso_cntry_code_2 = t2.iso_cntry_code_2
order by 1 ;

select t2.org_id, t2.description, t1.iso_cntry_code_2, t3.description, t1.allow_sev1, t1.allow_attachments
  from xsr.pmr_country_org_config t1, cam.avl_org t2, cam.iso_cntry t3
 where t1.org_id = t2.org_id
   and t1.iso_cntry_code_2 = t3.iso_cntry_code_2
   and t1.iso_cntry_code_2 in ('CA','MX','US')
order by 3,2;

update xsr.pmr_country_org_config set allow_sev1 = 0 where org_id in (2,3) and iso_cntry_code_2 = 'CA';
update xsr.pmr_country_org_config set allow_sev1 = 0 where org_id in (2,3) and iso_cntry_code_2 = 'MX';
update xsr.pmr_country_org_config set allow_sev1 = 1, allow_attachments = 1
 where org_id in (1) and iso_cntry_code_2 = 'US';

select * from xsr.pmr_country_org_config;
