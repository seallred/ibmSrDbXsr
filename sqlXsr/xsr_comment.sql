COMMENT ON TABLE XSR.PMR_ADV_ROUTE IS
'Primary table that defines the routing rules.  Used for produciton routing of service requests.';

COMMENT ON TABLE XSR.PMR_ADV_ROUTE_SET IS
'Defines a route set that can be comprised of a set of rules with different criteria.  Used for routing production service requests.';

COMMENT ON TABLE XSR.COMP_GROUP IS
'Used to group like components so that business rules can be managed at a more coarse grain level.  This makes manageing the many compents much more manageable.
Note: Removed spprt_brand_id column that was part of the EEM implementation.  This was used to association responsibility/ownership of a component group to a brand.';

COMMENT ON TABLE XSR.PMR_COUNTRY_ROUTE IS
'Default country route table. This replaced the RETAIN_CNTRY table in the EEM database.';

COMMENT ON TABLE XSR.PMR_ADV_ROUTE_TIME_SLOT IS
'Defines time slots that a paticular advance route may apply.  Used to route production service requests.';

COMMENT ON TABLE XSR.PMR_ADV_ROUTE_EXCL_DAYS IS
'Defines exlusion days for the associated routing records.  Used for routing of service requests.';

COMMENT ON TABLE XSR.AVL_OPERATING_SYSTEM IS
'Master table (allowed value list) of operating systems.';

COMMENT ON TABLE XSR.AVL_COMM_METHOD IS
'Master table / allowed value list of available communication methods.  One use of this list is for routing.  A PMR could be submitted with the approapriate routing rule and then the use could be presented with some additional methods to communicate with the support engineers that recieve the PMR.  Possible options include:
- standard (electronic, which is the default)
- live call back.  user can provide a phone number and the support engineer will call them 
- chat, user can initiate a chat session with a support engineer';

COMMENT ON TABLE XSR.PMR_ADV_ROUTE_KEYWORD IS
'List of keywords.  Used for routing production service requests.';

COMMENT ON TABLE XSR.PMR_ADV_ROUTE_KEYWORD_LIST IS
'Grouping of keywords that can apply to a given advance route.  Used for routing production service requests.';

COMMENT ON TABLE XSR.COMP_GROUP_TYPE IS
'Identifies the type of component group.  Component groups can be created for various reasons and each component group may include different components depending on what it is being used for.  For example, there could be a component group created for grouping products for routing purposes.  Another component group my be created to allow admins to group components they are responsible for managing.

Notes: Removed src_xref_tab_name and last_updt_of_type columns from original EEM implementation.  Not expecting to need these two columns in xSR.';

COMMENT ON TABLE XSR.PMR_T_ADV_ROUTE IS
'Test routing rules table.  Primary table that defines the routing rules.  Test tables isolate impact of building routing rules and testing them from production tables to ensure top performance for production routing.';

COMMENT ON TABLE XSR.PMR_T_ADV_ROUTE_SET IS
'Test routing rules table.  Test tables isolate impact of building routing rules and testing them from production tables to ensure top performance for production routing.  Defines a route set that can be comprised of a set of rules with different criteria.';

COMMENT ON TABLE XSR.PMR_ROUTE_LOG IS
'Logs PMRs that are sent through the routing engine.';

COMMENT ON TABLE XSR.PMR_ROUTE_LOG_COMM_METHOD IS
'Logs the communication method chose for PMRs passed to the routing engine.';

COMMENT ON TABLE XSR.PMR_T_ADV_ROUTE_TIME_SLOT IS
'Test routing rules table.  Test tables isolate impact of building routing rules and testing them from production tables to ensure top performance for production routing.  Defines time slots that a paticular advance route may apply.';

COMMENT ON TABLE XSR.PMR_T_ADV_ROUTE_KEYWORD_LIST IS
'Test routing rules table.  Test tables isolate impact of building routing rules and testing them from production tables to ensure top performance for production routing.  Grouping of keywords that can apply to a given advance route.';

COMMENT ON TABLE XSR.PMR_T_ADV_ROUTE_KEYWORD IS
'Test routing rules table.  Test tables isolate impact of building routing rules and testing them from production tables to ensure top performance for production routing.  List of keywords.';

COMMENT ON TABLE XSR.PMR_T_ADV_ROUTE_EXCL_DAYS IS
'Test routing rules table.  Test tables isolate impact of building routing rules and testing them from production tables to ensure top performance for production routing.  Defines exlusion days for the associated routing records.';

COMMENT ON TABLE XSR.PMR_A_ADV_ROUTE IS
'Archive routing rules table.  Primary table that defines the routing rules.  Archive table allows us to keep a history of routing rules in case we need to restore one that was deleted or for some other reason.';

COMMENT ON TABLE XSR.PMR_A_ADV_ROUTE_SET IS
'Archive routing rules table.  Defines a route set that can be comprised of a set of rules with different criteria.  Archvie tables allow us to maintain a history of routing rules removed from production.';

COMMENT ON TABLE XSR.PMR_A_ADV_ROUTE_KEYWORD_LIST IS
'Archive routing rules table.  Grouping of keywords that can apply to a given advance route.  Archive tables used for historical purposes.';

COMMENT ON TABLE XSR.PMR_A_ADV_ROUTE_KEYWORD IS
'Archive routing rules table.  List of keywords.  Used as a history of routing rules no longer in production.';

