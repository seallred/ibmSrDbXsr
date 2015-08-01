
-- DDL Statements for indexes on Table "XSR     "."PMR_ATTACHMENT"

CREATE INDEX "XSR     "."PMR_ATTACH_IDX1" ON "XSR     "."PMR_ATTACHMENT" 
		("SRC_TRAN_ID" ASC,
		 "SRC_APPL" ASC,
		 "SRC_NODE" ASC) PCTFREE 10 ;

-- DDL Statements for indexes on Table "XSR     "."AUDIT_LOG"

CREATE INDEX "XSR     "."AUDIT_LOG_IDX01" ON "XSR     "."AUDIT_LOG" 
		("APP_ID" ASC) PCTFREE 10 ;


-- DDL Statements for indexes on Table "XSR     "."PMR_RETRY"

CREATE INDEX "XSR     "."PMR_RETRY_IDX01" ON "XSR     "."PMR_RETRY" 
		("CREATE_DATETIME" DESC) PCTFREE 10 ;

-- DDL Statements for indexes on Table "XSR     "."COMP_GROUP"

CREATE UNIQUE INDEX "XSR     "."COMP_GROUP_IDX1" ON "XSR     "."COMP_GROUP" 
		("NAME" ASC) PCTFREE 0 ;




-- DDL Statements for indexes on Table "XSR     "."USER_PMR_RETRY_XREF"

CREATE INDEX "XSR     "."USR_PMR_RTY_X_IDX1" ON "XSR     "."USER_PMR_RETRY_XREF" 
		("USER_ID" ASC) PCTFREE 10 ;

-- DDL Statements for indexes on Table "XSR     "."USER_PMR_RETRY_XREF"

CREATE INDEX "XSR     "."USR_PMR_RTY_X_IDX2" ON "XSR     "."USER_PMR_RETRY_XREF" 
		("USER_ID" DESC) PCTFREE 10 ;

-- DDL Statements for indexes on Table "XSR     "."USER_PMR_RETRY_XREF"

CREATE INDEX "XSR     "."USR_PMR_RTY_X_IDX3" ON "XSR     "."USER_PMR_RETRY_XREF" 
		("COM_SRC_APPL" DESC) PCTFREE 10 ;

-- DDL Statements for indexes on Table "XSR     "."PMR_DRAFT"

CREATE INDEX "XSR     "."PMR_DRAFT_IDX01" ON "XSR     "."PMR_DRAFT" 
		("CREATE_DATETIME" DESC) PCTFREE 10 ;


-- DDL Statements for indexes on Table "XSR     "."USER_PMR_DRAFT_XREF"

CREATE INDEX "XSR     "."USR_PMR_DRF_X_IDX1" ON "XSR     "."USER_PMR_DRAFT_XREF" 
		("USER_ID" ASC) PCTFREE 10 ;

-- DDL Statements for indexes on Table "XSR     "."USER_PMR_DRAFT_XREF"

CREATE INDEX "XSR     "."USR_PMR_DRF_X_IDX2" ON "XSR     "."USER_PMR_DRAFT_XREF" 
		("COM_SRC_APPL" DESC) PCTFREE 10 ;


-- DDL Statements for indexes on Table "XSR     "."PMR_SIG_LINES"

CREATE INDEX "XSR     "."PMR_HEADER_SL_IDX1" ON "XSR     "."PMR_SIG_LINES" 
		("UPDATE_USER" DESC) PCTFREE 10 ;

-- DDL Statements for indexes on Table "XSR     "."PMR_SIG_LINES"

CREATE INDEX "XSR     "."PMR_HEADER_SL_IDX2" ON "XSR     "."PMR_SIG_LINES" 
		("CREATE_DATETIME" DESC) PCTFREE 10 ;

-- DDL Statements for indexes on Table "XSR     "."USER_PMR_XREF"

CREATE INDEX "XSR     "."USR_PMR_XREF_IDX1" ON "XSR     "."USER_PMR_XREF" 
		("USER_ID" ASC) PCTFREE 10 ;

-- DDL Statements for indexes on Table "XSR     "."USER_PMR_XREF"

CREATE INDEX "XSR     "."USR_PMR_XREF_IDX2" ON "XSR     "."USER_PMR_XREF" 
		("USER_ID" DESC) PCTFREE 10 ;

-- DDL Statements for indexes on Table "XSR     "."USER_PMR_XREF"

