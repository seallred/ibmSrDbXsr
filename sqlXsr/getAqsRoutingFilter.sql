select * from xsr.aqs_bp_filter;
select * from xsr.aqs_filter_types;
select * from xsr.aqs_routing_config where aqs_routing_config_id = ;
select * from xsr.aqs_routing_config_locale_xref where aqs_routing_config_id = 389;
select * from xsr.aqs_offering_country_comp_filter_201 where offer_cntry_comp_filter_id = 124;
select * from xsr.AQS_OFFERING_COUNTRY_FILTER where offering_country_filter_id = 419;

select * from xsr.AQS_OFFERING_COUNTRY_FILTER where offering_country_filter_id = 123;
--OFFERING_COUNTRY_FILTER_ID	RETAIN_CNTRY_CODE	SUPPORT_OFFERING_ID	SUPPORT_TYPE_ID	LEVEL	CREATE_USER	CREATE_DATETIME	UPDATE_USER	UPDATE_DATETIME
--519	(null)	7	(null)	2	cpan@us.ibm.com	2012-12-05 07:33:22	cpan@us.ibm.com	2012-12-05 07:33:22

select * from cam.support_offering;
--7	BT19	Software Maintenance (SWMA) Not System Entitled
--22	SXE	SoftwareXcel Enterprise

select * from xsr.comp_group_comp_xref
where comp_id = '5725I2900' with ur;

select * from xsr.avl_request_type;
select * from xsr.offshift_queue;
select * from xsr.offshift_queue_route;


select * from xsr.cfg_properties where key = 'xsr.version' with ur;