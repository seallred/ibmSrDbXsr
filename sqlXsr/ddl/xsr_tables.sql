

------------------------------------------------
-- DDL Statements for table "XSR     "."COMP_GROUP_TYPE"
------------------------------------------------
 
 CREATE TABLE "XSR     "."COMP_GROUP_TYPE"  (
		  "COMP_GROUP_TYPE_ID" INTEGER NOT NULL , 
		  "TYPE_CODE" VARCHAR(8) NOT NULL , 
		  "DESCRIPTION" VARCHAR(80) NOT NULL )   
		 IN "XSR1_DATA_01" INDEX IN "XSR1_INDX_01" ; 
COMMENT ON TABLE "XSR     "."COMP_GROUP_TYPE" IS 'Identifies the type of component group.  Component groups can be created for various reasons and each component group may include different components depending on use.';


-- DDL Statements for primary key on Table "XSR     "."COMP_GROUP_TYPE"

ALTER TABLE "XSR     "."COMP_GROUP_TYPE" 
	ADD CONSTRAINT "COMP_GROUP_TYPE_PK" PRIMARY KEY
		("COMP_GROUP_TYPE_ID");



------------------------------------------------
-- DDL Statements for table "XSR     "."AVL_STATUS_CODE"
------------------------------------------------
 
 CREATE TABLE "XSR     "."AVL_STATUS_CODE"  (
		  "STATUS_CODE" CHAR(1) NOT NULL , 
		  "DESCRIPTION" VARGRAPHIC(128) NOT NULL )   
		 IN "XSR1_DATA_01" INDEX IN "XSR1_INDX_01" ; 
COMMENT ON TABLE "XSR     "."AVL_STATUS_CODE" IS 'Master table of status codes for the xsr application. ACTV_STAT_CODE    DSCR 0 Active 1 Inactive 2 Expired 3 Migrated';


-- DDL Statements for primary key on Table "XSR     "."AVL_STATUS_CODE"

ALTER TABLE "XSR     "."AVL_STATUS_CODE" 
	ADD CONSTRAINT "AVL_STATUS_CODE_PK" PRIMARY KEY
		("STATUS_CODE");



------------------------------------------------
-- DDL Statements for table "XSR     "."FAMS"
------------------------------------------------
 
 CREATE TABLE "XSR     "."FAMS"  (
		  "FAMS_ID" INTEGER NOT NULL , 
		  "SRC_FILE_NAME" VARCHAR(128) NOT NULL , 
		  "APP_ID" INTEGER NOT NULL , 
		  "STORAGE_NODE_ID" SMALLINT , 
		  "STATUS_ID" INTEGER NOT NULL WITH DEFAULT 0 , 
		  "MESSAGE_ID" INTEGER NOT NULL WITH DEFAULT 0 , 
		  "CREATE_DATETIME" TIMESTAMP NOT NULL WITH DEFAULT CURRENT TIMESTAMP , 
		  "UPDATE_DATETIME" TIMESTAMP NOT NULL WITH DEFAULT CURRENT TIMESTAMP )   
		 IN "XSR1_DATA_01" INDEX IN "XSR1_INDX_01" ; 
COMMENT ON TABLE "XSR     "."FAMS" IS 'Detail table used by FAMS to manage file attachments.';


-- DDL Statements for primary key on Table "XSR     "."FAMS"

ALTER TABLE "XSR     "."FAMS" 
	ADD CONSTRAINT "FAMS_PK" PRIMARY KEY
		("FAMS_ID");



------------------------------------------------
-- DDL Statements for table "XSR     "."FAMS_APP_INFO"
------------------------------------------------
 
 CREATE TABLE "XSR     "."FAMS_APP_INFO"  (
		  "APP_ID" INTEGER NOT NULL , 
		  "DESCRIPTION" VARCHAR(80) , 
		  "DUMP_NODE_ID" SMALLINT NOT NULL WITH DEFAULT 0 , 
		  "CALLBACK_URI" VARCHAR(255) NOT NULL )   
		 IN "XSR1_DATA_01" INDEX IN "XSR1_INDX_01" ; 
COMMENT ON TABLE "XSR     "."FAMS_APP_INFO" IS 'This table defines applications using FAMS.';


-- DDL Statements for primary key on Table "XSR     "."FAMS_APP_INFO"

ALTER TABLE "XSR     "."FAMS_APP_INFO" 
	ADD CONSTRAINT "FAMS_APP_INFO_PK" PRIMARY KEY
		("APP_ID");



------------------------------------------------
-- DDL Statements for table "XSR     "."FAMS_CONFIG"
------------------------------------------------
 
 CREATE TABLE "XSR     "."FAMS_CONFIG"  (
		  "DEFAULT_DUMP_NODE_ID" SMALLINT NOT NULL , 
		  "DEFAULT_STORAGE_NODE_ID" SMALLINT NOT NULL , 
		  "SCAN_NODE_ID" SMALLINT NOT NULL , 
		  "UPDATE_USER" VARGRAPHIC(127) WITH DEFAULT USER , 
		  "UPDATE_DATETIME" TIMESTAMP NOT NULL WITH DEFAULT CURRENT TIMESTAMP )   
		 IN "XSR1_DATA_01" INDEX IN "XSR1_INDX_01" ; 
COMMENT ON TABLE "XSR     "."FAMS_CONFIG" IS 'CONFIGURATION VALUES FOR FAMS.';




------------------------------------------------
-- DDL Statements for table "XSR     "."FAMS_MESSAGE"
------------------------------------------------
 
 CREATE TABLE "XSR     "."FAMS_MESSAGE"  (
		  "MESSAGE_ID" INTEGER NOT NULL , 
		  "MESSAGE_CODE" VARCHAR(32) , 
		  "MESSAGE" VARCHAR(255) NOT NULL )   
		 IN "XSR1_DATA_01" INDEX IN "XSR1_INDX_01" ; 
COMMENT ON TABLE "XSR     "."FAMS_MESSAGE" IS 'This table defines messages to describe FAMS actions or results.';


-- DDL Statements for primary key on Table "XSR     "."FAMS_MESSAGE"

ALTER TABLE "XSR     "."FAMS_MESSAGE" 
	ADD CONSTRAINT "FAMS_MESSAGE_PK" PRIMARY KEY
		("MESSAGE_ID");



------------------------------------------------
-- DDL Statements for table "XSR     "."FAMS_NODE_INFO"
------------------------------------------------
 
 CREATE TABLE "XSR     "."FAMS_NODE_INFO"  (
		  "NODE_ID" SMALLINT NOT NULL , 
		  "TYPE_CODE" VARCHAR(10) , 
		  "DESCRIPTION" VARCHAR(80) , 
		  "SERVER_NAME" VARCHAR(64) , 
		  "PATH" VARCHAR(255) )   
		 IN "XSR1_DATA_01" INDEX IN "XSR1_INDX_01" ; 
COMMENT ON TABLE "XSR     "."FAMS_NODE_INFO" IS 'Ccontains information regarding file sytem nodes used for storing attachments.';


-- DDL Statements for primary key on Table "XSR     "."FAMS_NODE_INFO"

ALTER TABLE "XSR     "."FAMS_NODE_INFO" 
	ADD CONSTRAINT "FAMS_NODE_INFO_PK" PRIMARY KEY
		("NODE_ID");



------------------------------------------------
-- DDL Statements for table "XSR     "."FAMS_STATUS"
------------------------------------------------
 
 CREATE TABLE "XSR     "."FAMS_STATUS"  (
		  "STATUS_ID" INTEGER NOT NULL , 
		  "STATUS_CODE" VARCHAR(10) , 
		  "DESCRIPTION" VARCHAR(80) NOT NULL )   
		 IN "XSR1_DATA_01" INDEX IN "XSR1_INDX_01" ; 
COMMENT ON TABLE "XSR     "."FAMS_STATUS" IS 'Table contains description of status values used by FAMS.';


-- DDL Statements for primary key on Table "XSR     "."FAMS_STATUS"

ALTER TABLE "XSR     "."FAMS_STATUS" 
	ADD CONSTRAINT "FAMS_STATUS_PK" PRIMARY KEY
		("STATUS_ID");



------------------------------------------------
-- DDL Statements for table "XSR     "."MSG_OUTBOUND"
------------------------------------------------
 
 CREATE TABLE "XSR     "."MSG_OUTBOUND"  (
		  "TRAN_ID" VARGRAPHIC(40) NOT NULL , 
		  "MSG_TMPL_ID" VARGRAPHIC(40) NOT NULL , 
		  "LOCALE" VARCHAR(10) NOT NULL , 
		  "SRC_APPL" VARCHAR(40) , 
		  "TO" VARCHAR(2048) , 
		  "FROM" VARCHAR(400) , 
		  "CC" VARCHAR(1024) , 
		  "BCC" VARCHAR(1024) , 
		  "SUBJECT" VARCHAR(100) , 
		  "REASON" VARCHAR(1024) , 
		  "PMR_NUM" CHAR(7) , 
		  "BRANCH" CHAR(3) , 
		  "RETAIN_CNTRY_CODE" CHAR(3) , 
		  "PMR_TEXT_IDS" VARCHAR(2048) , 
		  "SHORT_DESCRIPTION" VARGRAPHIC(1024) , 
		  "CREATE_USER" VARGRAPHIC(127) , 
		  "CREATE_DATETIME" TIMESTAMP NOT NULL WITH DEFAULT CURRENT TIMESTAMP , 
		  "UPDATE_USER" VARGRAPHIC(127) , 
		  "UPDATE_DATETIME" TIMESTAMP NOT NULL WITH DEFAULT CURRENT TIMESTAMP , 
		  "CONTACT_ID" VARGRAPHIC(127) , 
		  "CUST_NAME" VARGRAPHIC(100) , 
		  "SRC_SUPPORT_ID" VARGRAPHIC(40) , 
		  "CALLER_TYPE_DESCRIPTION" VARGRAPHIC(40) , 
		  "CALLER_STAT_DESCRIPTION" VARGRAPHIC(40) , 
		  "STC_QUES_TXT" VARGRAPHIC(256) , 
		  "FIRST_NAME" VARGRAPHIC(40) , 
		  "LAST_NAME" VARGRAPHIC(40) , 
		  "EMAIL_ADR" VARGRAPHIC(127) , 
		  "IBM_CUST_NUM" CHAR(7) , 
		  "ENCRYPT_STRING" VARGRAPHIC(128) , 
		  "PSTC_EMAIL_ADR" VARGRAPHIC(127) , 
		  "NOMINATION_CONTACT_ID" VARGRAPHIC(40) , 
		  "SUBJECTLINE" VARGRAPHIC(128) , 
		  "SRC_NODE" VARGRAPHIC(127) , 
		  "SRC_TRAN_ID" VARGRAPHIC(40) , 
		  "BP_FIRST_NAME" VARGRAPHIC(40) , 
		  "BP_LAST_NAME" VARGRAPHIC(40) , 
		  "BP_CITY" VARGRAPHIC(40) , 
		  "BP_COMPANY_NAME" VARGRAPHIC(100) )   
		 IN "XSR1_DATA_PG16K" INDEX IN "XSR1_INDX_01" ; 
COMMENT ON TABLE "XSR     "."MSG_OUTBOUND" IS 'Used to persist outbound notification messages before they are actually sent out.';


-- DDL Statements for primary key on Table "XSR     "."MSG_OUTBOUND"

ALTER TABLE "XSR     "."MSG_OUTBOUND" 
	ADD CONSTRAINT "MSG_OUTBOUND_PK" PRIMARY KEY
		("TRAN_ID");



------------------------------------------------
-- DDL Statements for table "XSR     "."MSG_SUBST"
------------------------------------------------
 
 CREATE TABLE "XSR     "."MSG_SUBST"  (
		  "MSG_SUBST_KEY" VARGRAPHIC(127) NOT NULL , 
		  "LOCALE" VARCHAR(10) NOT NULL , 
		  "MSG_SUBST_VAL" VARGRAPHIC(1024) NOT NULL , 
		  "CREATE_USER" VARGRAPHIC(127) , 
		  "CREATE_DATETIME" TIMESTAMP NOT NULL WITH DEFAULT CURRENT TIMESTAMP , 
		  "UPDATE_USER" VARGRAPHIC(127) , 
		  "UPDATE_DATETIME" TIMESTAMP NOT NULL WITH DEFAULT CURRENT TIMESTAMP )   
		 IN "XSR1_DATA_PG16K" INDEX IN "XSR1_INDX_01" ; 
COMMENT ON TABLE "XSR     "."MSG_SUBST" IS 'List of keys and the text that should be subsituted for it when found in the message template.  This is used to dynamically build notification email messages.';


-- DDL Statements for primary key on Table "XSR     "."MSG_SUBST"

ALTER TABLE "XSR     "."MSG_SUBST" 
	ADD CONSTRAINT "MSG_SUBST_PK" PRIMARY KEY
		("MSG_SUBST_KEY",
		 "LOCALE");



------------------------------------------------
-- DDL Statements for table "XSR     "."MSG_TOKEN"
------------------------------------------------
 
 CREATE TABLE "XSR     "."MSG_TOKEN"  (
		  "MSG_TMPL_ID" VARGRAPHIC(40) NOT NULL , 
		  "LOCALE" VARCHAR(10) NOT NULL , 
		  "MSG_TOKEN" VARGRAPHIC(127) NOT NULL , 
		  "CREATE_USER" VARGRAPHIC(127) , 
		  "CREATE_DATETIME" TIMESTAMP NOT NULL WITH DEFAULT CURRENT TIMESTAMP , 
		  "UPDATE_USER" VARGRAPHIC(127) , 
		  "UPDATE_DATETIME" TIMESTAMP NOT NULL WITH DEFAULT CURRENT TIMESTAMP )   
		 IN "XSR1_DATA_PG16K" INDEX IN "XSR1_INDX_01" ; 
COMMENT ON TABLE "XSR     "."MSG_TOKEN" IS 'USED TO TOKENIZE AN EMAIL TEMPLATE TO PROVIDE AN ABILITY TO DYNAMICALLY GENERATE THE OUTBOUND EMAIL USED FOR NOTIFICATIONS.';


-- DDL Statements for primary key on Table "XSR     "."MSG_TOKEN"

ALTER TABLE "XSR     "."MSG_TOKEN" 
	ADD CONSTRAINT "MSG_TOKEN_PK" PRIMARY KEY
		("MSG_TMPL_ID",
		 "LOCALE",
		 "MSG_TOKEN");



------------------------------------------------
-- DDL Statements for table "XSR     "."MSG_TMPL"
------------------------------------------------
 
 CREATE TABLE "XSR     "."MSG_TMPL"  (
		  "MSG_TMPL_ID" VARGRAPHIC(40) NOT NULL , 
		  "LOCALE" VARCHAR(10) NOT NULL , 
		  "MSG_TMPL" VARGRAPHIC(4096) NOT NULL , 
		  "CREATE_USER" VARGRAPHIC(127) , 
		  "CREATE_DATETIME" TIMESTAMP NOT NULL WITH DEFAULT CURRENT TIMESTAMP , 
		  "UPDATE_USER" VARGRAPHIC(127) , 
		  "UPDATE_DATETIME" TIMESTAMP NOT NULL WITH DEFAULT CURRENT TIMESTAMP )   
		 IN "XSR1_DATA_PG16K" INDEX IN "XSR1_INDX_01" ; 
COMMENT ON TABLE "XSR     "."MSG_TMPL" IS 'USED TO CREATE TEMPLATES TO HELP GENERATE OUTBOUND EMAIL FOR NOTIFICATIONS.';


-- DDL Statements for primary key on Table "XSR     "."MSG_TMPL"

ALTER TABLE "XSR     "."MSG_TMPL" 
	ADD CONSTRAINT "MSG_TMPL_PK" PRIMARY KEY
		("MSG_TMPL_ID",
		 "LOCALE");



------------------------------------------------
-- DDL Statements for table "XSR     "."RIGHT_OBJ_TYPE"
------------------------------------------------
 
 CREATE TABLE "XSR     "."RIGHT_OBJ_TYPE"  (
		  "OBJ_TYPE_ID" INTEGER NOT NULL , 
		  "DESCRIPTION" VARGRAPHIC(128) NOT NULL , 
		  "CREATE_USER" VARGRAPHIC(127) , 
		  "CREATE_DATETIME" TIMESTAMP NOT NULL WITH DEFAULT CURRENT TIMESTAMP , 
		  "UPDATE_USER" VARGRAPHIC(127) , 
		  "UPDATE_DATETIME" TIMESTAMP NOT NULL WITH DEFAULT CURRENT TIMESTAMP )   
		 IN "XSR1_DATA_01" INDEX IN "XSR1_INDX_01" ; 
COMMENT ON TABLE "XSR     "."RIGHT_OBJ_TYPE" IS 'Master table / allowed value list of the caller types.  Used for user authorization functionality. OBJ_TYPE_ID DSCR 1 primarySiteTechnicalContactSupportIds 2 secondarySiteTechnicalContactSupportIds';


-- DDL Statements for primary key on Table "XSR     "."RIGHT_OBJ_TYPE"

ALTER TABLE "XSR     "."RIGHT_OBJ_TYPE" 
	ADD CONSTRAINT "OBJ_TYPE_PK" PRIMARY KEY
		("OBJ_TYPE_ID");



------------------------------------------------
-- DDL Statements for table "XSR     "."RETAIN_ERR_LOG"
------------------------------------------------
 
 CREATE TABLE "XSR     "."RETAIN_ERR_LOG"  (
		  "PMR_NUM" CHAR(7) , 
		  "BRANCH" VARCHAR(3) , 
		  "RETAIN_CNTRY_CODE" CHAR(3) , 
		  "USER_ID" VARCHAR(15) NOT NULL , 
		  "CONTACT_ID" BIGINT , 
		  "SUBMIT_DATE" TIMESTAMP NOT NULL , 
		  "SUBMIT_TYPE" VARCHAR(15) NOT NULL , 
		  "METHOD_NAME" VARCHAR(35) , 
		  "COMP_ID" VARCHAR(15) , 
		  "SUPPORT_LEVEL" VARCHAR(4) , 
		  "QUEUE" VARCHAR(35) , 
		  "SEVERITY" VARCHAR(15) , 
		  "ERR_NUM" VARCHAR(15) , 
		  "ERR_MSG" VARCHAR(255) , 
		  "ERR_DATE" TIMESTAMP NOT NULL , 
		  "CREATE_USER" VARGRAPHIC(127) , 
		  "CREATE_DATETIME" TIMESTAMP NOT NULL WITH DEFAULT CURRENT TIMESTAMP , 
		  "UPDATE_USER" VARGRAPHIC(127) , 
		  "UPDATE_DATETIME" TIMESTAMP NOT NULL WITH DEFAULT CURRENT TIMESTAMP )   
		 IN "XSR1_LOG_01" INDEX IN "XSR1_LOG_INDX_01" ; 
COMMENT ON TABLE "XSR     "."RETAIN_ERR_LOG" IS 'Used to capture errors that occur while interacting with RETAIN.';




------------------------------------------------
-- DDL Statements for table "XSR     "."RIGHT_OBJ_TRAN"
------------------------------------------------
 
 CREATE TABLE "XSR     "."RIGHT_OBJ_TRAN"  (
		  "TRAN_ID" VARGRAPHIC(40) NOT NULL , 
		  "TBL_NAME" VARCHAR(25) NOT NULL , 
		  "KEY_1" VARGRAPHIC(127) , 
		  "KEY_2" VARGRAPHIC(127) , 
		  "KEY_3" VARGRAPHIC(127) , 
		  "KEY_4" VARGRAPHIC(127) , 
		  "KEY_5" VARGRAPHIC(127) , 
		  "KEY_6" VARGRAPHIC(127) , 
		  "CREATE_USER" VARGRAPHIC(127) , 
		  "CREATE_DATETIME" TIMESTAMP NOT NULL WITH DEFAULT CURRENT TIMESTAMP , 
		  "UPDATE_USER" VARGRAPHIC(127) , 
		  "UPDATE_DATETIME" TIMESTAMP NOT NULL WITH DEFAULT CURRENT TIMESTAMP )   
		 IN "XSR1_DATA_01" INDEX IN "XSR1_INDX_01" ; 
COMMENT ON TABLE "XSR     "."RIGHT_OBJ_TRAN" IS 'Used for user authorization functionality.  Triggers on some tables insert the new records when the records in these tables are updated. A timer process goes through the records in RIGHT_OBJ_TRAN table and update the rights of the related customer.';


-- DDL Statements for primary key on Table "XSR     "."RIGHT_OBJ_TRAN"

ALTER TABLE "XSR     "."RIGHT_OBJ_TRAN" 
	ADD CONSTRAINT "RIGHT_OBJ_TRAN_PK" PRIMARY KEY
		("TRAN_ID",
		 "TBL_NAME");



------------------------------------------------
-- DDL Statements for table "XSR     "."RETAIN_CNTRY_CODE"
------------------------------------------------
 
 CREATE TABLE "XSR     "."RETAIN_CNTRY_CODE"  (
		  "RETAIN_NODE" VARCHAR(6) NOT NULL , 
		  "RETAIN_CNTRY_CODE" VARCHAR(3) NOT NULL , 
		  "CENTER" VARCHAR(3) NOT NULL , 
		  "CREATE_USER" VARGRAPHIC(127) , 
		  "CREATE_DATETIME" TIMESTAMP NOT NULL WITH DEFAULT CURRENT TIMESTAMP , 
		  "UPDATE_USER" VARGRAPHIC(127) , 
		  "UPDATE_DATETIME" TIMESTAMP NOT NULL WITH DEFAULT CURRENT TIMESTAMP )   
		 IN "XSR1_DATA_01" INDEX IN "XSR1_INDX_01" ; 
COMMENT ON TABLE "XSR     "."RETAIN_CNTRY_CODE" IS 'Used to define center (queue/center) differences between RETAIN nodes by country code.  This is primarly used when a RETAIN nodes goes down and we are on a node that we normally do not run against.';


-- DDL Statements for primary key on Table "XSR     "."RETAIN_CNTRY_CODE"

ALTER TABLE "XSR     "."RETAIN_CNTRY_CODE" 
	ADD CONSTRAINT "RETAIN_CC_PK" PRIMARY KEY
		("RETAIN_NODE",
		 "RETAIN_CNTRY_CODE",
		 "CENTER");



------------------------------------------------
-- DDL Statements for table "XSR     "."RETAIN_ACT_LOG"
------------------------------------------------
 
 CREATE TABLE "XSR     "."RETAIN_ACT_LOG"  (
		  "PMR_NUM" CHAR(7) NOT NULL , 
		  "BRANCH" CHAR(3) NOT NULL , 
		  "RETAIN_CNTRY_CODE" CHAR(3) NOT NULL , 
		  "PMR_CREATE_DATE" VARCHAR(15) NOT NULL , 
		  "USER_ID" VARCHAR(15) NOT NULL , 
		  "CONTACT_ID" BIGINT , 
		  "SUBMIT_DATE" TIMESTAMP NOT NULL , 
		  "SUBMIT_TYPE" VARCHAR(15) NOT NULL , 
		  "METHOD_NAME" VARCHAR(35) , 
		  "COMP_ID" VARCHAR(15) , 
		  "SUPPORT_LEVEL" VARCHAR(4) , 
		  "QUEUE" VARCHAR(35) , 
		  "CREATE_USER" VARGRAPHIC(127) , 
		  "CREATE_DATETIME" TIMESTAMP NOT NULL WITH DEFAULT CURRENT TIMESTAMP , 
		  "UPDATE_USER" VARGRAPHIC(127) , 
		  "UPDATE_DATETIME" TIMESTAMP NOT NULL WITH DEFAULT CURRENT TIMESTAMP )   
		 IN "XSR1_LOG_01" INDEX IN "XSR1_LOG_INDX_01" ; 