COMMENT ON TABLE XSR.PMR_A_ADV_ROUTE_TIME_SLOT IS
'Archive routing rules table.  Defines time slots that a paticular advance route may apply.  Used to maintain a history of routing rules removed from production.';

COMMENT ON TABLE XSR.PMR_A_ADV_ROUTE_EXCL_DAYS IS
'Archive routing rules table.  Defines exlusion days for the associated routing records.  Used as a history of routing rules that are no longer in production.';

COMMENT ON TABLE XSR.PMR_ADV_ROUTE_XREF_AVL_COMM_METHOD IS
'Defines the available communication methods associated with an advance route.  Used to route production service requests.';

COMMENT ON TABLE XSR.PMR_T_ADV_ROUTE_XREF_AVL_COMM_METHOD IS
'Test routing rules table.  Test tables isolate impact of building routing rules and testing them from production tables to ensure top performance for production routing.  Defines the available communication methods associated with an advance route.';

COMMENT ON TABLE XSR.PMR_A_ADV_ROUTE_XREF_AVL_COMM_METHOD IS
'Archive routing rules table.  Defines the available communication methods associated with an advance route.  Used to maintain a history of routing rules removed from production.';

COMMENT ON TABLE XSR.APP_TYPE IS
'Master table (allowed value list) of applications that interact with the XSR middleware.  Examples are:
APP_ID	APP_TYPE	DESCRIPTION
---------    -------------  ------------------------------
1	            INTSYS	        Internal systems
2	            ESR	            The ESR application
3	            EAT	            The EEM Admin Tool
4	            CED	            The CED application
5	            ISA	            The IBM Support Assistant application
0	            N/A	            Not applicable';

COMMENT ON TABLE XSR.AUDIT_ACTION_TYPE IS
'Used for describing the action types availble for audit logging.';

COMMENT ON TABLE XSR.AUDIT_LOG IS
'Used for general audit logging for any application.';

COMMENT ON TABLE XSR.AUDIT_OBJ_TYPE IS
'Used for describing the action object types availble for audit logging.';

COMMENT ON TABLE XSR.CFG_PROPERTIES IS
'Table containing application configuration parameters.';

COMMENT ON TABLE XSR.RIGHT_OBJ IS
'Used for user authorization functionality.  The mapping between customer and caller type (spprt_cnt_id <-> obj_type_id)';

COMMENT ON TABLE XSR.RIGHT_OBJ_LOG IS
'USED FOR USER AUTHORIZATION FUNCTIONALITY.  THE LOGS TABLE FOR ALL THE CHANGE ON RIGHT_OBJ';

COMMENT ON TABLE XSR.RIGHT_OBJ_TRAN IS
'Used for user authorization functionality.  Triggers on some tables insert the new records when the records in these tables are updated. A timer process goes through the records in RIGHT_OBJ_TRAN table and update the rights of the related customer. key_1 to key_6 are used to pass the key data to the process.  ';

COMMENT ON TABLE XSR.RETAIN_ACT_LOG IS
'Used to track activity against RETAIN.  This informatoin can help reconcile billing issues.';

COMMENT ON TABLE XSR.RETAIN_CNTRY_CODE IS
'Used to define center (queue/center) differences between RETAIN nodes by country code.  This is primarly used when a RETAIN nodes goes down and we are on a node that we normally do not run against.';

COMMENT ON TABLE XSR.RETAIN_ERR_LOG IS
'Used to capture errors that occur while interacting with RETAIN.';

COMMENT ON TABLE XSR.PMR_ATTACHMENT IS
'Used to manage attachments associated to PMRs';

COMMENT ON TABLE XSR.PMR_DRAFT IS
'Primary PMR draft table used to capture PMRs in draft state.';

COMMENT ON TABLE XSR.PMR_DRAFT_TEXT IS
'Contains the text block portion of a draft PMR.  Really only used for updates to PMRs that get saved as draft.';

COMMENT ON TABLE XSR.PMR_ERR IS
'Used to capture errors that occur while processing PMRs.';

COMMENT ON TABLE XSR.PMR_HEADER IS
'Primary PMR table associated with active PMRs.';

COMMENT ON TABLE XSR.PMR_LOG IS
'Logs activity on PMRs.';

COMMENT ON TABLE XSR.PMR_RETRY IS
'Used to persist PMRs that failed to make it to RETAIN.  These PMRs are dropped onto an MQ queue which continues to try and post the PMR to RETAIN for a configuable number of times before it gives up and writes logs an error.';

COMMENT ON TABLE XSR.PMR_RETRY_TEXT IS
'Contains text blocks associated to a  PMRs in retry state.';

COMMENT ON TABLE XSR.CONTACT_AUTH IS
'This table contains a rights mask that identifies an XSR users rights within the application.';

COMMENT ON TABLE XSR.CONTACT_AUTH_LOG IS
'TABLE TRACKS CHANGES TO THE USERS AUTHORIZATIONS FOR AUDITING AND TROUBLESHOOTING.';

