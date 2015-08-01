-- --------------------------------------------------------------------------
-- Description: This was used to develop common set of triggers for 
--					 maintaining who and when rows are updated on our tables.
-- 
-- Issues:		 On an update ('Test Update 2') the user field, if populated
--					 will not be updated to reflect the system user since an
--					 update_user was not really passed in.
-- 				 For example, if the row being updated has update_user=scott
--					 and the 'Update 2' statement below is processed then the 
--					 update_user should be set to the system user and instead
--					 it will continue to be scott.
-- --------------------------------------------------------------------------
DROP TABLE XSR.AVL_TRIGGER_TEST;

CREATE TABLE XSR.AVL_TRIGGER_TEST (
		AVL_ID INTEGER NOT NULL,
		DESCRIPTION CHAR(128),
		CREATE_USER VARGRAPHIC(127),
		CREATE_DATETIME TIMESTAMP DEFAULT CURRENT TIMESTAMP NOT NULL,
		UPDATE_USER VARGRAPHIC(127) DEFAULT USER,
		UPDATE_DATETIME TIMESTAMP DEFAULT CURRENT TIMESTAMP NOT NULL		
	)
	DATA CAPTURE NONE 
	IN XSR1_DATA_01 INDEX IN XSR1_INDX_01;

ALTER TABLE XSR.AVL_TRIGGER_TEST ADD CONSTRAINT AVL_TT_PK PRIMARY KEY (AVL_ID);

DROP TRIGGER XSR.T_UB_AVL_TT;
CREATE TRIGGER XSR.T_UB_AVL_TT
   NO CASCADE BEFORE UPDATE ON XSR.AVL_TRIGGER_TEST
   REFERENCING NEW AS N OLD AS O
   FOR EACH ROW MODE DB2SQL
BEGIN ATOMIC
   SET N.UPDATE_DATETIME = CURRENT TIMESTAMP;--
   IF (N.UPDATE_USER IS NULL OR RTRIM(N.UPDATE_USER) = '') THEN
     SET N.UPDATE_USER = USER;--
   END IF;--
END;

DROP TRIGGER XSR.T_IB_AVL_TT;
CREATE TRIGGER XSR.T_IB_AVL_TT
   NO CASCADE BEFORE INSERT ON XSR.AVL_TRIGGER_TEST
   REFERENCING  NEW AS N
   FOR EACH ROW MODE DB2SQL
BEGIN ATOMIC
   SET N.CREATE_DATETIME = CURRENT TIMESTAMP;--
   SET N.UPDATE_DATETIME = CURRENT TIMESTAMP;--
   SET N.UPDATE_USER = N.CREATE_USER;--
   IF (N.CREATE_USER IS NULL OR RTRIM(N.CREATE_USER) = '') THEN
      SET N.CREATE_USER = USER;--
      SET N.UPDATE_USER = USER;--
   END IF;--
END;


-- --------------------------------------------------------------------------
-- TEST DATA
-- --------------------------------------------------------------------------
insert into xsr.avl_trigger_test (avl_id, description, create_user) values (1, 'Insert 1', 'insert1_test');
insert into xsr.avl_trigger_test (avl_id, description) values (2, 'Insert 2');
insert into xsr.avl_trigger_test (avl_id, description, create_user) values (3, 'Insert 3', null);
insert into xsr.avl_trigger_test (avl_id, description, create_user) values (4, 'Insert 4', ' ');

update xsr.avl_trigger_test set description = 'Update 1', update_user = 'update1_test' where avl_id = 1;
update xsr.avl_trigger_test set description = 'Update 2' where avl_id = 2; -- Failed
update xsr.avl_trigger_test set description = 'Update 3', update_user = null where avl_id = 3;
update xsr.avl_trigger_test set description = 'Update 4', update_user = ' ' where avl_id = 4;