COMMENT ON TABLE "XSR     "."RETAIN_ACT_LOG" IS 'Used to track activity against RETAIN.  This informatoin can help reconcile billing issues.';




------------------------------------------------
-- DDL Statements for table "XSR     "."PMR_ERR_TRAN"
------------------------------------------------
 
 CREATE TABLE "XSR     "."PMR_ERR_TRAN"  (
		  "PMR_ID" BIGINT NOT NULL , 
		  "ERR_CREATE_DATE" TIMESTAMP NOT NULL , 
		  "SRC_TRAN_ID" VARGRAPHIC(40) NOT NULL , 
		  "SRC_APPL" VARCHAR(40) NOT NULL , 
		  "SRC_NODE" VARCHAR(127) NOT NULL , 
		  "CONTACT_PHONE1" VARCHAR(19) NOT NULL , 
		  "CREATE_USER" VARGRAPHIC(127) , 
		  "CREATE_DATETIME" TIMESTAMP NOT NULL WITH DEFAULT CURRENT TIMESTAMP , 
		  "UPDATE_USER" VARGRAPHIC(127) , 
		  "UPDATE_DATETIME" TIMESTAMP NOT NULL WITH DEFAULT CURRENT TIMESTAMP )   
		 IN "XSR1_LOG_01" INDEX IN "XSR1_LOG_INDX_01" ; 

-- DDL Statements for primary key on Table "XSR     "."PMR_ERR_TRAN"

ALTER TABLE "XSR     "."PMR_ERR_TRAN" 
	ADD CONSTRAINT "PMR_ERR_TRAN_PK" PRIMARY KEY
		("ERR_CREATE_DATE",
		 "PMR_ID");



------------------------------------------------
-- DDL Statements for table "XSR     "."PMR_ATTACHMENT"
------------------------------------------------
 
 CREATE TABLE "XSR     "."PMR_ATTACHMENT"  (
		  "ATTACHMENT_ID" VARGRAPHIC(40) NOT NULL , 
		  "SRC_TRAN_ID" VARGRAPHIC(40) , 
		  "SRC_APPL" VARCHAR(32) , 
		  "SRC_NODE" VARCHAR(32) , 
		  "DROP_NAME" VARGRAPHIC(127) , 
		  "DROP_HOST" VARGRAPHIC(127) , 
		  "ORIGINAL_NAME" VARGRAPHIC(512) , 
		  "STRG_NAME" VARGRAPHIC(512) , 
		  "FILE_SIZE" BIGINT , 
		  "RECV_DATE" TIMESTAMP , 
		  "PMR_DATE" TIMESTAMP , 
		  "CREATE_USER" VARGRAPHIC(127) NOT NULL , 
		  "CREATE_DATETIME" TIMESTAMP NOT NULL WITH DEFAULT CURRENT TIMESTAMP , 
		  "UPDATE_USER" VARGRAPHIC(127) NOT NULL , 
		  "UPDATE_DATETIME" TIMESTAMP NOT NULL WITH DEFAULT CURRENT TIMESTAMP )   
		 IN "XSR1_DATA_01" INDEX IN "XSR1_INDX_01" ; 
COMMENT ON TABLE "XSR     "."PMR_ATTACHMENT" IS 'Used to manage attachments associated to PMRs';


-- DDL Statements for primary key on Table "XSR     "."PMR_ATTACHMENT"

ALTER TABLE "XSR     "."PMR_ATTACHMENT" 
	ADD CONSTRAINT "PMR_ATTACHMENT_PK" PRIMARY KEY
		("ATTACHMENT_ID");



------------------------------------------------
-- DDL Statements for table "XSR     "."COMP_GROUP_XREF"
------------------------------------------------
 
 CREATE TABLE "XSR     "."COMP_GROUP_XREF"  (
		  "COMP_ID" VARCHAR(15) NOT NULL , 
		  "COMP_GROUP_ID" INTEGER NOT NULL , 
		  "CREATE_USER" VARGRAPHIC(127) NOT NULL WITH DEFAULT USER , 
		  "CREATE_DATETIME" TIMESTAMP NOT NULL WITH DEFAULT CURRENT TIMESTAMP )   
		 IN "XSR1_DATA_01" INDEX IN "XSR1_INDX_01" ; 
COMMENT ON TABLE "XSR     "."COMP_GROUP_XREF" IS 'Cross reference table between component groups and the components that belong to them.';


-- DDL Statements for primary key on Table "XSR     "."COMP_GROUP_XREF"

ALTER TABLE "XSR     "."COMP_GROUP_XREF" 
	ADD CONSTRAINT "COMP_GRP_XRE_PK" PRIMARY KEY
		("COMP_ID");



------------------------------------------------
-- DDL Statements for table "XSR     "."COMP_GROUP"
------------------------------------------------
 
 CREATE TABLE "XSR     "."COMP_GROUP"  (
		  "COMP_GROUP_ID" INTEGER NOT NULL , 
		  "NAME" VARGRAPHIC(130) , 
		  "STATUS" SMALLINT NOT NULL WITH DEFAULT 0 , 
		  "CREATE_USER" VARGRAPHIC(127) , 
		  "CREATE_DATETIME" TIMESTAMP NOT NULL , 
		  "UPDATE_USER" VARGRAPHIC(127) , 
		  "UPDATE_DATETIME" TIMESTAMP NOT NULL )   
		 IN "XSR1_DATA_01" INDEX IN "XSR1_INDX_01" ; 
COMMENT ON TABLE "XSR     "."COMP_GROUP" IS 'Used to group like components so that business rules can be managed at a more coarse grain level.  This makes manageing the many compents much more manageable.';

-- DDL Statements for primary key on Table "XSR     "."COMP_GROUP"

ALTER TABLE "XSR     "."COMP_GROUP" 
	ADD CONSTRAINT "COMP_GROUP_PK" PRIMARY KEY
		("COMP_GROUP_ID");



------------------------------------------------
-- DDL Statements for table "XSR     "."COMP_GROUP_COMP_XREF"
------------------------------------------------
 
 CREATE TABLE "XSR     "."COMP_GROUP_COMP_XREF"  (
		  "COMP_GROUP_ID" INTEGER NOT NULL , 
		  "PROD_ID" VARGRAPHIC(80) NOT NULL , 
		  "COMP_ID" VARGRAPHIC(15) NOT NULL , 
		  "CREATE_USER" VARGRAPHIC(127) , 
		  "CREATE_DATETIME" TIMESTAMP NOT NULL , 
		  "UPDATE_USER" VARGRAPHIC(127) , 
		  "UPDATE_DATETIME" TIMESTAMP NOT NULL )   
		 IN "XSR1_DATA_01" INDEX IN "XSR1_INDX_01" ; 

-- DDL Statements for primary key on Table "XSR     "."COMP_GROUP_COMP_XREF"

ALTER TABLE "XSR     "."COMP_GROUP_COMP_XREF" 
	ADD CONSTRAINT "CMP_GRP_CMP_XRF_PK" PRIMARY KEY
		("COMP_GROUP_ID",
		 "PROD_ID",
		 "COMP_ID");



------------------------------------------------
-- DDL Statements for table "XSR     "."AVL_OPERATING_SYSTEM"
------------------------------------------------
 
 CREATE TABLE "XSR     "."AVL_OPERATING_SYSTEM"  (
		  "OS_ID" INTEGER NOT NULL , 
		  "NAME" VARGRAPHIC(256) , 
		  "CREATE_USER" VARGRAPHIC(127) , 
		  "CREATE_DATETIME" TIMESTAMP NOT NULL , 
		  "UPDATE_USER" VARGRAPHIC(127) , 
		  "UPDATE_DATETIME" TIMESTAMP NOT NULL )   
		 IN "XSR1_DATA_01" INDEX IN "XSR1_INDX_01" ; 

-- DDL Statements for primary key on Table "XSR     "."AVL_OPERATING_SYSTEM"

ALTER TABLE "XSR     "."AVL_OPERATING_SYSTEM" 
	ADD CONSTRAINT "AVL_OS_PK" PRIMARY KEY
		("OS_ID");



------------------------------------------------
-- DDL Statements for table "XSR     "."PMR_ROUTE_LOG"
------------------------------------------------
 
 CREATE TABLE "XSR     "."PMR_ROUTE_LOG"  (
		  "ROUTE_LOG_ID" INTEGER NOT NULL , 
		  "ROUTE_DATETIME" TIMESTAMP NOT NULL , 
		  "ROUTE_RULE" VARCHAR(40) NOT NULL , 
		  "ROUTE_ID" VARCHAR(128) , 
		  "REASON" VARGRAPHIC(256) NOT NULL , 
		  "CRITERIA_MATCHED" VARGRAPHIC(256) , 
		  "QUEUE" VARGRAPHIC(6) NOT NULL , 
		  "CENTER" VARGRAPHIC(3) NOT NULL , 
		  "SRC_TRAN_ID" VARGRAPHIC(80) NOT NULL , 
		  "SRC_APPL" VARCHAR(40) NOT NULL , 
		  "SRC_NODE" VARCHAR(40) NOT NULL , 
		  "CREATE_FLAG" SMALLINT NOT NULL WITH DEFAULT 0 , 
		  "PMR_SEVERITY" CHAR(1) NOT NULL , 
		  "IBM_CUST_NUM" VARCHAR(8) , 
		  "OS_ID" INTEGER , 
		  "RETAIN_COUNTRY_CODE" CHAR(3) , 
		  "CREATE_USER" VARGRAPHIC(127) , 
		  "CREATE_DATETIME" TIMESTAMP NOT NULL , 
		  "UPDATE_USER" VARGRAPHIC(127) , 
		  "UPDATE_DATETIME" TIMESTAMP NOT NULL )   
		 IN "XSR1_LOG_01" INDEX IN "XSR1_LOG_INDX_01" ; 

-- DDL Statements for primary key on Table "XSR     "."PMR_ROUTE_LOG"

ALTER TABLE "XSR     "."PMR_ROUTE_LOG" 
	ADD CONSTRAINT "PMR_ROUTE_LOG_PK" PRIMARY KEY
		("ROUTE_LOG_ID");



------------------------------------------------
-- DDL Statements for table "XSR     "."APP_TYPE"
------------------------------------------------
 
 CREATE TABLE "XSR     "."APP_TYPE"  (
		  "APP_ID" INTEGER NOT NULL , 
		  "APP_TYPE" VARCHAR(20) NOT NULL , 
		  "DESCRIPTION" VARCHAR(80) )   
		 IN "XSR1_DATA_01" INDEX IN "XSR1_INDX_01" ; 
COMMENT ON TABLE "XSR     "."APP_TYPE" IS 'Describe applications that interact w/ xSR';


-- DDL Statements for primary key on Table "XSR     "."APP_TYPE"

ALTER TABLE "XSR     "."APP_TYPE" 
	ADD CONSTRAINT "APP_TYPE_PK" PRIMARY KEY
		("APP_ID");



------------------------------------------------
-- DDL Statements for table "XSR     "."AUDIT_LOG"
------------------------------------------------
 
 CREATE TABLE "XSR     "."AUDIT_LOG"  (
		  "AUDIT_LOG_ID" INTEGER NOT NULL , 
		  "TIME_STAMP" TIMESTAMP NOT NULL WITH DEFAULT CURRENT TIMESTAMP , 
		  "USER_ID" VARGRAPHIC(254) NOT NULL , 
		  "APP_ID" INTEGER NOT NULL , 
		  "SRC_APP_ID" INTEGER NOT NULL WITH DEFAULT 0 , 
		  "ACTION_ID" INTEGER NOT NULL , 
		  "OBJ_ID" VARCHAR(128) NOT NULL , 
		  "OBJ_TYPE_ID" INTEGER NOT NULL , 
		  "DESCRIPTION" VARGRAPHIC(510) )   
		 IN "XSR1_DATA_01" INDEX IN "XSR1_INDX_01" ; 
COMMENT ON TABLE "XSR     "."AUDIT_LOG" IS 'Used for general audit logging for any application.';

-- DDL Statements for primary key on Table "XSR     "."AUDIT_LOG"

ALTER TABLE "XSR     "."AUDIT_LOG" 
	ADD CONSTRAINT "AUDIT_LOG_PK" PRIMARY KEY
		("AUDIT_LOG_ID");



------------------------------------------------
-- DDL Statements for table "XSR     "."AUDIT_OBJ_TYPE"
------------------------------------------------
 
 CREATE TABLE "XSR     "."AUDIT_OBJ_TYPE"  (
		  "OBJ_TYPE_ID" INTEGER NOT NULL , 
		  "DESCRIPTION" VARCHAR(80) NOT NULL )   
		 IN "XSR1_DATA_01" INDEX IN "XSR1_INDX_01" ; 
COMMENT ON TABLE "XSR     "."AUDIT_OBJ_TYPE" IS 'Used for describing the action object types availble for logging.';


-- DDL Statements for primary key on Table "XSR     "."AUDIT_OBJ_TYPE"

ALTER TABLE "XSR     "."AUDIT_OBJ_TYPE" 
	ADD CONSTRAINT "AUDIT_ACT_OBJ_PK" PRIMARY KEY
		("OBJ_TYPE_ID");



------------------------------------------------
-- DDL Statements for table "XSR     "."NOTIFY_EVENT_REGISTRATION"
------------------------------------------------
 
 CREATE TABLE "XSR     "."NOTIFY_EVENT_REGISTRATION"  (
		  "EVENT_REG_ID" BIGINT NOT NULL , 
		  "USER_ID" BIGINT NOT NULL , 
		  "USER_TYPE" CHAR(1) NOT NULL WITH DEFAULT 'P' , 
		  "EVENT_TYPE_ID" INTEGER NOT NULL , 
		  "ACTION_TYPE_ID" SMALLINT NOT NULL , 
		  "NOTIFICATION_METHOD" CHAR(1) , 
		  "FILTER_CRITERIA" VARGRAPHIC(512) , 
		  "CREATE_USER" VARGRAPHIC(127) , 
		  "CREATE_DATETIME" TIMESTAMP NOT NULL WITH DEFAULT CURRENT TIMESTAMP , 
		  "UPDATE_USER" VARGRAPHIC(127) , 
		  "UPDATE_DATETIME" TIMESTAMP NOT NULL WITH DEFAULT CURRENT TIMESTAMP )   
		 IN "XSR1_DATA_01" INDEX IN "XSR1_INDX_01" ; 
COMMENT ON TABLE "XSR     "."NOTIFY_EVENT_REGISTRATION" IS 'List of users who have registered for event types.  There is a row for each event type and action combination.  If notification method is populated it overrides the notification method in the users profile.';

COMMENT ON COLUMN "XSR     "."NOTIFY_EVENT_REGISTRATION"."FILTER_CRITERIA" IS 'Used to build filter criteria to further restrict what notifications get sent.  Must be for the event type, action and match the filter criteria.';


-- DDL Statements for primary key on Table "XSR     "."NOTIFY_EVENT_REGISTRATION"

ALTER TABLE "XSR     "."NOTIFY_EVENT_REGISTRATION" 
	ADD CONSTRAINT "NTF_EVENT_REG_PK" PRIMARY KEY
		("EVENT_REG_ID");



------------------------------------------------
-- DDL Statements for table "XSR     "."NOTIFY_EVENT_REGISTRATION_LOG"
------------------------------------------------
 
 CREATE TABLE "XSR     "."NOTIFY_EVENT_REGISTRATION_LOG"  (
		  "EVENT_REG_ID" BIGINT NOT NULL , 
		  "USER_ID" BIGINT NOT NULL , 
		  "USER_TYPE" CHAR(1) NOT NULL WITH DEFAULT 'P' , 
		  "EVENT_TYPE_ID" INTEGER NOT NULL , 
		  "ACTION_TYPE_ID" SMALLINT NOT NULL , 
		  "NOTIFICATION_METHOD" CHAR(1) , 
		  "FILTER_CRITERIA" VARGRAPHIC(512) , 
		  "CREATE_USER" VARGRAPHIC(127) , 
		  "CREATE_DATETIME" TIMESTAMP NOT NULL WITH DEFAULT CURRENT TIMESTAMP , 
		  "UPDATE_USER" VARGRAPHIC(127) , 
		  "UPDATE_DATETIME" TIMESTAMP NOT NULL WITH DEFAULT CURRENT TIMESTAMP , 
		  "CRUD" CHAR(1) )   
		 IN "XSR1_LOG_01" INDEX IN "XSR1_LOG_INDX_01" ; 



------------------------------------------------
-- DDL Statements for table "XSR     "."NOTIFY_EVENT_TRAN"
------------------------------------------------
 
 CREATE TABLE "XSR     "."NOTIFY_EVENT_TRAN"  (
		  "EVENT_ID" BIGINT NOT NULL , 
		  "EVENT_TYPE_ID" INTEGER NOT NULL , 
		  "OBJECT_ID" VARCHAR(256) , 
		  "MESSAGE" VARGRAPHIC(15000) , 
		  "CREATE_USER" VARGRAPHIC(127) , 
		  "CREATE_DATETIME" TIMESTAMP NOT NULL WITH DEFAULT CURRENT TIMESTAMP )   
		 IN "XSR1_DATA_PG32K" INDEX IN "XSR1_INDX_01" ; 
COMMENT ON TABLE "XSR     "."NOTIFY_EVENT_TRAN" IS 'Event transaction table that tracks all events that have been made available for notifications.';

COMMENT ON COLUMN "XSR     "."NOTIFY_EVENT_TRAN"."MESSAGE" IS 'Message to be made available to users who have registered for notifications.';

COMMENT ON COLUMN "XSR     "."NOTIFY_EVENT_TRAN"."OBJECT_ID" IS 'Unique identifier for the object tied to the event type.  Follows the name value pair format separated by commas for composite keys.';


-- DDL Statements for primary key on Table "XSR     "."NOTIFY_EVENT_TRAN"

ALTER TABLE "XSR     "."NOTIFY_EVENT_TRAN" 
	ADD CONSTRAINT "NTF_EVENT_TRAN_PK" PRIMARY KEY
		("EVENT_ID");



------------------------------------------------
-- DDL Statements for table "XSR     "."NOTIFY_EVENT_TRAN_ARCHIVE"
------------------------------------------------
 
 CREATE TABLE "XSR     "."NOTIFY_EVENT_TRAN_ARCHIVE"  (
		  "EVENT_ID" BIGINT NOT NULL , 
		  "EVENT_TYPE_ID" INTEGER NOT NULL , 
		  "OBJECT_ID" VARCHAR(256) , 
		  "MESSAGE" VARGRAPHIC(15000) , 
		  "CREATE_USER" VARGRAPHIC(127) , 
		  "CREATE_DATETIME" TIMESTAMP , 
		  "ARCHIVE_DATETIME" TIMESTAMP NOT NULL WITH DEFAULT CURRENT TIMESTAMP )   
		 IN "XSR1_DATA_PG32K" INDEX IN "XSR1_INDX_01" ; 



------------------------------------------------
-- DDL Statements for table "XSR     "."NOTIFY_EVENT_TYPE"
------------------------------------------------
 
 CREATE TABLE "XSR     "."NOTIFY_EVENT_TYPE"  (
		  "EVENT_TYPE_ID" INTEGER NOT NULL , 
		  "SCOPE" SMALLINT NOT NULL WITH DEFAULT 0 , 
		  "DESCRIPTION" VARCHAR(128) , 
		  "CREATE_USER" VARGRAPHIC(127) , 
		  "CREATE_DATETIME" TIMESTAMP NOT NULL WITH DEFAULT CURRENT TIMESTAMP , 
		  "UPDATE_USER" VARGRAPHIC(127) , 
		  "UPDATE_DATETIME" TIMESTAMP NOT NULL WITH DEFAULT CURRENT TIMESTAMP )   
		 IN "XSR1_DATA_01" INDEX IN "XSR1_INDX_01" ; 
COMMENT ON TABLE "XSR     "."NOTIFY_EVENT_TYPE" IS 'Identifies types of events to available for notification.  Scope identifies whether notifications for the event type are available to systems, users or both.  (S - System, U - Users, A - All).';


-- DDL Statements for primary key on Table "XSR     "."NOTIFY_EVENT_TYPE"

ALTER TABLE "XSR     "."NOTIFY_EVENT_TYPE" 
	ADD CONSTRAINT "NTF_EVENT_TYPE_PK" PRIMARY KEY
		("EVENT_TYPE_ID");



------------------------------------------------
-- DDL Statements for table "XSR     "."NOTIFY_EVENT_TYPE_ACTION_XREF"
------------------------------------------------
 
 CREATE TABLE "XSR     "."NOTIFY_EVENT_TYPE_ACTION_XREF"  (
		  "EVENT_TYPE_ID" INTEGER NOT NULL , 
		  "ACTION_TYPE_ID" SMALLINT NOT NULL , 
		  "CREATE_USER" VARGRAPHIC(127) , 
		  "CREATE_DATETIME" TIMESTAMP NOT NULL WITH DEFAULT CURRENT TIMESTAMP , 
		  "UPDATE_USER" VARGRAPHIC(127) , 
		  "UPDATE_DATETIME" TIMESTAMP NOT NULL WITH DEFAULT CURRENT TIMESTAMP )   
		 IN "XSR1_DATA_01" INDEX IN "XSR1_INDX_01" ; 
COMMENT ON TABLE "XSR     "."NOTIFY_EVENT_TYPE_ACTION_XREF" IS 'Identifies available actions for each event type.  For example, create, update or delete.';


-- DDL Statements for primary key on Table "XSR     "."NOTIFY_EVENT_TYPE_ACTION_XREF"

ALTER TABLE "XSR     "."NOTIFY_EVENT_TYPE_ACTION_XREF" 
	ADD CONSTRAINT "NTF_ET_ACTX_PK" PRIMARY KEY
		("EVENT_TYPE_ID",
		 "ACTION_TYPE_ID");



------------------------------------------------
-- DDL Statements for table "XSR     "."NOTIFY_EVENT_USER_TRAN"
------------------------------------------------
 
 CREATE TABLE "XSR     "."NOTIFY_EVENT_USER_TRAN"  (
		  "EVENT_REG_ID" BIGINT NOT NULL , 
		  "EVENT_ID" BIGINT NOT NULL , 
		  "ACTION" CHAR(1) , 
		  "CREATE_USER" VARGRAPHIC(127) , 
		  "CREATE_DATETIME" TIMESTAMP NOT NULL WITH DEFAULT CURRENT TIMESTAMP , 
		  "UPDATE_USER" VARGRAPHIC(127) , 
		  "UPDATE_DATETIME" TIMESTAMP NOT NULL WITH DEFAULT CURRENT TIMESTAMP )   
		 IN "XSR1_DATA_01" INDEX IN "XSR1_INDX_01" ; 
COMMENT ON TABLE "XSR     "."NOTIFY_EVENT_USER_TRAN" IS 'Transaction table that list events for every match in the user registration table.  It also tracks if any action has been taken by the user on the event.  ';


-- DDL Statements for primary key on Table "XSR     "."NOTIFY_EVENT_USER_TRAN"

ALTER TABLE "XSR     "."NOTIFY_EVENT_USER_TRAN" 
	ADD CONSTRAINT "NTF_ET_USR_TRN_PK" PRIMARY KEY
		("EVENT_REG_ID",
		 "EVENT_ID");



