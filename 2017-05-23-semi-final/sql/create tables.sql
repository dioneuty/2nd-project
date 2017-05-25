drop table hanb_user;
drop table student;
drop table teacher;
drop table education;
drop table attendance;

drop sequence hanb_user_seq;
drop sequence education_seq;

create table hanb_user (
  unum number primary key
  ,uids varchar2(12) not null
  ,upw varchar2(15) not null
  ,uname varchar2(15) not null
  ,uemail varchar2(30) not null
  ,uphone varchar2(12) not null
  ,utype number not null
);

create table student(
  unum number not null,
  enum number not null,	
  fir_sub varchar2(30) default '' not null,
  sec_sub varchar2(30) default '' not null,
  thr_sub varchar2(30) default '' not null,
  s_total number default 0,
  s_append number default 0,
  s_early number default 0,
  s_absent number default 0,
  s_empoly number default 0 not null,
  s_cmpt number default 0 not null,
  s_sucemp number default 0 not null
  );
  
  create table teacher (
    unum number not null,
    enum number not null
  );
  
  
  create table education(
    enum number primary key,
    ename varchar2(60) not null,
    esub1 varchar2(30) default '',
    esub2 varchar2(30) default '',
    esub3 varchar2(30) default '',
    startdate date default to_date('2017.01.01', 'yyyy-mm-dd'),
    enddate date default to_date('2017.01.30', 'yyyy-mm-dd'),
    etotalday number default 0,
    stnum number DEFAULT 0,
    unum number not null
  );
  
  create table attendance(
    unum number not null,
    atdate date not null,
    st_time date DEFAULT to_date('00.00','hh24:mi'),
    ed_time date DEFAULT to_date('00.00','hh24:mi'),
    state number default 0,
    tcheck number default 0
  );
	
  drop sequence jobcnslt_seq;
  drop table job_consultant;
  CREATE TABLE job_consultant
	(
    num        NUMBER            NOT NULL, 
    sub        VARCHAR2(90)      DEFAULT '제목없음', 
    uids	   VARCHAR2(30)	     NOT NULL,
    uname      VARCHAR2(40)      DEFUALT '글쓴이', 
    fdate       DATE              DEFAULT sysdate, 
    cnt        NUMBER            DEFAULT 0, 
    content    VARCHAR2(1024)    DEFAULT '내용없음', 
    CONSTRAINT JOB_CONSULTANT_PK PRIMARY KEY (num)
	);
	create sequence jobcnslt_seq;
	

insert into job_consultant (num,sub,uids,uname,fdate,cnt,content) values(jobcnsltnt.nextVal,'제목','tmp','글쓴이',sysdate,0,'내용');
	
-- 시퀀스 생성
 create sequence hanb_user_seq;
 create sequence education_seq;

 
 -- 잡다한 명령어들
 insert into education (enum,ename,unum) values(education_seq.nextVal,'기본',1);
 
 select * from education;
 select * from hanb_user;
 select * from student;
 select * from attendance;
 insert into ATTENDANCE (unum,atdate,st_time,ed_time,state) values(2,to_date('2017.01.31','yyyy-mm-dd'),'09.00','18.00',2));
 
 delete from HANB_USER where uids='stu1';
 
 insert into ATTENDANCE (unum,atdate,st_time,ed_time,state) values(2,sysdate,to_date('09.00','hh24:mi'),to_date('12.00','hh24:mi'),2);

 
 
 -- 건의사항
 drop table suggest;
 create table suggest(
	idx number primary key,
	utype number not null,
	uids varchar2(12) not null,
	wpw varchar2(15) not null,	
	title varchar2(40),
	regdate date default sysdate not null,  
	cntnt clob
);
date default to_date('2017.01.01', 'yyyy-mm-dd')

create sequence suggest_seq;
insert into suggest (idx,utype,uids,wpw,title,regdate,cntnt) values(suggest_seq.nextVal,'2','글쓴이','임시','제목',sysdate,'내용');

drop table notice;
-- notice Table Create SQL
CREATE TABLE notice
(
    n_num        NUMBER            NOT NULL, 
    n_sub        VARCHAR2(90)      DEFAULT '제목없음', 
    unum        VARCHAR2(15)      NOT NULL, 
    n_date       DATE              DEFAULT sysdate, 
    n_cnt        NUMBER            DEFAULT 0, 
    n_content    VARCHAR2(1024)    DEFAULT '내용없음', 
    CONSTRAINT NOTICE_PK PRIMARY KEY (n_num)
)
/

insert into notice(n_num,n_sub,unum,n_date,n_cnt,n_content) values(notice_SEQ.nextVal,'제목','글쓴이',sysdate,0,'내용');

