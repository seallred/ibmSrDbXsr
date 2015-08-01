-- ----------------------------------------------------------------------------
-- Find Prod Favorites that no longer exist in the product catalog
-- ----------------------------------------------------------------------------
select count(*)
  from xsr.user_prod_favorites upf
 where not exists
(
   select 1 from cam.prod_version_comp_release_xref pvcrx 
    where upf.prod_id = pvcrx.prod_id and upf.prod_id_version = pvcrx.prod_id_version
      and upf.comp_id = pvcrx.comp_id and upf.comp_id_release = pvcrx.comp_id_release
);

-- ----------------------------------------------------------------------------
-- Report on good and bad products in prod favorites list
-- ----------------------------------------------------------------------------
with temp (contact_id, good_cnt, bad_cnt) as
(
select upf.contact_id, count(*), 0
  from xsr.user_prod_favorites upf
       left outer join cam.prod_version_comp_release_xref pvcrx
         on upf.prod_id = pvcrx.prod_id and upf.prod_id_version = pvcrx.prod_id_version
            and upf.comp_id = pvcrx.comp_id and upf.comp_id_release = pvcrx.comp_id_release
 where pvcrx.prod_id is not null
group by upf.contact_id
union
select upf.contact_id, 0, count(*)
  from xsr.user_prod_favorites upf
       left outer join cam.prod_version_comp_release_xref pvcrx
         on upf.prod_id = pvcrx.prod_id and upf.prod_id_version = pvcrx.prod_id_version
            and upf.comp_id = pvcrx.comp_id and upf.comp_id_release = pvcrx.comp_id_release
 where pvcrx.prod_id is null
group by upf.contact_id
)
select * from temp where bad_cnt > 0
with ur;         

-- ----------------------------------------------------------------------------
-- Clean-up bad products from prod favorites
-- ----------------------------------------------------------------------------
select count(*) 
-- delete
  from XSR.USER_PROD_FAVORITES upf
 where upf.contact_id in (select contact_id from cam.contact c where c.ibm_uid in ('120000C4SV','1200006K6A','270005AKR8'))
   and not exists
(
   select 1 from cam.prod_version_comp_release_xref pvcrx 
    where upf.prod_id = pvcrx.prod_id and upf.prod_id_version = pvcrx.prod_id_version
      and upf.comp_id = pvcrx.comp_id and upf.comp_id_release = pvcrx.comp_id_release
) 
with ur;   
  
-- '120000C4SV','1200006K6A','270005AKR8'