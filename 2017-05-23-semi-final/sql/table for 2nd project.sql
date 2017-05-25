-- 테이블 순서는 관계를 고려하여 한 번에 실행해도 에러가 발생하지 않게 정렬되었습니다.

-- FAQ Table Create SQL
CREATE TABLE FAQ
(
    fnum      NUMBER            NOT NULL, 
    fsub      VARCHAR2(128)     DEFAULT ' ', 
    fqcont    VARCHAR2(128)     DEFAULT ' ', 
    facont    VARCHAR2(1024)    DEFAULT ' ', 
    uname     VARCHAR2(1024)    NOT NULL, 
    fdate     DATE              DEFAULT sysdate
);
/

CREATE SEQUENCE FAQ_SEQ
START WITH 1
INCREMENT BY 1;
/

CREATE OR REPLACE TRIGGER FAQ_fnum_AI_TRG
BEFORE INSERT ON FAQ 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT FAQ_SEQ.NEXTVAL
    INTO: NEW.fnum
    FROM DUAL;
END;
/

COMMENT ON TABLE FAQ IS '자주 묻는 질문'
/

COMMENT ON COLUMN FAQ.fnum IS '질문번호'
/

COMMENT ON COLUMN FAQ.fsub IS '질문제목'
/

COMMENT ON COLUMN FAQ.fqcont IS '질문내용'
/

COMMENT ON COLUMN FAQ.facont IS '답변내용'
/

COMMENT ON COLUMN FAQ.uname IS '작성자'
/

COMMENT ON COLUMN FAQ.fdate IS '작성일'
/


-- notice Table Create SQL
CREATE TABLE notice
(
    n_num        NUMBER            NOT NULL, 
    n_sub        VARCHAR2(90)      DEFAULT '제목없음', 
    unum         VARCHAR2(15)      NOT NULL, 
    n_date       DATE              DEFAULT sysdate, 
    n_cnt        NUMBER            DEFAULT 0, 
    n_content    VARCHAR2(1024)    DEFAULT '내용없음', 
    CONSTRAINT NOTICE_PK PRIMARY KEY (n_num)
);
/

CREATE SEQUENCE notice_SEQ
START WITH 1
INCREMENT BY 1;
/

CREATE OR REPLACE TRIGGER notice_n_num_AI_TRG
BEFORE INSERT ON notice 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT notice_SEQ.NEXTVAL
    INTO: NEW.n_num
    FROM DUAL;
END;
/

COMMENT ON TABLE notice IS '공지사항'
/

COMMENT ON COLUMN notice.n_num IS '공지번호'
/

COMMENT ON COLUMN notice.n_sub IS '제목'
/

COMMENT ON COLUMN notice.unum IS '작성자'
/

COMMENT ON COLUMN notice.n_date IS '등록일'
/

COMMENT ON COLUMN notice.n_cnt IS '조회수'
/

COMMENT ON COLUMN notice.n_content IS '내용'
/


-- epilogue Table Create SQL
CREATE TABLE epilogue
(
    ep_num     NUMBER            NOT NULL, 
    ep_sub     VARCHAR2(128)     DEFAULT '제목없음', 
    ep_cont    VARCHAR2(1024)    NULL, 
    uname      VARCHAR2(15)      NOT NULL, 
    ep_date    DATE              DEFAULT sysdate, 
    CONSTRAINT EPILOGUE_PK PRIMARY KEY (ep_num)
);
/

CREATE SEQUENCE epilogue_SEQ
START WITH 1
INCREMENT BY 1;
/

CREATE OR REPLACE TRIGGER epilogue_ep_num_AI_TRG
BEFORE INSERT ON epilogue 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT epilogue_SEQ.NEXTVAL
    INTO: NEW.ep_num
    FROM DUAL;
END;
/

COMMENT ON TABLE epilogue IS '교육후기 게시판'
/

COMMENT ON COLUMN epilogue.ep_num IS '후기번호'
/

COMMENT ON COLUMN epilogue.ep_sub IS '후기제목'
/

COMMENT ON COLUMN epilogue.ep_cont IS '후기내용'
/

COMMENT ON COLUMN epilogue.uname IS '작성자'
/

COMMENT ON COLUMN epilogue.ep_date IS '작성일'
/


