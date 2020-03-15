
CREATE TABLE BATCH_JOB_INSTANCE  (
	JOB_INSTANCE_ID BIGINT  NOT NULL PRIMARY KEY ,
	VERSION BIGINT ,
	JOB_NAME VARCHAR(100) NOT NULL,
	JOB_KEY VARCHAR(32) NOT NULL,
	constraint JOB_INST_UN unique (JOB_NAME, JOB_KEY)
) ENGINE=InnoDB;

CREATE TABLE BATCH_JOB_EXECUTION  (
	JOB_EXECUTION_ID BIGINT  NOT NULL PRIMARY KEY ,
	VERSION BIGINT  ,
	JOB_INSTANCE_ID BIGINT NOT NULL,
	CREATE_TIME DATETIME NOT NULL,
	START_TIME DATETIME DEFAULT NULL ,
	END_TIME DATETIME DEFAULT NULL ,
	STATUS VARCHAR(10) ,
	EXIT_CODE VARCHAR(2500) ,
	EXIT_MESSAGE VARCHAR(2500) ,
	LAST_UPDATED DATETIME,
	JOB_CONFIGURATION_LOCATION VARCHAR(2500) NULL,
	constraint JOB_INST_EXEC_FK foreign key (JOB_INSTANCE_ID)
	references BATCH_JOB_INSTANCE(JOB_INSTANCE_ID)
) ENGINE=InnoDB;

CREATE TABLE BATCH_JOB_EXECUTION_PARAMS  (
	JOB_EXECUTION_ID BIGINT NOT NULL ,
	TYPE_CD VARCHAR(6) NOT NULL ,
	KEY_NAME VARCHAR(100) NOT NULL ,
	STRING_VAL VARCHAR(250) ,
	DATE_VAL DATETIME DEFAULT NULL ,
	LONG_VAL BIGINT ,
	DOUBLE_VAL DOUBLE PRECISION ,
	IDENTIFYING CHAR(1) NOT NULL ,
	constraint JOB_EXEC_PARAMS_FK foreign key (JOB_EXECUTION_ID)
	references BATCH_JOB_EXECUTION(JOB_EXECUTION_ID)
) ENGINE=InnoDB;

CREATE TABLE BATCH_STEP_EXECUTION  (
	STEP_EXECUTION_ID BIGINT  NOT NULL PRIMARY KEY ,
	VERSION BIGINT NOT NULL,
	STEP_NAME VARCHAR(100) NOT NULL,
	JOB_EXECUTION_ID BIGINT NOT NULL,
	START_TIME DATETIME NOT NULL ,
	END_TIME DATETIME DEFAULT NULL ,
	STATUS VARCHAR(10) ,
	COMMIT_COUNT BIGINT ,
	READ_COUNT BIGINT ,
	FILTER_COUNT BIGINT ,
	WRITE_COUNT BIGINT ,
	READ_SKIP_COUNT BIGINT ,
	WRITE_SKIP_COUNT BIGINT ,
	PROCESS_SKIP_COUNT BIGINT ,
	ROLLBACK_COUNT BIGINT ,
	EXIT_CODE VARCHAR(2500) ,
	EXIT_MESSAGE VARCHAR(2500) ,
	LAST_UPDATED DATETIME,
	constraint JOB_EXEC_STEP_FK foreign key (JOB_EXECUTION_ID)
	references BATCH_JOB_EXECUTION(JOB_EXECUTION_ID)
) ENGINE=InnoDB;

CREATE TABLE BATCH_STEP_EXECUTION_CONTEXT  (
	STEP_EXECUTION_ID BIGINT NOT NULL PRIMARY KEY,
	SHORT_CONTEXT VARCHAR(2500) NOT NULL,
	SERIALIZED_CONTEXT TEXT ,
	constraint STEP_EXEC_CTX_FK foreign key (STEP_EXECUTION_ID)
	references BATCH_STEP_EXECUTION(STEP_EXECUTION_ID)
) ENGINE=InnoDB;

CREATE TABLE BATCH_JOB_EXECUTION_CONTEXT  (
	JOB_EXECUTION_ID BIGINT NOT NULL PRIMARY KEY,
	SHORT_CONTEXT VARCHAR(2500) NOT NULL,
	SERIALIZED_CONTEXT TEXT ,
	constraint JOB_EXEC_CTX_FK foreign key (JOB_EXECUTION_ID)
	references BATCH_JOB_EXECUTION(JOB_EXECUTION_ID)
) ENGINE=InnoDB;