COMMENT ON TABLE XSR.RIGHT_OBJ_TYPE IS
'Master table / allowed value list of the caller types.  Used for user authorization functionality.
OBJ_TYPE_ID DSCR
----------- 
1 primarySiteTechnicalContactSupportIds
2 secondarySiteTechnicalContactSupportIds
3 authorizedCallerSupportIds
4 authorizedReaderSupportIds
5 updateOnlyCallerSupportIds
6 businessPartnerLocationIds
7 businessPartnerPrimaryLocationIds
8 businessPartnerUnlimitedSupport
9 businessPartnerPerIncidentSupport
10 primarySiteTechnicalContactExpiredSupportIds
11 secondarySiteTechnicalContactExpiredSupportIds
12 authorizedCallerExpiredSupportIds';

COMMENT ON TABLE XSR.ISO_CNTRY IS
'Table of ISO country codes and how they map to RETAIN country codes.  These codes follow the standard ISO 3166 Codes (both 2 & 3 character codes).

CNTRY_CODE_2	CNTRY_CODE	RETAIN_CNTRY_CODE	DSCR
!!		!!!					Root
AD	AD 					Andorra
AE	ARE		677		United Arab Emirates
AF	AF 		614		Afghanistan';

COMMENT ON TABLE XSR.ISO_LANG IS
'ISO language codes (ISO 639) for the Representation of Names of Languages.  

ISO_LANG_CODE	DSCR
!!!		Root
ZZ		dscr1
aa		Afar
ab		Abkhazian
ace		Achinese
ach		Acoli';

COMMENT ON TABLE XSR.LOCALE IS
'Locale is a set of parameters that defines the user''s language, country and any special variant preferences that the user wants to see in their user interface.  Locale follows the RFC 3066 standard of [iso_lang_code] "_" [country_code].
The locale''s that are supported by xSR will have the IS_SUPPORTED = 1 and if not it will be 0.

locale		country_code_2		iso_lang_code
ab_CD		ZD	
af												af
af_ZA		ZA							af
am											am
am_ET		ET							am

New..........
LOCALE_ID	LOCALE	CNTRY_CODE_2	ISO_LANG_CODE	IS_SUPPORTED
-------------	----------	-------------------	---------------------	-------------------
1					en_US		US						en							1
2					de_DE		DE						de							1
3					ja_JP		JP							ja								1
4					it_IT			IT							it								1
5					es_ES		ES						es								1
6					fr_FR		FR						fr								1
7					ko_KR		KR						ko								1
8					pt_BR		BR						pt								1
9					zh_CN		CN						zh								1
10	';

COMMENT ON TABLE XSR.FAMS IS
'Detail table used by FAMS to manage file attachments.';

COMMENT ON TABLE XSR.FAMS_APP_INFO IS
'This table defines applications using FAMS.';

COMMENT ON TABLE XSR.FAMS_CONFIG IS
'CONFIGURATION VALUES FOR FAMS.';

COMMENT ON TABLE XSR.FAMS_MESSAGE IS
'This table defines messages to describe FAMS actions or results.';

COMMENT ON TABLE XSR.FAMS_NODE_INFO IS
'Ccontains information regarding file sytem nodes used for storing attachments.';

COMMENT ON TABLE XSR.FAMS_STATUS IS
'Table contains description of status values used by FAMS.';

COMMENT ON TABLE XSR.MSG_LOG IS
'Log table for notification and other types of outbound messages sent by the XSR application.';

COMMENT ON TABLE XSR.MSG_OUTBOUND IS
'Used to persist outbound notification messages before they are actually sent out.';

COMMENT ON TABLE XSR.MSG_SUBST IS
'List of keys and the text that should be subsituted for it when found in the message template.  This is used to dynamically build notification email messages.';

COMMENT ON TABLE XSR.MSG_TMPL IS
'USED TO CREATE TEMPLATES TO HELP GENERATE OUTBOUND EMAIL FOR NOTIFICATIONS.';

COMMENT ON TABLE XSR.MSG_TOKEN IS
'USED TO TOKENIZE AN EMAIL TEMPLATE TO PROVIDE AN ABILITY TO DYNAMICALLY GENERATE THE OUTBOUND EMAIL USED FOR NOTIFICATIONS.';

COMMENT ON TABLE XSR.NOTIFICATION_TRAN IS
'TRANSACTION TABLE MONITORED TO SEND OUT NOTIFICATIONS BASED ON EVENTS USERS HAVE REGISTERED TO RECEIVE NOTIFICATIONS';

COMMENT ON TABLE XSR.BRAND IS
'Master table / allowed value list of IBM brands and sub-brands (SW brands - Lotus, Tivoli, etc.)';

COMMENT ON TABLE XSR.PMR_DRAFT_LOG IS
'Log of activity against draft PMRs.';

COMMENT ON TABLE XSR.COMP_GROUP_COMP_XREF IS
'Cross reference table between component groups and associated products and components.';

COMMENT ON TABLE XSR.COMP_GROUP_XREF IS
'Cross reference table between component groups and the components that belong to them.';

COMMENT ON TABLE XSR.CONTACT_LOGIN_ERR_LOG IS
'USED TO LOG USER AUTHENTICATION PROBLEMS INCLUDING PROBLEMS LIKE CALLRE ALREADY REGISTERED,  OR USER BEING REGISTERED WITH A DIFFERENT IBM UID.';

COMMENT ON TABLE XSR.CONTACT_LOGIN_XREF_LOG IS
'USED TO TRACK CUSTOMER LOGIN TO XSR.  MAY NOT NEED THIS IN XSR.';

COMMENT ON TABLE XSR.CONTACT_PMR_XREF IS
'MAINTAINS RELEASE_LEVELATIONSHIP BETWEEN USERS AND PMR''S IN DRAFT STATE.';

