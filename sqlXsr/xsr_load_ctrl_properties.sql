ALTER SEQUENCE XSR.SEQ_PROPERTIES_ID RESTART WITH 1;
DELETE FROM XSR.CFG_PROPERTIES;

-- -----------------------------------------------------------------------
-- XSR AUTHORIZATION (Generic authorization component)
-- Configure location of authorization component used by XSR
-- TODO: For production and test won't this be a proxy or ND that directs
-- the request to the right spot?
-- -----------------------------------------------------------------------
-- Default configuration values (not node or component specific)
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'xsrauth.url','https://www-946.ibm.com/xsrAuth/authenticate');

-- Development environment configuration
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.etlbdesr04.xsrauth.url','https://etlbdesr04.cambridge.ibm.com/xsrAuth/authenticate');

-- Test environment configuration
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.etlgxsr01.xsrauth.url','https://etlyxsrcl01.cambridge.ibm.com/xsrAuth/authenticate');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.etlgxsr02.xsrauth.url','https://etlyxsrcl01.cambridge.ibm.com/xsrAuth/authenticate');

 -- Pre-Production environment configuration
 INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.w30037.xsrauth.url','https://w3pre.xsr.eventsgslb.ibm.com/xsrAuth/authenticate');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.w30041.xsrauth.url','https://w3pre.xsr.eventsgslb.ibm.com/xsrAuth/authenticate');

-- -----------------------------------------------------------------------
-- ESR Redirect configuration
-- -----------------------------------------------------------------------
-- Default configuration values (not node or component specific)
INSERT INTO XSR.CFG_PROPERTIES (PROPERTIES_ID, KEY, VALUE)
   VALUES (NEXT VALUE FOR XSR.SEQ_PROPERTIES_ID, 'addRelationshipBy.earlyAdopter', 'false');
INSERT INTO XSR.CFG_PROPERTIES (PROPERTIES_ID, KEY, VALUE)
   VALUES (NEXT VALUE FOR XSR.SEQ_PROPERTIES_ID, 'addRelationshipBy.esrSrcAppl', 'DSW');
INSERT INTO XSR.CFG_PROPERTIES (PROPERTIES_ID, KEY, VALUE)
   VALUES (NEXT VALUE FOR XSR.SEQ_PROPERTIES_ID, 'addRelationshipBy.esrURL', 'https://www-925.ibm.com/software/support/esr/esrHome.do');

-- Pre-production environment configuration
INSERT INTO XSR.CFG_PROPERTIES (PROPERTIES_ID, KEY, VALUE)
   VALUES (NEXT VALUE FOR XSR.SEQ_PROPERTIES_ID, 'ACUnode.w30037.addRelationshipBy.earlyAdopter', 'false');
INSERT INTO XSR.CFG_PROPERTIES (PROPERTIES_ID, KEY, VALUE)
   VALUES (NEXT VALUE FOR XSR.SEQ_PROPERTIES_ID, 'ACUnode.w30041.addRelationshipBy.earlyAdopter', 'false');

-- Test environment configuration
INSERT INTO XSR.CFG_PROPERTIES (PROPERTIES_ID, KEY, VALUE)
   VALUES (NEXT VALUE FOR XSR.SEQ_PROPERTIES_ID, 'ACUnode.etlgxsr01.addRelationshipBy.earlyAdopter', 'false');
INSERT INTO XSR.CFG_PROPERTIES (PROPERTIES_ID, KEY, VALUE)
   VALUES (NEXT VALUE FOR XSR.SEQ_PROPERTIES_ID, 'ACUnode.etlgxsr02.addRelationshipBy.earlyAdopter', 'false');

-- Development environment configuration
INSERT INTO XSR.CFG_PROPERTIES (PROPERTIES_ID, KEY, VALUE)
   VALUES (NEXT VALUE FOR XSR.SEQ_PROPERTIES_ID, 'ACUnode.etlbdesr04.addRelationshipBy.earlyAdopter', 'false');


-- -----------------------------------------------------------------------
-- WEB IDENTITY BYPASS CONFIGURATION
-- -----------------------------------------------------------------------
-- Default configuration values (not node or component specific)
INSERT INTO XSR.CFG_PROPERTIES (PROPERTIES_ID, KEY, VALUE)
   VALUES (NEXT VALUE FOR XSR.SEQ_PROPERTIES_ID, 'xsrAuth.wi.bypass', 'false');

-- Development environment configuration
INSERT INTO XSR.CFG_PROPERTIES (PROPERTIES_ID, KEY, VALUE)
   VALUES (NEXT VALUE FOR XSR.SEQ_PROPERTIES_ID, 'ACUnode.etlbdesr04.xsrAuth.wi.bypass', 'false');

-- Test environment configuration
INSERT INTO XSR.CFG_PROPERTIES (PROPERTIES_ID, KEY, VALUE)
   VALUES (NEXT VALUE FOR XSR.SEQ_PROPERTIES_ID, 'ACUnode.etlgxsr01.xsrAuth.wi.bypass', 'false');
INSERT INTO XSR.CFG_PROPERTIES (PROPERTIES_ID, KEY, VALUE)
   VALUES (NEXT VALUE FOR XSR.SEQ_PROPERTIES_ID, 'ACUnode.etlgxsr02.xsrAuth.wi.bypass', 'false');

 -- Pre-production environment configuration
 INSERT INTO XSR.CFG_PROPERTIES (PROPERTIES_ID, KEY, VALUE)
   VALUES (NEXT VALUE FOR XSR.SEQ_PROPERTIES_ID, 'ACUnode.w30037.xsrAuth.wi.bypass', 'false');
INSERT INTO XSR.CFG_PROPERTIES (PROPERTIES_ID, KEY, VALUE)
   VALUES (NEXT VALUE FOR XSR.SEQ_PROPERTIES_ID, 'ACUnode.w30041.xsrAuth.wi.bypass', 'false');

-- -----------------------------------------------------------------------
-- CONFIGURATION NEEDED FOR STG IMPLEMENTATION
-- 1.0.4 - updated test to point to production WI
-- -----------------------------------------------------------------------
-- Default configuration values (not node or component specific)
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID, 'xsr.compInfo.okUrl', 'https://www-946.ibm.com/support/servicerequest/relationship/addRelationshipBy.action');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID, 'xsr.compInfo.wiProfile', 'https://www.ibm.com/account/profile/us?page=chpro&appname=xsrapp&required=FNAME+LNAME+DPHN+EMAIL+OADDR+CTRY');

-- Development environment configuration
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID, 'ACUnode.etlbdesr04.xsr.compInfo.okUrl', 'http://etlbdesr04.cambridge.ibm.com/support/servicerequest/relationship/addRelationshipBy.action');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID, 'ACUnode.etlbdesr04.xsr.compInfo.wiProfile', 'https://www-ait-common-profile.toronto.ca.ibm.com/ait/account/profile/us?page=chpro&appname=xsrapp&required=FNAME+LNAME+DPHN+EMAIL+OADDR+CTRY');

-- Test environment configuration
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID, 'ACUnode.etlgxsr01.xsr.compInfo.okUrl', 'https://etlyxsrcl01.cambridge.ibm.com/support/servicerequest/relationship/addRelationshipBy.action');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID, 'ACUnode.etlgxsr02.xsr.compInfo.okUrl', 'https://etlyxsrcl01.cambridge.ibm.com/support/servicerequest/relationship/addRelationshipBy.action');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID, 'ACUnode.etlgxsr01.xsr.compInfo.wiProfile', 'https://www.ibm.com/account/profile/us?page=chpro&appname=xsrapp&required=FNAME+LNAME+DPHN+EMAIL+OADDR+CTRY');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID, 'ACUnode.etlgxsr02.xsr.compInfo.wiProfile', 'https://www.ibm.com/account/profile/us?page=chpro&appname=xsrapp&required=FNAME+LNAME+DPHN+EMAIL+OADDR+CTRY');
-- INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)
--    VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID, 'ACUnode.etlgxsr01.xsr.compInfo.wiProfile', 'https://www-ait-common-profile.toronto.ca.ibm.com/ait/account/profile/us?page=chpro&appname=xsrapp&required=FNAME+LNAME+DPHN+EMAIL+OADDR+CTRY');
-- INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)
--    VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID, 'ACUnode.etlgxsr02.xsr.compInfo.wiProfile', 'https://www-ait-common-profile.toronto.ca.ibm.com/ait/account/profile/us?page=chpro&appname=xsrapp&required=FNAME+LNAME+DPHN+EMAIL+OADDR+CTRY');