------------------------------------------------
-- DDL Statements for table "XSR     "."NOTIFY_EVENT_USER_TRAN_LOG"
------------------------------------------------
 
 CREATE TABLE "XSR     "."NOTIFY_EVENT_USER_TRAN_LOG"  (
		  "USER_ID" BIGINT NOT NULL , 
		  "EVENT_ID" BIGINT NOT NULL , 
		  "ACTION" CHAR(1) , 
		  "CREATE_USER" VARGRAPHIC(127) , 
		  "CREATE_DATETIME" TIMESTAMP NOT NULL WITH DEFAULT CURRENT TIMESTAMP , 
		  "UPDATE_USER" VARGRAPHIC(127) , 
		  "UPDATE_DATETIME" TIMESTAMP NOT NULL WITH DEFAULT CURRENT TIMESTAMP , 
		  "CRUD" CHAR(1) )   
		 IN "XSR1_LOG_01" INDEX IN "XSR1_LOG_INDX_01" ; 



------------------------------------------------
-- DDL Statements for table "XSR     "."NOTIFY_TRAN"
------------------------------------------------
 
 CREATE TABLE "XSR     "."NOTIFY_TRAN"  (
		  "TRAN_ID" VARGRAPHIC(40) NOT NULL , 
		  "TBL_NAME" VARCHAR(32) NOT NULL , 
		  "KEY_1" VARCHAR(127) , 
		  "KEY_2" VARCHAR(127) , 
		  "KEY_3" VARCHAR(127) , 
		  "KEY_4" VARCHAR(127) , 
		  "KEY_5" VARCHAR(127) , 
		  "KEY_6" VARCHAR(127) , 
		  "UPDATE_DATETIME" TIMESTAMP NOT NULL WITH DEFAULT CURRENT TIMESTAMP )   
		 IN "XSR1_DATA_01" INDEX IN "XSR1_INDX_01" ; 
COMMENT ON TABLE "XSR     "."NOTIFY_TRAN" IS 'TRANSACTION TABLE MONITORED TO SEND OUT NOTIFICATIONS BASED ON EVENTS USERS HAVE REGISTERED TO RECEIVE NOTIFICATIONS';


-- DDL Statements for primary key on Table "XSR     "."NOTIFY_TRAN"

ALTER TABLE "XSR     "."NOTIFY_TRAN" 
	ADD CONSTRAINT "NTF_TRAN_PK" PRIMARY KEY
		("TRAN_ID");



------------------------------------------------
-- DDL Statements for table "XSR     "."AUDIT_ACTION_TYPE"
------------------------------------------------
 
 CREATE TABLE "XSR     "."AUDIT_ACTION_TYPE"  (
		  "ACTION_ID" INTEGER NOT NULL , 
		  "DESCRIPTION" VARCHAR(80) NOT NULL )   
		 IN "XSR1_DATA_01" INDEX IN "XSR1_INDX_01" ; 
COMMENT ON TABLE "XSR     "."AUDIT_ACTION_TYPE" IS 'Used for describing the action types availble for logging.';


-- DDL Statements for primary key on Table "XSR     "."AUDIT_ACTION_TYPE"

ALTER TABLE "XSR     "."AUDIT_ACTION_TYPE" 
	ADD CONSTRAINT "AUDIT_ACT_PK" PRIMARY KEY
		("ACTION_ID");



------------------------------------------------
-- DDL Statements for table "XSR     "."USER_AUTH"
------------------------------------------------
 
 CREATE TABLE "XSR     "."USER_AUTH"  (
		  "USER_ID" BIGINT NOT NULL , 
		  "RIGHT_MASK" VARCHAR(256) NOT NULL , 
		  "IS_LOCKED" SMALLINT NOT NULL WITH DEFAULT 0 , 
		  "CREATE_USER" VARGRAPHIC(127) , 
		  "CREATE_DATETIME" TIMESTAMP NOT NULL WITH DEFAULT CURRENT TIMESTAMP , 
		  "UPDATE_USER" VARGRAPHIC(127) , 
		  "UPDATE_DATETIME" TIMESTAMP NOT NULL WITH DEFAULT CURRENT TIMESTAMP )   
		 IN "XSR1_DATA_01" INDEX IN "XSR1_INDX_01" ; 
COMMENT ON TABLE "XSR     "."USER_AUTH" IS 'This table contains a rights mask that identifies an XSR users rights within the application.';


-- DDL Statements for primary key on Table "XSR     "."USER_AUTH"

ALTER TABLE "XSR     "."USER_AUTH" 
	ADD CONSTRAINT "CONTACT_AUTH_PK" PRIMARY KEY
		("USER_ID");



------------------------------------------------
-- DDL Statements for table "XSR     "."USER_AUTH_LOG"
------------------------------------------------
 
 CREATE TABLE "XSR     "."USER_AUTH_LOG"  (
		  "USER_ID" BIGINT NOT NULL , 
		  "RIGHT_MASK" VARCHAR(256) NOT NULL , 
		  "IS_LOCKED" SMALLINT NOT NULL WITH DEFAULT 0 , 
		  "CREATE_USER" VARGRAPHIC(127) , 
		  "CREATE_DATETIME" TIMESTAMP NOT NULL WITH DEFAULT CURRENT TIMESTAMP , 
		  "UPDATE_USER" VARGRAPHIC(127) , 
		  "UPDATE_DATETIME" TIMESTAMP NOT NULL WITH DEFAULT CURRENT TIMESTAMP , 
		  "ACTION_FLAG" CHAR(1) )   
		 IN "XSR1_LOG_01" INDEX IN "XSR1_LOG_INDX_01" ; 
COMMENT ON TABLE "XSR     "."USER_AUTH_LOG" IS 'TABLE TRACKS CHANGES TO THE USERS AUTHORIZATIONS FOR AUDITING AND TROUBLESHOOTING.';




------------------------------------------------
-- DDL Statements for table "XSR     "."USER_LOGIN_ERR_LOG"
------------------------------------------------
 
 CREATE TABLE "XSR     "."USER_LOGIN_ERR_LOG"  (
		  "ERR_ID" BIGINT NOT NULL , 
		  "ERR_NUM" VARCHAR(15) , 
		  "ERR_MSG" VARCHAR(255) , 
		  "LOGIN" VARGRAPHIC(127) , 
		  "IBM_UID" VARGRAPHIC(40) , 
		  "CONTACT_IDS" VARGRAPHIC(255) , 
		  "SRC_APPL" VARCHAR(40) , 
		  "INACT_FLAG" INTEGER WITH DEFAULT 0 , 
		  "CREATE_USER" VARGRAPHIC(127) , 
		  "CREATE_DATETIME" TIMESTAMP NOT NULL WITH DEFAULT CURRENT TIMESTAMP , 
		  "UPDATE_USER" VARGRAPHIC(127) , 
		  "UPDATE_DATETIME" TIMESTAMP NOT NULL WITH DEFAULT CURRENT TIMESTAMP )   
		 IN "XSR1_LOG_01" INDEX IN "XSR1_LOG_INDX_01" ; 
COMMENT ON TABLE "XSR     "."USER_LOGIN_ERR_LOG" IS 'USED TO LOG USER AUTHENTICATION PROBLEMS INCLUDING PROBLEMS LIKE CALLRE ALREADY REGISTERED,  OR USER BEING REGISTERED WITH A DIFFERENT IBM UID.';




------------------------------------------------
-- DDL Statements for table "XSR     "."USER_LOGIN_XREF_LOG"
------------------------------------------------
 
 CREATE TABLE "XSR     "."USER_LOGIN_XREF_LOG"  (
		  "USER_ID" BIGINT NOT NULL , 
		  "LOGIN" VARGRAPHIC(127) , 
		  "PASSWORD" VARGRAPHIC(127) , 
		  "SRC_APPL" VARCHAR(40) , 
		  "CREATE_USER" VARGRAPHIC(127) , 
		  "CREATE_DATETIME" TIMESTAMP NOT NULL WITH DEFAULT CURRENT TIMESTAMP , 
		  "UPDATE_USER" VARGRAPHIC(127) , 
		  "UPDATE_DATETIME" TIMESTAMP NOT NULL WITH DEFAULT CURRENT TIMESTAMP )   
		 IN "XSR1_LOG_01" INDEX IN "XSR1_LOG_INDX_01" ; 
COMMENT ON TABLE "XSR     "."USER_LOGIN_XREF_LOG" IS 'USED TO TRACK CUSTOMER LOGIN TO XSR.  MAY NOT NEED THIS IN XSR.';




------------------------------------------------
-- DDL Statements for table "XSR     "."USER_PROFILE_REPORT"
------------------------------------------------
 
 CREATE TABLE "XSR     "."USER_PROFILE_REPORT"  (
		  "USER_ID" BIGINT NOT NULL , 
		  "RPT_COL1" VARCHAR(50) , 
		  "RPT_COL2" VARCHAR(50) , 
		  "RPT_COL3" VARCHAR(50) , 
		  "RPT_COL4" VARCHAR(50) , 
		  "RPT_COL5" VARCHAR(50) , 
		  "RPT_COL6" VARCHAR(50) , 
		  "RPT_COL7" VARCHAR(50) , 
		  "RPT_COL8" VARCHAR(50) , 
		  "RPT_COL9" VARCHAR(50) , 
		  "RPT_COL10" VARCHAR(50) , 
		  "RPT_FILTER" VARCHAR(30) , 
		  "RPT_OPEN" INTEGER , 
		  "RPT_CLOSED" INTEGER , 
		  "RPT_DATE_OPT" TIMESTAMP , 
		  "RPT_DATE_FROM" TIMESTAMP , 
		  "RPT_DATE_TO" TIMESTAMP , 
		  "SORT_COL" VARCHAR(50) , 
		  "SORT_DIRECTION" SMALLINT , 
		  "CREATE_USER" VARGRAPHIC(127) , 
		  "CREATE_DATETIME" TIMESTAMP NOT NULL WITH DEFAULT CURRENT TIMESTAMP , 
		  "UPDATE_USER" VARGRAPHIC(127) NOT NULL , 
		  "UPDATE_DATETIME" TIMESTAMP NOT NULL WITH DEFAULT CURRENT TIMESTAMP , 
		  "RPT_NAME" VARGRAPHIC(255) )   
		 IN "XSR1_DATA_01" INDEX IN "XSR1_INDX_01" ; 
COMMENT ON TABLE "XSR     "."USER_PROFILE_REPORT" IS 'USED TO PERSIST THE COLUMNS DISPLAYED ON THE SEARCH RESULTS PAGE.  USER HAS THE ABILITY TO SELECT UP TO 10 COLUMNS AND HOW TO SORT THE DATA.';


-- DDL Statements for primary key on Table "XSR     "."USER_PROFILE_REPORT"

ALTER TABLE "XSR     "."USER_PROFILE_REPORT" 
	ADD CONSTRAINT "USR_PROF_RPT_PK" PRIMARY KEY
		("USER_ID");



------------------------------------------------
-- DDL Statements for table "XSR     "."NOTIFY_EVENT_ACTION_TYPE"
------------------------------------------------
 
 CREATE TABLE "XSR     "."NOTIFY_EVENT_ACTION_TYPE"  (
		  "ACTION_TYPE_ID" INTEGER NOT NULL , 
		  "DESCRIPTION" VARCHAR(80) NOT NULL )   
		 IN "XSR1_DATA_01" INDEX IN "XSR1_INDX_01" ; 
COMMENT ON TABLE "XSR     "."NOTIFY_EVENT_ACTION_TYPE" IS 'Used for describing the action types availble for events that can be subscribed to for notifications.';


-- DDL Statements for primary key on Table "XSR     "."NOTIFY_EVENT_ACTION_TYPE"

ALTER TABLE "XSR     "."NOTIFY_EVENT_ACTION_TYPE" 
	ADD CONSTRAINT "NTFY_EVNT_AT_PK" PRIMARY KEY
		("ACTION_TYPE_ID");



------------------------------------------------
-- DDL Statements for table "XSR     "."CFG_PROPERTIES"
------------------------------------------------
 
 CREATE TABLE "XSR     "."CFG_PROPERTIES"  (
		  "PROPERTIES_ID" INTEGER NOT NULL , 
		  "KEY" VARCHAR(100) NOT NULL , 
		  "VALUE" VARCHAR(100) )   
		 IN "XSR1_DATA_01" INDEX IN "XSR1_INDX_01" ; 

-- DDL Statements for primary key on Table "XSR     "."CFG_PROPERTIES"

ALTER TABLE "XSR     "."CFG_PROPERTIES" 
	ADD CONSTRAINT "PROPERTIES_PK" PRIMARY KEY
		("PROPERTIES_ID");



------------------------------------------------
-- DDL Statements for table "XSR     "."PMR_ADV_ROUTE"
------------------------------------------------
 
 CREATE TABLE "XSR     "."PMR_ADV_ROUTE"  (
		  "ROUTE_ID" INTEGER NOT NULL , 
		  "ROUTE_SET_ID" INTEGER NOT NULL , 
		  "ROUTE_TIME_SLOT_ID" INTEGER , 
		  "ROUTE_KEYWORD_LIST_ID" INTEGER , 
		  "IBM_CUST_NUM" VARCHAR(8) , 
		  "RETAIN_COUNTRY_CODE" CHAR(3) , 
		  "OS_ID" INTEGER , 
		  "PLATFORM_ID" INTEGER , 
		  "CONTRACT_TYPE_ID" INTEGER , 
		  "REQUEST_TYPE_ID" INTEGER , 
		  "PMR_SEVERITY" CHAR(1) , 
		  "CREATE_FLAG" SMALLINT NOT NULL WITH DEFAULT 0 , 
		  "QUEUE" VARGRAPHIC(6) NOT NULL , 
		  "CENTER" VARGRAPHIC(3) NOT NULL , 
		  "CREATE_USER" VARGRAPHIC(127) , 
		  "CREATE_DATETIME" TIMESTAMP NOT NULL , 
		  "UPDATE_USER" VARGRAPHIC(127) , 
		  "UPDATE_DATETIME" TIMESTAMP NOT NULL )   
		 IN "XSR1_DATA_01" INDEX IN "XSR1_INDX_01" ; 
COMMENT ON COLUMN "XSR     "."PMR_ADV_ROUTE"."CREATE_FLAG" IS 'Used to identify which transaction types this rule applies to.  Possible values are: I = Insert U = Update A = All';


-- DDL Statements for primary key on Table "XSR     "."PMR_ADV_ROUTE"

ALTER TABLE "XSR     "."PMR_ADV_ROUTE" 
	ADD CONSTRAINT "PMR_ADV_RTE_PK" PRIMARY KEY
		("ROUTE_ID");



------------------------------------------------
-- DDL Statements for table "XSR     "."PMR_ADV_ROUTE_SET"
------------------------------------------------
 
 CREATE TABLE "XSR     "."PMR_ADV_ROUTE_SET"  (
		  "ROUTE_SET_ID" INTEGER NOT NULL , 
		  "NAME" VARGRAPHIC(80) , 
		  "COMP_GROUP_ID" INTEGER NOT NULL , 
		  "CREATE_USER" VARGRAPHIC(127) , 
		  "CREATE_DATETIME" TIMESTAMP NOT NULL , 
		  "UPDATE_USER" VARGRAPHIC(127) , 
		  "UPDATE_DATETIME" TIMESTAMP NOT NULL )   
		 IN "XSR1_DATA_01" INDEX IN "XSR1_INDX_01" ; 

-- DDL Statements for primary key on Table "XSR     "."PMR_ADV_ROUTE_SET"

ALTER TABLE "XSR     "."PMR_ADV_ROUTE_SET" 
	ADD CONSTRAINT "PAR_S_PK" PRIMARY KEY
		("ROUTE_SET_ID");


-- DDL Statements for unique constraints on Table "XSR     "."PMR_ADV_ROUTE_SET"

ALTER TABLE "XSR     "."PMR_ADV_ROUTE_SET" 
	ADD UNIQUE
		("COMP_GROUP_ID");


------------------------------------------------
-- DDL Statements for table "XSR     "."PMR_ADV_ROUTE_TIME_SLOT"
------------------------------------------------
 
 CREATE TABLE "XSR     "."PMR_ADV_ROUTE_TIME_SLOT"  (
		  "ROUTE_TIME_SLOT_ID" INTEGER NOT NULL , 
		  "ROUTE_SET_ID" INTEGER NOT NULL , 
		  "TIME_ZONE_ID" VARCHAR(64) NOT NULL , 
		  "NAME" VARGRAPHIC(128) , 
		  "START_TIME" TIME , 
		  "END_TIME" TIME , 
		  "MON" SMALLINT NOT NULL WITH DEFAULT 0 , 
		  "TUE" SMALLINT NOT NULL WITH DEFAULT 0 , 
		  "WED" SMALLINT NOT NULL WITH DEFAULT 0 , 
		  "THU" SMALLINT NOT NULL WITH DEFAULT 0 , 
		  "FRI" SMALLINT NOT NULL WITH DEFAULT 0 , 
		  "SAT" SMALLINT NOT NULL WITH DEFAULT 0 , 
		  "SUN" SMALLINT NOT NULL WITH DEFAULT 0 , 
		  "CREATE_USER" VARGRAPHIC(127) , 
		  "CREATE_DATETIME" TIMESTAMP NOT NULL , 
		  "UPDATE_USER" VARGRAPHIC(127) , 
		  "UPDATE_DATETIME" TIMESTAMP NOT NULL )   
		 IN "XSR1_DATA_01" INDEX IN "XSR1_INDX_01" ; 

-- DDL Statements for primary key on Table "XSR     "."PMR_ADV_ROUTE_TIME_SLOT"

ALTER TABLE "XSR     "."PMR_ADV_ROUTE_TIME_SLOT" 
	ADD CONSTRAINT "PAR_TIME_SLOT_PK" PRIMARY KEY
		("ROUTE_TIME_SLOT_ID");



------------------------------------------------
-- DDL Statements for table "XSR     "."PMR_ADV_ROUTE_EXCL_DAYS"
------------------------------------------------
 
 CREATE TABLE "XSR     "."PMR_ADV_ROUTE_EXCL_DAYS"  (
		  "ROUTE_EXCL_DAY_ID" INTEGER NOT NULL , 
		  "ROUTE_TIME_SLOT_ID" INTEGER NOT NULL , 
		  "EXCL_DATE" DATE NOT NULL , 
		  "REPEAT_YEARLY" SMALLINT NOT NULL WITH DEFAULT 0 , 
		  "CREATE_USER" VARGRAPHIC(127) , 
		  "CREATE_DATETIME" TIMESTAMP NOT NULL , 
		  "UPDATE_USER" VARGRAPHIC(127) , 
		  "UPDATE_DATETIME" TIMESTAMP NOT NULL )   
		 IN "XSR1_DATA_01" INDEX IN "XSR1_INDX_01" ; 

-- DDL Statements for primary key on Table "XSR     "."PMR_ADV_ROUTE_EXCL_DAYS"

ALTER TABLE "XSR     "."PMR_ADV_ROUTE_EXCL_DAYS" 
	ADD CONSTRAINT "PAR_EXCL_DAYS_PK" PRIMARY KEY
		("ROUTE_EXCL_DAY_ID");



------------------------------------------------
-- DDL Statements for table "XSR     "."PMR_ADV_ROUTE_KEYWORD"
------------------------------------------------
 
 CREATE TABLE "XSR     "."PMR_ADV_ROUTE_KEYWORD"  (
		  "ROUTE_KEYWORD_ID" INTEGER NOT NULL , 
		  "ROUTE_KEYWORD_LIST_ID" INTEGER NOT NULL , 
		  "KEYWORD" VARGRAPHIC(80) NOT NULL , 
		  "CREATE_USER" VARGRAPHIC(127) , 
		  "CREATE_DATETIME" TIMESTAMP NOT NULL , 
		  "UPDATE_USER" VARGRAPHIC(127) , 
		  "UPDATE_DATETIME" TIMESTAMP NOT NULL )   
		 IN "XSR1_DATA_01" INDEX IN "XSR1_INDX_01" ; 

-- DDL Statements for primary key on Table "XSR     "."PMR_ADV_ROUTE_KEYWORD"

ALTER TABLE "XSR     "."PMR_ADV_ROUTE_KEYWORD" 
	ADD CONSTRAINT "PAR_KW_PK" PRIMARY KEY
		("ROUTE_KEYWORD_ID");



------------------------------------------------
-- DDL Statements for table "XSR     "."PMR_ADV_ROUTE_KEYWORD_LIST"
------------------------------------------------
 
 CREATE TABLE "XSR     "."PMR_ADV_ROUTE_KEYWORD_LIST"  (
		  "ROUTE_KEYWORD_LIST_ID" INTEGER NOT NULL , 
		  "ROUTE_SET_ID" INTEGER NOT NULL , 
		  "NAME" VARGRAPHIC(128) , 
		  "CREATE_USER" VARGRAPHIC(127) , 
		  "CREATE_DATETIME" TIMESTAMP NOT NULL , 
		  "UPDATE_USER" VARGRAPHIC(127) , 
		  "UPDATE_DATETIME" TIMESTAMP NOT NULL )   
		 IN "XSR1_DATA_01" INDEX IN "XSR1_INDX_01" ; 

-- DDL Statements for primary key on Table "XSR     "."PMR_ADV_ROUTE_KEYWORD_LIST"

ALTER TABLE "XSR     "."PMR_ADV_ROUTE_KEYWORD_LIST" 
	ADD CONSTRAINT "PAR_KW_LIST_PK" PRIMARY KEY
		("ROUTE_KEYWORD_LIST_ID");



------------------------------------------------
-- DDL Statements for table "XSR     "."PMR_T_ADV_ROUTE"
------------------------------------------------
 
 CREATE TABLE "XSR     "."PMR_T_ADV_ROUTE"  (
		  "ROUTE_ID" INTEGER NOT NULL , 
		  "ROUTE_SET_ID" INTEGER NOT NULL , 
		  "ROUTE_TIME_SLOT_ID" INTEGER , 
		  "ROUTE_KEYWORD_LIST_ID" INTEGER , 
		  "IBM_CUST_NUM" VARCHAR(8) , 
		  "RETAIN_COUNTRY_CODE" CHAR(3) , 
		  "OS_ID" INTEGER , 
		  "PLATFORM_ID" INTEGER , 
		  "CONTRACT_TYPE_ID" INTEGER , 
		  "REQUEST_TYPE_ID" INTEGER , 
		  "PMR_SEVERITY" CHAR(1) , 
		  "CREATE_FLAG" SMALLINT NOT NULL WITH DEFAULT 0 , 
		  "QUEUE" VARGRAPHIC(6) NOT NULL , 
		  "CENTER" VARGRAPHIC(3) NOT NULL , 
		  "CREATE_USER" VARGRAPHIC(127) , 
		  "CREATE_DATETIME" TIMESTAMP NOT NULL , 
		  "UPDATE_USER" VARGRAPHIC(127) , 
		  "UPDATE_DATETIME" TIMESTAMP NOT NULL )   
		 IN "XSR1_DATA_01" INDEX IN "XSR1_INDX_01" ; 

-- DDL Statements for primary key on Table "XSR     "."PMR_T_ADV_ROUTE"

ALTER TABLE "XSR     "."PMR_T_ADV_ROUTE" 
	ADD CONSTRAINT "PMR_T_ADV_RTE_PK" PRIMARY KEY
		("ROUTE_ID");