CREATE INDEX "XSR     "."USR_PMR_XREF_IDX3" ON "XSR     "."USER_PMR_XREF" 
		("COM_SRC_APPL" DESC) PCTFREE 10 ;


-- DDL Statements for indexes on Table "XSR     "."MSG_LOG"

CREATE INDEX "XSR     "."MSG_LOG_IDX1" ON "XSR     "."MSG_LOG" 
		("MSG_TMPL_ID" DESC) PCTFREE 10 ;

-- DDL Statements for indexes on Table "XSR     "."PMR_COUNTRY_ROUTE"

CREATE UNIQUE INDEX "XSR     "."PMR_CNTRY_RTE_IDX1" ON "XSR     "."PMR_COUNTRY_ROUTE" 
		("RETAIN_COUNTRY_CODE" ASC,
		 "PLATFORM_ID" ASC,
		 "ORG_ID" ASC) PCTFREE 0 ;

-- DDL Statements for indexes on Table "XSR     "."PMR_ENT_EXC_ROUTE"

CREATE UNIQUE INDEX "XSR     "."PMR_ENTEX_RTE_IDX1" ON "XSR     "."PMR_ENT_EXC_ROUTE" 
		("RETAIN_COUNTRY_CODE" ASC,
		 "COMP_GROUP_ID" ASC,
		 "PLATFORM_ID" ASC,
		 "ORG_ID" ASC) PCTFREE 0 ;

-- DDL Statements for indexes on Table "XSR     "."PMR_BASIC_ROUTE"

CREATE UNIQUE INDEX "XSR     "."PMR_RTE_BASIC_UI1" ON "XSR     "."PMR_BASIC_ROUTE" 
		("RETAIN_COUNTRY_CODE" ASC,
		 "PLATFORM_ID" ASC,
		 "COMP_ID" ASC,
		 "COMP_ID_RELEASE" ASC) PCTFREE 0 ;



-- DDL Statements for indexes on Table "XSR     "."PMR_RETAIN_INFO"

CREATE INDEX "XSR     "."PMR_HEADER_RI_IDX1" ON "XSR     "."PMR_RETAIN_INFO" 
		("PMR_CREATE_DATE" ASC) PCTFREE 10 ;

-- DDL Statements for indexes on Table "XSR     "."PMR_RETAIN_INFO"

CREATE INDEX "XSR     "."PMR_HEADER_RI_IDX2" ON "XSR     "."PMR_RETAIN_INFO" 
		("STATUS" ASC) PCTFREE 10 ;


-- DDL Statements for indexes on Table "XSR     "."PMR_RETRY_RETAIN_INFO"

CREATE INDEX "XSR     "."PMR_RETRY_RI_IDX1" ON "XSR     "."PMR_RETRY_RETAIN_INFO" 
		("PMR_CREATE_DATE" ASC) PCTFREE 10 ;

-- DDL Statements for indexes on Table "XSR     "."PMR_RETRY_RETAIN_INFO"

CREATE INDEX "XSR     "."PMR_RETRY_RI_IDX2" ON "XSR     "."PMR_RETRY_RETAIN_INFO" 
		("STATUS" ASC) PCTFREE 10 ;


-- DDL Statements for indexes on Table "XSR     "."PMR_HEADER"

CREATE INDEX "XSR     "."PMR_HEADER_IDX1" ON "XSR     "."PMR_HEADER" 
		("UPDATE_USER" DESC,
		 "PMR_NUM" DESC) PCTFREE 10 ;

-- DDL Statements for indexes on Table "XSR     "."PMR_HEADER"

CREATE INDEX "XSR     "."PMR_HEADER_IDX2" ON "XSR     "."PMR_HEADER" 
		("RETAIN_CNTRY_CODE" ASC,
		 "PMR_NUM" ASC,
		 "BRANCH" ASC,
		 "SRC_NODE" ASC,
		 "SRC_APPL" ASC,
		 "SRC_TRAN_ID" ASC) PCTFREE 10 ;

-- DDL Statements for indexes on Table "XSR     "."PMR_HEADER"

CREATE INDEX "XSR     "."PMR_HEADER_IDX3" ON "XSR     "."PMR_HEADER" 
		("PMR_NUM" ASC,
		 "RETAIN_CNTRY_CODE" ASC,
		 "BRANCH" ASC,
		 "SRC_NODE" ASC,
		 "SRC_APPL" ASC,
		 "SRC_TRAN_ID" ASC) PCTFREE 10 ;