-- Pre-production configuration
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID, 'ACUnode.w30037.xsr.compInfo.okUrl', 'https://w3pre.xsr.eventsgslb.ibm.com/support/servicerequest/relationship/addRelationshipBy.action');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID, 'ACUnode.w30041.xsr.compInfo.okUrl', 'https://w3pre.xsr.eventsgslb.ibm.com/support/servicerequest/relationship/addRelationshipBy.action');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID, 'ACUnode.w30037.xsr.compInfo.wiProfile', 'https://www-ait-common-profile.toronto.ca.ibm.com/ait/account/profile/us?page=chpro&appname=xsrapp&required=FNAME+LNAME+DPHN+EMAIL+OADDR+CTRY');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID, 'ACUnode.w30041.xsr.compInfo.wiProfile', 'https://www-ait-common-profile.toronto.ca.ibm.com/ait/account/profile/us?page=chpro&appname=xsrapp&required=FNAME+LNAME+DPHN+EMAIL+OADDR+CTRY');


-- -----------------------------------------------------------------------
-- WEB IDENTITY USER REGISTRATION URL CONFIGURATION
-- -----------------------------------------------------------------------
-- Default configuration values (not node or component specific)
INSERT INTO XSR.CFG_PROPERTIES
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID, 'registration.url', 'https://www.ibm.com/account/profile?page=reg');

-- Development environment configuration
INSERT INTO XSR.CFG_PROPERTIES
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID, 'ACUnode.etlbdesr04.registration.url', 'https://www-ait-common-profile.toronto.ca.ibm.com/ait/account/profile?page=reg');

-- Test environment configuration
INSERT INTO XSR.CFG_PROPERTIES
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID, 'ACUnode.etlgxsr01.registration.url', 'https://www-ait-common-profile.toronto.ca.ibm.com/ait/account/profile?page=reg');
INSERT INTO XSR.CFG_PROPERTIES
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID, 'ACUnode.etlgxsr02.registration.url', 'https://www-ait-common-profile.toronto.ca.ibm.com/ait/account/profile?page=reg');

-- Pre-production environment configuration
INSERT INTO XSR.CFG_PROPERTIES
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID, 'ACUnode.w30037.registration.url', 'https://www.ibm.com/account/profile?page=reg');
INSERT INTO XSR.CFG_PROPERTIES
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID, 'ACUnode.w30041.registration.url', 'https://www.ibm.com/account/profile?page=reg');


-- -----------------------------------------------------------------------
-- WEB IDENTITY USER REGISTRATION FORGOT ID URL CONFIGURATION
-- -----------------------------------------------------------------------
-- Default configuration values (not node or component specific)
INSERT INTO XSR.CFG_PROPERTIES
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID, 'forgotuid.url', 'https://www.ibm.com/account/profile?page=forgotuid');

-- Development environment configuration
INSERT INTO XSR.CFG_PROPERTIES
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID, 'ACUnode.etlbdesr04.forgotuid.url', 'https://www-ait-common-profile.toronto.ca.ibm.com/ait/account/profile?page=forgotuid');

-- Test environment configuration
INSERT INTO XSR.CFG_PROPERTIES
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID, 'ACUnode.etlgxsr01.forgotuid.url', 'https://www-ait-common-profile.toronto.ca.ibm.com/ait/account/profile?page=forgotuid');
INSERT INTO XSR.CFG_PROPERTIES
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID, 'ACUnode.etlgxsr02.forgotuid.url', 'https://www-ait-common-profile.toronto.ca.ibm.com/ait/account/profile?page=forgotuid');

-- Pre-production environment configuration
INSERT INTO XSR.CFG_PROPERTIES
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID, 'ACUnode.w30037.forgotuid.url', 'https://www.ibm.com/account/profile?page=forgotuid');
INSERT INTO XSR.CFG_PROPERTIES
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID, 'ACUnode.w30041.forgotuid.url', 'https://www.ibm.com/account/profile?page=forgotuid');


-- -----------------------------------------------------------------------
-- WEB IDENTITY USER REGISTRATION FORGOT PASSWORD URL CONFIGURATION
-- -----------------------------------------------------------------------
-- Default configuration values (not node or component specific)
INSERT INTO XSR.CFG_PROPERTIES
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID, 'ACUcomp.xsrAuth.forgotpwd.url', 'https://www.ibm.com/account/profile?page=forgot');

-- Development environment configuration
INSERT INTO XSR.CFG_PROPERTIES
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID, 'ACUnode.etlbdesr04.forgotpwd.url', 'https://www-ait-common-profile.toronto.ca.ibm.com/ait/account/profile?page=forgot');

-- Test environment configuration
INSERT INTO XSR.CFG_PROPERTIES
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID, 'ACUnode.etlgxsr01.forgotpwd.url', 'https://www-ait-common-profile.toronto.ca.ibm.com/ait/account/profile?page=forgot');
INSERT INTO XSR.CFG_PROPERTIES
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID, 'ACUnode.etlgxsr02.forgotpwd.url', 'https://www-ait-common-profile.toronto.ca.ibm.com/ait/account/profile?page=forgot');

-- Pre-production environment configuration
INSERT INTO XSR.CFG_PROPERTIES
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID, 'ACUnode.w30037.forgotpwd.url', 'https://www.ibm.com/account/profile?page=forgot');
INSERT INTO XSR.CFG_PROPERTIES
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID, 'ACUnode.w30041.forgotpwd.url', 'https://www.ibm.com/account/profile?page=forgot');


-- -----------------------------------------------------------------------
-- WEB IDENTITY USER REGISTRATION CHANGE PASSWORD URL CONFIGURATION
-- -----------------------------------------------------------------------
-- Default configuration values (not node or component specific)
INSERT INTO XSR.CFG_PROPERTIES
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID, 'ACUcomp.xsrAuth.changepwd.url', 'https://www.ibm.com/account/profile?page=chgexpw');

-- Development environment configuration
INSERT INTO XSR.CFG_PROPERTIES
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID, 'ACUnode.etlbdesr04.changepwd.url', 'https://www-ait-common-profile.toronto.ca.ibm.com/ait/account/profile?page=chgexpw');

-- Test environment configuration
INSERT INTO XSR.CFG_PROPERTIES
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID, 'ACUnode.etlgxsr01.changepwd.url', 'https://www-ait-common-profile.toronto.ca.ibm.com/ait/account/profile?page=chgexpw');
INSERT INTO XSR.CFG_PROPERTIES
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID, 'ACUnode.etlgxsr02.changepwd.url', 'https://www-ait-common-profile.toronto.ca.ibm.com/ait/account/profile?page=chgexpw');

-- Pre-production environment configuration
INSERT INTO XSR.CFG_PROPERTIES
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID, 'ACUnode.w30037.changepwd.url', 'https://www.ibm.com/account/profile?page=chgexpw');
INSERT INTO XSR.CFG_PROPERTIES
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID, 'ACUnode.w30041.changepwd.url', 'https://www.ibm.com/account/profile?page=chgexpw');


-- -----------------------------------------------------------------------
-- XSR COOKIE ENCRYPTER USED BY AUTHORIZATION MODULE
-- -----------------------------------------------------------------------
-- Default configuration values (not node or component specific)
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'EcareCookieEncrypter.key.file','/projects/xsr/etc/ecare.key');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'EcareCookieEncrypter.session.timeout','0');