COMMENT ON TABLE XSR.BP_PMR_DRAFT_XREF IS
'CROSS REFERENCE TABLE IDENTIFYING BUSINESS PARTNERS AND THEIR PMRS IN DRAFT STATUS.';

COMMENT ON TABLE XSR.BP_PMR_RETRY_XREF IS
'CROSS REFERENCE TABLE IDENTIFYING BUSINESS PARTNERS AND THEIR PMRS IN RETRY STATUS.';

COMMENT ON TABLE XSR.BP_PMR_XREF IS
'CROSS REFERENCE TABLE IDENTIFYING BUSINESS PARTNERS AND THEIR CURRENT PMRS.';

COMMENT ON TABLE XSR.CONTACT_PROD_FAVORITES IS
'PART OF THE XSR USER PROFILE THAT TRACKS THE LIST OF PRODUCTS THAT THE USERS HAS ADDED TO THEIR FAVORITES LIST.';

COMMENT ON TABLE XSR.AVL_STATUS_CODE IS
'Master table of status codes for the xsr application.

ACTV_STAT_CODE		DSCR
0									Active
1									Inactive
2									Expired
3									Migrated';

COMMENT ON TABLE XSR.CONTACT_XREF IS
'This table is used to cache a list of support agreements for each XSR user.';

COMMENT ON TABLE XSR.CONTACT_PROFILE IS
'PRIMARY TABLE FOR THE XSR USER PROFILE INFORMATION.';

COMMENT ON TABLE XSR.CONTACT_PROFILE_REPORT IS
'USED TO PERSIST THE COLUMNS DISPLAYED ON THE SEARCH RESULTS PAGE.  USER HAS THE ABILITY TO SELECT UP TO 10 COLUMNS AND HOW TO SORT THE DATA.';

COMMENT ON TABLE XSR.CONTACT_PROFILE_NOTIFICATION IS
'PART OF THE XSR USER PROFILE THAT TRACKS THE USERS NOTIFICATION PREFERENCES.';

COMMENT ON TABLE XSR.PMR_HEADER_RETAIN_INFO IS
'Contains RETAIN specific information associated to a PMR.';

COMMENT ON TABLE XSR.PMR_HEADER_XSR_INFO IS
'Contains XSR specific information associated to a  PMR.';

COMMENT ON TABLE XSR.PMR_HEADER_SIG_LINES IS
'Maintains signature lines associated to an active PMR.';

COMMENT ON TABLE XSR.AVL_REQUEST_TYPE IS
'SYS109 XSR shall require the user to select the subtype of the request, from Software Defect  Support (SDS), Preventative Maintenance (PMA), Installation (INS), Software Usage Support (SUS), or Account Support Management (AMA).
';

COMMENT ON TABLE XSR.PMR_DRAFT_XSR_INFO IS
'Contains XSR specific information associated to a DRAFT PMR.';

COMMENT ON TABLE XSR.PMR_DRAFT_RETAIN_INFO IS
'Contains RETAIN specific information associated to a DRAFT PMR.';

COMMENT ON TABLE XSR.PMR_CONFIG IS
'Holds configuration parameters associated to PMRs by country.
** Note:  does this just belong in the config management system.';

COMMENT ON TABLE XSR.PMR_RETRY_XSR_INFO IS
'Contains XSR specific information associated to a  PMR in retry state.';

COMMENT ON TABLE XSR.PMR_RETRY_RETAIN_INFO IS
'Contains RETAIN specific information associated to a PMR in retry state.';

COMMENT ON COLUMN XSR.PMR_ADV_ROUTE.CREATE_FLAG IS
'Used to identify which transaction types this rule applies to.  Possible values are: I = Insert U = Update A = All';

COMMENT ON COLUMN XSR.PMR_A_ADV_ROUTE.CREATE_FLAG IS
'Used to identify which transaction types this rule applies to.  Possible values are: I = Insert U = Update A = All';

COMMENT ON COLUMN XSR.PMR_DRAFT.STATE IS
'The state identifies the current state of a PMR based on the values listed below.  This is used to help determine which set of PMR tables contains the PMR.  The data is distributed based on state to resolve possible contention problems with the various processes that need access to this data.

0 - Normal
1 - Draft
2 - In-progress';

COMMENT ON COLUMN XSR.PMR_HEADER.PMR_NUM IS
'RETAIN PROBLEM NUMBER';

COMMENT ON COLUMN XSR.PMR_HEADER.BRANCH IS
'RETAIN BRANCH';

COMMENT ON COLUMN XSR.PMR_HEADER.RETAIN_CNTRY_CODE IS
'RETAIN COUNTRY CODE';

COMMENT ON COLUMN XSR.LOCALE.IS_SUPPORTED IS
'Flag to identify those LOCALE''s that the xSR application supports.';

COMMENT ON COLUMN XSR.CONTACT_PROFILE.SUPPORT_AGRMNT_VIEW_PREF IS
'USERS PREFERRED VIEW FOR THE SELECT A SUPPORT AGREEMENT PAGE.
C - BY CONTRACT
M - BY MACHINE';

COMMENT ON COLUMN XSR.PMR_HEADER_RETAIN_INFO.SW_HD IS
'THE TYPE OF PMR - SOFTWARE OR HARDWARE