-- job_info Table Create SQL
CREATE TABLE job_info
(
    ji_num        NUMBER            NOT NULL, 
    ji_comp       VARCHAR2(60)      NOT NULL, 
    ji_area       VARCHAR2(15)      NOT NULL, 
    ji_recruit    NUMBER            NOT NULL, 
    ji_type       VARCHAR2(12)      NOT NULL, 
    ji_enddate    VARCHAR2(24)      NOT NULL, 
    ji_date       DATE              DEFAULT sysdate, 
    ji_pay        VARCHAR2(24)      NOT NULL, 
    ji_phone      VARCHAR2(20)      DEFAULT '', 
    ji_cont       VARCHAR2(1024)    DEFAULT '내용없음', 
    CONSTRAINT JOB_INFO_PK PRIMARY KEY (ji_num)
);
/

INSERT INTO job_info VALUES (job_info_SEQ.nextVal, 'ji_comp 1', 'ji_area 1', 1, 'ji_type 1', 'ji_enddate 1', sysdate, 'ji_pay 1', 'ji_phone 1', 'ji_cont 1');
INSERT INTO job_info VALUES (job_info_SEQ.nextVal, 'ji_comp 2', 'ji_area 2', 2, 'ji_type 2', 'ji_enddate 2', sysdate, 'ji_pay 2', 'ji_phone 2', 'ji_cont 2');
INSERT INTO job_info VALUES (job_info_SEQ.nextVal, 'ji_comp 3', 'ji_area 3', 3, 'ji_type 3', 'ji_enddate 3', sysdate, 'ji_pay 3', 'ji_phone 3', 'ji_cont 3');
INSERT INTO job_info VALUES (job_info_SEQ.nextVal, 'ji_comp 4', 'ji_area 4', 4, 'ji_type 4', 'ji_enddate 4', sysdate, 'ji_pay 4', 'ji_phone 4', 'ji_cont 4');
INSERT INTO job_info VALUES (job_info_SEQ.nextVal, 'ji_comp 5', 'ji_area 5', 5, 'ji_type 5', 'ji_enddate 5', sysdate, 'ji_pay 5', 'ji_phone 5', 'ji_cont 5');

INSERT INTO job_info VALUES (job_info_SEQ.nextVal, 'ji_comp 06', 'ji_area 06', 06, 'ji_type 06', 'ji_enddate 06', sysdate, 'ji_pay 06', 'ji_phone 06', 'ji_cont 06');
INSERT INTO job_info VALUES (job_info_SEQ.nextVal, 'ji_comp 07', 'ji_area 07', 07, 'ji_type 07', 'ji_enddate 07', sysdate, 'ji_pay 07', 'ji_phone 07', 'ji_cont 07');
INSERT INTO job_info VALUES (job_info_SEQ.nextVal, 'ji_comp 08', 'ji_area 08', 08, 'ji_type 08', 'ji_enddate 08', sysdate, 'ji_pay 08', 'ji_phone 08', 'ji_cont 08');
INSERT INTO job_info VALUES (job_info_SEQ.nextVal, 'ji_comp 09', 'ji_area 09', 09, 'ji_type 09', 'ji_enddate 09', sysdate, 'ji_pay 09', 'ji_phone 09', 'ji_cont 09');
INSERT INTO job_info VALUES (job_info_SEQ.nextVal, 'ji_comp 10', 'ji_area 10', 10, 'ji_type 10', 'ji_enddate 10', sysdate, 'ji_pay 10', 'ji_phone 10', 'ji_cont 10');
INSERT INTO job_info VALUES (job_info_SEQ.nextVal, 'ji_comp 11', 'ji_area 11', 11, 'ji_type 11', 'ji_enddate 11', sysdate, 'ji_pay 11', 'ji_phone 11', 'ji_cont 11');
INSERT INTO job_info VALUES (job_info_SEQ.nextVal, 'ji_comp 12', 'ji_area 12', 12, 'ji_type 12', 'ji_enddate 12', sysdate, 'ji_pay 12', 'ji_phone 12', 'ji_cont 12');
INSERT INTO job_info VALUES (job_info_SEQ.nextVal, 'ji_comp 13', 'ji_area 13', 13, 'ji_type 13', 'ji_enddate 13', sysdate, 'ji_pay 13', 'ji_phone 13', 'ji_cont 13');
INSERT INTO job_info VALUES (job_info_SEQ.nextVal, 'ji_comp 14', 'ji_area 14', 14, 'ji_type 14', 'ji_enddate 14', sysdate, 'ji_pay 14', 'ji_phone 14', 'ji_cont 14');
INSERT INTO job_info VALUES (job_info_SEQ.nextVal, 'ji_comp 15', 'ji_area 15', 15, 'ji_type 15', 'ji_enddate 15', sysdate, 'ji_pay 15', 'ji_phone 15', 'ji_cont 15');