-- -----------------------------------------------------------------------
-- XSR HOME PAGE
-- Note: In redundant environments like test and production this should
-- go through a proxy and not need separate entries for each node.
-- -----------------------------------------------------------------------
-- Default configuration values (not node or component specific)
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'xsr.homepage','https://www-946.ibm.com/support/servicerequest');

-- Development environment configuration
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.etlbdesr04.xsr.homepage','https://etlbdesr04.cambridge.ibm.com/support/servicerequest/');

-- Test environment configuration
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.etlgxsr01.xsr.homepage','https://etlyxsrcl01.cambridge.ibm.com/support/servicerequest/');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.etlgxsr02.xsr.homepage','https://etlyxsrcl01.cambridge.ibm.com/support/servicerequest/');

-- Pre-production environment configuration
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.w30037.xsr.homepage','https://w3pre.xsr.eventsgslb.ibm.com/support/servicerequest/');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.w30041.xsr.homepage','https://w3pre.xsr.eventsgslb.ibm.com/support/servicerequest/');

-- -----------------------------------------------------------------------
-- XSR RELATED LINKS CONFIGURATION
-- relatedLinks.order: Defines the order of the links in the Related Links section
-- relatedLinks.xxx.name: Defines the language bundle key used for the link name
-- relatedLinks.xxx.url: Defines the URL that goes with the link name
-- -----------------------------------------------------------------------
-- Default configuration values (not node or component specific)
INSERT INTO XSR.CFG_PROPERTIES
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID, 'relatedLinks.order', 'passport,otherSR,ibmServices,mySearch,ibmServer');
INSERT INTO XSR.CFG_PROPERTIES
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID, 'relatedLinks.passport.name', 'nav.passport');
INSERT INTO XSR.CFG_PROPERTIES
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID, 'relatedLinks.passport.url', 'https://www.ibm.com/software/howtobuy/passportadvantage/paocustomer');
INSERT INTO XSR.CFG_PROPERTIES
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID, 'relatedLinks.otherSR.name', 'nav.otherSR');
INSERT INTO XSR.CFG_PROPERTIES
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID, 'relatedLinks.otherSR.url', 'http://www.ibm.com/support/electronic/uprtransition.wss?category=2');
INSERT INTO XSR.CFG_PROPERTIES
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID, 'relatedLinks.ibmServices.name', 'nav.IBMServices');
INSERT INTO XSR.CFG_PROPERTIES
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID, 'relatedLinks.ibmServices.url', 'https://www.ibm.com/support/electronic');
INSERT INTO XSR.CFG_PROPERTIES
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID, 'relatedLinks.mySearch.name', 'nav.mysearch');
INSERT INTO XSR.CFG_PROPERTIES
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID, 'relatedLinks.mySearch.url', 'http://www.ibm.com/support/electronic/mysearch');
INSERT INTO XSR.CFG_PROPERTIES
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID, 'relatedLinks.ibmServer.name', 'nav.IBMServer');
INSERT INTO XSR.CFG_PROPERTIES
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID, 'relatedLinks.ibmServer.url', 'http://www.ibm.com/systems/support');

-- -----------------------------------------------------------------------
-- EJB PORT CONFIGURATION
-- -----------------------------------------------------------------------
-- Production environment configuration
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'EJB.Default.Port','9810');

-- Test environment configuration
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.etlgxsr01.EJB.Default.Port','9811');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.etlgxsr02.EJB.Default.Port','9811');

-- Dev environment configuration
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.etlbdesr04.EJB.Default.Port','2813');

-- Pre-production environment configuration
-- 0037 is SPPP for now and 0041 is production
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.w30037.EJB.Default.Port','9810');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.w30041.EJB.Default.Port','9811');

-- -----------------------------------------------------------------------
-- SESSION TIMEOUT CONFIGURATION
-- -----------------------------------------------------------------------
-- Component based configuration
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUcomp.xsr.session.timeout','43200000');

-- -----------------------------------------------------------------------
-- TIMER JOBS
-- It should always be nexus component hiting the XSR schema.
-- PMR_DRAFT_CLEANUP_HOME - job to clean-up draft PMRs that haven't been updated in a
--                          configurable number of days.
-- PMR_RETRY_HOME - job to retry PMRs that have failed and are in the PMR retry table.
-- PMR_SYNC_HOME - job to sync XSR PMRs with RETAIN.
-- UPLOAD_ATTACHMENTS_HOME - job to upload file attachments to CDDR locations.
-- WI_UPDATE_HOME - Timer for syncing the cam.contact table with WI profile
-- -----------------------------------------------------------------------
-- Component based configuration
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUcomp.nexus.Timer.List','PMR_DRAFT_CLEANUP_HOME');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUcomp.nexus.Timer.List','PMR_RETRY_HOME');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUcomp.nexus.Timer.List','PMR_SYNC_HOME');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUcomp.nexus.Timer.List','UPLOAD_ATTACHMENTS_HOME');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUcomp.nexus.Timer.List','WI_UPDATE_HOME');

-- -----------------------------------------------------------------------
-- WEB IDENTITY
-- Use the following values for <SERVER NAME>. The location closest to the hosting
-- site of your application should be chosen for primary with the next closest as secondary
-- eND Cluster Location Address:
-- Boulder, CO USA g03cxwascl035.ahe.boulder.ibm.com
-- Sagamino, Japan g19cxwascl031.ahe.sagamino.ibm.com
-- Portsmouth, UK g06cxwascl002.ahe.uk.ibm.com
-- Poughkeepsie, NY USA g01cxwascl010.ahe.pok.ibm.com
-- -----------------------------------------------------------------------
-- Component based configuration
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'webidentity.service.userid','xsrapp');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'webidentity.service.password','r@SPutNik.');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'webidentity.service.timeout','15');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'webidentity.service.primary.url','https://g03cxwascl035.ahe.boulder.ibm.com/account/idservices/api/services/WebIdentity');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'webidentity.service.secondary.url','https://g01cxwascl010.ahe.pok.ibm.com/account/idservices/api/services/WebIdentity');

-- Development environment configuration
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.etlbdesr04.webidentity.service.userid','xsrapp');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.etlbdesr04.webidentity.service.password','r@SPutNik.');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.etlbdesr04.webidentity.service.primary.url','https://wiwasimcl.toronto.ca.ibm.com/account/idservices/ait/api/services/WebIdentity');

-- Test environment configuration
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.etlgxsr01.webidentity.service.userid','xsrapp');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.etlgxsr02.webidentity.service.userid','xsrapp');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.etlgxsr01.webidentity.service.password','r@SPutNik.');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.etlgxsr02.webidentity.service.password','r@SPutNik.');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.etlgxsr01.webidentity.service.primary.url','https://wiwasimcl.toronto.ca.ibm.com/account/idservices/ait/api/services/WebIdentity');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.etlgxsr02.webidentity.service.primary.url','https://wiwasimcl.toronto.ca.ibm.com/account/idservices/ait/api/services/WebIdentity');

-- Pre-production environment configuration
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.w30037.webidentity.service.userid','xsrapp');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.w30041.webidentity.service.userid','xsrapp');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.w30037.webidentity.service.password','r@SPutNik.');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.w30041.webidentity.service.password','r@SPutNik.');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.w30037.webidentity.service.primary.url','https://g03cxwascl035.ahe.boulder.ibm.com/account/idservices/api/services/WebIdentity');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.w30037.webidentity.service.secondary.url','https://g01cxwascl010.ahe.pok.ibm.com/account/idservices/api/services/WebIdentity');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.w30041.webidentity.service.primary.url','https://g03cxwascl035.ahe.boulder.ibm.com/account/idservices/api/services/WebIdentity');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.w30041.webidentity.service.secondary.url','https://g01cxwascl010.ahe.pok.ibm.com/account/idservices/api/services/WebIdentity');


-- -----------------------------------------------------------------------
-- EMAIL CONFIGURATION
-- -----------------------------------------------------------------------
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'mail.smtp.host','localhost');