FOR NOW, ALWAYS DEFAULT TO S FOR SOFTWARE.';

COMMENT ON COLUMN XSR.PMR_HEADER_RETAIN_INFO.RETAIN_NODE IS
'THE NODE THAT IS THE SOURCE FOR THE PMR RECORD.  RS4 OR BDC.';

COMMENT ON COLUMN XSR.PMR_HEADER_RETAIN_INFO.STATUS IS
'RETAIN FIELD: THE CURRENT STATUS - OPEN, CLOSED, ETC.';

COMMENT ON COLUMN XSR.PMR_HEADER_RETAIN_INFO.CUST_NAME_NLS IS
'THE COMPANY NAME OF THE CUSTOMER';

COMMENT ON COLUMN XSR.PMR_HEADER_RETAIN_INFO.CONTACT_PHONE1 IS
'COMPANY PHONE NUMBER.  THIS ONE IS NOT USED TO CALL THE PERSON BACK';

COMMENT ON COLUMN XSR.PMR_HEADER_RETAIN_INFO.CONTACT_PHONE2 IS
'CONTACT''S PHONE NUMBER';

COMMENT ON COLUMN XSR.PMR_HEADER_RETAIN_INFO.SUPPORT_LEVEL IS
'THIS IS ALWAYS A ''1';

COMMENT ON COLUMN XSR.PMR_HEADER_RETAIN_INFO.QUEUE IS
'QUEUE THE PMR IS CURRENTLY ON - OR THE QUEUE THE PMR WAS ON LAST OF THERE ARE NO CALLS ON THE PMR.';

COMMENT ON COLUMN XSR.PMR_HEADER_RETAIN_INFO.CENTER IS
'CENTER THAT IS PAIRED WITH QUEUE';

COMMENT ON COLUMN XSR.PMR_HEADER_RETAIN_INFO.COMP_ID IS
'COMPONENT ID THIS PMR IS ABOUT';

COMMENT ON COLUMN XSR.PMR_HEADER_RETAIN_INFO.RELEASE_LEVEL IS
'RELEASE_LEVELEASE LEVEL.';

COMMENT ON COLUMN XSR.PMR_HEADER_RETAIN_INFO.SEVERITY IS
'PMR SEVERITY.';

COMMENT ON COLUMN XSR.PMR_HEADER_RETAIN_INFO.SYSTEM_DOWN IS
'INDICATES THAT A SYSTEM IS DOWN FOR A CUSTOMER.';

COMMENT ON COLUMN XSR.PMR_HEADER_RETAIN_INFO.APAR_NUM IS
'APAR ASSOCIATED WITH THE PMR (IF IT EXISTS)';

COMMENT ON COLUMN XSR.PMR_HEADER_RETAIN_INFO.PRIORITY_PG IS
'"PRI-PAGE".  PRIORITY PAGE IS BASCIALLY THE NUMBER OF THE CALL ON A QUEUE.  IF A CALL IS THE SECOND PRIORITY 3 CALL ON A QUEUE THE PRI-PAGE IS 302.  THIS IS LINKED WITH THE QUEUE, CENTER FIELDS.';

COMMENT ON COLUMN XSR.PMR_HEADER_RETAIN_INFO.CALL_CAT IS
'CALL CATEGORY.

USED ON CREATE (PMCE)  AND UPATE (PMCE).';

COMMENT ON COLUMN XSR.PMR_HEADER_RETAIN_INFO.CUPRIMD IS
'METRICS FIELD HAVING TO DO WITH SOLUTION GIVEN.';

COMMENT ON COLUMN XSR.PMR_HEADER_RETAIN_INFO.PMR_CREATE_DATE IS
'Date PMR was created.  If the service requrest was created in xSR then this date and the create_date should be the same.  But, for those service request that were created by phone os some other means then this date will be the actual PMR create date as RETAIN knows it and the create_date will be the date the record was added to the xSR database.';

COMMENT ON COLUMN XSR.PMR_HEADER_RETAIN_INFO.PMR_UPDATE_DATE IS
'LAST DATE THE PMR WAS UPDATED IN RETAIN.  THIS DATE COULD VARY FROM THE UPDATE_DATETIME STORED IN XSR BECAUSE XSR DATABASE ONLY TRACKS ACTIVITY WITHIN THE XSR APPLICATION.  THE RECORD COULD HAVE BEEN UPDATED IN RETAIN.
';

COMMENT ON COLUMN XSR.PMR_HEADER_XSR_INFO.SUPPORT_ID IS
'FK TO SPPRT THAT PMR WAS OPENED UNDER.';

COMMENT ON COLUMN XSR.PMR_HEADER_XSR_INFO.TITLE IS
'TITLE OF THE PMR THAT WAS PROVIDED BY THE PERSON OPENING IT.';

COMMENT ON COLUMN XSR.PMR_HEADER_XSR_INFO.CONTACT_METHOD IS
'THE METHOD BY WHICH THE CUSTOMER IS TO BE CONTACTED - EMAIL, PHONE, ETC.';

COMMENT ON COLUMN XSR.PMR_HEADER_XSR_INFO.ALT_CONTACT_METHOD IS
'THE METHOD BY WHICH THE ALTERNATE CONTACT IS TO BE CONTACTED.';