CREATE SEQUENCE notice_SEQ


//스테프
create table staff(
	unum number primary key not null,
	utype number not null,
	uname varchar(15) not null
);

//스태프:잡다한 사항들

insert into staff values((select unum from HANB_USER where uids='admin'),(select utype from HANB_USER where uids='admin'),(select uname from HANB_USER where uids='admin')); 
insert into staff values((select unum from HANB_USER where uids='public1'),(select utype from HANB_USER where uids='public1'),(select uname from HANB_USER where uids='public1')); 
insert into staff values((select unum from HANB_USER where uids='teacher1'),(select utype from HANB_USER where uids='teacher1'),(select uname from HANB_USER where uids='teacher1')); 
insert into staff values((select unum from HANB_USER where uids='teacher3'),(select utype from HANB_USER where uids='teacher3'),(select uname from HANB_USER where uids='teacher3')); 
insert into staff values((select unum from HANB_USER where uids='admin'),(select utype from HANB_USER where uids='admin'),(select uname from HANB_USER where uids='admin')); 



select * from staff;

CREATE TABLE freeboard
(
    num        NUMBER            NOT NULL, 
    sub        VARCHAR2(90)      DEFAULT '제목없음', 
    uname      VARCHAR2(40)      NOT NULL, 
    fdate       DATE              DEFAULT sysdate, 
    cnt        NUMBER            DEFAULT 0, 
    content    VARCHAR2(1024)    DEFAULT '내용없음', 
    CONSTRAINT FREEBOARD_PK PRIMARY KEY (num)
);
create sequence free_seq;

insert into freeboard values(free_seq.nextVal, '제목', '이름', to_date('2017.01.01', 'yyyy-mm-dd'), 0, '내용');

CREATE TABLE freeboard
(
    num        NUMBER            NOT NULL, 
    sub        VARCHAR2(90)      DEFAULT '제목없음', 
    uname      VARCHAR2(40)      NOT NULL, 
    fdate       DATE              DEFAULT sysdate, 
    cnt        NUMBER            DEFAULT 0, 
    content    VARCHAR2(1024)    DEFAULT '내용없음', 
    CONSTRAINT FREEBOARD_PK PRIMARY KEY (num)
);
create sequence free_seq;

CREATE TABLE epilogue
(
    ep_num     NUMBER            NOT NULL, 
    ep_sub     VARCHAR2(128)     DEFAULT '제목없음', 
    ep_cont    VARCHAR2(1024)    NULL, 
    uname      VARCHAR2(15)      NOT NULL, 
    ep_date    DATE              DEFAULT sysdate, 
    CONSTRAINT EPILOGUE_PK PRIMARY KEY (ep_num)
);
CREATE SEQUENCE epilogue_SEQ;
insert into epilogue values(epilogue_SEQ.nextVal,'제목','내용','글쓴이',sysdate);

insert into notice values(notice_seq.nextVal,6,'admin','1111','world',sysdate,'eifdssdf');

 -- to_date('','yyyy-mm-dd');

alter table suggest add(title varchar2(80));

select * from suggest;
select * from notice; 
 
 
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
insert into JOB_STATE values(job_state_SEQ.nextVal,'글쓴이','제목','회사','IT');

drop table homework;
CREATE TABLE  homework
(
    hnum      NUMBER            NOT NULL, 
    hsub      VARCHAR2(60)      DEFAULT '제목없음', 
    uname     VARCHAR2(15)      NOT NULL, 
    hcont     VARCHAR2(1024)    NOT NULL, 
    hadd_1    VARCHAR2(128)     DEFAULT ' ', 
    hadd_2    VARCHAR2(128)     DEFAULT ' ', 
    hadd_3    VARCHAR2(128)     DEFAULT ' ', 
    hadd_4    VARCHAR2(128)     DEFAULT ' ', 
    hadd_5    VARCHAR2(128)     DEFAULT ' ', 
    hcheck    NUMBER            NOT NULL, 
    CONSTRAINT HOMEWORK_PK PRIMARY KEY (hnum)
);

CREATE SEQUENCE homework_SEQ
START WITH 1
INCREMENT BY 1;
/

insert into homework (hnum,hsub,uname,hcont,hadd_1,hadd_2,hadd_3,hadd_4,hadd_5,hcheck) values(homework_SEQ.nextVAl,'제목','이름','내용','파일1','파일2','파일3','파일4','파일5',0);
delete from homework where hsub='이름';
select * from homework;
 
alter table homework add (hadd_3 varchar2(128));
  