-- Development environment configuration
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.etlbdesr04.mail.smtp.host','austin.ibm.com');

-- Test environment configuration
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.etlgxsr01.mail.smtp.host','austin.ibm.com');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.etlgxsr02.mail.smtp.host','austin.ibm.com');



-- -----------------------------------------------------------------------
-- WEB IDENTITY - PROFILE UPDATE
-- Timer List: WI_UPDATE_HOME
-- This should only run on a single node in a multi-node environment
-- SHOULD RUN IN SPPP IF THAT OPTION EXISTS
-- -----------------------------------------------------------------------
-- Default configuration values (not node or component specific)
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'WiUpdate.Timer.Enabled','false');   
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'WiUpdate.Timer.Interval.Mins','15');

-- Production environment configuration (SPPP Only, default will have other off )
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.w20016.WiUpdate.Timer.Enabled','false');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.w30011.WiUpdate.Timer.Enabled','true');
-- -- RALEIGH, NC SITE
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.v10014.WiUpdate.Timer.Enabled','false');   
-- -- ST. LOUIS, MO SITE
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.v20016.WiUpdate.Timer.Enabled','false');
-- -- BOULDER, CO SITE
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.v30015.WiUpdate.Timer.Enabled','false');      


-- Development environment configuration
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.etlbdesr04.WiUpdate.Timer.Enabled','true');
   
-- Test environment configuration
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.etlgxsr01.WiUpdate.Timer.Enabled','true');

-- Pre-production environment configuration
-- 0037 is SPPP and 0041 is prod
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.w30037.WiUpdate.Timer.Enabled','true');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.w30041.WiUpdate.Timer.Enabled','false');   


-- -----------------------------------------------------------------------
-- EARLY ADOPTER CONFIGURATION - USED TO MANAGE ESR PHASED MIGRATION
-- -----------------------------------------------------------------------
-- Default configuration values (not node or component specific)
INSERT INTO XSR.CFG_PROPERTIES (PROPERTIES_ID, KEY, VALUE) 
   VALUES (NEXT VALUE FOR XSR.SEQ_PROPERTIES_ID, 'xsrAuth.earlyAdopter.enabled', 'false');
INSERT INTO XSR.CFG_PROPERTIES (PROPERTIES_ID, KEY, VALUE) 
   VALUES (NEXT VALUE FOR XSR.SEQ_PROPERTIES_ID, 'xsrAuth.earlyAdopter.esr.url', 'https://www-925.ibm.com/software/support/esr/');
INSERT INTO XSR.CFG_PROPERTIES (PROPERTIES_ID, KEY, VALUE) 
   VALUES (NEXT VALUE FOR XSR.SEQ_PROPERTIES_ID, 'xsrAuth.earlyAdopter.xsr.url', 'https://www-946.ibm.com/support/servicerequest');
INSERT INTO XSR.CFG_PROPERTIES (PROPERTIES_ID, KEY, VALUE) 
   VALUES (NEXT VALUE FOR XSR.SEQ_PROPERTIES_ID, 'xsrAuth.earlyAdopter.xsr.pattern', '/support/servicerequest');
INSERT INTO XSR.CFG_PROPERTIES (PROPERTIES_ID, KEY, VALUE) 
   VALUES (NEXT VALUE FOR XSR.SEQ_PROPERTIES_ID, 'xsrAuth.earlyAdopter.esr.pattern', '/support/esr');

-- Development environment configuration
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.etlbdesr04.xsrAuth.earlyAdopter.esr.url','https://etlbdesr03.cambridge.ibm.com/software/support/esr');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.etlbdesr04.xsrAuth.earlyAdopter.xsr.url','https://etlbdesr04.cambridge.ibm.com/support/servicerequest/Home.action');

-- Test environment configuration
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.etlgxsr01.xsrAuth.earlyAdopter.esr.url','https://www-925test.cambridge.ibm.com/software/support/esr');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.etlgxsr02.xsrAuth.earlyAdopter.esr.url','https://www-925test.cambridge.ibm.com/software/support/esr');
INSERT INTO XSR.CFG_PROPERTIES (PROPERTIES_ID, KEY, VALUE) 
   VALUES (NEXT VALUE FOR XSR.SEQ_PROPERTIES_ID, 'ACUnode.etlgxsr01.xsrAuth.earlyAdopter.xsr.url', 'https://etlyxsrcl01.cambridge.ibm.com/support/servicerequest/Home.action');
INSERT INTO XSR.CFG_PROPERTIES (PROPERTIES_ID, KEY, VALUE) 
   VALUES (NEXT VALUE FOR XSR.SEQ_PROPERTIES_ID, 'ACUnode.etlgxsr02.xsrAuth.earlyAdopter.xsr.url', 'https://etlyxsrcl01.cambridge.ibm.com/support/servicerequest/Home.action');

-- Pre-production environment configuration
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.w30037.xsrAuth.earlyAdopter.esr.url','https://www-925.ibm.com/software/support/esr/');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.w30041.xsrAuth.earlyAdopter.esr.url','https://www-925.ibm.com/software/support/esr/');
INSERT INTO XSR.CFG_PROPERTIES (PROPERTIES_ID, KEY, VALUE) 
   VALUES (NEXT VALUE FOR XSR.SEQ_PROPERTIES_ID, 'ACUnode.w30037.xsrAuth.earlyAdopter.xsr.url', 'https://w3pre.xsr.eventsgslb.ibm.com/support/servicerequest/Home.action');
INSERT INTO XSR.CFG_PROPERTIES (PROPERTIES_ID, KEY, VALUE)
   VALUES (NEXT VALUE FOR XSR.SEQ_PROPERTIES_ID, 'ACUnode.w30041.xsrAuth.earlyAdopter.xsr.url', 'https://w3pre.xsr.eventsgslb.ibm.com/support/servicerequest/Home.action');


-- -----------------------------------------------------------------------
-- PMR MAINTENANCE
-- -----------------------------------------------------------------------
-- Default configuration values (not node or component specific)
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'PMR.ReOpen.MinAgeDays','30');

-- -----------------------------------------------------------------------
-- PMR RETRY MAINTENANCE
-- Timer List: PMR_RETRY_HOME
-- This should only run on a single node in a multi-node environment.  
-- Only one of the nodes below should be set to true at any given time.
-- SHOULD RUN IN SPPP IF THAT OPTION EXISTS
-- -----------------------------------------------------------------------
-- Default configuration values (not node or component specific)
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'PMRRetry.Timer.Enabled','false');

INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'PMRRetry.Retry.BadQueueCenter','DMOFF|129');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'PMRRetry.Retry.BadQueueCenter','SLINE|163');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'PMRRetry.Retry.MinAgeMinutes','5');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'PMRRetry.Retry.TimeoutWait','120000');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'PMRRetry.Timer.Interval.Mins','5');


-- Production environment configuration (SPPP Only, default will have other off )
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.w20016.PMRRetry.Timer.Enabled','false');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.w30011.PMRRetry.Timer.Enabled','false');
-- -- RALEIGH, NC SITE
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.v10014.PMRRetry.Timer.Enabled','true');
-- -- ST. LOUIS, MO SITE
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.v20016.PMRRetry.Timer.Enabled','false');
-- -- BOULDER, CO SITE
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.v30015.PMRRetry.Timer.Enabled','false');

-- Development environment configuration
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.etlbdesr04.PMRRetry.Timer.Enabled','true');

-- Test environment configuration
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.etlgxsr01.PMRRetry.Timer.Enabled','true');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.etlgxsr02.PMRRetry.Timer.Enabled','false');

-- Pre-production environment configuration
-- 0037 is SPPP and 0041 is prod 
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.w30037.PMRRetry.Timer.Enabled','true');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.w30041.PMRRetry.Timer.Enabled','false');   

