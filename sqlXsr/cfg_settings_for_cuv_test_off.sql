-- -----------------------------------------------------------------------
-- WEB IDENTITY BYPASS CONFIGURATION
-- -----------------------------------------------------------------------
-- Default configuration values (not node or component specific)
delete from XSR.CFG_PROPERTIES where key = 'ACUnode.v30015.xsrAuth.wi.bypass';
delete from XSR.CFG_PROPERTIES where key = 'ACUnode.v30016.xsrAuth.wi.bypass';

-- -----------------------------------------------------------------------
-- XSR AUTHORIZATION (Generic authorization component)
-- Configure location of authorization component used by XSR
-- -----------------------------------------------------------------------
delete from XSR.CFG_PROPERTIES where key = 'ACUnode.v30015.xsrauth.url';
delete from XSR.CFG_PROPERTIES where key = 'ACUnode.v30016.xsrauth.url';