CREATE TABLE BATCH_STEP_EXECUTION_SEQ (
	ID BIGINT NOT NULL,
	UNIQUE_KEY CHAR(1) NOT NULL,
	constraint UNIQUE_KEY_UN unique (UNIQUE_KEY)
) ENGINE=InnoDB;

INSERT INTO BATCH_STEP_EXECUTION_SEQ (ID, UNIQUE_KEY) select * from (select 0 as ID, '0' as UNIQUE_KEY) as tmp where not exists(select * from BATCH_STEP_EXECUTION_SEQ);

CREATE TABLE BATCH_JOB_EXECUTION_SEQ (
	ID BIGINT NOT NULL,
	UNIQUE_KEY CHAR(1) NOT NULL,
	constraint UNIQUE_KEY_UN unique (UNIQUE_KEY)
) ENGINE=InnoDB;

INSERT INTO BATCH_JOB_EXECUTION_SEQ (ID, UNIQUE_KEY) select * from (select 0 as ID, '0' as UNIQUE_KEY) as tmp where not exists(select * from BATCH_JOB_EXECUTION_SEQ);

CREATE TABLE BATCH_JOB_SEQ (
	ID BIGINT NOT NULL,
	UNIQUE_KEY CHAR(1) NOT NULL,
	constraint UNIQUE_KEY_UN unique (UNIQUE_KEY)
) ENGINE=InnoDB;

INSERT INTO BATCH_JOB_SEQ (ID, UNIQUE_KEY) select * from (select 0 as ID, '0' as UNIQUE_KEY) as tmp where not exists(select * from BATCH_JOB_SEQ);

