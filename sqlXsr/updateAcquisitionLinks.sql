select * from xsr.cfg_properties where key like '%portalRecentAcqui%' and key != 'portalRecentAcqui.Items'
union
select * from xsr.cfg_properties where key = 'portalRecentAcqui.Items'
with ur;

--iLog - added 11/15/2012
update xsr.cfg_properties set value = 'Curam,iCluster,i2,Netezza,Coremetrics,ilog' where key = 'portalRecentAcqui.Items';

insert into XSR.CFG_PROPERTIES (PROPERTIES_ID, key, VALUE) values
(NEXTVAL FOR XSR.SEQ_PROPERTIES_ID, 'portalRecentAcqui.ilog.label', 'IBM ILOG Visualization for C++ Products'),
(NEXTVAL FOR XSR.SEQ_PROPERTIES_ID, 'portalRecentAcqui.ilog.url', 'http://www.roguewave.com/support.aspx');

--Added Vivisimo and removed Netezza - 11/16/2012
update xsr.cfg_properties set value = 'Coremetrics,Curam,i2,iCluster,ilog,Vivisimo' where key = 'portalRecentAcqui.Items';

insert into XSR.CFG_PROPERTIES (PROPERTIES_ID, key, VALUE) values
(NEXTVAL FOR XSR.SEQ_PROPERTIES_ID, 'portalRecentAcqui.Vivisimo.label', 'Vivisimo'),
(NEXTVAL FOR XSR.SEQ_PROPERTIES_ID, 'portalRecentAcqui.Vivisimo .url', 'http://www.ibm.com/software/data/support/vivisimo_support_comm.html');

delete from xsr.cfg_properties where key = 'portalRecentAcqui.Netezza.label';
delete from xsr.cfg_properties where key = 'portalRecentAcqui.Netezza.url';