-- -----------------------------------------------------------------------
-- PMR SYNC MAINTENANCE
-- Timer List: PMR_SYNC_HOME
-- This should only run on a single node in a multi-node environment.  
-- Only one of the nodes below should be set to true at any given time.
-- SHOULD RUN IN SPPP IF THAT OPTION EXISTS
-- -----------------------------------------------------------------------
-- Default configuration values (not node or component specific)
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'PMRSync.Timer.Enabled','false');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'PMRSync.Sync.MinAgeMinutes','5');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'PMRSync.Timer.Interval.Mins','5');

-- Production environment configuration (SPPP Only, default will have other off )
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.w20016.PMRSync.Timer.Enabled','false');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.w30011.PMRSync.Timer.Enabled','false');
-- -- RALEIGH, NC SITE
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.v10014.PMRSync.Timer.Enabled','true');
-- -- ST. LOUIS, MO SITE
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.v20016.PMRSync.Timer.Enabled','false');
-- -- BOULDER, CO SITE
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.v30015.PMRSync.Timer.Enabled','false');

-- Development environment configuration
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.etlbdesr04.PMRSync.Timer.Enabled','false');

-- Test environment configuration
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.etlgxsr01.PMRSync.Timer.Enabled','false');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.etlgxsr02.PMRSync.Timer.Enabled','false');
   
 -- Pre-production environment configuration
 -- 0037 is SPPP and 0041 is prod
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.w30037.PMRSync.Timer.Enabled','true');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.w30041.PMRSync.Timer.Enabled','false');   

--which actions we send notices on
insert into xsr.cfg_properties (properties_id, key, value) values 
(next value for xsr.seq_properties_id, 'pmr.sync.notice.admin.action', 'CC'),
(next value for xsr.seq_properties_id, 'pmr.sync.notice.admin.action', 'AT');

-- -----------------------------------------------------------------------
-- PMR DRAFT MAINTENANCE
-- Timer List: PMR_DRAFT_CLEANUP_HOME
-- This should only run on a single node in a multi-node environment.  
-- Only one of the nodes below should be set to true at any given time.
-- SHOULD RUN IN SPPP IF THAT OPTION EXISTS
-- -----------------------------------------------------------------------
-- Default configuration values (not node or component specific)
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'PmrDraftCleanup.Timer.Enabled','false');   

INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'PmrDraftCleanup.Expires.Days','5');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'PmrDraftCleanup.Timer.Interval.Days','1');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'draft.aging.days','5');

-- Production environment configuration (SPPP Only, default will have other off )
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.w20016.PmrDraftCleanup.Timer.Enabled','false');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.w30011.PmrDraftCleanup.Timer.Enabled','true');
-- -- RALEIGH, NC SITE
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.v10014.PmrDraftCleanup.Timer.Enabled','false');   
-- -- ST. LOUIS, MO SITE
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.v20016.PmrDraftCleanup.Timer.Enabled','false');
-- -- BOULDER, CO SITE
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.v30015.PmrDraftCleanup.Timer.Enabled','false');      

-- Development environment configuration
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.etlbdesr04.PmrDraftCleanup.Timer.Enabled','false');

-- Test environment configuration
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.etlgxsr01.PmrDraftCleanup.Timer.Enabled','false');
   
-- Pre-production environment configuration
-- 0037 is SPPP and 0041 is prod
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.w30037.PmrDraftCleanup.Timer.Enabled','true');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.w30041.PmrDraftCleanup.Timer.Enabled','false');     

-- -----------------------------------------------------------------------
-- FILE UPLOAD CONFIGURATION (CDDR)
-- Timer List: UPLOAD_ATTACHMENTS_HOME
-- Used to configure whether the file upload timer job is on or off, at
-- what interval it runs and where XSR initially drops the files for processing.  
-- Also allows us to configure different upload end points and where to 
-- place the files on those servers.
-- SHOULD OUNLY RUN IN PRODUCTION (NOT SPPP)
-- -----------------------------------------------------------------------
-- Default configuration values (not node or component specific)
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'UploadAttachment.Timer.Enabled','true');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'UploadAttachment.Timer.Interval.Mins','5');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'UploadAttachment.dropDir','/weblogs/attachments');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'UploadAttachment.ecurep.userid','esrprod');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'UploadAttachment.ecurep.password','2008mar03');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'UploadAttachment.ecurep.dir','/ecurep/toibm/xsr');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'UploadAttachment.ecurep.host','ecurep.mainz.de.ibm.com');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'UploadAttachment.ecurep.port','22');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'UploadAttachment.testcase.userid','cerebro@us.ibm.com');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'UploadAttachment.testcase.password','tikmxn5i');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'UploadAttachment.testcase.dir','/software/toibm/xsr');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'UploadAttachment.testcase.host','testcase.boulder.ibm.com');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'UploadAttachment.testcase.port','22');

-- Production SPPP configuration values -- do not want this to run in SPPP
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.w20016.UploadAttachment.Timer.Enabled','false');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.w30011.UploadAttachment.Timer.Enabled','false');      

-- Pre-production environment configuration
-- 0037 is SPPP and 0041 is prod
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.w30037.UploadAttachment.Timer.Enabled','false');      

-- Development environment configuration
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.etlbdesr04.UploadAttachment.ecurep.userid','esrprod');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.etlbdesr04.UploadAttachment.ecurep.password','2008mar03');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.etlbdesr04.UploadAttachment.ecurep.dir','/ecurep/toibm/xsr');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.etlbdesr04.UploadAttachment.ecurep.host','ecurep.mainz.de.ibm.com');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.etlbdesr04.UploadAttachment.testcase.userid','cerebrod@us.ibm.com');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.etlbdesr04.UploadAttachment.testcase.password','absn57qb');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.etlbdesr04.UploadAttachment.testcase.dir','/software/toibm/xsr');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.etlbdesr04.UploadAttachment.testcase.host','testcase.boulder.ibm.com');

-- Test environment configuration
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.etlgxsr01.UploadAttachment.ecurep.userid','esrprod');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.etlgxsr01.UploadAttachment.ecurep.password','2008mar03');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.etlgxsr01.UploadAttachment.ecurep.host','ecurep.mainz.de.ibm.com');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.etlgxsr01.UploadAttachment.ecurep.dir','/ecurep/toibm/xsr');

INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.etlgxsr02.UploadAttachment.ecurep.userid','esrprod');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.etlgxsr02.UploadAttachment.ecurep.password','2008mar03');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.etlgxsr02.UploadAttachment.ecurep.host','ecurep.mainz.de.ibm.com');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.etlgxsr02.UploadAttachment.ecurep.dir','/ecurep/toibm/xsr');

INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.etlgxsr01.UploadAttachment.testcase.userid','cerebrot@us.ibm.com');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.etlgxsr01.UploadAttachment.testcase.password','m8whvxok');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.etlgxsr01.UploadAttachment.testcase.host','testcase.boulder.ibm.com');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.etlgxsr01.UploadAttachment.testcase.dir','/software/toibm/xsr');

INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.etlgxsr02.UploadAttachment.testcase.userid','cerebrot@us.ibm.com');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.etlgxsr02.UploadAttachment.testcase.password','m8whvxok');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.etlgxsr02.UploadAttachment.testcase.host','testcase.boulder.ibm.com');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.etlgxsr02.UploadAttachment.testcase.dir','/software/toibm/xsr');

-- -----------------------------------------------------------------------
-- BLUEGROUP & BLUEPAGES CONFIGURATION
-- Configuration to connect to bluegroups and bluepages.  Used to provide 
-- authorization (ACLs) that control what users have access to certain functionality
-- in the XSR Admin Tool.
-- -----------------------------------------------------------------------
-- Default configuration values (not node or component specific)
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'bluegroups.bluegroups.server','ldap://bluepages.ibm.com:389');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'bluegroups.bluepages.server','ldap://bluepages.ibm.com:389');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'bluegroups.ldap.version','3');

-- -----------------------------------------------------------------------
-- CDDR CONFIGURATION: UPLOAD DESTINATION BY COUNTRY AND PLATFORM ID
-- -----------------------------------------------------------------------
-- Default configuration values (not node or component specific)
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'cddr','ecurep');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'cddr.CN.2','testcase');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'cddr.US.2','testcase');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'cddr.US.3','testcase');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'cddr.US.4','testcase');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'cddr.US.5','testcase');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'cddr.US.6','testcase');