------------------------------------------------
-- DDL Statements for table "XSR     "."PMR_T_ADV_ROUTE_SET"
------------------------------------------------
 
 CREATE TABLE "XSR     "."PMR_T_ADV_ROUTE_SET"  (
		  "ROUTE_SET_ID" INTEGER NOT NULL , 
		  "PREV_ROUTE_SET_ID" INTEGER , 
		  "NAME" VARGRAPHIC(80) , 
		  "COMP_GROUP_ID" INTEGER NOT NULL , 
		  "CREATE_USER" VARGRAPHIC(127) , 
		  "CREATE_DATETIME" TIMESTAMP NOT NULL , 
		  "UPDATE_USER" VARGRAPHIC(127) , 
		  "UPDATE_DATETIME" TIMESTAMP NOT NULL )   
		 IN "XSR1_DATA_01" INDEX IN "XSR1_INDX_01" ; 

-- DDL Statements for primary key on Table "XSR     "."PMR_T_ADV_ROUTE_SET"

ALTER TABLE "XSR     "."PMR_T_ADV_ROUTE_SET" 
	ADD CONSTRAINT "PTAR_S_PK" PRIMARY KEY
		("ROUTE_SET_ID");



------------------------------------------------
-- DDL Statements for table "XSR     "."PMR_T_ADV_ROUTE_TIME_SLOT"
------------------------------------------------
 
 CREATE TABLE "XSR     "."PMR_T_ADV_ROUTE_TIME_SLOT"  (
		  "ROUTE_TIME_SLOT_ID" INTEGER NOT NULL , 
		  "ROUTE_SET_ID" INTEGER NOT NULL , 
		  "TIME_ZONE_ID" VARCHAR(64) NOT NULL , 
		  "NAME" VARGRAPHIC(128) , 
		  "START_TIME" TIME , 
		  "END_TIME" TIME , 
		  "MON" SMALLINT NOT NULL WITH DEFAULT 0 , 
		  "TUE" SMALLINT NOT NULL WITH DEFAULT 0 , 
		  "WED" SMALLINT NOT NULL WITH DEFAULT 0 , 
		  "THU" SMALLINT NOT NULL WITH DEFAULT 0 , 
		  "FRI" SMALLINT NOT NULL WITH DEFAULT 0 , 
		  "SAT" SMALLINT NOT NULL WITH DEFAULT 0 , 
		  "SUN" SMALLINT NOT NULL WITH DEFAULT 0 , 
		  "CREATE_USER" VARGRAPHIC(127) , 
		  "CREATE_DATETIME" TIMESTAMP NOT NULL , 
		  "UPDATE_USER" VARGRAPHIC(127) , 
		  "UPDATE_DATETIME" TIMESTAMP NOT NULL )   
		 IN "XSR1_DATA_01" INDEX IN "XSR1_INDX_01" ; 

-- DDL Statements for primary key on Table "XSR     "."PMR_T_ADV_ROUTE_TIME_SLOT"

ALTER TABLE "XSR     "."PMR_T_ADV_ROUTE_TIME_SLOT" 
	ADD CONSTRAINT "PTAR_TIME_SLOT_PK" PRIMARY KEY
		("ROUTE_TIME_SLOT_ID");



------------------------------------------------
-- DDL Statements for table "XSR     "."PMR_T_ADV_ROUTE_KEYWORD_LIST"
------------------------------------------------
 
 CREATE TABLE "XSR     "."PMR_T_ADV_ROUTE_KEYWORD_LIST"  (
		  "ROUTE_KEYWORD_LIST_ID" INTEGER NOT NULL , 
		  "ROUTE_SET_ID" INTEGER NOT NULL , 
		  "NAME" VARGRAPHIC(128) , 
		  "CREATE_USER" VARGRAPHIC(127) , 
		  "CREATE_DATETIME" TIMESTAMP NOT NULL , 
		  "UPDATE_USER" VARGRAPHIC(127) , 
		  "UPDATE_DATETIME" TIMESTAMP NOT NULL )   
		 IN "XSR1_DATA_01" INDEX IN "XSR1_INDX_01" ; 

-- DDL Statements for primary key on Table "XSR     "."PMR_T_ADV_ROUTE_KEYWORD_LIST"

ALTER TABLE "XSR     "."PMR_T_ADV_ROUTE_KEYWORD_LIST" 
	ADD CONSTRAINT "PTAR_KW_LIST_PK" PRIMARY KEY
		("ROUTE_KEYWORD_LIST_ID");



------------------------------------------------
-- DDL Statements for table "XSR     "."PMR_T_ADV_ROUTE_KEYWORD"
------------------------------------------------
 
 CREATE TABLE "XSR     "."PMR_T_ADV_ROUTE_KEYWORD"  (
		  "ROUTE_KEYWORD_ID" INTEGER NOT NULL , 
		  "ROUTE_KEYWORD_LIST_ID" INTEGER NOT NULL , 
		  "KEYWORD" VARGRAPHIC(80) NOT NULL , 
		  "CREATE_USER" VARGRAPHIC(127) , 
		  "CREATE_DATETIME" TIMESTAMP NOT NULL , 
		  "UPDATE_USER" VARGRAPHIC(127) , 
		  "UPDATE_DATETIME" TIMESTAMP NOT NULL )   
		 IN "XSR1_DATA_01" INDEX IN "XSR1_INDX_01" ; 

-- DDL Statements for primary key on Table "XSR     "."PMR_T_ADV_ROUTE_KEYWORD"

ALTER TABLE "XSR     "."PMR_T_ADV_ROUTE_KEYWORD" 
	ADD CONSTRAINT "PTAR_KW_PK" PRIMARY KEY
		("ROUTE_KEYWORD_ID");



------------------------------------------------
-- DDL Statements for table "XSR     "."PMR_T_ADV_ROUTE_EXCL_DAYS"
------------------------------------------------
 
 CREATE TABLE "XSR     "."PMR_T_ADV_ROUTE_EXCL_DAYS"  (
		  "ROUTE_EXCL_DAY_ID" INTEGER NOT NULL , 
		  "ROUTE_TIME_SLOT_ID" INTEGER NOT NULL , 
		  "EXCL_DATE" DATE NOT NULL , 
		  "REPEAT_YEARLY" SMALLINT NOT NULL WITH DEFAULT 0 , 
		  "CREATE_USER" VARGRAPHIC(127) , 
		  "CREATE_DATETIME" TIMESTAMP NOT NULL , 
		  "UPDATE_USER" VARGRAPHIC(127) , 
		  "UPDATE_DATETIME" TIMESTAMP NOT NULL )   
		 IN "XSR1_DATA_01" INDEX IN "XSR1_INDX_01" ; 

-- DDL Statements for primary key on Table "XSR     "."PMR_T_ADV_ROUTE_EXCL_DAYS"

ALTER TABLE "XSR     "."PMR_T_ADV_ROUTE_EXCL_DAYS" 
	ADD CONSTRAINT "PTAR_EXCL_DAY_PK" PRIMARY KEY
		("ROUTE_EXCL_DAY_ID");



------------------------------------------------
-- DDL Statements for table "XSR     "."PMR_A_ADV_ROUTE"
------------------------------------------------
 
 CREATE TABLE "XSR     "."PMR_A_ADV_ROUTE"  (
		  "ROUTE_ID" INTEGER NOT NULL , 
		  "PREV_ROUTE_ID" INTEGER NOT NULL , 
		  "ROUTE_SET_ID" INTEGER NOT NULL , 
		  "ROUTE_TIME_SLOT_ID" INTEGER , 
		  "ROUTE_KEYWORD_LIST_ID" INTEGER , 
		  "IBM_CUST_NUM" VARCHAR(8) , 
		  "RETAIN_COUNTRY_CODE" CHAR(3) , 
		  "OS_ID" INTEGER , 
		  "PLATFORM_ID" INTEGER , 
		  "CONTRACT_TYPE_ID" INTEGER , 
		  "REQUEST_TYPE_ID" INTEGER , 
		  "PMR_SEVERITY" CHAR(1) , 
		  "CREATE_FLAG" SMALLINT NOT NULL WITH DEFAULT 0 , 
		  "QUEUE" VARGRAPHIC(6) NOT NULL , 
		  "CENTER" VARGRAPHIC(3) NOT NULL , 
		  "CREATE_USER" VARGRAPHIC(127) , 
		  "CREATE_DATETIME" TIMESTAMP NOT NULL , 
		  "UPDATE_USER" VARGRAPHIC(127) , 
		  "UPDATE_DATETIME" TIMESTAMP NOT NULL )   
		 IN "XSR1_DATA_01" INDEX IN "XSR1_INDX_01" ; 
COMMENT ON COLUMN "XSR     "."PMR_A_ADV_ROUTE"."CREATE_FLAG" IS 'Used to identify which transaction types this rule applies to.  Possible values are: I = Insert U = Update A = All';


-- DDL Statements for primary key on Table "XSR     "."PMR_A_ADV_ROUTE"

ALTER TABLE "XSR     "."PMR_A_ADV_ROUTE" 
	ADD CONSTRAINT "PMR_A_ADV_RTE_PK" PRIMARY KEY
		("ROUTE_ID");



------------------------------------------------
-- DDL Statements for table "XSR     "."PMR_A_ADV_ROUTE_SET"
------------------------------------------------
 
 CREATE TABLE "XSR     "."PMR_A_ADV_ROUTE_SET"  (
		  "ROUTE_SET_ID" INTEGER NOT NULL , 
		  "PREV_ROUTE_SET_ID" INTEGER NOT NULL , 
		  "NAME" VARGRAPHIC(80) , 
		  "COMP_GROUP_ID" INTEGER NOT NULL , 
		  "CREATE_USER" VARGRAPHIC(127) , 
		  "CREATE_DATETIME" TIMESTAMP NOT NULL , 
		  "UPDATE_USER" VARGRAPHIC(127) , 
		  "UPDATE_DATETIME" TIMESTAMP NOT NULL )   
		 IN "XSR1_DATA_01" INDEX IN "XSR1_INDX_01" ; 

-- DDL Statements for primary key on Table "XSR     "."PMR_A_ADV_ROUTE_SET"

ALTER TABLE "XSR     "."PMR_A_ADV_ROUTE_SET" 
	ADD CONSTRAINT "PAAR_S_PK" PRIMARY KEY
		("ROUTE_SET_ID");



------------------------------------------------
-- DDL Statements for table "XSR     "."PMR_A_ADV_ROUTE_KEYWORD_LIST"
------------------------------------------------
 
 CREATE TABLE "XSR     "."PMR_A_ADV_ROUTE_KEYWORD_LIST"  (
		  "ROUTE_KEYWORD_LIST_ID" INTEGER NOT NULL , 
		  "ROUTE_SET_ID" INTEGER NOT NULL , 
		  "NAME" VARGRAPHIC(128) , 
		  "CREATE_USER" VARGRAPHIC(127) , 
		  "CREATE_DATETIME" TIMESTAMP NOT NULL , 
		  "UPDATE_USER" VARGRAPHIC(127) , 
		  "UPDATE_DATETIME" TIMESTAMP NOT NULL )   
		 IN "XSR1_DATA_01" INDEX IN "XSR1_INDX_01" ; 

-- DDL Statements for primary key on Table "XSR     "."PMR_A_ADV_ROUTE_KEYWORD_LIST"

ALTER TABLE "XSR     "."PMR_A_ADV_ROUTE_KEYWORD_LIST" 
	ADD CONSTRAINT "PAAR_KW_LIST_PK" PRIMARY KEY
		("ROUTE_KEYWORD_LIST_ID");



------------------------------------------------
-- DDL Statements for table "XSR     "."PMR_A_ADV_ROUTE_KEYWORD"
------------------------------------------------
 
 CREATE TABLE "XSR     "."PMR_A_ADV_ROUTE_KEYWORD"  (
		  "ROUTE_KEYWORD_ID" INTEGER NOT NULL , 
		  "ROUTE_KEYWORD_LIST_ID" INTEGER NOT NULL , 
		  "KEYWORD" VARGRAPHIC(80) NOT NULL , 
		  "CREATE_USER" VARGRAPHIC(127) , 
		  "CREATE_DATETIME" TIMESTAMP NOT NULL , 
		  "UPDATE_USER" VARGRAPHIC(127) , 
		  "UPDATE_DATETIME" TIMESTAMP NOT NULL )   
		 IN "XSR1_DATA_01" INDEX IN "XSR1_INDX_01" ; 

-- DDL Statements for primary key on Table "XSR     "."PMR_A_ADV_ROUTE_KEYWORD"

ALTER TABLE "XSR     "."PMR_A_ADV_ROUTE_KEYWORD" 
	ADD CONSTRAINT "PAAR_KW_PK" PRIMARY KEY
		("ROUTE_KEYWORD_ID");



------------------------------------------------
-- DDL Statements for table "XSR     "."PMR_A_ADV_ROUTE_TIME_SLOT"
------------------------------------------------
 
 CREATE TABLE "XSR     "."PMR_A_ADV_ROUTE_TIME_SLOT"  (
		  "ROUTE_TIME_SLOT_ID" INTEGER NOT NULL , 
		  "ROUTE_SET_ID" INTEGER NOT NULL , 
		  "TIME_ZONE_ID" VARCHAR(64) NOT NULL , 
		  "NAME" VARGRAPHIC(128) , 
		  "START_TIME" TIME , 
		  "END_TIME" TIME , 
		  "MON" SMALLINT NOT NULL WITH DEFAULT 0 , 
		  "TUE" SMALLINT NOT NULL WITH DEFAULT 0 , 
		  "WED" SMALLINT NOT NULL WITH DEFAULT 0 , 
		  "THU" SMALLINT NOT NULL WITH DEFAULT 0 , 
		  "FRI" SMALLINT NOT NULL WITH DEFAULT 0 , 
		  "SAT" SMALLINT NOT NULL WITH DEFAULT 0 , 
		  "SUN" SMALLINT NOT NULL WITH DEFAULT 0 , 
		  "CREATE_USER" VARGRAPHIC(127) , 
		  "CREATE_DATETIME" TIMESTAMP NOT NULL , 
		  "UPDATE_USER" VARGRAPHIC(127) , 
		  "UPDATE_DATETIME" TIMESTAMP NOT NULL )   
		 IN "XSR1_DATA_01" INDEX IN "XSR1_INDX_01" ; 

-- DDL Statements for primary key on Table "XSR     "."PMR_A_ADV_ROUTE_TIME_SLOT"

ALTER TABLE "XSR     "."PMR_A_ADV_ROUTE_TIME_SLOT" 
	ADD CONSTRAINT "PAAR_TIME_SLOT_PK" PRIMARY KEY
		("ROUTE_TIME_SLOT_ID");



------------------------------------------------
-- DDL Statements for table "XSR     "."PMR_A_ADV_ROUTE_EXCL_DAYS"
------------------------------------------------
 
 CREATE TABLE "XSR     "."PMR_A_ADV_ROUTE_EXCL_DAYS"  (
		  "ROUTE_EXCL_DAY_ID" INTEGER NOT NULL , 
		  "ROUTE_TIME_SLOT_ID" INTEGER , 
		  "EXCL_DATE" DATE NOT NULL , 
		  "REPEAT_YEARLY" SMALLINT NOT NULL WITH DEFAULT 0 , 
		  "CREATE_USER" VARGRAPHIC(127) , 
		  "CREATE_DATETIME" TIMESTAMP NOT NULL , 
		  "UPDATE_USER" VARGRAPHIC(127) , 
		  "UPDATE_DATETIME" TIMESTAMP NOT NULL )   
		 IN "XSR1_DATA_01" INDEX IN "XSR1_INDX_01" ; 

-- DDL Statements for primary key on Table "XSR     "."PMR_A_ADV_ROUTE_EXCL_DAYS"

ALTER TABLE "XSR     "."PMR_A_ADV_ROUTE_EXCL_DAYS" 
	ADD CONSTRAINT "PAAR_EXCL_DAY_PK" PRIMARY KEY
		("ROUTE_EXCL_DAY_ID");



------------------------------------------------
-- DDL Statements for table "XSR     "."PMR_PREM_ROUTE"
------------------------------------------------
 
 CREATE TABLE "XSR     "."PMR_PREM_ROUTE"  (
		  "ROUTE_ID" INTEGER NOT NULL , 
		  "ROUTE_SET_ID" INTEGER NOT NULL , 
		  "PLATFORM_ID" INTEGER , 
		  "ROUTE_TIME_SLOT_ID" INTEGER , 
		  "IBM_CUST_NUM" VARCHAR(8) , 
		  "RETAIN_COUNTRY_CODE" CHAR(3) , 
		  "QUEUE" VARGRAPHIC(6) NOT NULL , 
		  "CENTER" VARGRAPHIC(3) NOT NULL , 
		  "CREATE_USER" VARGRAPHIC(127) , 
		  "CREATE_DATETIME" TIMESTAMP NOT NULL , 
		  "UPDATE_USER" VARGRAPHIC(127) , 
		  "UPDATE_DATETIME" TIMESTAMP NOT NULL )   
		 IN "XSR1_DATA_01" INDEX IN "XSR1_INDX_01" ; 

-- DDL Statements for primary key on Table "XSR     "."PMR_PREM_ROUTE"

ALTER TABLE "XSR     "."PMR_PREM_ROUTE" 
	ADD CONSTRAINT "PMR_PREM_RTE_PK" PRIMARY KEY
		("ROUTE_ID");



------------------------------------------------
-- DDL Statements for table "XSR     "."PMR_PREM_ROUTE_SET"
------------------------------------------------
 
 CREATE TABLE "XSR     "."PMR_PREM_ROUTE_SET"  (
		  "ROUTE_SET_ID" INTEGER NOT NULL , 
		  "NAME" VARGRAPHIC(80) , 
		  "PREM_SUPPORT_TYPE" VARCHAR(40) NOT NULL , 
		  "CREATE_USER" VARGRAPHIC(127) , 
		  "CREATE_DATETIME" TIMESTAMP NOT NULL , 
		  "UPDATE_USER" VARGRAPHIC(127) , 
		  "UPDATE_DATETIME" TIMESTAMP NOT NULL )   
		 IN "XSR1_DATA_01" INDEX IN "XSR1_INDX_01" ; 

-- DDL Statements for primary key on Table "XSR     "."PMR_PREM_ROUTE_SET"

ALTER TABLE "XSR     "."PMR_PREM_ROUTE_SET" 
	ADD CONSTRAINT "PPR_S_PK" PRIMARY KEY
		("ROUTE_SET_ID");


-- DDL Statements for unique constraints on Table "XSR     "."PMR_PREM_ROUTE_SET"

ALTER TABLE "XSR     "."PMR_PREM_ROUTE_SET" 
	ADD CONSTRAINT "PPRS_SPPRT_TYPE_1" UNIQUE
		("PREM_SUPPORT_TYPE");


------------------------------------------------
-- DDL Statements for table "XSR     "."PMR_PREM_ROUTE_TIME_SLOT"
------------------------------------------------
 
 CREATE TABLE "XSR     "."PMR_PREM_ROUTE_TIME_SLOT"  (
		  "ROUTE_TIME_SLOT_ID" INTEGER NOT NULL , 
		  "ROUTE_SET_ID" INTEGER NOT NULL , 
		  "TIME_ZONE_ID" VARCHAR(64) NOT NULL , 
		  "NAME" VARGRAPHIC(128) , 
		  "START_TIME" TIME , 
		  "END_TIME" TIME , 
		  "MON" SMALLINT NOT NULL WITH DEFAULT 0 , 
		  "TUE" SMALLINT NOT NULL WITH DEFAULT 0 , 
		  "WED" SMALLINT NOT NULL WITH DEFAULT 0 , 
		  "THU" SMALLINT NOT NULL WITH DEFAULT 0 , 
		  "FRI" SMALLINT NOT NULL WITH DEFAULT 0 , 
		  "SAT" SMALLINT NOT NULL WITH DEFAULT 0 , 
		  "SUN" SMALLINT NOT NULL WITH DEFAULT 0 , 
		  "CREATE_USER" VARGRAPHIC(127) , 
		  "CREATE_DATETIME" TIMESTAMP NOT NULL , 
		  "UPDATE_USER" VARGRAPHIC(127) , 
		  "UPDATE_DATETIME" TIMESTAMP NOT NULL )   
		 IN "XSR1_DATA_01" INDEX IN "XSR1_INDX_01" ; 

-- DDL Statements for primary key on Table "XSR     "."PMR_PREM_ROUTE_TIME_SLOT"

ALTER TABLE "XSR     "."PMR_PREM_ROUTE_TIME_SLOT" 
	ADD CONSTRAINT "PPR_TIME_SLOT_PK" PRIMARY KEY
		("ROUTE_TIME_SLOT_ID");



------------------------------------------------
-- DDL Statements for table "XSR     "."PMR_PREM_ROUTE_EXCL_DAYS"
------------------------------------------------
 
 CREATE TABLE "XSR     "."PMR_PREM_ROUTE_EXCL_DAYS"  (
		  "ROUTE_EXCL_DAY_ID" INTEGER NOT NULL , 
		  "ROUTE_TIME_SLOT_ID" INTEGER NOT NULL , 
		  "EXCL_DATE" DATE NOT NULL , 
		  "REPEAT_YEARLY" SMALLINT NOT NULL WITH DEFAULT 0 , 
		  "CREATE_USER" VARGRAPHIC(127) , 
		  "CREATE_DATETIME" TIMESTAMP NOT NULL , 
		  "UPDATE_USER" VARGRAPHIC(127) , 
		  "UPDATE_DATETIME" TIMESTAMP NOT NULL )   
		 IN "XSR1_DATA_01" INDEX IN "XSR1_INDX_01" ; 

-- DDL Statements for primary key on Table "XSR     "."PMR_PREM_ROUTE_EXCL_DAYS"

ALTER TABLE "XSR     "."PMR_PREM_ROUTE_EXCL_DAYS" 
	ADD CONSTRAINT "PPR_EXCL_DAYS_PK" PRIMARY KEY
		("ROUTE_EXCL_DAY_ID");



------------------------------------------------
-- DDL Statements for table "XSR     "."PMR_COUNTRY_ROUTE"
------------------------------------------------
 
 CREATE TABLE "XSR     "."PMR_COUNTRY_ROUTE"  (
		  "COUNTRY_ROUTE_ID" INTEGER NOT NULL , 
		  "RETAIN_COUNTRY_CODE" CHAR(3) , 
		  "PLATFORM_ID" INTEGER , 
		  "ORG_ID" INTEGER , 
		  "DESCRIPTION" VARGRAPHIC(256) , 
		  "GEO" VARCHAR(25) , 
		  "ORG" VARGRAPHIC(55) , 
		  "REGION" VARCHAR(25) , 
		  "QUEUE" VARGRAPHIC(6) NOT NULL , 
		  "CENTER" VARGRAPHIC(3) NOT NULL , 
		  "CREATE_USER" VARGRAPHIC(127) , 
		  "CREATE_DATETIME" TIMESTAMP NOT NULL , 
		  "UPDATE_USER" VARGRAPHIC(127) , 
		  "UPDATE_DATETIME" TIMESTAMP NOT NULL )   
		 IN "XSR1_DATA_01" INDEX IN "XSR1_INDX_01" ; 
-- DDL Statements for primary key on Table "XSR     "."PMR_COUNTRY_ROUTE"

ALTER TABLE "XSR     "."PMR_COUNTRY_ROUTE" 
	ADD CONSTRAINT "PMR_CNTRY_ROUTE_PK" PRIMARY KEY
		("COUNTRY_ROUTE_ID");



