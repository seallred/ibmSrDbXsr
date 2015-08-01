-- -----------------------------------------------------------------------
-- WEB IDENTITY BYPASS CONFIGURATION
-- -----------------------------------------------------------------------
-- Default configuration values (not node or component specific)
INSERT INTO XSR.CFG_PROPERTIES (PROPERTIES_ID, KEY, VALUE) 
   VALUES (NEXT VALUE FOR XSR.SEQ_PROPERTIES_ID, 'ACUnode.v30015.xsrAuth.wi.bypass', 'true');
INSERT INTO XSR.CFG_PROPERTIES (PROPERTIES_ID, KEY, VALUE) 
   VALUES (NEXT VALUE FOR XSR.SEQ_PROPERTIES_ID, 'ACUnode.v30016.xsrAuth.wi.bypass', 'true');

-- -----------------------------------------------------------------------
-- XSR AUTHORIZATION (Generic authorization component)
-- Configure location of authorization component used by XSR
-- -----------------------------------------------------------------------
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.v30015.xsrauth.url','https://p3.www-946.events.ibm.com/xsrAuth/authenticate');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.v30016.xsrauth.url','https://p3.www-946.events.ibm.com/xsrAuth/authenticate');