COMMENT ON COLUMN XSR.PMR_HEADER_XSR_INFO.ALT_CONTACT_ID IS
'A PMR CAN HAVE A BACKUP CONTACT.  THIS IS THE CONTACT_ID OF THAT CONTACT.  THIS IS A CONTACT THAT WAS A CALLER ON THE CONTRACT AT THE TIME THE PMR WAS CREATED IN XSR.';

COMMENT ON COLUMN XSR.PMR_HEADER_XSR_INFO.OPERSYS_ID IS
'FK TO THE TABLE THAT MAINTAINS  A LIST OF OPERATING SYSTEMS.  IDENTIFIES THE OPERATING SYSTEM WHERE THE SOFTWARE IS RUNNING.';

COMMENT ON COLUMN XSR.PMR_HEADER_XSR_INFO.PROD_ID IS
'FK TO CAM IDENTIFYING THE PRODUCT THE PMR IS OPENED UNDER.';

COMMENT ON COLUMN XSR.PMR_HEADER_XSR_INFO.INITIAL_SEVERITY IS
'INITIAL SEVERITY REPORTED FOR THE PMR ';

COMMENT ON COLUMN XSR.PMR_HEADER_XSR_INFO.LOCALE IS
'LOCALE THE PMR WAS CREATED IN.  USED PRIMARILY FOR METRICS.  WE USE THE USERS BROWSER SETTINGS TO FIGURE OUT HOW THAT MAPS TO A CCSID SO THAT WE CAN GET IT IN THE RIGHT CHARACTER SET AND ENCODING FOR RETAIN.';

COMMENT ON COLUMN XSR.PMR_HEADER_XSR_INFO.OPEN_COUNT IS
'NUMBER OF TIMES THIS PMR HAS BEEN REOPENED VIA ESR';

COMMENT ON COLUMN XSR.PMR_HEADER_XSR_INFO.UPDATE_CONTACT_ID IS
'THE CONTACT_ID THAT LAST UPDATED THE PMR VIA XSR.';

COMMENT ON COLUMN XSR.PMR_DRAFT_XSR_INFO.SUPPORT_ID IS
'FK TO SPPRT THAT PMR WAS OPENED UNDER.';

COMMENT ON COLUMN XSR.PMR_DRAFT_XSR_INFO.TITLE IS
'TITLE OF THE PMR THAT WAS PROVIDED BY THE PERSON OPENING IT.';

COMMENT ON COLUMN XSR.PMR_DRAFT_XSR_INFO.ALT_CONTACT_METHOD IS
'THE METHOD BY WHICH THE ALTERNATE CONTACT IS TO BE CONTACTED.';

COMMENT ON COLUMN XSR.PMR_DRAFT_XSR_INFO.ALT_CONTACT_ID IS
'A PMR CAN HAVE A BACKUP CONTACT.  THIS IS THE CONTACT_ID OF THAT CONTACT.  THIS IS A CONTACT THAT WAS A CALLER ON THE CONTRACT AT THE TIME THE PMR WAS CREATED IN XSR.';

COMMENT ON COLUMN XSR.PMR_DRAFT_XSR_INFO.OPERSYS_ID IS
'FK TO THE TABLE THAT MAINTAINS  A LIST OF OPERATING SYSTEMS.  IDENTIFIES THE OPERATING SYSTEM WHERE THE SOFTWARE IS RUNNING.';

COMMENT ON COLUMN XSR.PMR_DRAFT_XSR_INFO.PROD_ID IS
'FK TO CAM IDENTIFYING THE PRODUCT THE PMR IS OPENED UNDER.';

COMMENT ON COLUMN XSR.PMR_DRAFT_XSR_INFO.INITIAL_SEVERITY IS
'INITIAL SEVERITY REPORTED FOR THE PMR ';

COMMENT ON COLUMN XSR.PMR_DRAFT_XSR_INFO.LOCALE IS
'LOCALE THE PMR WAS CREATED IN.  USED PRIMARILY FOR METRICS.  WE USE THE USERS BROWSER SETTINGS TO FIGURE OUT HOW THAT MAPS TO A CCSID SO THAT WE CAN GET IT IN THE RIGHT CHARACTER SET AND ENCODING FOR RETAIN.';

COMMENT ON COLUMN XSR.PMR_DRAFT_XSR_INFO.OPEN_COUNT IS
'NUMBER OF TIMES THIS PMR HAS BEEN REOPENED VIA ESR';

COMMENT ON COLUMN XSR.PMR_DRAFT_XSR_INFO.UPDATE_CONTACT_ID IS
'THE CONTACT_ID THAT LAST UPDATED THE PMR VIA XSR.';

COMMENT ON COLUMN XSR.PMR_DRAFT_XSR_INFO.CONTACT_ID IS
'POINTER TO CONTACT RECORD ASSOCIATED WITH PMR.';

COMMENT ON COLUMN XSR.PMR_DRAFT_RETAIN_INFO.RETAIN_NODE IS
'THE NODE THAT IS THE SOURCE FOR THE PMR RECORD.  RS4 OR BDC.';

COMMENT ON COLUMN XSR.PMR_DRAFT_RETAIN_INFO.STATUS IS
'RETAIN FIELD: THE CURRENT STATUS - OPEN, CLOSED, ETC.';

COMMENT ON COLUMN XSR.PMR_DRAFT_RETAIN_INFO.CUST_NAME_NLS IS
'THE COMPANY NAME OF THE CUSTOMER';