-- -----------------------------------------------------------------------
-- PRODUCT / COMPONENT ID'S SETUP TO SUPPORT OTHER PRODUCT SELECTION
-- -----------------------------------------------------------------------
-- Default configuration values (not node or component specific)
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'product.other.prodId','OTHER');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'component.other.compId','UNKNOWNSR');

-- -----------------------------------------------------------------------
-- LIVE ASSISTANCE CONFIGURATION
-- -----------------------------------------------------------------------
-- Default configuration values (not node or component specific)
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'liveAssistance.PSTS.BaseUrl','https://www-919.ibm.com/CCSI/index.jsp');

-- Development environment configuration
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.etlbdesr04.liveAssistance.PSTS.BaseUrl','http://pstscc1.rchland.ibm.com/CCSI/');

-- Test environment configuration
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.etlgxsr01.liveAssistance.PSTS.BaseUrl','http://pstscc1.rchland.ibm.com/CCSI/');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.etlgxsr02.liveAssistance.PSTS.BaseUrl','http://pstscc1.rchland.ibm.com/CCSI/');

-- Pre-production environment configuration
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.w30041.liveAssistance.PSTS.BaseUrl','https://www-919.ibm.com/CCSI/index.jsp');

-- -----------------------------------------------------------------------
-- REPORT GENERATION TOOL
-- -----------------------------------------------------------------------
-- Default configuration values (not node or component specific)
INSERT INTO XSR.CFG_PROPERTIES (PROPERTIES_ID, KEY, VALUE)
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID, 'ReportGenerationTool.Timer.Enabled', 'false');

-- Production environment configuration (SPPP Only, default will have other off )
INSERT INTO XSR.CFG_PROPERTIES (PROPERTIES_ID, KEY, VALUE)
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID, 'ACUnode.w20016.ReportGenerationTool.Timer.Enabled', 'false');
INSERT INTO XSR.CFG_PROPERTIES (PROPERTIES_ID, KEY, VALUE)
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID, 'ACUnode.w30011.ReportGenerationTool.Timer.Enabled', 'true');

-- Development environment configuration
INSERT INTO XSR.CFG_PROPERTIES (PROPERTIES_ID, KEY, VALUE)
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID, 'ACUnode.etlbdesr04.ReportGenerationTool.Timer.Enabled', 'true');

-- Test environment configuration
INSERT INTO XSR.CFG_PROPERTIES (PROPERTIES_ID, KEY, VALUE)
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID, 'ACUnode.etlgxsr01.ReportGenerationTool.Timer.Enabled', 'false');
INSERT INTO XSR.CFG_PROPERTIES (PROPERTIES_ID, KEY, VALUE)
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID, 'ACUnode.etlgxsr02.ReportGenerationTool.Timer.Enabled', 'true');

-- Pre-production environment configuration
INSERT INTO XSR.CFG_PROPERTIES (PROPERTIES_ID, KEY, VALUE)
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID, 'ACUnode.w30041.ReportGenerationTool.Timer.Enabled', 'false');
INSERT INTO XSR.CFG_PROPERTIES (PROPERTIES_ID, KEY, VALUE)
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID, 'ACUnode.w30037.ReportGenerationTool.Timer.Enabled', 'true');


-- -----------------------------------------------------------------------
-- SUPPORT LINKS AND HELP DESK EMAIL CONFIGURATION
-- -----------------------------------------------------------------------
-- Default configuration values (not node or component specific)
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ibm.support.handbook.link','http://techsupport.services.ibm.com/guides/handbook.html');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ibm.support.help.contactus.link','http://www.ibm.com/software/support/help-contactus.html');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ibm.support.help.link','http://www.ibm.com/support/electronic/navpage.wss?category=25');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ibm.support.helpdesk.email','srhelp@us.ibm.com');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ibm.support.xsr.link','https://www-946.ibm.com/support/servicerequest');

-- Development environment configuration
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.etlbdesr04.ibm.support.xsr.link','https://etlbdesr04.cambridge.ibm.com/support/servicerequest/Home.action');

-- Test environment configuration
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.etlgxsr01.ibm.support.xsr.link','https://etlyxsrcl01.cambridge.ibm.com/support/servicerequest/Home.action');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.etlgxsr02.ibm.support.xsr.link','https://etlyxsrcl01.cambridge.ibm.com/support/servicerequest/Home.action');

-- Pre-production environment configuration
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.w30037.ibm.support.xsr.link','https://w3pre.xsr.eventsgslb.ibm.com/support/servicerequest/Home.action');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.w30041.ibm.support.xsr.link','https://w3pre.xsr.eventsgslb.ibm.com/support/servicerequest/Home.action');


-- -----------------------------------------------------------------------
-- PMR CONFIGURATION
-- -----------------------------------------------------------------------
-- Default configuration values (not node or component specific)
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'nexus.wopr.PMR.CancelLiveRouting','false');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'nexus.wopr.PMR.InterestNode','IBMUS');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'nexus.wopr.PMR.InterestUser','cerebro');
   
-- For Dev
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.etlbdesr04.nexus.wopr.PMR.CancelLiveRouting','true');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.etlbdesr04.nexus.wopr.PMR.InterestUser','cerebrod');
   
-- For Test
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.etlgxsr01.nexus.wopr.PMR.CancelLiveRouting','true');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.etlgxsr02.nexus.wopr.PMR.CancelLiveRouting','true');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.etlgxsr01.nexus.wopr.PMR.InterestUser','cerebrot');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.etlgxsr02.nexus.wopr.PMR.InterestUser','cerebrot');

-- -----------------------------------------------------------------------
-- REMOTE SITE CUSTOMIZATION
-- Used to allow other consumers of the XSR web application to customize the
-- look of the application using stylesheets so that it more closely matches
-- their current application.  
-- Current consumers include: ISA and IWCS
-- -----------------------------------------------------------------------
-- Default configuration values (not node or component specific)
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'rsc.98765.contentOnly','true');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'rsc.98765.location','/support/servicerequest/theme/');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'rsc.98765.name','custom.css');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'rsc.cookieName','IBM_XSR_RSC');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'rsc.paramName','rsc');

-- -----------------------------------------------------------------------
-- ISA Redirect Configuration
-- IsaDirect allows redirection to a particular URL in either xSR or ESR, 
-- based on the action the user passes and the app that the environment is 
-- currently configured.
-- -----------------------------------------------------------------------
-- Default configuration values (not node or component specific)
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID, 'IsaDirect.app','esr');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID, 'IsaDirect.xsr', 'https://www-946.ibm.com/support/servicerequest');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID, 'IsaDirect.xsr.openapmr', 'https://www-946.ibm.com/support/servicerequest/productSelect.action');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID, 'IsaDirect.xsr.search', 'https://www-946.ibm.com/support/servicerequest/searchSR.action');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID, 'IsaDirect.esr','https://www-925.ibm.com/software/support/esr/');

-- Test environment values
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.etlgxsr01.IsaDirect.app','xsr');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID, 'ACUnode.etlgxsr01.IsaDirect.xsr', 'https://etlyxsrcl01.cambridge.ibm.com/support/servicerequest/Home.action');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID, 'ACUnode.etlgxsr01.IsaDirect.xsr.openapmr', 'https://etlyxsrcl01.cambridge.ibm.com/support/servicerequest/productSelect.action');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID, 'ACUnode.etlgxsr01.IsaDirect.xsr.search', 'https://etlyxsrcl01.cambridge.ibm.com/support/servicerequest/searchSR.action');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.etlgxsr02.IsaDirect.app','xsr');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID, 'ACUnode.etlgxsr02.IsaDirect.xsr', 'https://etlyxsrcl01.cambridge.ibm.com/support/servicerequest/Home.action');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID, 'ACUnode.etlgxsr02.IsaDirect.xsr.openapmr', 'https://etlyxsrcl01.cambridge.ibm.com/support/servicerequest/productSelect.action');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID, 'ACUnode.etlgxsr02.IsaDirect.xsr.search', 'https://etlyxsrcl01.cambridge.ibm.com/support/servicerequest/searchSR.action');

