CREATE TABLE category (categ_id 	INT
					  , catheg_name VARCHAR(255)
					  , CONSTRAINT cp_categ_id PRIMARY KEY (categ_id)
					  , CONSTRAINT cu_catheg_name UNIQUE (catheg_name));

CREATE TABLE soft_type (soft_type_id 	INT
					  , soft_type_name 	VARCHAR(255)
					  , CONSTRAINT cp_soft_type_id PRIMARY KEY (soft_type_id)
					  , CONSTRAINT cu_type_name UNIQUE (soft_type_name));
					  
CREATE TABLE dev_stage (dev_stage_id 	INT
					  , dev_stage_name 	VARCHAR(255)
					  , CONSTRAINT cp_dev_stage_id PRIMARY KEY (dev_stage_id)
					  , CONSTRAINT cu_dev_stage_name UNIQUE (dev_stage_name));
					  
CREATE TABLE proj_role (proj_role_id 	INT
					  , proj_name 		VARCHAR(255)
					  , proj_role_desc 	VARCHAR(512)
					  , CONSTRAINT cp_proj_role_id PRIMARY KEY (proj_role_id)
					  , CONSTRAINT cu_proj_name UNIQUE (proj_name));
					  
CREATE TABLE tag	   (tag_id 		INT
					  , tag_text 	VARCHAR(255)
					  , CONSTRAINT cp_tag_id PRIMARY KEY (tag_id)
					  , CONSTRAINT cu_tag_text UNIQUE (tag_text));
					  
CREATE TABLE author    (auth_id 		INT
					  , auth_login 		VARCHAR(255)
					  , auth_pass 		VARCHAR(255)
					  , auth_name 		VARCHAR(255)
					  , auth_status 	VARCHAR(255)
					  , auth_birthdate 	DATE
					  , auth_sex VARCHAR(6) CHECK(auth_sex IN('Male', 'Female'))
					  , CONSTRAINT cp_auth_id PRIMARY KEY (auth_id)
					  , CONSTRAINT cu_author UNIQUE (auth_login, auth_name));

CREATE TABLE recom     (recom_id 		INT
					  , auth_id 		INT
					  , categ_id 		INT
					  , soft_type_id	INT
					  , proj_role_id 	INT
					  , dev_stage_id 	INT
					  , recom_title		VARCHAR(255)
					  , recom_text 		CLOB
					  , recom_create_time 	TIMESTAMP
					  , recom_native_auth 	VARCHAR(255)
					  , recom_like_num 		INT
					  , recom_dislike_num 	INT
					  , recom_init_condit 	VARCHAR(1024)
					  , recom_conseq		VARCHAR(1024)
					  , recom_side_eff		VARCHAR(1024)
					  , recom_req_res		VARCHAR(1024)
					  , recom_use_cond		VARCHAR(1024)
					  , CONSTRAINT cp_recom_id 	  PRIMARY KEY (recom_id)
					  , CONSTRAINT cu_recom_title UNIQUE (recom_title)
					  , CONSTRAINT cf_recom_auth_id 	 FOREIGN KEY (auth_id) 		REFERENCES author	(auth_id)
					  , CONSTRAINT cf_recom_catheg_id 	 FOREIGN KEY (categ_id) 	REFERENCES category(categ_id)
					  , CONSTRAINT cf_recom_soft_type_id FOREIGN KEY (soft_type_id) REFERENCES soft_type(soft_type_id)
					  , CONSTRAINT cf_recom_proj_role_id FOREIGN KEY (proj_role_id) REFERENCES proj_role(proj_role_id)
					  , CONSTRAINT cf_recom_dev_stage_id FOREIGN KEY (dev_stage_id) REFERENCES dev_stage(dev_stage_id));
					  
CREATE TABLE tag_to_recom (recom_id INT
						 , tag_id 	INT
						 , CONSTRAINT cf_recom_id FOREIGN KEY (recom_id) REFERENCES recom(recom_id)
						 , CONSTRAINT cf_tag_id FOREIGN KEY (tag_id) REFERENCES tag(tag_id));
						 