COMMENT ON COLUMN XSR.PMR_DRAFT_RETAIN_INFO.CONTACT_PHONE1 IS
'COMPANY PHONE NUMBER.  THIS ONE IS NOT USED TO CALL THE PERSON BACK';

COMMENT ON COLUMN XSR.PMR_DRAFT_RETAIN_INFO.CONTACT_PHONE2 IS
'CONTACT''S PHONE NUMBER';

COMMENT ON COLUMN XSR.PMR_DRAFT_RETAIN_INFO.SUPPORT_LEVEL IS
'THIS IS ALWAYS A ''1';

COMMENT ON COLUMN XSR.PMR_DRAFT_RETAIN_INFO.QUEUE IS
'QUEUE THE PMR IS CURRENTLY ON - OR THE QUEUE THE PMR WAS ON LAST OF THERE ARE NO CALLS ON THE PMR.';

COMMENT ON COLUMN XSR.PMR_DRAFT_RETAIN_INFO.CENTER IS
'CENTER THAT IS PAIRED WITH QUEUE';

COMMENT ON COLUMN XSR.PMR_DRAFT_RETAIN_INFO.COMP_ID IS
'COMPONENT ID THIS PMR IS ABOUT';

COMMENT ON COLUMN XSR.PMR_DRAFT_RETAIN_INFO.RELEASE_LEVEL IS
'RELEASE_LEVELEASE LEVEL.';

COMMENT ON COLUMN XSR.PMR_DRAFT_RETAIN_INFO.SEVERITY IS
'PMR SEVERITY.';

COMMENT ON COLUMN XSR.PMR_DRAFT_RETAIN_INFO.SYSTEM_DOWN IS
'INDICATES THAT A SYSTEM IS DOWN FOR A CUSTOMER.';

COMMENT ON COLUMN XSR.PMR_DRAFT_RETAIN_INFO.APAR_NUM IS
'APAR ASSOCIATED WITH THE PMR (IF IT EXISTS)';

COMMENT ON COLUMN XSR.PMR_DRAFT_RETAIN_INFO.PRIORITY_PG IS
'"PRI-PAGE".  PRIORITY PAGE IS BASCIALLY THE NUMBER OF THE CALL ON A QUEUE.  IF A CALL IS THE SECOND PRIORITY 3 CALL ON A QUEUE THE PRI-PAGE IS 302.  THIS IS LINKED WITH THE QUEUE, CENTER FIELDS.';

COMMENT ON COLUMN XSR.PMR_DRAFT_RETAIN_INFO.CALL_CAT IS
'CALL CATEGORY.

USED ON CREATE (PMCE)  AND UPATE (PMCE).';

COMMENT ON COLUMN XSR.PMR_DRAFT_RETAIN_INFO.CUPRIMD IS
'METRICS FIELD HAVING TO DO WITH SOLUTION GIVEN.';

COMMENT ON COLUMN XSR.PMR_DRAFT_RETAIN_INFO.PMR_UPDATE_DATE IS
'LAST DATE THE PMR WAS UPDATED IN RETAIN.  THIS DATE COULD VARY FROM THE UPDATE_DATETIME STORED IN XSR BECAUSE XSR DATABASE ONLY TRACKS ACTIVITY WITHIN THE XSR APPLICATION.  THE RECORD COULD HAVE BEEN UPDATED IN RETAIN.
';

COMMENT ON COLUMN XSR.PMR_CONFIG.SEV1_INFO_MSG IS
'SYS110 XSR shall warn the user of the consequences and hours of support for Severity 1 PMRs when Severity 1 is selected, using a message indicated by the customer / country / contract of the entitlement data, in a language tailored to the browser’s locale.
Files are in the language bundles, and mapped by browser settings. Map to NLS.';

COMMENT ON COLUMN XSR.PMR_RETRY_XSR_INFO.SUPPORT_ID IS
'FK TO SPPRT THAT PMR WAS OPENED UNDER.';

COMMENT ON COLUMN XSR.PMR_RETRY_XSR_INFO.TITLE IS
'TITLE OF THE PMR THAT WAS PROVIDED BY THE PERSON OPENING IT.';

COMMENT ON COLUMN XSR.PMR_RETRY_XSR_INFO.CONTACT_METHOD IS
'THE METHOD BY WHICH THE CUSTOMER IS TO BE CONTACTED - EMAIL, PHONE, ETC.';

COMMENT ON COLUMN XSR.PMR_RETRY_XSR_INFO.ALT_CONTACT_METHOD IS
'THE METHOD BY WHICH THE ALTERNATE CONTACT IS TO BE CONTACTED.';

COMMENT ON COLUMN XSR.PMR_RETRY_XSR_INFO.ALT_CONTACT_ID IS
'A PMR CAN HAVE A BACKUP CONTACT.  THIS IS THE CONTACT_ID OF THAT CONTACT.  THIS IS A CONTACT THAT WAS A CALLER ON THE CONTRACT AT THE TIME THE PMR WAS CREATED IN XSR.';

COMMENT ON COLUMN XSR.PMR_RETRY_XSR_INFO.OPERSYS_ID IS
'FK TO THE TABLE THAT MAINTAINS  A LIST OF OPERATING SYSTEMS.  IDENTIFIES THE OPERATING SYSTEM WHERE THE SOFTWARE IS RUNNING.';