------------------------------------------------
-- DDL Statements for table "XSR     "."PMR_ENT_EXC_ROUTE"
------------------------------------------------
 
 CREATE TABLE "XSR     "."PMR_ENT_EXC_ROUTE"  (
		  "EXC_ROUTE_ID" INTEGER NOT NULL , 
		  "RETAIN_COUNTRY_CODE" CHAR(3) , 
		  "COMP_GROUP_ID" INTEGER , 
		  "PLATFORM_ID" INTEGER , 
		  "ORG_ID" INTEGER , 
		  "QUEUE" VARGRAPHIC(6) NOT NULL , 
		  "CENTER" VARGRAPHIC(3) NOT NULL , 
		  "CREATE_USER" VARGRAPHIC(127) , 
		  "CREATE_DATETIME" TIMESTAMP NOT NULL , 
		  "UPDATE_USER" VARGRAPHIC(127) , 
		  "UPDATE_DATETIME" TIMESTAMP NOT NULL )   
		 IN "XSR1_DATA_01" INDEX IN "XSR1_INDX_01" ; 
-- DDL Statements for primary key on Table "XSR     "."PMR_ENT_EXC_ROUTE"

ALTER TABLE "XSR     "."PMR_ENT_EXC_ROUTE" 
	ADD CONSTRAINT "PMR_ENT_EXC_RTE_PK" PRIMARY KEY
		("EXC_ROUTE_ID");



------------------------------------------------
-- DDL Statements for table "XSR     "."USER_PROD_FAVORITES"
------------------------------------------------
 
 CREATE TABLE "XSR     "."USER_PROD_FAVORITES"  (
		  "USER_ID" BIGINT NOT NULL , 
		  "PROD_ID" VARGRAPHIC(40) NOT NULL , 
		  "COMP_ID" VARCHAR(15) NOT NULL , 
		  "CREATE_USER" VARGRAPHIC(127) , 
		  "CREATE_DATETIME" TIMESTAMP NOT NULL WITH DEFAULT CURRENT TIMESTAMP , 
		  "UPDATE_USER" VARGRAPHIC(127) , 
		  "UPDATE_DATETIME" TIMESTAMP NOT NULL WITH DEFAULT CURRENT TIMESTAMP )   
		 IN "XSR1_DATA_01" INDEX IN "XSR1_INDX_01" ; 
COMMENT ON TABLE "XSR     "."USER_PROD_FAVORITES" IS 'PART OF THE XSR USER PROFILE THAT TRACKS THE LIST OF PRODUCTS THAT THE USERS HAS ADDED TO THEIR FAVORITES LIST.';


-- DDL Statements for primary key on Table "XSR     "."USER_PROD_FAVORITES"

ALTER TABLE "XSR     "."USER_PROD_FAVORITES" 
	ADD CONSTRAINT "USR_PROD_FAV_PK" PRIMARY KEY
		("USER_ID",
		 "PROD_ID",
		 "COMP_ID");



------------------------------------------------
-- DDL Statements for table "XSR     "."AVL_REQUEST_TYPE"
------------------------------------------------
 
 CREATE TABLE "XSR     "."AVL_REQUEST_TYPE"  (
		  "AVL_REQUEST_TYPE_ID" SMALLINT NOT NULL , 
		  "REQUEST_TYPE" VARCHAR(100) , 
		  "DESCRIPTION" VARCHAR(255) , 
		  "CREATE_USER" VARGRAPHIC(127) , 
		  "CREATE_DATETIME" TIMESTAMP NOT NULL WITH DEFAULT CURRENT TIMESTAMP , 
		  "UPDATE_USER" VARGRAPHIC(127) , 
		  "UPDATE_DATETIME" TIMESTAMP NOT NULL WITH DEFAULT CURRENT TIMESTAMP )   
		 IN "XSR1_DATA_01" INDEX IN "XSR1_INDX_01" ; 
COMMENT ON TABLE "XSR     "."AVL_REQUEST_TYPE" IS 'SYS109 XSR shall require the user to select the subtype of the request, from Software Defect  Support (SDS), Preventative Maintenance (PMA), Installation (INS), Software Usage Support (SUS), or Account Support Management (AMA).
';


-- DDL Statements for primary key on Table "XSR     "."AVL_REQUEST_TYPE"

ALTER TABLE "XSR     "."AVL_REQUEST_TYPE" 
	ADD CONSTRAINT "AVL_REQST_TYPE_PK" PRIMARY KEY
		("AVL_REQUEST_TYPE_ID");



------------------------------------------------
-- DDL Statements for table "XSR     "."TIME_ZONE"
------------------------------------------------
 
 CREATE TABLE "XSR     "."TIME_ZONE"  (
		  "TIME_ZONE_ID" VARCHAR(64) NOT NULL , 
		  "DESCRIPTION" VARGRAPHIC(256) , 
		  "CREATE_USER" VARGRAPHIC(127) , 
		  "CREATE_DATETIME" TIMESTAMP NOT NULL , 
		  "UPDATE_USER" VARGRAPHIC(127) , 
		  "UPDATE_DATETIME" TIMESTAMP NOT NULL )   
		 IN "XSR1_DATA_01" INDEX IN "XSR1_INDX_01" ; 

-- DDL Statements for primary key on Table "XSR     "."TIME_ZONE"

ALTER TABLE "XSR     "."TIME_ZONE" 
	ADD CONSTRAINT "TIME_ZONE_PK" PRIMARY KEY
		("TIME_ZONE_ID");



------------------------------------------------
-- DDL Statements for table "XSR     "."PMR_RETRY"
------------------------------------------------
 
 CREATE TABLE "XSR     "."PMR_RETRY"  (
		  "SRC_TRAN_ID" VARGRAPHIC(40) NOT NULL , 
		  "SRC_APPL" VARCHAR(40) NOT NULL , 
		  "SRC_NODE" VARCHAR(127) NOT NULL , 
		  "PMR_NUM" CHAR(7) , 
		  "BRANCH" CHAR(3) , 
		  "RETAIN_CNTRY_CODE" CHAR(3) , 
		  "RETRY_CNT" SMALLINT , 
		  "STAGE" INTEGER , 
		  "CREATE_USER" VARGRAPHIC(127) , 
		  "CREATE_DATETIME" TIMESTAMP NOT NULL WITH DEFAULT CURRENT TIMESTAMP , 
		  "UPDATE_USER" VARGRAPHIC(127) , 
		  "UPDATE_DATETIME" TIMESTAMP NOT NULL WITH DEFAULT CURRENT TIMESTAMP )   
		 IN "XSR1_DATA_01" INDEX IN "XSR1_INDX_01" ; 
COMMENT ON TABLE "XSR     "."PMR_RETRY" IS 'Used to persist PMRs that failed to make it to RETAIN.  These PMRs are dropped onto an MQ queue which continues to try and post the PMR to RETAIN for a configuable number of times before it gives up and writes logs an error.';

-- DDL Statements for primary key on Table "XSR     "."PMR_RETRY"

ALTER TABLE "XSR     "."PMR_RETRY" 
	ADD CONSTRAINT "PMR_RETRY_PK" PRIMARY KEY
		("SRC_TRAN_ID",
		 "SRC_APPL",
		 "SRC_NODE");



------------------------------------------------
-- DDL Statements for table "XSR     "."PMR_RETRY_TEXT"
------------------------------------------------
 
 CREATE TABLE "XSR     "."PMR_RETRY_TEXT"  (
		  "SRC_TRAN_ID" VARGRAPHIC(40) NOT NULL , 
		  "SRC_APPL" VARCHAR(40) NOT NULL , 
		  "SRC_NODE" VARCHAR(127) NOT NULL , 
		  "TEXT_BLOCK" VARGRAPHIC(15000) , 
		  "CREATE_USER" VARGRAPHIC(127) , 
		  "CREATE_DATETIME" TIMESTAMP NOT NULL WITH DEFAULT CURRENT TIMESTAMP , 
		  "UPDATE_USER" VARGRAPHIC(127) , 
		  "UPDATE_DATETIME" TIMESTAMP NOT NULL WITH DEFAULT CURRENT TIMESTAMP )   
		 IN "XSR1_DATA_PG32K" INDEX IN "XSR1_INDX_01" ; 
COMMENT ON TABLE "XSR     "."PMR_RETRY_TEXT" IS 'Contains text blocks associated to a  PMRs in retry state.';


-- DDL Statements for primary key on Table "XSR     "."PMR_RETRY_TEXT"

ALTER TABLE "XSR     "."PMR_RETRY_TEXT" 
	ADD CONSTRAINT "PMR_RETRY_TEXT_PK" PRIMARY KEY
		("SRC_TRAN_ID",
		 "SRC_APPL",
		 "SRC_NODE");



------------------------------------------------
-- DDL Statements for table "XSR     "."USER_PMR_RETRY_XREF"
------------------------------------------------
 
 CREATE TABLE "XSR     "."USER_PMR_RETRY_XREF"  (
		  "USER_ID" BIGINT NOT NULL , 
		  "SRC_TRAN_ID" VARGRAPHIC(40) NOT NULL , 
		  "SRC_APPL" VARCHAR(40) NOT NULL , 
		  "SRC_NODE" VARCHAR(127) NOT NULL , 
		  "COM_SRC_APPL" VARCHAR(40) , 
		  "CREATE_USER" VARGRAPHIC(127) , 
		  "CREATE_DATETIME" TIMESTAMP NOT NULL WITH DEFAULT CURRENT TIMESTAMP , 
		  "UPDATE_USER" VARGRAPHIC(127) , 
		  "UPDATE_DATETIME" TIMESTAMP NOT NULL WITH DEFAULT CURRENT TIMESTAMP )   
		 IN "XSR1_DATA_01" INDEX IN "XSR1_INDX_01" ; 
COMMENT ON TABLE "XSR     "."USER_PMR_RETRY_XREF" IS 'MAINTAINS RELEASE_LEVELATIONSHIP BETWEEN USERS AND PMR''S IN DRAFT STATE.';


-- DDL Statements for primary key on Table "XSR     "."USER_PMR_RETRY_XREF"

ALTER TABLE "XSR     "."USER_PMR_RETRY_XREF" 
	ADD CONSTRAINT "USR_PMR_RTY_X_PK" PRIMARY KEY
		("USER_ID",
		 "SRC_TRAN_ID",
		 "SRC_APPL",
		 "SRC_NODE");



------------------------------------------------
-- DDL Statements for table "XSR     "."PMR_DRAFT"
------------------------------------------------
 
 CREATE TABLE "XSR     "."PMR_DRAFT"  (
		  "SRC_TRAN_ID" VARGRAPHIC(40) NOT NULL , 
		  "SRC_APPL" VARCHAR(40) NOT NULL , 
		  "SRC_NODE" VARCHAR(127) NOT NULL , 
		  "PMR_NUM" CHAR(7) , 
		  "BRANCH" CHAR(3) , 
		  "RETAIN_CNTRY_CODE" CHAR(3) , 
		  "STATE" INTEGER , 
		  "CREATE_USER" VARGRAPHIC(127) , 
		  "CREATE_DATETIME" TIMESTAMP NOT NULL WITH DEFAULT CURRENT TIMESTAMP , 
		  "UPDATE_USER" VARGRAPHIC(127) , 
		  "UPDATE_DATETIME" TIMESTAMP NOT NULL WITH DEFAULT CURRENT TIMESTAMP )   
		 IN "XSR1_DATA_01" INDEX IN "XSR1_INDX_01" ; 
COMMENT ON TABLE "XSR     "."PMR_DRAFT" IS 'Primary PMR draft table used to capture PMRs in draft state.';

COMMENT ON COLUMN "XSR     "."PMR_DRAFT"."STATE" IS 'The state identifies the current state of a PMR. This is used to determine which set PMR tables
contains the PMR.  The data is distributed based on state to resolve possible contention.  0 - Normal,
1 - Draft, 2 - In-progress';

-- DDL Statements for primary key on Table "XSR     "."PMR_DRAFT"

ALTER TABLE "XSR     "."PMR_DRAFT" 
	ADD CONSTRAINT "PMR_DRAFT_PK" PRIMARY KEY
		("SRC_TRAN_ID",
		 "SRC_APPL",
		 "SRC_NODE");



------------------------------------------------
-- DDL Statements for table "XSR     "."USER_PMR_DRAFT_XREF"
------------------------------------------------
 
 CREATE TABLE "XSR     "."USER_PMR_DRAFT_XREF"  (
		  "USER_ID" BIGINT NOT NULL , 
		  "SRC_TRAN_ID" VARGRAPHIC(40) NOT NULL , 
		  "SRC_APPL" VARCHAR(40) NOT NULL , 
		  "SRC_NODE" VARCHAR(127) NOT NULL , 
		  "COM_SRC_APPL" VARCHAR(40) , 
		  "CREATE_USER" VARGRAPHIC(127) , 
		  "CREATE_DATETIME" TIMESTAMP NOT NULL WITH DEFAULT CURRENT TIMESTAMP , 
		  "UPDATE_USER" VARGRAPHIC(127) , 
		  "UPDATE_DATETIME" TIMESTAMP NOT NULL WITH DEFAULT CURRENT TIMESTAMP )   
		 IN "XSR1_DATA_01" INDEX IN "XSR1_INDX_01" ; 
COMMENT ON TABLE "XSR     "."USER_PMR_DRAFT_XREF" IS 'MAINTAINS RELEASE_LEVELATIONSHIP BETWEEN USERS AND PMR''S IN DRAFT STATE.';

-- DDL Statements for primary key on Table "XSR     "."USER_PMR_DRAFT_XREF"

ALTER TABLE "XSR     "."USER_PMR_DRAFT_XREF" 
	ADD CONSTRAINT "USR_PMR_DRFT_X_PK" PRIMARY KEY
		("USER_ID",
		 "SRC_TRAN_ID",
		 "SRC_APPL",
		 "SRC_NODE");



------------------------------------------------
-- DDL Statements for table "XSR     "."PMR_SIG_LINES"
------------------------------------------------
 
 CREATE TABLE "XSR     "."PMR_SIG_LINES"  (
		  "SRC_TRAN_ID" VARGRAPHIC(40) NOT NULL , 
		  "SRC_APPL" VARCHAR(40) NOT NULL , 
		  "SRC_NODE" VARCHAR(127) NOT NULL , 
		  "SIG_LINE_NUM" SMALLINT NOT NULL , 
		  "SIG_LINE" VARCHAR(72) NOT NULL , 
		  "PMR_ACTION" CHAR(3) , 
		  "PMR_ACTION_DATETIME" TIMESTAMP , 
		  "CREATE_USER" VARGRAPHIC(127) , 
		  "CREATE_DATETIME" TIMESTAMP NOT NULL WITH DEFAULT CURRENT TIMESTAMP , 
		  "UPDATE_USER" VARGRAPHIC(127) , 
		  "UPDATE_DATETIME" TIMESTAMP NOT NULL WITH DEFAULT CURRENT TIMESTAMP )   
		 IN "XSR1_DATA_01" INDEX IN "XSR1_INDX_01" ; 
COMMENT ON TABLE "XSR     "."PMR_SIG_LINES" IS 'Maintains signature lines associated to an active PMR.';


-- DDL Statements for primary key on Table "XSR     "."PMR_SIG_LINES"

ALTER TABLE "XSR     "."PMR_SIG_LINES" 
	ADD CONSTRAINT "PMR_SIG_LN_PK" PRIMARY KEY
		("SRC_TRAN_ID",
		 "SRC_APPL",
		 "SRC_NODE",
		 "SIG_LINE_NUM");



------------------------------------------------
-- DDL Statements for table "XSR     "."USER_PMR_XREF"
------------------------------------------------
 
 CREATE TABLE "XSR     "."USER_PMR_XREF"  (
		  "USER_ID" BIGINT NOT NULL , 
		  "SRC_TRAN_ID" VARGRAPHIC(40) NOT NULL , 
		  "SRC_APPL" VARCHAR(40) NOT NULL , 
		  "SRC_NODE" VARCHAR(127) NOT NULL , 
		  "COM_SRC_APPL" VARCHAR(40) , 
		  "CREATE_USER" VARGRAPHIC(127) , 
		  "CREATE_DATETIME" TIMESTAMP NOT NULL WITH DEFAULT CURRENT TIMESTAMP , 
		  "UPDATE_USER" VARGRAPHIC(127) , 
		  "UPDATE_DATETIME" TIMESTAMP NOT NULL WITH DEFAULT CURRENT TIMESTAMP )   
		 IN "XSR1_DATA_01" INDEX IN "XSR1_INDX_01" ; 
COMMENT ON TABLE "XSR     "."USER_PMR_XREF" IS 'MAINTAINS RELEASE_LEVELATIONSHIP BETWEEN USERS AND PMR''S IN DRAFT STATE.';

-- DDL Statements for primary key on Table "XSR     "."USER_PMR_XREF"

ALTER TABLE "XSR     "."USER_PMR_XREF" 
	ADD CONSTRAINT "USR_PMR_XREF_PK" PRIMARY KEY
		("USER_ID",
		 "SRC_TRAN_ID",
		 "SRC_APPL",
		 "SRC_NODE");



------------------------------------------------
-- DDL Statements for table "XSR     "."PMR_LOG"
------------------------------------------------
 
 CREATE TABLE "XSR     "."PMR_LOG"  (
		  "SRC_TRAN_ID" VARGRAPHIC(40) , 
		  "SRC_APPL" VARCHAR(40) , 
		  "SRC_NODE" VARCHAR(127) , 
		  "PMR_NUM" CHAR(7) , 
		  "BRANCH" CHAR(3) , 
		  "RETAIN_CNTRY_CODE" CHAR(3) , 
		  "CONTACT_ID" BIGINT , 
		  "ESR_CONTACT_ID" VARGRAPHIC(128) , 
		  "RETAIN_STATUS" VARCHAR(10) , 
		  "WOPR_STATUS" VARCHAR(10) , 
		  "PMR_CREATE_DATE" VARCHAR(15) , 
		  "QUEUE_METHOD" VARCHAR(32) , 
		  "EMM_REQUEST" VARCHAR(32) , 
		  "QUEUE" VARGRAPHIC(6) , 
		  "CENTER" VARGRAPHIC(3) , 
		  "PRIORITY_PG" VARGRAPHIC(3) , 
		  "SEVERITY" VARCHAR(1) , 
		  "PRIORITY" VARCHAR(1) , 
		  "COMP_ID" VARCHAR(15) , 
		  "SUPPORT_LEVEL" VARCHAR(1) , 
		  "LOG_TEXT" VARCHAR(4096) , 
		  "LOCALE" VARCHAR(10) , 
		  "COMM_METHOD" VARCHAR(64) , 
		  "SDI_PORT" INTEGER , 
		  "SDI_IP" VARCHAR(20) , 
		  "ROUTE_REASON" VARGRAPHIC(256) , 
		  "ROUTE_TYPE" VARCHAR(35) , 
		  "NODE" VARCHAR(20) , 
		  "STAGE_TIME_1" INTEGER , 
		  "STAGE_TIME_2" INTEGER , 
		  "STAGE_TIME_3" INTEGER , 
		  "STAGE_TIME_4" INTEGER , 
		  "STAGE_TIME_5" INTEGER , 
		  "STAGE_TIME_6" INTEGER , 
		  "STAGE_TIME_7" INTEGER , 
		  "STAGE_TIME_8" INTEGER , 
		  "STAGE_TIME_9" INTEGER , 
		  "STAGE_TIME_10" INTEGER , 
		  "STAGE_TIME_11" INTEGER , 
		  "STAGE_TIME_12" INTEGER , 
		  "STAGE_TIME_13" INTEGER , 
		  "STAGE_TIME_14" INTEGER , 
		  "STAGE_TIME_15" INTEGER , 
		  "CREATE_USER" VARGRAPHIC(128) , 
		  "CREATE_DATETIME" TIMESTAMP WITH DEFAULT CURRENT TIMESTAMP , 
		  "UPDATE_USER" VARGRAPHIC(128) , 
		  "UPDATE_DATETIME" TIMESTAMP WITH DEFAULT CURRENT TIMESTAMP )   
		 IN "XSR1_LOG_PG16K" INDEX IN "XSR1_LOG_INDX_01" ; 
COMMENT ON TABLE "XSR     "."PMR_LOG" IS 'Logs activity on PMRs.';




------------------------------------------------
-- DDL Statements for table "XSR     "."RIGHT_OBJ"
------------------------------------------------
 
 CREATE TABLE "XSR     "."RIGHT_OBJ"  (
		  "USER_ID" BIGINT NOT NULL , 
		  "OBJ_TYPE_ID" INTEGER NOT NULL , 
		  "OBJ_ID" VARGRAPHIC(40) NOT NULL , 
		  "CREATE_USER" VARGRAPHIC(127) , 
		  "CREATE_DATETIME" TIMESTAMP NOT NULL WITH DEFAULT CURRENT TIMESTAMP , 
		  "UPDATE_USER" VARGRAPHIC(127) , 
		  "UPDATE_DATETIME" TIMESTAMP NOT NULL WITH DEFAULT CURRENT TIMESTAMP )   
		 IN "XSR1_DATA_01" INDEX IN "XSR1_INDX_01" ; 
COMMENT ON TABLE "XSR     "."RIGHT_OBJ" IS 'Used for user authorization functionality.  The mapping between customer and caller type (spprt_cnt_id <-> obj_type_id)';


-- DDL Statements for primary key on Table "XSR     "."RIGHT_OBJ"

ALTER TABLE "XSR     "."RIGHT_OBJ" 
	ADD CONSTRAINT "RIGHT_OBJ_PK" PRIMARY KEY
		("OBJ_TYPE_ID",
		 "OBJ_ID",
		 "USER_ID");



------------------------------------------------
-- DDL Statements for table "XSR     "."PMR_TEXT"
------------------------------------------------
 
 CREATE TABLE "XSR     "."PMR_TEXT"  (
		  "PMR_TEXT_ID" BIGINT NOT NULL , 
		  "SRC_TRAN_ID" VARGRAPHIC(40) NOT NULL , 
		  "SRC_APPL" VARCHAR(40) NOT NULL , 
		  "SRC_NODE" VARCHAR(127) NOT NULL , 
		  "SIG_LINE" VARCHAR(72) , 
		  "TEXT_BLOCK" VARGRAPHIC(15000) , 
		  "CREATE_USER" VARGRAPHIC(127) , 
		  "CREATE_DATETIME" TIMESTAMP NOT NULL WITH DEFAULT CURRENT TIMESTAMP , 
		  "UPDATE_USER" VARGRAPHIC(127) , 
		  "UPDATE_DATETIME" TIMESTAMP NOT NULL WITH DEFAULT CURRENT TIMESTAMP )   
		 IN "XSR1_DATA_PG32K" INDEX IN "XSR1_INDX_01" ; 

-- DDL Statements for primary key on Table "XSR     "."PMR_TEXT"

ALTER TABLE "XSR     "."PMR_TEXT" 
	ADD CONSTRAINT "PMR_TEXT_PK" PRIMARY KEY
		("PMR_TEXT_ID");

------------------------------------------------
-- DDL Statements for table "XSR     "."APPL_AUTH"
------------------------------------------------
CREATE TABLE xsr.appl_auth (
      admin_rights_id INTEGER NOT NULL,
      action_name VARCHAR(64) NOT NULL,
      user_type VARCHAR(32) NOT NULL,
      create_user VARGRAPHIC(127),
      create_datetime TIMESTAMP NOT NULL,
      update_user VARGRAPHIC(127),
      update_datetime TIMESTAMP NOT NULL
   )
   DATA CAPTURE NONE
   IN XSR1_DATA_01 INDEX IN XSR1_INDX_01;
   
ALTER TABLE xsr.appl_auth ADD CONSTRAINT appl_auth_pk PRIMARY KEY (admin_rights_id, action_name, user_type);