-- DDL Statements for indexes on Table "XSR     "."PMR_HEADER"

CREATE INDEX "XSR     "."PMR_HEADER_IDX4" ON "XSR     "."PMR_HEADER" 
		("SRC_APPL" ASC,
		 "SRC_NODE" ASC) PCTFREE 10 ;

-- DDL Statements for indexes on Table "XSR     "."PMR_HEADER"

CREATE INDEX "XSR     "."PMR_HEADER_IDX5" ON "XSR     "."PMR_HEADER" 
		("SRC_APPL" ASC,
		 "SRC_NODE" DESC) PCTFREE 10 ;

-- DDL Statements for indexes on Table "XSR     "."PMR_HEADER"

CREATE INDEX "XSR     "."PMR_HEADER_IDX6" ON "XSR     "."PMR_HEADER" 
		("SRC_APPL" ASC,
		 "SRC_TRAN_ID" ASC) PCTFREE 10 ;

-- DDL Statements for indexes on Table "XSR     "."PMR_HEADER"

CREATE INDEX "XSR     "."PMR_HEADER_IDX7" ON "XSR     "."PMR_HEADER" 
		("PMR_NUM" ASC,
		 "BRANCH" ASC,
		 "RETAIN_CNTRY_CODE" ASC,
		 "CREATE_DATETIME" DESC) PCTFREE 10 ;

-- DDL Statements for indexes on Table "XSR     "."PMR_DRAFT_RETAIN_INFO"

CREATE INDEX "XSR     "."PMR_DRFT_RI_IDX1" ON "XSR     "."PMR_DRAFT_RETAIN_INFO" 
		("PMR_CREATE_DATE" ASC) PCTFREE 10 ;

-- DDL Statements for indexes on Table "XSR     "."PMR_DRAFT_RETAIN_INFO"

CREATE INDEX "XSR     "."PMR_DRFT_RI_IDX2" ON "XSR     "."PMR_DRAFT_RETAIN_INFO" 
		("STATUS" ASC) PCTFREE 10 ;

-- DDL Statements for indexes on Table "XSR     "."PMR_DRAFT_XSR_INFO"

CREATE INDEX "XSR     "."PMR_DRFT_XI_IDX1" ON "XSR     "."PMR_DRAFT_XSR_INFO" 
		("SUPPORT_ID" ASC) PCTFREE 10 ;

-- DDL Statements for indexes on Table "XSR     "."PMR_DRAFT_XSR_INFO"

CREATE INDEX "XSR     "."PMR_DRFT_XI_IDX2" ON "XSR     "."PMR_DRAFT_XSR_INFO" 
		("ALT_CONTACT_ID" ASC) PCTFREE 10 ;

-- DDL Statements for indexes on Table "XSR     "."PMR_DRAFT_XSR_INFO"

CREATE INDEX "XSR     "."PMR_DRFT_XI_IDX3" ON "XSR     "."PMR_DRAFT_XSR_INFO" 
		("CREATE_CONTACT_ID" ASC) PCTFREE 10 ;

-- DDL Statements for indexes on Table "XSR     "."PMR_DRAFT_XSR_INFO"

CREATE INDEX "XSR     "."PMR_DRFT_XI_IDX4" ON "XSR     "."PMR_DRAFT_XSR_INFO" 
		("UPDATE_CONTACT_ID" ASC) PCTFREE 10 ;


-- DDL Statements for indexes on Table "XSR     "."PMR_XSR_INFO"

CREATE INDEX "XSR     "."PMR_HEADER_XI_IDX1" ON "XSR     "."PMR_XSR_INFO" 
		("SUPPORT_ID" ASC) PCTFREE 10 ;

-- DDL Statements for indexes on Table "XSR     "."PMR_XSR_INFO"

CREATE INDEX "XSR     "."PMR_HEADER_XI_IDX2" ON "XSR     "."PMR_XSR_INFO" 
		("ALT_CONTACT_ID" ASC) PCTFREE 10 ;

-- DDL Statements for indexes on Table "XSR     "."PMR_XSR_INFO"

CREATE INDEX "XSR     "."PMR_HEADER_XI_IDX3" ON "XSR     "."PMR_XSR_INFO" 
		("CREATE_CONTACT_ID" ASC) PCTFREE 10 ;

-- DDL Statements for indexes on Table "XSR     "."PMR_XSR_INFO"

