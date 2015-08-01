begin work;
insert into xsr.pmr_retry (src_tran_id, src_appl, src_node, pmr_num, branch, retain_cntry_code, retry_cnt, stage, create_user)
   values ('1241187013967740', 'xsr', 'sallred', NULL, NULL, '000', 0, 0, 'moe');

insert into xsr.pmr_retry_xsr_info (src_tran_id, src_appl, src_node, support_id, title, description, contact_method,
      alt_contact_method, alt_contact_id, opersys_id, cust_tracking_num, prod_id, initial_severity, severity_description,
      pmr_create_src_appl, locale, open_count, create_contact_id, update_contact_id, add_alt_contact_id, remove_alt_contact_id,
      partner_init, contact_id, create_user)
values ('1241187013967740', 'xsr', 'sallred', 23902527, 'This SR goes to 11',
         'This is a short description of my problem. My server is not working.', 'telephone', NULL, NULL, 8,
         '12345123451234512345', 'D52VQLL', '2', 'On a scale of 1 to 4, this severity is a 2', NULL, NULL, 0,
         '505104', NULL, NULL, NULL, 0, 505104, 'moe');

insert into xsr.pmr_retry_retain_info (src_tran_id, src_appl, src_node, sw_hd, retain_node, status, retain_caller_type,
      ibm_cust_num, cust_name_nls, contact_name_nls, support_level, queue, center, next_queue, next_center, request_type_id,
      comp_id, severity, system_down, call_cat, pmr_create_date, pmr_update_date, pmr_update_time, first_name, last_name,
      phone_num, phone_ext, alt_phone_num, alt_phone_ext, fax_num, pager, email_adr, alt_email_address, submit_type,
      resp_type, priority, signature_name, create_user)
values ('1241187013967740', 'xsr', 'sallred', 'S', NULL, NULL, NULL, '7777777', NULL, 'Yongyuth Muphayak', '1', NULL, NULL,
      NULL, NULL, 4, '5733WS500', '2', '1', NULL, NULL, NULL, NULL, 'Yongyuth', 'Muphayak', '029550555', NULL, NULL, NULL,
      NULL, NULL, 'yongyuth@betagro.com', NULL, NULL, NULL, NULL, NULL, 'moe');

insert into xsr.pmr_retry_text (src_tran_id, src_appl, src_node, text_block, create_user)
values ('1241187013967740', 'xsr', 'sallred', '*** Electronic submission by customer via xSR tool, version A2.1.0', 'moe')asfsadf;
commit work;


BEGIN ATOMIC
DECLARE cntr INT DEFAULT 1;
DECLARE emsg CHAR(20);
whileloop:
WHILE RAND() < .99 DO
SET cntr = cntr + 1;
END WHILE;
SET emsg = '#loops: ' || CHAR(cntr);
SIGNAL SQLSTATE '75001' SET MESSAGE_TEXT = emsg;
END


WITH temp (tabname, cnt) as (
select 'xsr.pmr_retry', count(*) from xsr.pmr_retry where src_node = 'sallred' union
select 'xsr.pmr_retry_xsr_info', count(*) from xsr.pmr_retry_xsr_info where src_node = 'sallred' union
select 'xsr.pmr_retry_retain_info', count(*)  from xsr.pmr_retry_retain_info where src_node = 'sallred' union
select 'xsr.pmr_retry_text', count(*) from xsr.pmr_retry_text where src_node = 'sallred'
) select * from temp order by tabname;
-- select * from xsr.pmr_retry where src_node = 'sallred';
-- select * from xsr.pmr_retry_xsr_info where src_node = 'sallred';
-- select * from xsr.pmr_retry_retain_info where src_node = 'sallred';
-- select * from xsr.pmr_retry_text where src_node = 'sallred';

delete from xsr.pmr_retry_xsr_info where src_node = 'sallred';
delete from xsr.pmr_retry_retain_info where src_node = 'sallred';
delete from xsr.pmr_retry_text where src_node = 'sallred';
delete from xsr.pmr_retry where src_node = 'sallred';

-- Test good insert statements, should commit fine
CALL XSR.TEST_PROCEDURE('Y');
-- Test bad insert statements, should rollback
CALL XSR.TEST_PROCEDURE('N');
-- Test bad insert statements without rollback, header should be there without text
CALL XSR.TEST_PROCEDURE('T');

DROP PROCEDURE XSR.TEST_PROCEDURE;

CREATE PROCEDURE XSR.TEST_PROCEDURE
(
   IN  p_good  CHAR(1)
)
SPECIFIC dp_dlt_cmpnt
DYNAMIC RESULT SETS 0
MODIFIES SQL DATA
LANGUAGE SQL