------------------------------------------------
-- DDL Statements for table "XSR     "."ADMIN_AUTH"
------------------------------------------------
 
 CREATE TABLE "XSR     "."ADMIN_AUTH"  (
		  "BLUEGROUP" VARCHAR(32) NOT NULL , 
		  "ADMIN_RIGHTS_ID" INTEGER NOT NULL , 
		  "CREATE_USER" VARGRAPHIC(127) , 
		  "CREATE_DATETIME" TIMESTAMP NOT NULL WITH DEFAULT CURRENT TIMESTAMP , 
		  "UPDATE_USER" VARGRAPHIC(127) , 
		  "UPDATE_DATETIME" TIMESTAMP NOT NULL WITH DEFAULT CURRENT TIMESTAMP )   
		 IN "XSR1_DATA_01" INDEX IN "XSR1_INDX_01" ; 

-- DDL Statements for primary key on Table "XSR     "."ADMIN_AUTH"

ALTER TABLE "XSR     "."ADMIN_AUTH" 
	ADD CONSTRAINT "ADMIN_AUTH_PK" PRIMARY KEY
		("BLUEGROUP",
		 "ADMIN_RIGHTS_ID");



------------------------------------------------
-- DDL Statements for table "XSR     "."ADMIN_RIGHTS"
------------------------------------------------
 
 CREATE TABLE "XSR     "."ADMIN_RIGHTS"  (
		  "ADMIN_RIGHTS_ID" INTEGER NOT NULL , 
		  "APP_ID" INTEGER NOT NULL , 
		  "RIGHT" VARCHAR(64) NOT NULL , 
		  "DESCRIPTION" VARCHAR(80) , 
		  "CREATE_USER" VARGRAPHIC(127) , 
		  "CREATE_DATETIME" TIMESTAMP NOT NULL WITH DEFAULT CURRENT TIMESTAMP , 
		  "UPDATE_USER" VARGRAPHIC(127) , 
		  "UPDATE_DATETIME" TIMESTAMP NOT NULL WITH DEFAULT CURRENT TIMESTAMP )   
		 IN "XSR1_DATA_01" INDEX IN "XSR1_INDX_01" ; 

-- DDL Statements for primary key on Table "XSR     "."ADMIN_RIGHTS"

ALTER TABLE "XSR     "."ADMIN_RIGHTS" 
	ADD CONSTRAINT "ADMIN_RIGHTS_PK" PRIMARY KEY
		("ADMIN_RIGHTS_ID");


-- DDL Statements for unique constraints on Table "XSR     "."ADMIN_RIGHTS"

ALTER TABLE "XSR     "."ADMIN_RIGHTS" 
	ADD CONSTRAINT "ADMIN_RIGHT_UC" UNIQUE
		("APP_ID",
		 "RIGHT");


------------------------------------------------
-- DDL Statements for table "XSR     "."PMR_COUNTRY_ORG_CONFIG"
------------------------------------------------
 
 CREATE TABLE "XSR     "."PMR_COUNTRY_ORG_CONFIG"  (
		  "ORG_ID" INTEGER NOT NULL , 
		  "ISO_CNTRY_CODE_2" CHAR(2) NOT NULL , 
		  "ALLOW_ATTACHMENTS" SMALLINT , 
		  "ALLOW_SEV1" SMALLINT , 
		  "CREATE_USER" VARGRAPHIC(127) , 
		  "CREATE_DATETIME" TIMESTAMP NOT NULL WITH DEFAULT CURRENT TIMESTAMP , 
		  "UPDATE_USER" VARGRAPHIC(127) , 
		  "UPDATE_DATETIME" TIMESTAMP NOT NULL WITH DEFAULT CURRENT TIMESTAMP )   
		 IN "XSR1_DATA_01" INDEX IN "XSR1_INDX_01" ; 
COMMENT ON TABLE "XSR     "."PMR_COUNTRY_ORG_CONFIG" IS 'Holds configuration parameters associated to PMRs by country and organization.';


-- DDL Statements for primary key on Table "XSR     "."PMR_COUNTRY_ORG_CONFIG"

ALTER TABLE "XSR     "."PMR_COUNTRY_ORG_CONFIG" 
	ADD CONSTRAINT "PMR_CTRYORGCFG_PK" PRIMARY KEY
		("ISO_CNTRY_CODE_2",
		 "ORG_ID");



------------------------------------------------
-- DDL Statements for table "XSR     "."PMR_DRAFT_LOG"
------------------------------------------------
 
 CREATE TABLE "XSR     "."PMR_DRAFT_LOG"  (
		  "SRC_TRAN_ID" VARGRAPHIC(40) NOT NULL , 
		  "SRC_APPL" VARCHAR(40) NOT NULL , 
		  "SRC_NODE" VARCHAR(127) NOT NULL , 
		  "PMR_NUM" CHAR(7) , 
		  "BRANCH" CHAR(3) , 
		  "RETAIN_CNTRY_CODE" CHAR(3) , 
		  "STATE" INTEGER , 
		  "CREATE_USER" VARGRAPHIC(127) , 
		  "CREATE_DATETIME" TIMESTAMP NOT NULL WITH DEFAULT CURRENT TIMESTAMP , 
		  "UPDATE_USER" VARGRAPHIC(127) , 
		  "UPDATE_DATETIME" TIMESTAMP NOT NULL WITH DEFAULT CURRENT TIMESTAMP , 
		  "ACTION_FLAG" CHAR(1) )   
		 IN "XSR1_LOG_01" INDEX IN "XSR1_LOG_INDX_01" ; 
COMMENT ON TABLE "XSR     "."PMR_DRAFT_LOG" IS 'Log of activity against draft PMRs.';




------------------------------------------------
-- DDL Statements for table "XSR     "."RIGHT_OBJ_LOG"
------------------------------------------------
 
 CREATE TABLE "XSR     "."RIGHT_OBJ_LOG"  (
		  "USER_ID" BIGINT NOT NULL , 
		  "OBJ_TYPE_ID" INTEGER NOT NULL , 
		  "OBJ_ID" VARGRAPHIC(40) NOT NULL , 
		  "CREATE_USER" VARGRAPHIC(127) , 
		  "CREATE_DATETIME" TIMESTAMP NOT NULL WITH DEFAULT CURRENT TIMESTAMP , 
		  "UPDATE_USER" VARGRAPHIC(127) , 
		  "UPDATE_DATETIME" TIMESTAMP NOT NULL WITH DEFAULT CURRENT TIMESTAMP , 
		  "ACTION_FLAG" CHAR(1) )   
		 IN "XSR1_LOG_01" INDEX IN "XSR1_LOG_INDX_01" ; 



------------------------------------------------
-- DDL Statements for table "XSR     "."MSG_LOG"
------------------------------------------------
 
 CREATE TABLE "XSR     "."MSG_LOG"  (
		  "TRAN_ID" VARGRAPHIC(40) NOT NULL , 
		  "MSG_TMPL_ID" VARGRAPHIC(40) NOT NULL , 
		  "LOCALE" VARCHAR(10) NOT NULL , 
		  "SRC_APPL" VARCHAR(40) , 
		  "TO" VARCHAR(2048) , 
		  "FROM" VARCHAR(400) , 
		  "CC" VARCHAR(1024) , 
		  "BCC" VARCHAR(1024) , 
		  "SUBJECT" VARCHAR(100) , 
		  "REASON" VARCHAR(1024) , 
		  "PMR_NUM" CHAR(7) , 
		  "BRANCH" CHAR(3) , 
		  "RETAIN_CNTRY_CODE" CHAR(3) , 
		  "PMR_TEXT_IDS" VARCHAR(2048) , 
		  "SHORT_DESCRIPTION" VARGRAPHIC(1024) , 
		  "CREATE_USER" VARGRAPHIC(127) , 
		  "CREATE_DATETIME" TIMESTAMP NOT NULL WITH DEFAULT CURRENT TIMESTAMP , 
		  "UPDATE_USER" VARGRAPHIC(127) , 
		  "UPDATE_DATETIME" TIMESTAMP NOT NULL WITH DEFAULT CURRENT TIMESTAMP , 
		  "CONTACT_ID" VARGRAPHIC(127) , 
		  "CUST_NAME" VARGRAPHIC(100) , 
		  "SRC_SUPPORT_ID" VARGRAPHIC(40) , 
		  "CALLER_TYPE_DESCRIPTION" VARGRAPHIC(40) , 
		  "CALLER_STAT_DESCRIPTION" VARGRAPHIC(40) , 
		  "STC_QUES_TXT" VARGRAPHIC(256) , 
		  "FIRST_NAME" VARGRAPHIC(40) , 
		  "LAST_NAME" VARGRAPHIC(40) , 
		  "EMAIL_ADR" VARGRAPHIC(127) , 
		  "IBM_CUST_NUM" CHAR(7) , 
		  "ENCRYPT_STRING" VARGRAPHIC(128) , 
		  "PSTC_EMAIL_ADR" VARGRAPHIC(127) , 
		  "NOMINATION_CONTACT_ID" VARGRAPHIC(40) , 
		  "SUBJECTLINE" VARGRAPHIC(128) , 
		  "SRC_NODE" VARGRAPHIC(127) , 
		  "SRC_TRAN_ID" VARGRAPHIC(40) , 
		  "BP_FIRST_NAME" VARGRAPHIC(40) , 
		  "BP_LAST_NAME" VARGRAPHIC(40) , 
		  "BP_CITY" VARGRAPHIC(40) , 
		  "BP_COMPANY_NAME" VARGRAPHIC(100) , 
		  "ACTION_FLAG" CHAR(1) )   
		 IN "XSR1_LOG_PG16K" INDEX IN "XSR1_LOG_INDX_01" ; 
COMMENT ON TABLE "XSR     "."MSG_LOG" IS 'Log table for notification and other types of outbound messages sent by the XSR application.';

-- DDL Statements for primary key on Table "XSR     "."MSG_LOG"

ALTER TABLE "XSR     "."MSG_LOG" 
	ADD CONSTRAINT "MSG_LOG_PK" PRIMARY KEY
		("TRAN_ID");



------------------------------------------------
-- DDL Statements for table "XSR     "."PMR_SYNC"
------------------------------------------------
 
 CREATE TABLE "XSR     "."PMR_SYNC"  (
		  "SYNC_ID" INTEGER NOT NULL , 
		  "PMR_NUM" CHAR(7) NOT NULL , 
		  "BRANCH" CHAR(3) NOT NULL , 
		  "RETAIN_CNTRY_CODE" CHAR(3) NOT NULL , 
		  "CREATE_USER" VARGRAPHIC(127) , 
		  "CREATE_DATETIME" TIMESTAMP NOT NULL , 
		  "UPDATE_USER" VARGRAPHIC(127) , 
		  "UPDATE_DATETIME" TIMESTAMP NOT NULL )   
		 IN "XSR1_DATA_01" INDEX IN "XSR1_INDX_01" ; 

-- DDL Statements for primary key on Table "XSR     "."PMR_SYNC"

ALTER TABLE "XSR     "."PMR_SYNC" 
	ADD CONSTRAINT "PMR_SYNC_PK" PRIMARY KEY
		("SYNC_ID");



------------------------------------------------
-- DDL Statements for table "XSR     "."BP_SITE_PMR_XREF"
------------------------------------------------
 
 CREATE TABLE "XSR     "."BP_SITE_PMR_XREF"  (
		  "BP_SITE_ID" INTEGER NOT NULL , 
		  "SUPPORT_ID" BIGINT NOT NULL , 
		  "SRC_TRAN_ID" VARGRAPHIC(40) NOT NULL , 
		  "SRC_APPL" VARCHAR(40) NOT NULL , 
		  "SRC_NODE" VARCHAR(127) NOT NULL , 
		  "SUPPORT_RELATIONSHIP_TYPE" SMALLINT NOT NULL , 
		  "CREATE_USER" VARGRAPHIC(127) , 
		  "CREATE_DATETIME" TIMESTAMP NOT NULL WITH DEFAULT CURRENT TIMESTAMP , 
		  "UPDATE_USER" VARGRAPHIC(127) , 
		  "UPDATE_DATETIME" TIMESTAMP NOT NULL WITH DEFAULT CURRENT TIMESTAMP )   
		 IN "XSR1_DATA_01" INDEX IN "XSR1_INDX_01" ; 
COMMENT ON TABLE "XSR     "."BP_SITE_PMR_XREF" IS 'CROSS REFERENCE TABLE IDENTIFYING BUSINESS PARTNERS AND THEIR CURRENT PMRS.';


-- DDL Statements for primary key on Table "XSR     "."BP_SITE_PMR_XREF"

ALTER TABLE "XSR     "."BP_SITE_PMR_XREF" 
	ADD CONSTRAINT "BP_PMR_XREF_PK" PRIMARY KEY
		("BP_SITE_ID",
		 "SUPPORT_ID",
		 "SRC_TRAN_ID",
		 "SRC_APPL",
		 "SRC_NODE");



------------------------------------------------
-- DDL Statements for table "XSR     "."BP_SITE_PMR_RETRY_XREF"
------------------------------------------------
 
 CREATE TABLE "XSR     "."BP_SITE_PMR_RETRY_XREF"  (
		  "BP_SITE_ID" INTEGER NOT NULL , 
		  "SUPPORT_ID" BIGINT NOT NULL , 
		  "SRC_TRAN_ID" VARGRAPHIC(40) NOT NULL , 
		  "SRC_APPL" VARCHAR(40) NOT NULL , 
		  "SRC_NODE" VARCHAR(127) NOT NULL , 
		  "ACTION" CHAR(1) NOT NULL , 
		  "SUPPORT_RELATIONSHIP_TYPE" SMALLINT , 
		  "CREATE_USER" VARGRAPHIC(127) , 
		  "CREATE_DATETIME" TIMESTAMP NOT NULL WITH DEFAULT CURRENT TIMESTAMP , 
		  "UPDATE_USER" VARGRAPHIC(127) , 
		  "UPDATE_DATETIME" TIMESTAMP NOT NULL WITH DEFAULT CURRENT TIMESTAMP )   
		 IN "XSR1_DATA_01" INDEX IN "XSR1_INDX_01" ; 
COMMENT ON TABLE "XSR     "."BP_SITE_PMR_RETRY_XREF" IS 'CROSS REFERENCE TABLE IDENTIFYING BUSINESS PARTNERS AND THEIR PMRS IN RETRY STATUS.';


-- DDL Statements for primary key on Table "XSR     "."BP_SITE_PMR_RETRY_XREF"

ALTER TABLE "XSR     "."BP_SITE_PMR_RETRY_XREF" 
	ADD CONSTRAINT "BP_PMR_RETRY_X_PK" PRIMARY KEY
		("BP_SITE_ID",
		 "SUPPORT_ID",
		 "SRC_TRAN_ID",
		 "SRC_APPL",
		 "SRC_NODE");



------------------------------------------------
-- DDL Statements for table "XSR     "."PMR_RETAIN_INFO"
------------------------------------------------
 
 CREATE TABLE "XSR     "."PMR_RETAIN_INFO"  (
		  "SRC_TRAN_ID" VARGRAPHIC(40) NOT NULL , 
		  "SRC_APPL" VARCHAR(40) NOT NULL , 
		  "SRC_NODE" VARCHAR(127) NOT NULL , 
		  "SW_HD" CHAR(1) , 
		  "RETAIN_NODE" VARCHAR(6) , 
		  "STATUS" CHAR(7) , 
		  "RETAIN_CALLER_TYPE" CHAR(1) , 
		  "IBM_CUST_NUM" VARCHAR(8) , 
		  "CUST_NAME_NLS" VARGRAPHIC(28) , 
		  "CONTACT_NAME_NLS" VARGRAPHIC(30) , 
		  "PHONE_NUM" VARGRAPHIC(40) , 
		  "PHONE_EXT" VARGRAPHIC(40) , 
		  "ALT_PHONE_NUM" VARGRAPHIC(40) , 
		  "ALT_PHONE_EXT" VARGRAPHIC(40) , 
		  "SUPPORT_LEVEL" CHAR(1) , 
		  "QUEUE" CHAR(6) , 
		  "CENTER" CHAR(3) , 
		  "NEXT_QUEUE" CHAR(6) , 
		  "NEXT_CENTER" CHAR(3) , 
		  "REQUEST_TYPE_ID" SMALLINT , 
		  "PROD_ID" VARCHAR(40) NOT NULL , 
		  "PROD_ID_VERSION" VARCHAR(8) , 
		  "COMP_ID" VARCHAR(15) NOT NULL , 
		  "COMP_ID_RELEASE" VARCHAR(3) , 
		  "RELEASE_LEVEL" VARCHAR(3) , 
		  "SEVERITY" CHAR(1) , 
		  "SYSTEM_DOWN" CHAR(1) , 
		  "APAR_NUM" CHAR(7) , 
		  "PRIORITY_PG" CHAR(3) , 
		  "CALL_CAT" CHAR(3) , 
		  "CUPRIMD" CHAR(1) , 
		  "PMR_CREATE_DATE" VARCHAR(15) , 
		  "PMR_UPDATE_DATE" VARCHAR(15) , 
		  "PMR_UPDATE_TIME" VARCHAR(15) , 
		  "CREATE_USER" VARGRAPHIC(127) , 
		  "CREATE_DATETIME" TIMESTAMP NOT NULL WITH DEFAULT CURRENT TIMESTAMP , 
		  "UPDATE_USER" VARGRAPHIC(127) , 
		  "UPDATE_DATETIME" TIMESTAMP NOT NULL WITH DEFAULT CURRENT TIMESTAMP )   
		 IN "XSR1_DATA_01" INDEX IN "XSR1_INDX_01" ; 
COMMENT ON TABLE "XSR     "."PMR_RETAIN_INFO" IS 'Contains RETAIN specific information associated to a PMR.';

COMMENT ON COLUMN "XSR     "."PMR_RETAIN_INFO"."ALT_PHONE_NUM" IS 'CONTACT''S PHONE NUMBER';

COMMENT ON COLUMN "XSR     "."PMR_RETAIN_INFO"."APAR_NUM" IS 'APAR ASSOCIATED WITH THE PMR (IF IT EXISTS)';

COMMENT ON COLUMN "XSR     "."PMR_RETAIN_INFO"."CALL_CAT" IS 'CALL CATEGORY. USED ON CREATE (PMCE)  AND UPATE (PMCE).';

COMMENT ON COLUMN "XSR     "."PMR_RETAIN_INFO"."CENTER" IS 'CENTER THAT IS PAIRED WITH QUEUE';

COMMENT ON COLUMN "XSR     "."PMR_RETAIN_INFO"."COMP_ID" IS 'COMPONENT ID THIS PMR IS ABOUT';

COMMENT ON COLUMN "XSR     "."PMR_RETAIN_INFO"."CUPRIMD" IS 'METRICS FIELD HAVING TO DO WITH SOLUTION GIVEN.';

COMMENT ON COLUMN "XSR     "."PMR_RETAIN_INFO"."CUST_NAME_NLS" IS 'THE COMPANY NAME OF THE CUSTOMER';

COMMENT ON COLUMN "XSR     "."PMR_RETAIN_INFO"."PHONE_NUM" IS 'COMPANY PHONE NUMBER.  THIS ONE IS NOT USED TO CALL THE PERSON BACK';

COMMENT ON COLUMN "XSR     "."PMR_RETAIN_INFO"."PMR_CREATE_DATE" IS 'Date PMR was created.  If the service requrest was created in xSR then this date and the create_date should be the same.  But, for those service request that were created by phone os some other means then this date will be the actual';

COMMENT ON COLUMN "XSR     "."PMR_RETAIN_INFO"."PMR_UPDATE_DATE" IS 'LAST DATE THE PMR WAS UPDATED IN RETAIN.  THIS DATE COULD VARY FROM THE UPDATE_DATETIME STORED IN XSR BECAUSE XSR DATABASE ONLY TRACKS ACTIVITY WITHIN THE XSR APPLICATION.  THE RECORD COULD HAVE BEEN UPDATED IN RETAIN.
';

COMMENT ON COLUMN "XSR     "."PMR_RETAIN_INFO"."PRIORITY_PG" IS 'PRI-PAGE.  PRIORITY PAGE IS BASCIALLY THE NUMBER OF THE CALL ON A QUEUE.  IF A CALL IS THE SECOND PRIORITY 3 CALL ON A QUEUE THE PRI-PAGE IS 302.  THIS IS LINKED WITH THE QUEUE, CENTER FIELDS.';

COMMENT ON COLUMN "XSR     "."PMR_RETAIN_INFO"."PROD_ID" IS 'FK TO CAM IDENTIFYING THE PRODUCT THE PMR IS OPENED UNDER.';

COMMENT ON COLUMN "XSR     "."PMR_RETAIN_INFO"."QUEUE" IS 'QUEUE THE PMR IS CURRENTLY ON - OR THE QUEUE THE PMR WAS ON LAST OF THERE ARE NO CALLS ON THE PMR.';

COMMENT ON COLUMN "XSR     "."PMR_RETAIN_INFO"."RELEASE_LEVEL" IS 'RELEASE_LEVELEASE LEVEL.';

COMMENT ON COLUMN "XSR     "."PMR_RETAIN_INFO"."RETAIN_NODE" IS 'THE NODE THAT IS THE SOURCE FOR THE PMR RECORD.  RS4 OR BDC.';

COMMENT ON COLUMN "XSR     "."PMR_RETAIN_INFO"."SEVERITY" IS 'PMR SEVERITY.';

COMMENT ON COLUMN "XSR     "."PMR_RETAIN_INFO"."STATUS" IS 'RETAIN FIELD: THE CURRENT STATUS - OPEN, CLOSED, ETC.';

COMMENT ON COLUMN "XSR     "."PMR_RETAIN_INFO"."SUPPORT_LEVEL" IS 'THIS IS ALWAYS A ''1';

COMMENT ON COLUMN "XSR     "."PMR_RETAIN_INFO"."SW_HD" IS 'THE TYPE OF PMR - SOFTWARE OR HARDWARE FOR NOW, ALWAYS DEFAULT TO S FOR SOFTWARE.';

COMMENT ON COLUMN "XSR     "."PMR_RETAIN_INFO"."SYSTEM_DOWN" IS 'INDICATES THAT A SYSTEM IS DOWN FOR A CUSTOMER.';

-- DDL Statements for primary key on Table "XSR     "."PMR_RETAIN_INFO"

ALTER TABLE "XSR     "."PMR_RETAIN_INFO" 
	ADD CONSTRAINT "PMR_HEADER_RI_PK" PRIMARY KEY
		("SRC_TRAN_ID",
		 "SRC_APPL",
		 "SRC_NODE");