CREATE INDEX "XSR     "."PMR_HEADER_XI_IDX4" ON "XSR     "."PMR_XSR_INFO" 
		("UPDATE_CONTACT_ID" ASC) PCTFREE 10 ;


-- DDL Statements for indexes on Table "XSR     "."PMR_RETRY_XSR_INFO"

CREATE INDEX "XSR     "."PMR_RETRY_XI_IDX1" ON "XSR     "."PMR_RETRY_XSR_INFO" 
		("SUPPORT_ID" ASC) PCTFREE 10 ;

-- DDL Statements for indexes on Table "XSR     "."PMR_RETRY_XSR_INFO"

CREATE INDEX "XSR     "."PMR_RETRY_XI_IDX2" ON "XSR     "."PMR_RETRY_XSR_INFO" 
		("ALT_CONTACT_ID" ASC) PCTFREE 10 ;

-- DDL Statements for indexes on Table "XSR     "."PMR_RETRY_XSR_INFO"

CREATE INDEX "XSR     "."PMR_RETRY_XI_IDX3" ON "XSR     "."PMR_RETRY_XSR_INFO" 
		("CREATE_CONTACT_ID" ASC) PCTFREE 10 ;

-- DDL Statements for indexes on Table "XSR     "."PMR_RETRY_XSR_INFO"

CREATE INDEX "XSR     "."PMR_RETRY_XI_IDX4" ON "XSR     "."PMR_RETRY_XSR_INFO" 
		("UPDATE_CONTACT_ID" ASC) PCTFREE 10 ;
-- DDL Statements for indexes on Table "XSR     "."USER_PROFILE"

CREATE UNIQUE INDEX "XSR     "."USER_PROFILE_IDX1" ON "XSR     "."USER_PROFILE" 
		("CONTACT_ID" ASC) PCTFREE 0 ;


-- DDL Statements for indexes on Table "XSR     "."USER_PROFILE_NOTIFICATION"

CREATE INDEX "XSR     "."USR_PRF_NTF_IDX1" ON "XSR     "."USER_PROFILE_NOTIFICATION" 
		("NTFY_2_CLOSE" DESC) PCTFREE 10 ;

-- DDL Statements for indexes on Table "XSR     "."USER_PROFILE_NOTIFICATION"

CREATE INDEX "XSR     "."USR_PRF_NTF_IDX2" ON "XSR     "."USER_PROFILE_NOTIFICATION" 
		("NTFY_1_UPDT" DESC) PCTFREE 10 ;

-- DDL Statements for indexes on Table "XSR     "."USER_PROFILE_NOTIFICATION"

CREATE INDEX "XSR     "."USR_PRF_NTF_IDX3" ON "XSR     "."USER_PROFILE_NOTIFICATION" 
		("NTFY_1_CLOSE" DESC) PCTFREE 10 ;

-- DDL Statements for indexes on Table "XSR     "."USER_PROFILE_NOTIFICATION"

CREATE INDEX "XSR     "."USR_PRF_NTF_IDX4" ON "XSR     "."USER_PROFILE_NOTIFICATION" 
		("NTFY_2_UPDT" DESC) PCTFREE 10 ;

-- DDL Statements for indexes on Table "XSR     "."USER_PROFILE_NOTIFICATION"

CREATE INDEX "XSR     "."USR_PRF_NTF_IDX5" ON "XSR     "."USER_PROFILE_NOTIFICATION" 
		("NTFY_3_UPDT" DESC) PCTFREE 10 ;

-- DDL Statements for indexes on Table "XSR     "."USER_PROFILE_NOTIFICATION"

CREATE INDEX "XSR     "."USR_PRF_NTF_IDX6" ON "XSR     "."USER_PROFILE_NOTIFICATION" 
		("NTFY_3_CLOSE" DESC) PCTFREE 10 ;

-- DDL Statements for indexes on Table "XSR     "."USER_PROFILE_NOTIFICATION"

CREATE INDEX "XSR     "."USR_PRF_NTF_IDX7" ON "XSR     "."USER_PROFILE_NOTIFICATION" 
		("NTFY_4_UPDT" DESC) PCTFREE 10 ;

-- DDL Statements for indexes on Table "XSR     "."USER_PROFILE_NOTIFICATION"

CREATE INDEX "XSR     "."USR_PRF_NTF_IDX8" ON "XSR     "."USER_PROFILE_NOTIFICATION" 
		("NTFY_4_CLOSE" DESC) PCTFREE 10 ;



COMMIT WORK;