CREATE TABLE influence 	  (recom_reason_id 	INT
						 , recom_eff_id 	INT
						 , CONSTRAINT cf_recom_reason_id FOREIGN KEY (recom_reason_id) REFERENCES recom(recom_id)
						 , CONSTRAINT cf_recom_eff_id 	 FOREIGN KEY (recom_eff_id) 	 REFERENCES recom(recom_id));
						 
CREATE TABLE review (review_id 	INT
				   , recom_id 	INT
				   , auth_id 	INT
				   , review_text 	CLOB
				   , is_confirm 	VARCHAR(3) CHECK(is_confirm IN('YES', 'NO'))
				   , review_time	TIMESTAMP
				   , CONSTRAINT cp_review_id PRIMARY KEY (review_id)
				   , CONSTRAINT cf_review_recom_id FOREIGN KEY (recom_id) REFERENCES recom(recom_id)
				   , CONSTRAINT cf_review_auth_id FOREIGN KEY (auth_id) REFERENCES author(auth_id));
						 
CREATE TABLE feedback (auth_id 	INT
					 , recom_id INT
				     , CONSTRAINT cf_feedback_recom_id FOREIGN KEY (recom_id) REFERENCES recom(recom_id)
				     , CONSTRAINT cf_feedbackw_auth_id FOREIGN KEY (auth_id) REFERENCES author(auth_id));
						 
						 
/*триггер для автоинкремента таблицы рекомендаций (RECOM table) */
CREATE SEQUENCE recom_seq;

create or replace
TRIGGER RECOM_AUTO_INCREMENT_TRIGGER 
BEFORE INSERT ON RECOM
FOR EACH ROW

BEGIN
  SELECT recom_seq.NEXTVAL
  INTO   :new.RECOM_ID
  FROM   dual;
END;

/*триггер для метки создания рекомендации (RECOM table) */

CREATE OR REPLACE TRIGGER DATE_TRIGGER_RECOM 
BEFORE INSERT ON RECOM 
FOR EACH ROW
BEGIN
  :new.RECOM_CREATE_TIME := sysdate;
END;


INSERT INTO DEV_STAGE (DEV_STAGE_ID, DEV_STAGE_NAME) VALUES ('1', 'Первый уровень')
INSERT INTO DEV_STAGE (DEV_STAGE_ID, DEV_STAGE_NAME) VALUES ('2', 'Второй уровень')
INSERT INTO DEV_STAGE (DEV_STAGE_ID, DEV_STAGE_NAME) VALUES ('3', 'Третий уровень')
INSERT INTO DEV_STAGE (DEV_STAGE_ID, DEV_STAGE_NAME) VALUES ('4', 'Четвертый уровень')
INSERT INTO DEV_STAGE (DEV_STAGE_ID, DEV_STAGE_NAME) VALUES ('5', 'Пятый уровень')



INSERT INTO CATEGORY (CATEG_ID, CATHEG_NAME) VALUES ('1', 'Первая категория')
INSERT INTO CATEGORY (CATEG_ID, CATHEG_NAME) VALUES ('2', 'Вторая категория')
INSERT INTO CATEGORY (CATEG_ID, CATHEG_NAME) VALUES ('3', 'Третья категория')
INSERT INTO CATEGORY (CATEG_ID, CATHEG_NAME) VALUES ('4', 'Четвертая категория')
INSERT INTO CATEGORY (CATEG_ID, CATHEG_NAME) VALUES ('5', 'Пятая категория')


INSERT INTO SOFT_TYPE (SOFT_TYPE_ID, SOFT_TYPE_NAME) VALUES ('1', 'первый тип')
INSERT INTO SOFT_TYPE (SOFT_TYPE_ID, SOFT_TYPE_NAME) VALUES ('2', 'второй тип')
INSERT INTO SOFT_TYPE (SOFT_TYPE_ID, SOFT_TYPE_NAME) VALUES ('3', 'третий тип')
INSERT INTO SOFT_TYPE (SOFT_TYPE_ID, SOFT_TYPE_NAME) VALUES ('4', 'четвертый тип')
INSERT INTO SOFT_TYPE (SOFT_TYPE_ID, SOFT_TYPE_NAME) VALUES ('5', 'пятый тип')