------------------------------------------------
-- DDL Statements for table "XSR     "."PMR_RETRY_RETAIN_INFO"
------------------------------------------------
 
 CREATE TABLE "XSR     "."PMR_RETRY_RETAIN_INFO"  (
		  "SRC_TRAN_ID" VARGRAPHIC(40) NOT NULL , 
		  "SRC_APPL" VARCHAR(40) NOT NULL , 
		  "SRC_NODE" VARCHAR(127) NOT NULL , 
		  "SW_HD" CHAR(1) , 
		  "RETAIN_NODE" VARCHAR(6) , 
		  "STATUS" CHAR(7) , 
		  "RETAIN_CALLER_TYPE" CHAR(1) , 
		  "IBM_CUST_NUM" VARCHAR(8) , 
		  "CUST_NAME_NLS" VARGRAPHIC(28) , 
		  "CONTACT_NAME_NLS" VARGRAPHIC(30) , 
		  "SUPPORT_LEVEL" CHAR(1) , 
		  "QUEUE" CHAR(1) , 
		  "CENTER" CHAR(3) , 
		  "NEXT_QUEUE" CHAR(6) , 
		  "NEXT_CENTER" CHAR(3) , 
		  "REQUEST_TYPE_ID" SMALLINT , 
		  "PROD_ID" VARCHAR(40) NOT NULL , 
		  "PROD_ID_VERSION" VARCHAR(8) , 
		  "COMP_ID" VARCHAR(15) NOT NULL , 
		  "COMP_ID_RELEASE" VARCHAR(3) , 
		  "SEVERITY" CHAR(1) , 
		  "SYSTEM_DOWN" CHAR(1) , 
		  "CALL_CAT" CHAR(3) , 
		  "PMR_CREATE_DATE" VARCHAR(15) , 
		  "PMR_UPDATE_DATE" VARCHAR(15) , 
		  "PMR_UPDATE_TIME" VARCHAR(15) , 
		  "FIRST_NAME" VARGRAPHIC(40) , 
		  "LAST_NAME" VARGRAPHIC(40) , 
		  "PHONE_NUM" VARGRAPHIC(40) , 
		  "PHONE_EXT" VARGRAPHIC(40) , 
		  "ALT_PHONE_NUM" VARGRAPHIC(40) , 
		  "ALT_PHONE_EXT" VARGRAPHIC(40) , 
		  "FAX_NUM" VARGRAPHIC(40) , 
		  "PAGER" VARGRAPHIC(30) , 
		  "EMAIL_ADR" VARGRAPHIC(127) , 
		  "ALT_EMAIL_ADDRESS" VARGRAPHIC(127) , 
		  "SUBMIT_TYPE" VARCHAR(24) , 
		  "RESP_TYPE" VARCHAR(256) , 
		  "PRIORITY" CHAR(1) , 
		  "SIGNATURE_NAME" VARCHAR(222) , 
		  "CREATE_USER" VARGRAPHIC(128) , 
		  "CREATE_DATETIME" TIMESTAMP WITH DEFAULT CURRENT TIMESTAMP , 
		  "UPDATE_USER" VARGRAPHIC(128) , 
		  "UPDATE_DATETIME" TIMESTAMP WITH DEFAULT CURRENT TIMESTAMP )   
		 IN "XSR1_DATA_01" INDEX IN "XSR1_INDX_01" ; 
COMMENT ON TABLE "XSR     "."PMR_RETRY_RETAIN_INFO" IS 'Contains RETAIN specific information associated to a PMR in retry state.';

COMMENT ON COLUMN "XSR     "."PMR_RETRY_RETAIN_INFO"."ALT_PHONE_NUM" IS 'CONTACT''S PHONE NUMBER';

COMMENT ON COLUMN "XSR     "."PMR_RETRY_RETAIN_INFO"."CALL_CAT" IS 'CALL CATEGORY. USED ON CREATE (PMCE)  AND UPATE (PMCE).';

COMMENT ON COLUMN "XSR     "."PMR_RETRY_RETAIN_INFO"."CENTER" IS 'CENTER THAT IS PAIRED WITH QUEUE';

COMMENT ON COLUMN "XSR     "."PMR_RETRY_RETAIN_INFO"."COMP_ID" IS 'COMPONENT ID THIS PMR IS ABOUT';

COMMENT ON COLUMN "XSR     "."PMR_RETRY_RETAIN_INFO"."CUST_NAME_NLS" IS 'THE COMPANY NAME OF THE CUSTOMER';

COMMENT ON COLUMN "XSR     "."PMR_RETRY_RETAIN_INFO"."PHONE_NUM" IS 'COMPANY PHONE NUMBER.  THIS ONE IS NOT USED TO CALL THE PERSON BACK';

COMMENT ON COLUMN "XSR     "."PMR_RETRY_RETAIN_INFO"."PMR_UPDATE_DATE" IS 'Last date the PMR was updated in RETAIN.  This date could vary from the updt_date stored in xSR because xSR database only tracks activity within the xSR application.  The record could have been updated in RETAIN.
';

COMMENT ON COLUMN "XSR     "."PMR_RETRY_RETAIN_INFO"."PROD_ID" IS 'FK TO CAM IDENTIFYING THE PRODUCT THE PMR IS OPENED UNDER.';

COMMENT ON COLUMN "XSR     "."PMR_RETRY_RETAIN_INFO"."QUEUE" IS 'QUEUE THE PMR IS CURRENTLY ON - OR THE QUEUE THE PMR WAS ON LAST OF THERE ARE NO CALLS ON THE PMR.';

COMMENT ON COLUMN "XSR     "."PMR_RETRY_RETAIN_INFO"."RETAIN_NODE" IS 'THE NODE THAT IS THE SOURCE FOR THE PMR RECORD.  RS4 OR BDC.';

COMMENT ON COLUMN "XSR     "."PMR_RETRY_RETAIN_INFO"."SEVERITY" IS 'PMR SEVERITY.';

COMMENT ON COLUMN "XSR     "."PMR_RETRY_RETAIN_INFO"."STATUS" IS 'RETAIN FIELD: The current status - open, closed, etc.';

COMMENT ON COLUMN "XSR     "."PMR_RETRY_RETAIN_INFO"."SUPPORT_LEVEL" IS 'THIS IS ALWAYS A ''1';

COMMENT ON COLUMN "XSR     "."PMR_RETRY_RETAIN_INFO"."SW_HD" IS 'THE TYPE OF PMR - SOFTWARE OR HARDWARE FOR NOW, ALWAYS DEFAULT TO S FOR SOFTWARE.';

COMMENT ON COLUMN "XSR     "."PMR_RETRY_RETAIN_INFO"."SYSTEM_DOWN" IS 'INDICATES THAT A SYSTEM IS DOWN FOR A CUSTOMER.';

-- DDL Statements for primary key on Table "XSR     "."PMR_RETRY_RETAIN_INFO"

ALTER TABLE "XSR     "."PMR_RETRY_RETAIN_INFO" 
	ADD CONSTRAINT "PMR_RETRY_RI_PK" PRIMARY KEY
		("SRC_TRAN_ID",
		 "SRC_APPL",
		 "SRC_NODE");



------------------------------------------------
-- DDL Statements for table "XSR     "."PMR_DRAFT_RETAIN_INFO_LOG"
------------------------------------------------
 
 CREATE TABLE "XSR     "."PMR_DRAFT_RETAIN_INFO_LOG"  (
		  "SRC_TRAN_ID" VARGRAPHIC(40) NOT NULL , 
		  "SRC_APPL" VARCHAR(40) NOT NULL , 
		  "SRC_NODE" VARCHAR(127) NOT NULL , 
		  "SW_HD" CHAR(1) , 
		  "RETAIN_NODE" VARCHAR(6) , 
		  "STATUS" CHAR(7) , 
		  "RETAIN_CALLER_TYPE" CHAR(1) , 
		  "IBM_CUST_NUM" VARCHAR(8) , 
		  "CUST_NAME_NLS" VARGRAPHIC(28) , 
		  "CONTACT_NAME_NLS" VARGRAPHIC(30) , 
		  "PHONE_NUM" VARGRAPHIC(40) , 
		  "PHONE_EXT" VARGRAPHIC(40) , 
		  "ALT_PHONE_NUM" VARGRAPHIC(40) , 
		  "ALT_PHONE_EXT" VARGRAPHIC(40) , 
		  "SUPPORT_LEVEL" CHAR(1) , 
		  "QUEUE" CHAR(1) , 
		  "CENTER" CHAR(3) , 
		  "NEXT_QUEUE" CHAR(6) , 
		  "NEXT_CENTER" CHAR(3) , 
		  "REQUEST_TYPE_ID" SMALLINT , 
		  "PROD_ID" VARCHAR(40) , 
		  "PROD_ID_VERSION" VARCHAR(8) , 
		  "COMP_ID" VARCHAR(15) , 
		  "COMP_ID_RELEASE" VARCHAR(3) , 
		  "RELEASE_LEVEL" VARCHAR(3) , 
		  "SEVERITY" CHAR(1) , 
		  "SYSTEM_DOWN" CHAR(1) , 
		  "APAR_NUM" CHAR(7) , 
		  "PRIORITY_PG" CHAR(3) , 
		  "CALL_CAT" CHAR(3) , 
		  "CUPRIMD" CHAR(1) , 
		  "PMR_CREATE_DATE" VARCHAR(15) , 
		  "PMR_UPDATE_DATE" VARCHAR(15) , 
		  "PMR_UPDATE_TIME" VARCHAR(15) , 
		  "CREATE_USER" VARGRAPHIC(127) , 
		  "CREATE_DATETIME" TIMESTAMP NOT NULL WITH DEFAULT CURRENT TIMESTAMP , 
		  "UPDATE_USER" VARGRAPHIC(127) , 
		  "UPDATE_DATETIME" TIMESTAMP NOT NULL WITH DEFAULT CURRENT TIMESTAMP , 
		  "ACTION_FLAG" CHAR(1) )   
		 IN "XSR1_LOG_01" INDEX IN "XSR1_LOG_INDX_01" ; 



------------------------------------------------
-- DDL Statements for table "XSR     "."BP_SITE_PMR_DRAFT_XREF"
------------------------------------------------
 
 CREATE TABLE "XSR     "."BP_SITE_PMR_DRAFT_XREF"  (
		  "BP_SITE_ID" INTEGER NOT NULL , 
		  "SUPPORT_ID" BIGINT NOT NULL , 
		  "SRC_TRAN_ID" VARGRAPHIC(40) NOT NULL , 
		  "SRC_APPL" VARCHAR(40) NOT NULL , 
		  "SRC_NODE" VARCHAR(127) NOT NULL , 
		  "SUPPORT_RELATIONSHIP_TYPE" SMALLINT , 
		  "CREATE_USER" VARGRAPHIC(127) , 
		  "CREATE_DATETIME" TIMESTAMP NOT NULL WITH DEFAULT CURRENT TIMESTAMP , 
		  "UPDATE_USER" VARGRAPHIC(127) , 
		  "UPDATE_DATETIME" TIMESTAMP NOT NULL WITH DEFAULT CURRENT TIMESTAMP )   
		 IN "XSR1_DATA_01" INDEX IN "XSR1_INDX_01" ; 
COMMENT ON TABLE "XSR     "."BP_SITE_PMR_DRAFT_XREF" IS 'CROSS REFERENCE TABLE IDENTIFYING BUSINESS PARTNERS AND THEIR PMRS IN DRAFT STATUS.';


-- DDL Statements for primary key on Table "XSR     "."BP_SITE_PMR_DRAFT_XREF"

ALTER TABLE "XSR     "."BP_SITE_PMR_DRAFT_XREF" 
	ADD CONSTRAINT "BP_PMR_DRAFT_X_PK" PRIMARY KEY
		("BP_SITE_ID",
		 "SUPPORT_ID",
		 "SRC_TRAN_ID",
		 "SRC_APPL",
		 "SRC_NODE");



------------------------------------------------
-- DDL Statements for table "XSR     "."PMR_HEADER"
------------------------------------------------
 
 CREATE TABLE "XSR     "."PMR_HEADER"  (
		  "SRC_TRAN_ID" VARGRAPHIC(40) NOT NULL , 
		  "SRC_APPL" VARCHAR(40) NOT NULL , 
		  "SRC_NODE" VARCHAR(127) NOT NULL , 
		  "PMR_NUM" CHAR(7) , 
		  "BRANCH" CHAR(3) , 
		  "RETAIN_CNTRY_CODE" CHAR(3) , 
		  "STATE" SMALLINT , 
		  "ENTITLED" SMALLINT NOT NULL WITH DEFAULT 0 , 
		  "CREATE_USER" VARGRAPHIC(127) , 
		  "CREATE_DATETIME" TIMESTAMP NOT NULL WITH DEFAULT CURRENT TIMESTAMP , 
		  "UPDATE_USER" VARGRAPHIC(127) , 
		  "UPDATE_DATETIME" TIMESTAMP NOT NULL WITH DEFAULT CURRENT TIMESTAMP )   
		 IN "XSR1_DATA_01" INDEX IN "XSR1_INDX_01" ; 
COMMENT ON TABLE "XSR     "."PMR_HEADER" IS 'Primary PMR table associated with active PMRs.';

COMMENT ON COLUMN "XSR     "."PMR_HEADER"."BRANCH" IS 'RETAIN BRANCH';

COMMENT ON COLUMN "XSR     "."PMR_HEADER"."PMR_NUM" IS 'RETAIN PROBLEM NUMBER';

COMMENT ON COLUMN "XSR     "."PMR_HEADER"."RETAIN_CNTRY_CODE" IS 'RETAIN COUNTRY CODE';


-- DDL Statements for primary key on Table "XSR     "."PMR_HEADER"

ALTER TABLE "XSR     "."PMR_HEADER" 
	ADD CONSTRAINT "PMR_HEADER_PK" PRIMARY KEY
		("SRC_TRAN_ID",
		 "SRC_APPL",
		 "SRC_NODE");



------------------------------------------------
-- DDL Statements for table "XSR     "."PMR_BASIC_ROUTE"
------------------------------------------------
 
 CREATE TABLE "XSR     "."PMR_BASIC_ROUTE"  (
		  "BASIC_ROUTE_ID" INTEGER NOT NULL , 
		  "RETAIN_COUNTRY_CODE" CHAR(3) NOT NULL , 
		  "PLATFORM_ID" INTEGER NOT NULL , 
		  "COMP_ID" VARCHAR(15) , 
		  "COMP_ID_RELEASE" CHAR(3) , 
		  "QUEUE" VARGRAPHIC(6) NOT NULL , 
		  "CENTER" VARGRAPHIC(3) NOT NULL , 
		  "CREATE_USER" VARGRAPHIC(127) , 
		  "CREATE_DATETIME" TIMESTAMP NOT NULL , 
		  "UPDATE_USER" VARGRAPHIC(127) , 
		  "UPDATE_DATETIME" TIMESTAMP NOT NULL )   
		 IN "XSR1_DATA_01" INDEX IN "XSR1_INDX_01" ; 
-- DDL Statements for primary key on Table "XSR     "."PMR_BASIC_ROUTE"

ALTER TABLE "XSR     "."PMR_BASIC_ROUTE" 
	ADD CONSTRAINT "PMR_BASIC_BASIC_PK" PRIMARY KEY
		("BASIC_ROUTE_ID");



------------------------------------------------
-- DDL Statements for table "XSR     "."PMR_DRAFT_RETAIN_INFO"
------------------------------------------------
 
 CREATE TABLE "XSR     "."PMR_DRAFT_RETAIN_INFO"  (
		  "SRC_TRAN_ID" VARGRAPHIC(40) NOT NULL , 
		  "SRC_APPL" VARCHAR(40) NOT NULL , 
		  "SRC_NODE" VARCHAR(127) NOT NULL , 
		  "SW_HD" CHAR(1) , 
		  "RETAIN_NODE" VARCHAR(6) , 
		  "STATUS" CHAR(7) , 
		  "RETAIN_CALLER_TYPE" CHAR(1) , 
		  "IBM_CUST_NUM" VARCHAR(8) , 
		  "CUST_NAME_NLS" VARGRAPHIC(28) , 
		  "CONTACT_NAME_NLS" VARGRAPHIC(30) , 
		  "SUPPORT_LEVEL" CHAR(1) , 
		  "QUEUE" CHAR(1) , 
		  "CENTER" CHAR(3) , 
		  "NEXT_QUEUE" CHAR(6) , 
		  "NEXT_CENTER" CHAR(3) , 
		  "REQUEST_TYPE_ID" SMALLINT , 
		  "PROD_ID" VARCHAR(40) , 
		  "PROD_ID_VERSION" VARCHAR(8) , 
		  "COMP_ID" VARCHAR(15) , 
		  "COMP_ID_RELEASE" VARCHAR(3) , 
		  "RELEASE_LEVEL" VARCHAR(3) , 
		  "SEVERITY" CHAR(1) , 
		  "SYSTEM_DOWN" CHAR(1) , 
		  "APAR_NUM" CHAR(7) , 
		  "PRIORITY_PG" CHAR(3) , 
		  "CALL_CAT" CHAR(3) , 
		  "CUPRIMD" CHAR(1) , 
		  "FIRST_NAME" VARGRAPHIC(40) , 
		  "LAST_NAME" VARGRAPHIC(40) , 
		  "PHONE_NUM" VARGRAPHIC(40) , 
		  "PHONE_EXT" VARGRAPHIC(40) , 
		  "ALT_PHONE_NUM" VARGRAPHIC(40) , 
		  "ALT_PHONE_EXT" VARGRAPHIC(40) , 
		  "FAX_NUM" VARGRAPHIC(40) , 
		  "PAGER" VARGRAPHIC(30) , 
		  "EMAIL_ADR" VARGRAPHIC(127) , 
		  "ALT_EMAIL_ADDRESS" VARGRAPHIC(127) , 
		  "PMR_CREATE_DATE" VARCHAR(15) , 
		  "PMR_UPDATE_DATE" VARCHAR(15) , 
		  "PMR_UPDATE_TIME" VARCHAR(15) , 
		  "CREATE_USER" VARGRAPHIC(127) , 
		  "CREATE_DATETIME" TIMESTAMP NOT NULL WITH DEFAULT CURRENT TIMESTAMP , 
		  "UPDATE_USER" VARGRAPHIC(127) , 
		  "UPDATE_DATETIME" TIMESTAMP NOT NULL WITH DEFAULT CURRENT TIMESTAMP )   
		 IN "XSR1_DATA_PG32K" INDEX IN "XSR1_LOG_INDX_01" ; 
COMMENT ON TABLE "XSR     "."PMR_DRAFT_RETAIN_INFO" IS 'Contains RETAIN specific information associated to a DRAFT PMR.';

COMMENT ON COLUMN "XSR     "."PMR_DRAFT_RETAIN_INFO"."ALT_PHONE_NUM" IS 'CONTACT''S PHONE NUMBER';

COMMENT ON COLUMN "XSR     "."PMR_DRAFT_RETAIN_INFO"."APAR_NUM" IS 'APAR ASSOCIATED WITH THE PMR (IF IT EXISTS)';

COMMENT ON COLUMN "XSR     "."PMR_DRAFT_RETAIN_INFO"."CALL_CAT" IS 'CALL CATEGORY. USED ON CREATE (PMCE)  AND UPATE (PMCE).';

COMMENT ON COLUMN "XSR     "."PMR_DRAFT_RETAIN_INFO"."CENTER" IS 'CENTER THAT IS PAIRED WITH QUEUE';

COMMENT ON COLUMN "XSR     "."PMR_DRAFT_RETAIN_INFO"."COMP_ID" IS 'COMPONENT ID THIS PMR IS ABOUT';

COMMENT ON COLUMN "XSR     "."PMR_DRAFT_RETAIN_INFO"."CUPRIMD" IS 'METRICS FIELD HAVING TO DO WITH SOLUTION GIVEN.';

COMMENT ON COLUMN "XSR     "."PMR_DRAFT_RETAIN_INFO"."CUST_NAME_NLS" IS 'THE COMPANY NAME OF THE CUSTOMER';

COMMENT ON COLUMN "XSR     "."PMR_DRAFT_RETAIN_INFO"."PHONE_NUM" IS 'COMPANY PHONE NUMBER.  THIS ONE IS NOT USED TO CALL THE PERSON BACK';

COMMENT ON COLUMN "XSR     "."PMR_DRAFT_RETAIN_INFO"."PMR_UPDATE_DATE" IS 'LAST DATE THE PMR WAS UPDATED IN RETAIN.  THIS DATE COULD VARY FROM THE UPDATE_DATETIME STORED IN XSR BECAUSE XSR DATABASE ONLY TRACKS ACTIVITY WITHIN THE XSR APPLICATION.  THE RECORD COULD HAVE BEEN UPDATED IN RETAIN.
';

COMMENT ON COLUMN "XSR     "."PMR_DRAFT_RETAIN_INFO"."PRIORITY_PG" IS 'PRI-PAGE.  PRIORITY PAGE IS BASCIALLY THE NUMBER OF THE CALL ON A QUEUE.  IF A CALL IS THE SECOND PRIORITY 3 CALL ON A QUEUE THE PRI-PAGE IS 302.  THIS IS LINKED WITH THE QUEUE, CENTER FIELDS.';

COMMENT ON COLUMN "XSR     "."PMR_DRAFT_RETAIN_INFO"."PROD_ID" IS 'FK TO CAM IDENTIFYING THE PRODUCT THE PMR IS OPENED UNDER.';

COMMENT ON COLUMN "XSR     "."PMR_DRAFT_RETAIN_INFO"."QUEUE" IS 'QUEUE THE PMR IS CURRENTLY ON - OR THE QUEUE THE PMR WAS ON LAST OF THERE ARE NO CALLS ON THE PMR.';

COMMENT ON COLUMN "XSR     "."PMR_DRAFT_RETAIN_INFO"."RELEASE_LEVEL" IS 'RELEASE_LEVELEASE LEVEL.';

COMMENT ON COLUMN "XSR     "."PMR_DRAFT_RETAIN_INFO"."RETAIN_NODE" IS 'THE NODE THAT IS THE SOURCE FOR THE PMR RECORD.  RS4 OR BDC.';

COMMENT ON COLUMN "XSR     "."PMR_DRAFT_RETAIN_INFO"."SEVERITY" IS 'PMR SEVERITY.';

COMMENT ON COLUMN "XSR     "."PMR_DRAFT_RETAIN_INFO"."STATUS" IS 'RETAIN FIELD: THE CURRENT STATUS - OPEN, CLOSED, ETC.';

COMMENT ON COLUMN "XSR     "."PMR_DRAFT_RETAIN_INFO"."SUPPORT_LEVEL" IS 'THIS IS ALWAYS A ''1';

COMMENT ON COLUMN "XSR     "."PMR_DRAFT_RETAIN_INFO"."SYSTEM_DOWN" IS 'INDICATES THAT A SYSTEM IS DOWN FOR A CUSTOMER.';


-- DDL Statements for primary key on Table "XSR     "."PMR_DRAFT_RETAIN_INFO"

ALTER TABLE "XSR     "."PMR_DRAFT_RETAIN_INFO" 
	ADD CONSTRAINT "PMR_DRAFT_RI_PK" PRIMARY KEY
		("SRC_TRAN_ID",
		 "SRC_APPL",
		 "SRC_NODE");



------------------------------------------------
-- DDL Statements for table "XSR     "."PMR_DRAFT_XSR_INFO_LOG"
------------------------------------------------
 
 CREATE TABLE "XSR     "."PMR_DRAFT_XSR_INFO_LOG"  (
		  "SRC_TRAN_ID" VARGRAPHIC(40) NOT NULL , 
		  "SRC_APPL" VARCHAR(40) NOT NULL , 
		  "SRC_NODE" VARCHAR(127) NOT NULL , 
		  "SUPPORT_ID" BIGINT , 
		  "TITLE" VARGRAPHIC(512) , 
		  "DESCRIPTION" VARGRAPHIC(14000) , 
		  "CONTACT_METHOD" VARGRAPHIC(10) , 
		  "ALT_CONTACT_METHOD" VARGRAPHIC(10) , 
		  "ALT_CONTACT_ID" VARGRAPHIC(40) , 
		  "OPERSYS_ID" INTEGER , 
		  "CUST_TRACKING_NUM" VARGRAPHIC(20) , 
		  "OTHER_COMP_DSCR" VARGRAPHIC(255) , 
		  "INITIAL_SEVERITY" CHAR(1) , 
		  "SEVERITY_DESCRIPTION" VARGRAPHIC(512) , 
		  "LOCALE" VARCHAR(10) , 
		  "OPEN_COUNT" INTEGER , 
		  "PMR_CREATE_SRC_APPL" VARCHAR(40) , 
		  "CREATE_CONTACT_ID" VARGRAPHIC(40) , 
		  "UPDATE_CONTACT_ID" VARGRAPHIC(40) , 
		  "ADD_ALT_CONTACT_ID" VARGRAPHIC(40) , 
		  "REMOVE_ALT_CONTACT_ID" VARGRAPHIC(40) , 
		  "PARTNER_INIT" INTEGER , 
		  "SUBMIT_TYPE" VARCHAR(15) , 
		  "CONTACT_ID" BIGINT , 
		  "CREATE_USER" VARGRAPHIC(127) , 
		  "CREATE_DATETIME" TIMESTAMP NOT NULL WITH DEFAULT CURRENT TIMESTAMP , 
		  "UPDATE_USER" VARGRAPHIC(127) , 
		  "UPDATE_DATETIME" TIMESTAMP NOT NULL WITH DEFAULT CURRENT TIMESTAMP , 
		  "ACTION_FLAG" CHAR(1) )   
		 IN "XSR1_DATA_PG32K" ; 