-- Development environment values
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.etlbdesr04.IsaDirect.app','xsr');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,  'ACUnode.etlbdesr04.IsaDirect.xsr', 'http://etlbdesr04.cambridge.ibm.com/support/servicerequest/Home.action');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID, 'ACUnode.etlbdesr04.IsaDirect.xsr.openapmr', 'http://etlbdesr04.cambridge.ibm.com/support/servicerequest/productSelect.action');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID, 'ACUnode.etlbdesr04.IsaDirect.xsr.search', 'http://etlbdesr04.cambridge.ibm.com/support/servicerequest/searchSR.action');

-- Pre-production environment values
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.w30037.IsaDirect.app','xsr');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID, 'ACUnode.w30037.IsaDirect.xsr', 'https://w3pre.xsr.eventsgslb.ibm.com/support/servicerequest/Home.action');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID, 'ACUnode.w30037.IsaDirect.xsr.openapmr', 'https://w3pre.xsr.eventsgslb.ibm.com/support/servicerequest/productSelect.action');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID, 'ACUnode.w30037.IsaDirect.xsr.search', 'https://w3pre.xsr.eventsgslb.ibm.com/support/servicerequest/searchSR.action');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.w30041.IsaDirect.app','xsr');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID, 'ACUnode.w30041.IsaDirect.xsr', 'https://w3pre.xsr.eventsgslb.ibm.com/support/servicerequest/Home.action');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID, 'ACUnode.w30041.IsaDirect.xsr.openapmr', 'https://w3pre.xsr.eventsgslb.ibm.com/support/servicerequest/productSelect.action');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID, 'ACUnode.w30041.IsaDirect.xsr.search', 'https://w3pre.xsr.eventsgslb.ibm.com/support/servicerequest/searchSR.action');


-- -----------------------------------------------------------------------
-- SDI CONFIGURATION
-- -----------------------------------------------------------------------
-- Default configuration values (not node or component specific)
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'sdi.aqs.billing.1','TIV01');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'sdi.aqs.billing.2','TIV01');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'sdi.aqs.billing.3','TIV01');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'sdi.aqs.extbilling.1','TIV01');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'sdi.aqs.extbilling.2','TIV01');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'sdi.aqs.extbilling.3','TIV01');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'sdi.aqs.ip.1','9.56.214.253');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'sdi.aqs.ip.2','9.56.214.253');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'sdi.aqs.ip.3','9.149.87.129');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'sdi.aqs.node.1','BDC');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'sdi.aqs.node.2','BDC');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'sdi.aqs.node.3','RS4');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'sdi.aqs.port.1','3381');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'sdi.aqs.port.2','3382');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'sdi.aqs.port.3','3291');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'sdi.pmr.billing.1','TIV01');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'sdi.pmr.billing.2','TIV01');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'sdi.pmr.billing.3','TIV01');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'sdi.pmr.extbilling.1','TIV01');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'sdi.pmr.extbilling.2','TIV01');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'sdi.pmr.extbilling.3','TIV01');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'sdi.pmr.ip.1','9.56.214.253');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'sdi.pmr.ip.2','9.56.214.253');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'sdi.pmr.ip.3','9.149.87.129');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'sdi.pmr.node.1','BDC');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'sdi.pmr.node.2','BDC');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'sdi.pmr.node.3','RS4');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'sdi.pmr.port.1','3381');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'sdi.pmr.port.2','3382');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'sdi.pmr.port.3','3291');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'sdi.user','676713');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'sdi.password','jjan24fd');

-- Development environment configuration
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.etlbdesr04.sdi.user','676715');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.etlbdesr04.sdi.password','sepp09fd');

-- Test environment configuration
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.etlgxsr01.sdi.user','676710');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.etlgxsr01.sdi.password','jjan07fd');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.etlgxsr02.sdi.user','676710');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.etlgxsr02.sdi.password','jjan07fd');


-- -----------------------------------------------------------------------
-- SERVICE REQUEST CALL CATEGORY - used for metrics in CQDB.
-- Modified on 1/6/08 based on information from Don S.  Was WSR.
-- Modified on 3/14/08 based on email chain Bill Carey, Gary 
--    Brideau, Don S., Richard Bagnulo.  Changed from 20 to SR.
-- Modified on 5/13/08 based on email chain Don s., Christian and 
--    Mike Shenhouse.  Changed from SR to XSR because it has to be 
--    3 characters.
-- -----------------------------------------------------------------------
-- Default configuration values (not node or component specific)
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'serviceRequest.callCategory','XSR');

-- -----------------------------------------------------------------------
-- Non-DSW Contract Types 
-- List of non-DSW contract types used to determine when to invoke the STG nomination path
-- -----------------------------------------------------------------------
-- Default configuration values (not node or component specific)
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'offeringType.nonDSWList','7');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'offeringType.nonDSWList','8');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'offeringType.nonDSWList','9');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'offeringType.nonDSWList','10');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'offeringType.nonDSWList','11');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'offeringType.nonDSWList','12');

-- -----------------------------------------------------------------------
-- i18n settings: Internationalization 
-- CCSID is an abbreviation used by IBM to mean "Coded Character Set Identifier". 
-- It is a 16-bit number that represents a specific encoding of a specific code page.
-- il8n.[locale].ccsid: defines the ccsid used for that locale
-- il8n.[ccsid].language: defines the language for that CCSID
-- il8n.[ccsid].country: defines the country for that CCSID
-- -----------------------------------------------------------------------
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'i18n.en.ccsid','37');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'i18n.en_US.ccsid','37');

INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'i18n.37.language','en');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'i18n.37.country','US');

-- Japanese
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'i18n.ja_JP.ccsid','1399');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'i18n.ja.ccsid','1399');

INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'i18n.5035.language','ja');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'i18n.5035.country','JP');

INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'i18n.939.language','ja');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'i18n.939.country','JP');

INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'i18n.1399.language','ja');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'i18n.1399.country','JP');

INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'i18n.5026.language','ja');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'i18n.5026.country','JP');

INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'i18n.930.language','ja');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'i18n.930.country','JP');

INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'i18n.1390.language','ja');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'i18n.1390.country','JP');

-- Simplified Chinese
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'i18n.zh.ccsid','1388');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'i18n.zh_CN.ccsid','1388');

INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'i18n.1388.language','zh');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'i18n.1388.country','CN');

INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'i18n.5031.language','zh');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'i18n.5031.country','CN');

INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'i18n.5484.language','zh');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'i18n.5484.country','CN');

INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'i18n.935.language','zh');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'i18n.935.country','CN');

-- Traditional Chinese
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'i18n.zh_TW.ccsid','937');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'i18n.zh_HK.ccsid','937');

INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'i18n.937.language','zh');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'i18n.937.country','TW');

INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'i18n.5033.language','zh');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'i18n.5033.country','TW');

-- Korean
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'i18n.ko.ccsid','1364');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'i18n.ko_KR.ccsid','1364');

INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'i18n.1364.language','ko');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'i18n.1364.country','KR');

INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'i18n.933.language','ko');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'i18n.933.country','KR');

INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'i18n.5029.language','ko');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'i18n.5029.country','KR');

INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE) 
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'i18n.5460.language','ko');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'i18n.5460.country','KR');

INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'i18n.9125.language','ko');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'i18n.9125.country','KR');

-- -----------------------------------------------------------------------
-- XSR VERSION
-- -----------------------------------------------------------------------
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'xsr.version','A2.1.0');