select * from job_info;

CREATE SEQUENCE job_info_SEQ
START WITH 1
INCREMENT BY 1;
/

CREATE OR REPLACE TRIGGER job_info_ji_num_AI_TRG
BEFORE INSERT ON job_info 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT job_info_SEQ.NEXTVAL
    INTO: NEW.ji_num
    FROM DUAL;
END;
/

COMMENT ON TABLE job_info IS '채용정보 게시판'
/

COMMENT ON COLUMN job_info.ji_num IS '채용정보번호'
/

COMMENT ON COLUMN job_info.ji_comp IS '업체명'
/

COMMENT ON COLUMN job_info.ji_area IS '지역'
/

COMMENT ON COLUMN job_info.ji_recruit IS '모집인원'
/

COMMENT ON COLUMN job_info.ji_type IS '고용형태'
/

COMMENT ON COLUMN job_info.ji_enddate IS '마감날짜'
/

COMMENT ON COLUMN job_info.ji_date IS '작성일'
/

COMMENT ON COLUMN job_info.ji_pay IS '급여'
/

COMMENT ON COLUMN job_info.ji_phone IS '연락처'
/

COMMENT ON COLUMN job_info.ji_cont IS '채용내용'
/


-- job_state Table Create SQL
CREATE TABLE job_state
(
    jnum        NUMBER           NOT NULL, 
    uname       VARCHAR2(15)     NOT NULL, 
    jsub        VARCHAR2(128)    NOT NULL, 
    jcompany    VARCHAR2(36)     NOT NULL, 
    jfield      VARCHAR2(30)     NOT NULL, 
    CONSTRAINT JOB_STATE_PK PRIMARY KEY (jnum)
);
/

CREATE SEQUENCE job_state_SEQ;
START WITH 1
INCREMENT BY 1;
/

CREATE OR REPLACE TRIGGER job_state_jnum_AI_TRG
BEFORE INSERT ON job_state 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT job_state_SEQ.NEXTVAL
    INTO: NEW.jnum
    FROM DUAL;
END;
/

COMMENT ON TABLE job_state IS '취업 현황 게시판'
/

COMMENT ON COLUMN job_state.jnum IS '현황게시물번호'
/

COMMENT ON COLUMN job_state.uname IS '유저이름'
/

COMMENT ON COLUMN job_state.jsub IS '교육과정명'
/

COMMENT ON COLUMN job_state.jcompany IS '취업업체명'
/

COMMENT ON COLUMN job_state.jfield IS '취업분야'
/


-- homework Table Create SQL
CREATE TABLE  homework
(
    hnum      NUMBER            NOT NULL, 
    hsub      VARCHAR2(60)      DEFAULT '제목없음', 
    uname     VARCHAR2(15)      NOT NULL, 
    hcont     VARCHAR2(1024)    NOT NULL, 
    hadd_1    VARCHAR2(128)     DEFAULT ' ', 
    hadd_2    VARCHAR2(128)     DEFAULT ' ', 
    hcheck    NUMBER            NOT NULL, 
    CONSTRAINT HOMEWORK_PK PRIMARY KEY (hnum)
);

CREATE SEQUENCE homework_SEQ
START WITH 1
INCREMENT BY 1;
/

CREATE OR REPLACE TRIGGER homework_hnum_AI_TRG
BEFORE INSERT ON homework 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT homework_SEQ.NEXTVAL
    INTO: NEW.hnum
    FROM DUAL;
END;
/

COMMENT ON TABLE homework IS '과제게시판'
/

COMMENT ON COLUMN homework.hnum IS '과제등록번호'
/

COMMENT ON COLUMN homework.hsub IS '과제제목'
/

COMMENT ON COLUMN homework.uname IS '작성자'
/

COMMENT ON COLUMN homework.hcont IS '과제내용'
/

COMMENT ON COLUMN homework.hadd_1 IS '첨부파일1'
/

COMMENT ON COLUMN homework.hadd_2 IS '첨부파일2'
/

COMMENT ON COLUMN homework.hcheck IS '과제확인여부'
/