------------------------------------------------
-- DDL Statements for table "XSR     "."PMR_DRAFT_XSR_INFO"
------------------------------------------------
 
 CREATE TABLE "XSR     "."PMR_DRAFT_XSR_INFO"  (
		  "SRC_TRAN_ID" VARGRAPHIC(40) NOT NULL , 
		  "SRC_APPL" VARCHAR(40) NOT NULL , 
		  "SRC_NODE" VARCHAR(127) NOT NULL , 
		  "SUPPORT_ID" BIGINT , 
		  "TITLE" VARGRAPHIC(512) , 
		  "DESCRIPTION" VARGRAPHIC(14000) , 
		  "CONTACT_METHOD" VARGRAPHIC(10) , 
		  "ALT_CONTACT_METHOD" VARGRAPHIC(10) , 
		  "ALT_CONTACT_ID" VARGRAPHIC(40) , 
		  "OPERSYS_ID" INTEGER , 
		  "CUST_TRACKING_NUM" VARGRAPHIC(20) , 
		  "OTHER_COMP_DSCR" VARGRAPHIC(255) , 
		  "INITIAL_SEVERITY" CHAR(1) , 
		  "SEVERITY_DESCRIPTION" VARGRAPHIC(512) , 
		  "LOCALE" VARCHAR(10) , 
		  "OPEN_COUNT" INTEGER , 
		  "PMR_CREATE_SRC_APPL" VARCHAR(40) , 
		  "CREATE_CONTACT_ID" VARGRAPHIC(40) , 
		  "UPDATE_CONTACT_ID" VARGRAPHIC(40) , 
		  "ADD_ALT_CONTACT_ID" VARGRAPHIC(40) , 
		  "REMOVE_ALT_CONTACT_ID" VARGRAPHIC(40) , 
		  "PARTNER_INIT" INTEGER , 
		  "SUBMIT_TYPE" VARCHAR(15) , 
		  "CONTACT_ID" BIGINT , 
		  "CREATE_USER" VARGRAPHIC(127) , 
		  "CREATE_DATETIME" TIMESTAMP NOT NULL WITH DEFAULT CURRENT TIMESTAMP , 
		  "UPDATE_USER" VARGRAPHIC(127) , 
		  "UPDATE_DATETIME" TIMESTAMP NOT NULL WITH DEFAULT CURRENT TIMESTAMP )   
		 IN "XSR1_DATA_PG32K" INDEX IN "XSR1_INDX_01" ; 
COMMENT ON TABLE "XSR     "."PMR_DRAFT_XSR_INFO" IS 'Contains XSR specific information associated to a DRAFT PMR.';

COMMENT ON COLUMN "XSR     "."PMR_DRAFT_XSR_INFO"."ALT_CONTACT_ID" IS 'A PMR CAN HAVE A BACKUP CONTACT.  THIS IS THE CONTACT_ID OF THAT CONTACT.  THIS IS A CONTACT THAT WAS A CALLER ON THE CONTRACT AT THE TIME THE PMR WAS CREATED IN XSR.';

COMMENT ON COLUMN "XSR     "."PMR_DRAFT_XSR_INFO"."ALT_CONTACT_METHOD" IS 'THE METHOD BY WHICH THE ALTERNATE CONTACT IS TO BE CONTACTED.';

COMMENT ON COLUMN "XSR     "."PMR_DRAFT_XSR_INFO"."CONTACT_ID" IS 'POINTER TO CONTACT RECORD ASSOCIATED WITH PMR.';

COMMENT ON COLUMN "XSR     "."PMR_DRAFT_XSR_INFO"."CUST_TRACKING_NUM" IS 'Allows the customer to use their own tracking number to track the PMR.';

COMMENT ON COLUMN "XSR     "."PMR_DRAFT_XSR_INFO"."INITIAL_SEVERITY" IS 'INITIAL SEVERITY REPORTED FOR THE PMR ';

COMMENT ON COLUMN "XSR     "."PMR_DRAFT_XSR_INFO"."LOCALE" IS 'LOCALE THE PMR WAS CREATED IN.  USED PRIMARILY FOR METRICS.  WE USE THE USERS BROWSER SETTINGS TO FIGURE OUT HOW THAT MAPS TO A CCSID SO THAT WE CAN GET IT IN THE RIGHT CHARACTER SET AND ENCODING FOR RETAIN.';

COMMENT ON COLUMN "XSR     "."PMR_DRAFT_XSR_INFO"."OPEN_COUNT" IS 'NUMBER OF TIMES THIS PMR HAS BEEN REOPENED VIA ESR';

COMMENT ON COLUMN "XSR     "."PMR_DRAFT_XSR_INFO"."OPERSYS_ID" IS 'FK TO THE TABLE THAT MAINTAINS  A LIST OF OPERATING SYSTEMS.  IDENTIFIES THE OPERATING SYSTEM WHERE THE SOFTWARE IS RUNNING.';

COMMENT ON COLUMN "XSR     "."PMR_DRAFT_XSR_INFO"."SUPPORT_ID" IS 'FK TO SPPRT THAT PMR WAS OPENED UNDER.';

COMMENT ON COLUMN "XSR     "."PMR_DRAFT_XSR_INFO"."TITLE" IS 'TITLE OF THE PMR THAT WAS PROVIDED BY THE PERSON OPENING IT.';

COMMENT ON COLUMN "XSR     "."PMR_DRAFT_XSR_INFO"."UPDATE_CONTACT_ID" IS 'THE CONTACT_ID THAT LAST UPDATED THE PMR VIA XSR.';

-- DDL Statements for primary key on Table "XSR     "."PMR_DRAFT_XSR_INFO"

ALTER TABLE "XSR     "."PMR_DRAFT_XSR_INFO" 
	ADD CONSTRAINT "PMR_DRAFT_XI_PK" PRIMARY KEY
		("SRC_TRAN_ID",
		 "SRC_APPL",
		 "SRC_NODE");



------------------------------------------------
-- DDL Statements for table "XSR     "."PMR_XSR_INFO"
------------------------------------------------
 
 CREATE TABLE "XSR     "."PMR_XSR_INFO"  (
		  "SRC_TRAN_ID" VARGRAPHIC(40) NOT NULL , 
		  "SRC_APPL" VARCHAR(40) NOT NULL , 
		  "SRC_NODE" VARCHAR(127) NOT NULL , 
		  "SUPPORT_ID" BIGINT , 
		  "TITLE" VARGRAPHIC(512) , 
		  "DESCRIPTION" VARGRAPHIC(14000) , 
		  "CONTACT_METHOD" VARGRAPHIC(10) , 
		  "ALT_CONTACT_METHOD" VARGRAPHIC(10) , 
		  "ALT_CONTACT_ID" VARGRAPHIC(40) , 
		  "OPERSYS_ID" INTEGER , 
		  "CUST_TRACKING_NUM" VARGRAPHIC(20) , 
		  "OTHER_COMP_DSCR" VARGRAPHIC(255) , 
		  "INITIAL_SEVERITY" CHAR(1) , 
		  "SEVERITY_DESCRIPTION" VARGRAPHIC(512) , 
		  "PMR_CREATE_SRC_APPL" VARCHAR(40) , 
		  "LOCALE" VARCHAR(10) , 
		  "OPEN_COUNT" INTEGER , 
		  "CREATE_CONTACT_ID" VARGRAPHIC(40) , 
		  "UPDATE_CONTACT_ID" VARGRAPHIC(40) , 
		  "CREATE_USER" VARGRAPHIC(127) , 
		  "CREATE_DATETIME" TIMESTAMP NOT NULL WITH DEFAULT CURRENT TIMESTAMP , 
		  "UPDATE_USER" VARGRAPHIC(127) , 
		  "UPDATE_DATETIME" TIMESTAMP NOT NULL WITH DEFAULT CURRENT TIMESTAMP )   
		 IN "XSR1_DATA_PG32K" INDEX IN "XSR1_INDX_01" ; 
COMMENT ON TABLE "XSR     "."PMR_XSR_INFO" IS 'Contains XSR specific information associated to a  PMR.';

COMMENT ON COLUMN "XSR     "."PMR_XSR_INFO"."ALT_CONTACT_ID" IS 'A PMR CAN HAVE A BACKUP CONTACT.  THIS IS THE CONTACT_ID OF THAT CONTACT.  THIS IS A CONTACT THAT WAS A CALLER ON THE CONTRACT AT THE TIME THE PMR WAS CREATED IN XSR.';

COMMENT ON COLUMN "XSR     "."PMR_XSR_INFO"."ALT_CONTACT_METHOD" IS 'THE METHOD BY WHICH THE ALTERNATE CONTACT IS TO BE CONTACTED.';

COMMENT ON COLUMN "XSR     "."PMR_XSR_INFO"."CONTACT_METHOD" IS 'THE METHOD BY WHICH THE CUSTOMER IS TO BE CONTACTED - EMAIL, PHONE, ETC.';

COMMENT ON COLUMN "XSR     "."PMR_XSR_INFO"."CUST_TRACKING_NUM" IS 'Allows the customer to use their own tracking number to track the PMR.';

COMMENT ON COLUMN "XSR     "."PMR_XSR_INFO"."INITIAL_SEVERITY" IS 'INITIAL SEVERITY REPORTED FOR THE PMR ';

COMMENT ON COLUMN "XSR     "."PMR_XSR_INFO"."LOCALE" IS 'LOCALE THE PMR WAS CREATED IN.  USED PRIMARILY FOR METRICS.  WE USE THE USERS BROWSER SETTINGS TO FIGURE OUT HOW THAT MAPS TO A CCSID SO THAT WE CAN GET IT IN THE RIGHT CHARACTER SET AND ENCODING FOR RETAIN.';

COMMENT ON COLUMN "XSR     "."PMR_XSR_INFO"."OPEN_COUNT" IS 'NUMBER OF TIMES THIS PMR HAS BEEN REOPENED VIA ESR';

COMMENT ON COLUMN "XSR     "."PMR_XSR_INFO"."OPERSYS_ID" IS 'FK TO THE TABLE THAT MAINTAINS  A LIST OF OPERATING SYSTEMS.  IDENTIFIES THE OPERATING SYSTEM WHERE THE SOFTWARE IS RUNNING.';

COMMENT ON COLUMN "XSR     "."PMR_XSR_INFO"."PMR_CREATE_SRC_APPL" IS 'Used to track pmrs that originated outside of xsr and make sure when we insert into the table, an email isn''t generated.';

COMMENT ON COLUMN "XSR     "."PMR_XSR_INFO"."SUPPORT_ID" IS 'FK TO SPPRT THAT PMR WAS OPENED UNDER.';

COMMENT ON COLUMN "XSR     "."PMR_XSR_INFO"."TITLE" IS 'TITLE OF THE PMR THAT WAS PROVIDED BY THE PERSON OPENING IT.';

COMMENT ON COLUMN "XSR     "."PMR_XSR_INFO"."UPDATE_CONTACT_ID" IS 'THE CONTACT_ID THAT LAST UPDATED THE PMR VIA XSR.';

-- DDL Statements for primary key on Table "XSR     "."PMR_XSR_INFO"

ALTER TABLE "XSR     "."PMR_XSR_INFO" 
	ADD CONSTRAINT "PMR_HEADER_XI_PK" PRIMARY KEY
		("SRC_TRAN_ID",
		 "SRC_APPL",
		 "SRC_NODE");



------------------------------------------------
-- DDL Statements for table "XSR     "."PMR_RETRY_XSR_INFO"
------------------------------------------------
 
 CREATE TABLE "XSR     "."PMR_RETRY_XSR_INFO"  (
		  "SRC_TRAN_ID" VARGRAPHIC(40) NOT NULL , 
		  "SRC_APPL" VARCHAR(40) NOT NULL , 
		  "SRC_NODE" VARCHAR(127) NOT NULL , 
		  "SUPPORT_ID" BIGINT , 
		  "TITLE" VARGRAPHIC(512) , 
		  "DESCRIPTION" VARGRAPHIC(14000) , 
		  "CONTACT_METHOD" VARGRAPHIC(10) , 
		  "ALT_CONTACT_METHOD" VARGRAPHIC(10) , 
		  "ALT_CONTACT_ID" VARGRAPHIC(40) , 
		  "OPERSYS_ID" INTEGER , 
		  "CUST_TRACKING_NUM" VARGRAPHIC(20) , 
		  "OTHER_COMP_DSCR" VARGRAPHIC(255) , 
		  "INITIAL_SEVERITY" CHAR(1) , 
		  "SEVERITY_DESCRIPTION" VARGRAPHIC(512) , 
		  "PMR_CREATE_SRC_APPL" VARCHAR(40) , 
		  "LOCALE" VARCHAR(10) , 
		  "OPEN_COUNT" INTEGER , 
		  "CREATE_CONTACT_ID" VARGRAPHIC(40) , 
		  "UPDATE_CONTACT_ID" VARGRAPHIC(40) , 
		  "ADD_ALT_CONTACT_ID" VARGRAPHIC(40) , 
		  "REMOVE_ALT_CONTACT_ID" VARGRAPHIC(40) , 
		  "PARTNER_INIT" INTEGER , 
		  "CONTACT_ID" BIGINT , 
		  "CREATE_USER" VARGRAPHIC(128) , 
		  "CREATE_DATETIME" TIMESTAMP WITH DEFAULT CURRENT TIMESTAMP , 
		  "UPDATE_USER" VARGRAPHIC(128) , 
		  "UPDATE_DATETIME" TIMESTAMP WITH DEFAULT CURRENT TIMESTAMP )   
		 IN "XSR1_DATA_PG32K" INDEX IN "XSR1_INDX_01" ; 
COMMENT ON TABLE "XSR     "."PMR_RETRY_XSR_INFO" IS 'Contains XSR specific information associated to a  PMR in retry state.';

COMMENT ON COLUMN "XSR     "."PMR_RETRY_XSR_INFO"."ALT_CONTACT_ID" IS 'A PMR CAN HAVE A BACKUP CONTACT.  THIS IS THE CONTACT_ID OF THAT CONTACT.  THIS IS A CONTACT THAT WAS A CALLER ON THE CONTRACT AT THE TIME THE PMR WAS CREATED IN XSR.';

COMMENT ON COLUMN "XSR     "."PMR_RETRY_XSR_INFO"."ALT_CONTACT_METHOD" IS 'THE METHOD BY WHICH THE ALTERNATE CONTACT IS TO BE CONTACTED.';

COMMENT ON COLUMN "XSR     "."PMR_RETRY_XSR_INFO"."CONTACT_ID" IS 'POINTER TO CONTACT RECORD ASSOCIATED WITH PMR.';

COMMENT ON COLUMN "XSR     "."PMR_RETRY_XSR_INFO"."CONTACT_METHOD" IS 'THE METHOD BY WHICH THE CUSTOMER IS TO BE CONTACTED - EMAIL, PHONE, ETC.';

COMMENT ON COLUMN "XSR     "."PMR_RETRY_XSR_INFO"."CUST_TRACKING_NUM" IS 'Allows the customer to use their own tracking number to track the PMR.';

COMMENT ON COLUMN "XSR     "."PMR_RETRY_XSR_INFO"."INITIAL_SEVERITY" IS 'INITIAL SEVERITY REPORTED FOR THE PMR ';

COMMENT ON COLUMN "XSR     "."PMR_RETRY_XSR_INFO"."LOCALE" IS 'LOCALE THE PMR WAS CREATED IN.  USED PRIMARILY FOR METRICS.  WE USE THE USERS BROWSER SETTINGS TO FIGURE OUT HOW THAT MAPS TO A CCSID SO THAT WE CAN GET IT IN THE RIGHT CHARACTER SET AND ENCODING FOR RETAIN.';

COMMENT ON COLUMN "XSR     "."PMR_RETRY_XSR_INFO"."OPEN_COUNT" IS 'NUMBER OF TIMES THIS PMR HAS BEEN REOPENED VIA ESR';

COMMENT ON COLUMN "XSR     "."PMR_RETRY_XSR_INFO"."OPERSYS_ID" IS 'FK TO THE TABLE THAT MAINTAINS  A LIST OF OPERATING SYSTEMS.  IDENTIFIES THE OPERATING SYSTEM WHERE THE SOFTWARE IS RUNNING.';

COMMENT ON COLUMN "XSR     "."PMR_RETRY_XSR_INFO"."PMR_CREATE_SRC_APPL" IS 'Used to track pmrs that originated outside of xsr and make sure when we insert into the table, an email isn''t generated.';

COMMENT ON COLUMN "XSR     "."PMR_RETRY_XSR_INFO"."SUPPORT_ID" IS 'FK TO SPPRT THAT PMR WAS OPENED UNDER.';

COMMENT ON COLUMN "XSR     "."PMR_RETRY_XSR_INFO"."TITLE" IS 'TITLE OF THE PMR THAT WAS PROVIDED BY THE PERSON OPENING IT.';

COMMENT ON COLUMN "XSR     "."PMR_RETRY_XSR_INFO"."UPDATE_CONTACT_ID" IS 'THE CONTACT_ID THAT LAST UPDATED THE PMR VIA XSR.';

-- DDL Statements for primary key on Table "XSR     "."PMR_RETRY_XSR_INFO"

ALTER TABLE "XSR     "."PMR_RETRY_XSR_INFO" 
	ADD CONSTRAINT "PMR_RETRY_XI_PK" PRIMARY KEY
		("SRC_TRAN_ID",
		 "SRC_APPL",
		 "SRC_NODE");



------------------------------------------------
-- DDL Statements for table "XSR     "."USER_PROFILE_NOTIFICATION"
------------------------------------------------
 
 CREATE TABLE "XSR     "."USER_PROFILE_NOTIFICATION"  (
		  "USER_ID" BIGINT NOT NULL , 
		  "NOTIFY_BY_EMAIL" SMALLINT , 
		  "NTFY_1_UPDT" INTEGER , 
		  "NTFY_1_CLOSE" INTEGER , 
		  "NTFY_2_UPDT" INTEGER , 
		  "NTFY_2_CLOSE" INTEGER , 
		  "NTFY_3_UPDT" INTEGER , 
		  "NTFY_3_CLOSE" INTEGER , 
		  "NTFY_4_UPDT" INTEGER , 
		  "NTFY_4_CLOSE" INTEGER , 
		  "NTFY_CALLER" INTEGER , 
		  "CREATE_USER" VARGRAPHIC(127) , 
		  "CREATE_DATETIME" TIMESTAMP NOT NULL WITH DEFAULT CURRENT TIMESTAMP , 
		  "UPDATE_USER" VARGRAPHIC(127) , 
		  "UPDATE_DATETIME" TIMESTAMP NOT NULL WITH DEFAULT CURRENT TIMESTAMP )   
		 IN "XSR1_DATA_01" INDEX IN "XSR1_INDX_01" ; 
COMMENT ON TABLE "XSR     "."USER_PROFILE_NOTIFICATION" IS 'PART OF THE XSR USER PROFILE THAT TRACKS THE USERS NOTIFICATION PREFERENCES.';

-- DDL Statements for primary key on Table "XSR     "."USER_PROFILE_NOTIFICATION"

ALTER TABLE "XSR     "."USER_PROFILE_NOTIFICATION" 
	ADD CONSTRAINT "USR_PROF_NTF_PK" PRIMARY KEY
		("USER_ID");



------------------------------------------------
-- DDL Statements for table "XSR     "."PMR_COUNTRY_CONFIG"
------------------------------------------------
 
 CREATE TABLE "XSR     "."PMR_COUNTRY_CONFIG"  (
		  "ISO_CNTRY_CODE_2" CHAR(2) NOT NULL , 
		  "RETAIN_CNTRY_CODE" CHAR(3) , 
		  "XSR_ENABLED" SMALLINT , 
		  "ADMIN_EMAIL_ADDRESS" VARCHAR(254) , 
		  "CREATE_USER" VARGRAPHIC(127) , 
		  "CREATE_DATETIME" TIMESTAMP NOT NULL WITH DEFAULT CURRENT TIMESTAMP , 
		  "UPDATE_USER" VARGRAPHIC(127) , 
		  "UPDATE_DATETIME" TIMESTAMP NOT NULL WITH DEFAULT CURRENT TIMESTAMP )   
		 IN "XSR1_DATA_01" INDEX IN "XSR1_INDX_01" ; 
COMMENT ON TABLE "XSR     "."PMR_COUNTRY_CONFIG" IS 'Holds configuration parameters associated to PMRs by country.';


-- DDL Statements for primary key on Table "XSR     "."PMR_COUNTRY_CONFIG"

ALTER TABLE "XSR     "."PMR_COUNTRY_CONFIG" 
	ADD CONSTRAINT "PMR_COUNTRY_CFG_PK" PRIMARY KEY
		("ISO_CNTRY_CODE_2");



------------------------------------------------
-- DDL Statements for table "XSR     "."USER_PROFILE"
------------------------------------------------
 
 CREATE TABLE "XSR     "."USER_PROFILE"  (
		  "USER_ID" BIGINT NOT NULL , 
		  "CONTACT_ID" BIGINT NOT NULL , 
		  "CONTACT_METHOD" VARCHAR(40) NOT NULL WITH DEFAULT 'email' , 
		  "SUPPORT_AGRMNT_VIEW_PREF" CHAR(1) , 
		  "AUP_ACCEPTED_FLAG" SMALLINT NOT NULL WITH DEFAULT 0 , 
		  "AUP_ACCEPTED_DATE" DATE , 
		  "PMR_HOME_DISPLAY_CNT" INTEGER , 
		  "CREATE_USER" VARGRAPHIC(127) , 
		  "CREATE_DATETIME" TIMESTAMP NOT NULL WITH DEFAULT CURRENT TIMESTAMP , 
		  "UPDATE_USER" VARGRAPHIC(127) , 
		  "UPDATE_DATETIME" TIMESTAMP NOT NULL WITH DEFAULT CURRENT TIMESTAMP )   
		 IN "XSR1_DATA_01" INDEX IN "XSR1_INDX_01" ; 
COMMENT ON TABLE "XSR     "."USER_PROFILE" IS 'PRIMARY TABLE FOR THE XSR USER PROFILE INFORMATION.';


-- DDL Statements for primary key on Table "XSR     "."USER_PROFILE"

ALTER TABLE "XSR     "."USER_PROFILE" 
	ADD CONSTRAINT "USR_PROFILE_PK" PRIMARY KEY
		("USER_ID");






COMMIT WORK;

CONNECT RESET;

TERMINATE;