-- -----------------------------------------------------------------------
-- ONLY CONFIGURATION VALUES FOR DEVELOPMENT TEAM BELOW THIS POINT
-- -----------------------------------------------------------------------
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.IBM-16981402B27.EJB.Default.Port','2810');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.IBM-16981402B27.EJB.Default.Port','2811');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.IBM-16981402B27.EJB.Default.Port','2813');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.IBM-B268980E49CNode12.EJB.Default.Port','2819');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.IBM-B268980E49CNode12.xsrauth.url','http://etlbdesr04.cambridge.ibm.com/xsrAuth/authenticate');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.IBM-B70F48B8C3D.EJB.Default.Port','2809');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.IBM-B70F48B8C3D.WiUpdate.Timer.Enabled','true');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.IBM-B70F48B8C3D.WiUpdate.Timer.Interval.Mins','3');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.IBM-B70F48B8C3D.xsrauth.url','http://etlbdesr04.cambridge.ibm.com/xsrAuth/authenticate');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.ashar.EJB.Default.Port','2811');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.ashar.dev.userdtooff','0');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.ashar.xsr.viewRights.enabled','true');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.ashar.xsrauth.url','http://etlbdesr04.cambridge.ibm.com/xsrAuth/authenticate');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.bulldreyfuss.EJB.Default.Port','2809');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.bulldreyfuss.dev.userdto','1');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.cpan.EJB.Default.Port','2809');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.cpan.sdi.password','jjan07fd');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.cpan.sdi.user','676709');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.dantest.EJB.Default.Port','666666');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.dantest.dev.userdto','1');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.drnick.EJB.Default.Port','2809');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.drnick.PMRRetry.Timer.Enabled','false');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.drnick.PMRSync.Timer.Enabled','false');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.drnick.PmrDraftCleanup.Timer.Enabled','false');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.drnick.dev.userdtooff','1');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.drnick.test.key','test2');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.drnick.xsr.homepage','http://drnick.ibm.com:9081/support/servicerequest/');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.drnick.xsrAuth.earlyAdopter.xsr.url','http://drnick.ibm.com:9081/support/servicerequest/');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.drnick.xsrauth.url','http://drnick.ibm.com:9081/xsrAuth/authenticate');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.fharroun.EJB.Default.Port','2811');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.fharroun.dev.userdtooff','0');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.fharroun.xsrauth.url','http://xsrdev.ibm.com:9081/xsrAuth/authenticate');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.jontest.EJB.Default.Port','2810');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.jontest.PMRSync.Timer.Enabled','false');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.jontest.dev.userdto','1');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.kaapte.EJB.Default.Port','2811');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.kaapte.xsr.homepage','http://xsrdev.ibm.com:9082/support/servicerequest/Home.action');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.kaapte.xsrauth.url','https://etlyxsrcl01.cambridge.ibm.com/xsrAuth/authenticate');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.rsumner.EJB.Default.Port','2812');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.tlaveyjr.EJB.Default.Port','2809');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.tlaveyjr.IsaDirect.app','xsr');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.tlaveyjr.IsaDirect.esr','https://www-925.ibm.com/software/support/esr/');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.tlaveyjr.IsaDirect.xsr','http://xsrdev.ibm.com:9080/support/servicerequest/Home.action');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.tlaveyjr.IsaDirect.xsr.openapmr','http://xsrdev.ibm.com:9080/support/servicerequest/productSelect.action');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.tlaveyjr.IsaDirect.xsr.search','http://xsrdev.ibm.com:9080/support/servicerequest/searchSR.action');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.tlaveyjr.PMRSync.Timer.Enabled','false');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.tlaveyjr.UploadAttachment.Timer.Enabled','true');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.tlaveyjr.UploadAttachment.dropDir','c:/weblogs/attachments');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.tlaveyjr.WiUpdate.Timer.Interval.Mins','3');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.tlaveyjr.changepwd.url','https://www-ait-common-profile.toronto.ca.ibm.com/ait/account/profile?page=chgexpw');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.tlaveyjr.forgotpwd.url','https://www-ait-common-profile.toronto.ca.ibm.com/ait/account/profile?page=forgot');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.tlaveyjr.forgotuid.url','https://www-ait-common-profile.toronto.ca.ibm.com/ait/account/profile?page=reghelpdesk');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.tlaveyjr.registration.url','https://www-ait-common-profile.toronto.ca.ibm.com/ait/account/profile?page=reg');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.tlaveyjr.session.timeout','1800000');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.tlaveyjr.xsr.homepage','http://xsrdev.ibm.com:9080/support/servicerequest/Home.action');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.tlaveyjr.xsr.viewRights.enabled','true');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.tlaveyjr.xsrAuth.earlyAdopter.enabled','false');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.tlaveyjr.xsrAuth.earlyAdopter.esr.pattern','/support/esr');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.tlaveyjr.xsrAuth.earlyAdopter.esr.url','https://www-925.ibm.com/software/support/esr/');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.tlaveyjr.xsrAuth.earlyAdopter.xsr.pattern','/support/servicerequest');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.tlaveyjr.xsrAuth.earlyAdopter.xsr.url','http://xsrdev.ibm.com:9080/support/servicerequest/servicerequest/Home.action');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.tlaveyjr.xsrAuth.wi.bypass','false');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.tlaveyjr.xsrauth.url','http://xsrdev.ibm.com:9080/xsrAuth/authenticate');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.wongjy.EJB.Default.Port','2809');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.wongjy.sdi.password','jjan07fd');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.wongjy.sdi.user','676709');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.wongjy.xsr.viewRights.enabled','true');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)
   VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'ACUnode.wongjy.xsrauth.url','https://etlyxsrcl01.cambridge.ibm.com/xsrAuth/authenticate');


--RETAIN USER KEY VALUES FOR PMR HISTORY TEXT
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)    VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'retain.user.key1','NIM #01');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)    VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'retain.user.key10','NIM #10');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)    VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'retain.user.key11','NIM #11');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)    VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'retain.user.key12','NIM #12');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)    VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'retain.user.key13','NIM #13');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)    VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'retain.user.key14','NIM #14');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)    VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'retain.user.key15','NIM #15');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)    VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'retain.user.key16','NIM #16');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)    VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'retain.user.key17','NIM #17');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)    VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'retain.user.key18','NIM #18');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)    VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'retain.user.key19','NIM #19');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)    VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'retain.user.key2','NIM #02');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)    VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'retain.user.key20','NIM #20');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)    VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'retain.user.key21','NIM #21');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)    VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'retain.user.key22','NIM #22');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)    VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'retain.user.key23','NIM #23');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)    VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'retain.user.key24','NIM #24');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)    VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'retain.user.key25','NIM #25');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)    VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'retain.user.key26','TY2K 001');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)    VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'retain.user.key27','TY2K 002');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)    VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'retain.user.key28','TY2K 003');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)    VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'retain.user.key29','TY2K 004');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)    VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'retain.user.key3','NIM #03');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)    VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'retain.user.key30','TY2K 005');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)    VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'retain.user.key31','TY2K 006');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)    VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'retain.user.key32','TY2K 007');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)    VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'retain.user.key33','TY2K 008');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)    VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'retain.user.key34','TY2K 009');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)    VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'retain.user.key35','TY2K 010');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)    VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'retain.user.key36','TY2K 011');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)    VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'retain.user.key37','TY2K 012');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)    VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'retain.user.key38','TY2K 013');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)    VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'retain.user.key39','TY2K 014');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)    VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'retain.user.key4','NIM #04');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)    VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'retain.user.key40','TY2K 015');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)    VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'retain.user.key41','TY2K 016');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)    VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'retain.user.key42','TY2K 017');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)    VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'retain.user.key43','TY2K 018');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)    VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'retain.user.key5','NIM #05');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)    VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'retain.user.key6','NIM #06');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)    VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'retain.user.key7','NIM #07');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)    VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'retain.user.key8','NIM #08');
INSERT INTO XSR.CFG_PROPERTIES(PROPERTIES_ID,KEY,VALUE)    VALUES (NEXTVAL FOR XSR.SEQ_PROPERTIES_ID,'retain.user.key9','NIM #09');
