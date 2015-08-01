-- URL to reload config: https://sr-test.austin.ibm.com/support/servicerequest/appMonitor?cmd=reload
select * from xsr.cfg_properties where key like '%relatedLinks%' and key != 'relatedLinks.order'
union
select * from xsr.cfg_properties where key = 'relatedLinks.order'
with ur;

-- UPDATE RELATED LINKS AND ORDER
-- 2012-11-19: Removed otherSR, passport
-- spe,passport,otherSR,ibmServices,ibmServer
update xsr.cfg_properties set value = 'spe,ibmServices,ibmServer' where key = 'relatedLinks.order';

-- ADD NEW RELATED LINK
--insert into XSR.CFG_PROPERTIES (PROPERTIES_ID, key, VALUE) values
--(NEXTVAL FOR XSR.SEQ_PROPERTIES_ID, 'relatedLinks.spe.name', 'nav.spe'),
--(NEXTVAL FOR XSR.SEQ_PROPERTIES_ID, 'relatedLinks.spe.url', 'http://www.roguewave.com/support.aspx');
