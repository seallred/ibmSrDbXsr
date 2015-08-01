-- ----------------------------------------------------------------------------
-- View the Portal Tab Configuration
-- Note: issue using /entry/portal instead of /entry/myportal if you logout of
-- SR and then try to navigate to one of the tabs.
-- ----------------------------------------------------------------------------
select * from xsr.cfg_properties where key like '%portalTab%';

-- ----------------------------------------------------------------------------
-- Update Portal Tab Configuration
-- ----------------------------------------------------------------------------
--update xsr.cfg_properties set value = '//www-947.ibm.com/support/entry/portal/Overview' where key = 'portalTab.home.url';