BEGIN NOT ATOMIC

   -------------------------------------------------------------
   -- VARIABLE declaration
   -------------------------------------------------------------

   -- Generic Variables
   DECLARE SQLCODE                     INTEGER     DEFAULT 0;--
   DECLARE SQLSTATE                    CHAR(5)     DEFAULT '00000';--
   DECLARE return_code                 INTEGER     DEFAULT 0;--
   DECLARE h_sqlcode                   INTEGER     DEFAULT 0;--
   DECLARE h_sqlstate                  CHAR(5)     DEFAULT '00000';--

   --Local Variables
   DECLARE v_status                     INTEGER;--
   DECLARE v_sqlcode                    INTEGER;--
   DECLARE v_sqlstate                   CHAR(5);--
   DECLARE v_err_dscr                   VARCHAR(256);--
   DECLARE v_null                       VARCHAR(15);--


   DECLARE p_cmpnt_id   VARCHAR(15);--
   DECLARE p_user_id VARCHAR(127);--
   DECLARE p_status        INTEGER;--
   DECLARE p_sqlcode       INTEGER;--
   DECLARE p_sqlstate      CHAR(5);--
   DECLARE p_err_dscr   VARCHAR(256);--


    -------------------------------------------------------------
    -- CONDITION declaration
    -------------------------------------------------------------

    -- (80000~80099) EXIT
    DECLARE terminate_on_fatal_error     CONDITION FOR SQLSTATE '80000';--

    -- (80100~80199) SQLCODE & SQLSTATE
    DECLARE sql_reset                    CONDITION FOR SQLSTATE '80100';--

    -------------------------------------------------------------
    --  EXCEPTION HANDLER declaration
    -------------------------------------------------------------

   -- Continue Handler
   DECLARE CONTINUE HANDLER FOR sql_reset
   BEGIN NOT ATOMIC
       SET h_sqlcode    = 0;--
       SET h_sqlstate   = '00000';--
   END;--

   DECLARE CONTINUE HANDLER FOR NOT FOUND
   BEGIN NOT ATOMIC
           -- Capture SQLCODE & SQLSTATE
         SELECT  SQLCODE  ,  SQLSTATE
         INTO    h_sqlcode,  h_sqlstate
         FROM    SYSIBM.SYSDUMMY1;--
   END;--

   -- SQLExp/warn Handler
   DECLARE CONTINUE HANDLER FOR SQLEXCEPTION, SQLWARNING
   BEGIN NOT ATOMIC
         -- Capture SQLCODE & SQLSTATE
         SELECT  SQLCODE  ,  SQLSTATE
         INTO    h_sqlcode,  h_sqlstate
         FROM    SYSIBM.SYSDUMMY1;--
   END;--

   DECLARE EXIT HANDLER FOR terminate_on_fatal_error
   BEGIN NOT ATOMIC
           SET p_sqlcode = h_sqlcode;--
           SET p_sqlstate = h_sqlstate;--
      IF (p_good = 'Y' or p_good = 'N') THEN
         ROLLBACK TO SAVEPOINT pmr_retry;--
      END IF;--
      IF ( LENGTH(p_err_dscr) = 0) THEN
      SET p_err_dscr = 'Proc exited via terminate_on_fatal_error';--
      END IF;--
   END;--

   --======--
   -- Main --
   --======--
   SIGNAL sql_reset;--
   SAVEPOINT pmr_retry ON ROLLBACK RETAIN CURSORS;--

   IF ( p_good = 'Y' ) THEN
      --1. Insert pmr_retry header
      insert into xsr.pmr_retry (src_tran_id, src_appl, src_node, pmr_num, branch,
         retain_cntry_code, retry_cnt, stage, create_user)
      values ('1241187013967740', 'xsr', 'sallred', NULL, NULL, '000', 0, 0, 'moe');--

      --Make sure insert worked
      IF  h_sqlcode < 0  THEN
          SET p_err_dscr = 'error deleting from eem.cnt_cmpnt_xref where cmpnt_id='||p_cmpnt_id;--
          SET p_status = 9;--
          SIGNAL terminate_on_fatal_error;--
      END IF;--

      --2.  Insert pmr_text
      SIGNAL sql_reset;--
      insert into xsr.pmr_retry_text (src_tran_id, src_appl, src_node, text_block, create_user)
      values ('1241187013967740', 'xsr', 'sallred','Electronic submission by customer via xSR tool version A2.1.0', 'moe');--

      --Make sure delete worked
      IF  h_sqlcode < 0  THEN
          SET p_err_dscr = 'error deleting from eem.cnt_cmpnt_xref where cmpnt_id='||p_cmpnt_id;--
          SET p_status = 9;--
          SIGNAL terminate_on_fatal_error;--
      END IF;--
   END IF;--

   IF ( p_good = 'N' or p_good = 'T' ) THEN
      --1. Insert pmr_retry header
      insert into xsr.pmr_retry (src_tran_id, src_appl, src_node, pmr_num, branch,
         retain_cntry_code, retry_cnt, stage, create_user)
      values ('1241187013967740', 'xsr', 'sallred', NULL, NULL, '000', 0, 0, 'moe');--

      --Make sure insert worked
      IF  h_sqlcode < 0  THEN
          SET p_err_dscr = 'error deleting from eem.cnt_cmpnt_xref where cmpnt_id='||p_cmpnt_id;--
          SET p_status = 9;--
          SIGNAL terminate_on_fatal_error;--
      END IF;--

      --2.  Insert pmr_text
      SIGNAL sql_reset;--
      insert into xsr.pmr_retry_text (src_tran_id, src_appl, src_node, text_block, create_user)
      values ('1241187013967740', null, 'sallred','Electronic submission by customer via xSR tool version A2.1.0', 'moe');--

      --Make sure delete worked
      IF  h_sqlcode < 0  THEN
          SET p_err_dscr = 'error deleting from eem.cnt_cmpnt_xref where cmpnt_id='||p_cmpnt_id;--
          SET p_status = 9;--
          SIGNAL terminate_on_fatal_error;--
      END IF;--
   END IF;--

   -- Capture SQLCODE & SQLSTATE
   SELECT  SQLCODE  ,  SQLSTATE
   INTO    p_sqlcode,  p_sqlstate
   FROM    SYSIBM.SYSDUMMY1;--

   SET p_status = 0;--
   SET p_err_dscr = 'Component '||p_cmpnt_id||' successfully deleted';--
   COMMIT;--
   RETURN 0;--
END
;

