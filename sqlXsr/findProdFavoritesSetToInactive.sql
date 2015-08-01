-------------------------------------------------------------------------------
-- TESTING PROD FAVORITES FOR INACTIVE PRODUCTS
-------------------------------------------------------------------------------

--ID: seallred@hotmail.com   contactID: 1630653

-- Email verification
select * from trolley.notification_delivery_tran_2_3 ndt
where listener_id in (select listener_id from trolley.event_listener_2_3 where src_id='1630653') with ur;

-- Prod Favorites
select * from xsr.user_prod_favorites u where contact_id = 1630653;

-- Check product catalog
select * from cam.prod_version where prod_id = '5765F30' and prod_id_version = '950' with ur;
select comp_id, comp_id_release, viewable, active, description_sr from cam.comp_release where comp_id = 'DB2CONNCT' and comp_id_release = '950';
select * from cam.prod_version_comp_release_xref where prod_id = '5765F30' and prod_id_version = '950' and comp_id = 'DB2CONNCT' and comp_id_release = '950';


-- Update product
update cam.prod_version set active = 1 where prod_id = '5765F30' and prod_id_version = '950';
update cam.prod_version set viewable = 1 where prod_id = '5765F30' and prod_id_version = '950';
update cam.prod_version set viewable_all_prod = 1 where prod_id = '5765F30' and prod_id_version = '950';

-- Update component
update cam.comp_release set active = 0 where comp_id = 'DB2CONNCT' and comp_id_release = '950';
update cam.comp_release set viewable = 0 where comp_id = 'DB2CONNCT' and comp_id_release = '950';

-- Update prod comp xref
update cam.prod_version_comp_release_xref set viewable = 1 where prod_id = '5765F30' and prod_id_version = '950' and comp_id = 'DB2CONNCT' and comp_id_release = '950';