CREATE TABLE `batch`.`user`(
   user_no int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
   user_id varchar(20) NOT NULL,
   user_type varchar(10) NOT NULL,
   user_name varchar(20) NOT NULL,
   pwd varchar(255) NOT NULL,
   status tinyint DEFAULT 1 NOT NULL,
   create_date timestamp DEFAULT current_timestamp() NOT NULL,
   update_date datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO user (user_id, user_type, user_name, pwd, status, create_date, update_date) VALUES ('admin', 'ADMIN', 'jglee', '$2a$10$iDoOUv8ynSgyEsWuP1t3E.qs5zVRhJwUu.PXPmEM7h98s39VgInx6', 1, now(), null);
INSERT INTO user (user_id, user_type, user_name, pwd, status, create_date, update_date) VALUES ('user', 'USER', 'jglee', '$2a$10$iDoOUv8ynSgyEsWuP1t3E.qs5zVRhJwUu.PXPmEM7h98s39VgInx6', 1, now(), null);
INSERT INTO user (user_id, user_type, user_name, pwd, status, create_date, update_date) VALUES ('test', 'TEST', 'jglee', '$2a$10$iDoOUv8ynSgyEsWuP1t3E.qs5zVRhJwUu.PXPmEM7h98s39VgInx6', 1, now(), null);
INSERT INTO user (user_id, user_type, user_name, pwd, status, create_date, update_date) VALUES ('user1', 'USER', 'jglee', '$2a$10$iDoOUv8ynSgyEsWuP1t3E.qs5zVRhJwUu.PXPmEM7h98s39VgInx6', 1, now(), null);
INSERT INTO user (user_id, user_type, user_name, pwd, status, create_date, update_date) VALUES ('user2', 'USER', 'jglee', '$2a$10$iDoOUv8ynSgyEsWuP1t3E.qs5zVRhJwUu.PXPmEM7h98s39VgInx6', 1, now(), null);
INSERT INTO user (user_id, user_type, user_name, pwd, status, create_date, update_date) VALUES ('user3', 'USER', 'jglee', '$2a$10$iDoOUv8ynSgyEsWuP1t3E.qs5zVRhJwUu.PXPmEM7h98s39VgInx6', 1, now(), null);
INSERT INTO user (user_id, user_type, user_name, pwd, status, create_date, update_date) VALUES ('user4', 'USER', 'jglee', '$2a$10$iDoOUv8ynSgyEsWuP1t3E.qs5zVRhJwUu.PXPmEM7h98s39VgInx6', 1, now(), null);
INSERT INTO user (user_id, user_type, user_name, pwd, status, create_date, update_date) VALUES ('user5', 'USER', 'jglee', '$2a$10$iDoOUv8ynSgyEsWuP1t3E.qs5zVRhJwUu.PXPmEM7h98s39VgInx6', 1, now(), null);
INSERT INTO user (user_id, user_type, user_name, pwd, status, create_date, update_date) VALUES ('user6', 'USER', 'jglee', '$2a$10$iDoOUv8ynSgyEsWuP1t3E.qs5zVRhJwUu.PXPmEM7h98s39VgInx6', 1, now(), null);
INSERT INTO user (user_id, user_type, user_name, pwd, status, create_date, update_date) VALUES ('user7', 'USER', 'jglee', '$2a$10$iDoOUv8ynSgyEsWuP1t3E.qs5zVRhJwUu.PXPmEM7h98s39VgInx6', 1, now(), null);
INSERT INTO user (user_id, user_type, user_name, pwd, status, create_date, update_date) VALUES ('user8', 'USER', 'jglee', '$2a$10$iDoOUv8ynSgyEsWuP1t3E.qs5zVRhJwUu.PXPmEM7h98s39VgInx6', 1, now(), null);
INSERT INTO user (user_id, user_type, user_name, pwd, status, create_date, update_date) VALUES ('user9', 'USER', 'jglee', '$2a$10$iDoOUv8ynSgyEsWuP1t3E.qs5zVRhJwUu.PXPmEM7h98s39VgInx6', 1, now(), null);
INSERT INTO user (user_id, user_type, user_name, pwd, status, create_date, update_date) VALUES ('user10', 'USER', 'jglee', '$2a$10$iDoOUv8ynSgyEsWuP1t3E.qs5zVRhJwUu.PXPmEM7h98s39VgInx6', 1, now(), null);
INSERT INTO user (user_id, user_type, user_name, pwd, status, create_date, update_date) VALUES ('user11', 'USER', 'jglee', '$2a$10$iDoOUv8ynSgyEsWuP1t3E.qs5zVRhJwUu.PXPmEM7h98s39VgInx6', 1, now(), null);
INSERT INTO user (user_id, user_type, user_name, pwd, status, create_date, update_date) VALUES ('user12', 'USER', 'jglee', '$2a$10$iDoOUv8ynSgyEsWuP1t3E.qs5zVRhJwUu.PXPmEM7h98s39VgInx6', 1, now(), null);
INSERT INTO user (user_id, user_type, user_name, pwd, status, create_date, update_date) VALUES ('user13', 'USER', 'jglee', '$2a$10$iDoOUv8ynSgyEsWuP1t3E.qs5zVRhJwUu.PXPmEM7h98s39VgInx6', 1, now(), null);
INSERT INTO user (user_id, user_type, user_name, pwd, status, create_date, update_date) VALUES ('user14', 'USER', 'jglee', '$2a$10$iDoOUv8ynSgyEsWuP1t3E.qs5zVRhJwUu.PXPmEM7h98s39VgInx6', 1, now(), null);
INSERT INTO user (user_id, user_type, user_name, pwd, status, create_date, update_date) VALUES ('user15', 'USER', 'jglee', '$2a$10$iDoOUv8ynSgyEsWuP1t3E.qs5zVRhJwUu.PXPmEM7h98s39VgInx6', 1, now(), null);
INSERT INTO user (user_id, user_type, user_name, pwd, status, create_date, update_date) VALUES ('user16', 'USER', 'jglee', '$2a$10$iDoOUv8ynSgyEsWuP1t3E.qs5zVRhJwUu.PXPmEM7h98s39VgInx6', 1, now(), null);
INSERT INTO user (user_id, user_type, user_name, pwd, status, create_date, update_date) VALUES ('user17', 'USER', 'jglee', '$2a$10$iDoOUv8ynSgyEsWuP1t3E.qs5zVRhJwUu.PXPmEM7h98s39VgInx6', 1, now(), null);
INSERT INTO user (user_id, user_type, user_name, pwd, status, create_date, update_date) VALUES ('user18', 'USER', 'jglee', '$2a$10$iDoOUv8ynSgyEsWuP1t3E.qs5zVRhJwUu.PXPmEM7h98s39VgInx6', 1, now(), null);
INSERT INTO user (user_id, user_type, user_name, pwd, status, create_date, update_date) VALUES ('user19', 'USER', 'jglee', '$2a$10$iDoOUv8ynSgyEsWuP1t3E.qs5zVRhJwUu.PXPmEM7h98s39VgInx6', 1, now(), null);
INSERT INTO user (user_id, user_type, user_name, pwd, status, create_date, update_date) VALUES ('user20', 'USER', 'jglee', '$2a$10$iDoOUv8ynSgyEsWuP1t3E.qs5zVRhJwUu.PXPmEM7h98s39VgInx6', 1, now(), null);
INSERT INTO user (user_id, user_type, user_name, pwd, status, create_date, update_date) VALUES ('dev', 'DEV', 'dev', '$2a$10$iDoOUv8ynSgyEsWuP1t3E.qs5zVRhJwUu.PXPmEM7h98s39VgInx6', 1, now(), null);