COMMENT ON COLUMN XSR.PMR_RETRY_XSR_INFO.PROD_ID IS
'FK TO CAM IDENTIFYING THE PRODUCT THE PMR IS OPENED UNDER.';

COMMENT ON COLUMN XSR.PMR_RETRY_XSR_INFO.INITIAL_SEVERITY IS
'INITIAL SEVERITY REPORTED FOR THE PMR ';

COMMENT ON COLUMN XSR.PMR_RETRY_XSR_INFO.LOCALE IS
'LOCALE THE PMR WAS CREATED IN.  USED PRIMARILY FOR METRICS.  WE USE THE USERS BROWSER SETTINGS TO FIGURE OUT HOW THAT MAPS TO A CCSID SO THAT WE CAN GET IT IN THE RIGHT CHARACTER SET AND ENCODING FOR RETAIN.';

COMMENT ON COLUMN XSR.PMR_RETRY_XSR_INFO.OPEN_COUNT IS
'NUMBER OF TIMES THIS PMR HAS BEEN REOPENED VIA ESR';

COMMENT ON COLUMN XSR.PMR_RETRY_XSR_INFO.UPDATE_CONTACT_ID IS
'THE CONTACT_ID THAT LAST UPDATED THE PMR VIA XSR.';

COMMENT ON COLUMN XSR.PMR_RETRY_XSR_INFO.CONTACT_ID IS
'POINTER TO CONTACT RECORD ASSOCIATED WITH PMR.';

COMMENT ON COLUMN XSR.PMR_RETRY_RETAIN_INFO.SW_HD IS
'THE TYPE OF PMR - SOFTWARE OR HARDWARE

FOR NOW, ALWAYS DEFAULT TO S FOR SOFTWARE.';

COMMENT ON COLUMN XSR.PMR_RETRY_RETAIN_INFO.RETAIN_NODE IS
'THE NODE THAT IS THE SOURCE FOR THE PMR RECORD.  RS4 OR BDC.';

COMMENT ON COLUMN XSR.PMR_RETRY_RETAIN_INFO.STATUS IS
'RETAIN FIELD: The current status - open, closed, etc.';

COMMENT ON COLUMN XSR.PMR_RETRY_RETAIN_INFO.CUST_NAME_NLS IS
'THE COMPANY NAME OF THE CUSTOMER';

COMMENT ON COLUMN XSR.PMR_RETRY_RETAIN_INFO.CONTACT_PHONE1 IS
'COMPANY PHONE NUMBER.  THIS ONE IS NOT USED TO CALL THE PERSON BACK';

COMMENT ON COLUMN XSR.PMR_RETRY_RETAIN_INFO.CONTACT_PHONE2 IS
'CONTACT''S PHONE NUMBER';

COMMENT ON COLUMN XSR.PMR_RETRY_RETAIN_INFO.SUPPORT_LEVEL IS
'THIS IS ALWAYS A ''1';

COMMENT ON COLUMN XSR.PMR_RETRY_RETAIN_INFO.QUEUE IS
'QUEUE THE PMR IS CURRENTLY ON - OR THE QUEUE THE PMR WAS ON LAST OF THERE ARE NO CALLS ON THE PMR.';

COMMENT ON COLUMN XSR.PMR_RETRY_RETAIN_INFO.CENTER IS
'CENTER THAT IS PAIRED WITH QUEUE';

COMMENT ON COLUMN XSR.PMR_RETRY_RETAIN_INFO.COMP_ID IS
'COMPONENT ID THIS PMR IS ABOUT';

COMMENT ON COLUMN XSR.PMR_RETRY_RETAIN_INFO.RELEASE_LEVEL IS
'RELEASE_LEVELEASE LEVEL.';

COMMENT ON COLUMN XSR.PMR_RETRY_RETAIN_INFO.SEVERITY IS
'PMR SEVERITY.';

COMMENT ON COLUMN XSR.PMR_RETRY_RETAIN_INFO.SYSTEM_DOWN IS
'INDICATES THAT A SYSTEM IS DOWN FOR A CUSTOMER.';

COMMENT ON COLUMN XSR.PMR_RETRY_RETAIN_INFO.APAR_NUM IS
'APAR ASSOCIATED WITH THE PMR (IF IT EXISTS)';

COMMENT ON COLUMN XSR.PMR_RETRY_RETAIN_INFO.PRIORITY_PG IS
'"PRI-PAGE".  PRIORITY PAGE IS BASCIALLY THE NUMBER OF THE CALL ON A QUEUE.  IF A CALL IS THE SECOND PRIORITY 3 CALL ON A QUEUE THE PRI-PAGE IS 302.  THIS IS LINKED WITH THE QUEUE, CENTER FIELDS.';

COMMENT ON COLUMN XSR.PMR_RETRY_RETAIN_INFO.CALL_CAT IS
'CALL CATEGORY.

USED ON CREATE (PMCE)  AND UPATE (PMCE).';

COMMENT ON COLUMN XSR.PMR_RETRY_RETAIN_INFO.CUPRIMD IS
'METRICS FIELD HAVING TO DO WITH SOLUTION GIVEN.';

COMMENT ON COLUMN XSR.PMR_RETRY_RETAIN_INFO.PMR_UPDATE_DATE IS
'Last date the PMR was updated in RETAIN.  This date could vary from the updt_date stored in xSR because xSR database only tracks activity within the xSR application.  The record could have been updated in RETAIN.
';

