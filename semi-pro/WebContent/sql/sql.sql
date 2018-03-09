--0309 update

----------------------------------------------------------관리자----------------------------------------------------------
CREATE TABLE admin
(
	aId varchar2(10) PRIMARY KEY,
	aPasswd varchar2(10) NOT NULL
);
--시퀀스 없음

----------------------------------------------------------개인 회원----------------------------------------------------------
drop table member cascade constraint;
CREATE TABLE member
(
	-- 사용자 아이디는 이메일 형식
	mId varchar2(50) PRIMARY KEY,
	mPasswd varchar2(20) NOT NULL,
	mName varchar2(10) NOT NULL UNIQUE,
	mPhone1 varchar2(3),
  	mPhone2 varchar2(4),
  	mPhone3 varchar2(4)
);

----------------------------------------------------개인회원>리뷰----------------------------------------------------------
drop table review cascade constraint;
CREATE TABLE review
(
  	rvNum number(3) PRIMARY KEY,
  	rvContent varchar2(900) NOT NULL,
    mName varchar2(10) NOT NULL references member(mName),
    rvWritedate date NOT NULL,
  	sLike number(3),
  	sHate number(3),
    sCode varchar2(9) NOT NULL references shop(sCode)
);
CREATE SEQUENCE SEQ_reviewboard_rvNum INCREMENT BY 1 START WITH 1;

----------------------------------------------------------상점 회원----------------------------------------------------------
drop table shopowner cascade constraint;
CREATE TABLE shopowner
(
	soId varchar2(30) PRIMARY KEY,
	soPasswd varchar2(10) NOT NULL,
	soName varchar2(20) NOT NULL,
	soPhone varchar2(13) NOT NULL,
	soLicense varchar2(10) NOT NULL UNIQUE,
	soPost varchar2(5) NOT NULL,
	soAddr varchar2(500) NOT NULL,
	soLevel varchar2(1) default 0,
	soJoindate date default sysdate
);
--------------------------------------------상점 등록(상점 회원)-------------------------------------------
--0309 update
drop table shop cascade constraint;
CREATE TABLE shop
(
	-- 카테고리+사업자등록번호 뒤 7자리
    sCode varchar2(9) PRIMARY KEY,
    sName varchar2(20) NOT NULL,
    soId varchar2(50) references shopowner(soId),
    sPost varchar2(5) NOT NULL,
    sAddr varchar2(500) NOT NULL,
    sPhone varchar2(14) NOT NULL,
    sBusinesshours varchar2(100) NOT NULL,
    sParkinglot varchar2(1) NOT NULL,
    sTerrace varchar2(1) NOT NULL,
    sMenu1 varchar2(300) ,
    sMenu2 varchar2(300) ,
  	sCategory varchar2(10) NOT NULL,
    sImage varchar2(500),
    sLike number(3) default 0,
    sHate number(3) default 0,
    sInterest number(3),
    sSubway varchar2(10) default '없음'  
);
commit;
-------------------------------------------------------관리자->상점회원 공지사항-----------------------------------------------------------
--0303 update
--drop table noticetoso cascade constraint;
CREATE TABLE noticetoso
(
	noticeNum number(3) PRIMARY KEY,
	noticeContent varchar2(2000) NOT NULL,
	noticeTitle varchar2(30) NOT NULL,
	noticeWritedate date DEFAULT sysdate NOT NULL,
	noticeWriter varchar2(6) DEFAULT '관리자' NOT NULL,
	noticeReadcnt number(3)
);

CREATE SEQUENCE SEQ_noticetoso_noticeNum INCREMENT BY 1 START WITH 1;

insert into noticetoso(noticeNum,noticeTitle,noticeContent) values(1,'공지사항1','공지사항1');
insert into noticetoso(noticeNum,noticeTitle,noticeContent) values(2,'공지사항2','공지사항2');
insert into noticetoso(noticeNum,noticeTitle,noticeContent) values(3,'공지사항3','공지사항3');
insert into noticetoso(noticeNum,noticeTitle,noticeContent) values(4,'공지사항4','공지사항4');
insert into noticetoso(noticeNum,noticeTitle,noticeContent) values(5,'공지사항5','공지사항5');
insert into noticetoso(noticeNum,noticeTitle,noticeContent) values(6,'공지사항6','공지사항6');
insert into noticetoso(noticeNum,noticeTitle,noticeContent) values(7,'공지사항7','공지사항7');
insert into noticetoso(noticeNum,noticeTitle,noticeContent) values(8,'공지사항8','공지사항8');
insert into noticetoso(noticeNum,noticeTitle,noticeContent) values(9,'공지사항9','공지사항9');
insert into noticetoso(noticeNum,noticeTitle,noticeContent) values(10,'공지사항10','공지사항10');
insert into noticetoso(noticeNum,noticeTitle,noticeContent) values(11,'공지사항11','공지사항11');
insert into noticetoso(noticeNum,noticeTitle,noticeContent) values(12,'공지사항12','공지사항12');
insert into noticetoso(noticeNum,noticeTitle,noticeContent) values(13,'공지사항13','공지사항13');
insert into noticetoso(noticeNum,noticeTitle,noticeContent) values(14,'공지사항114','공지사항14');
insert into noticetoso(noticeNum,noticeTitle,noticeContent) values(15,'공지사항15','공지사항15');
insert into noticetoso(noticeNum,noticeTitle,noticeContent) values(16,'공지사항16','공지사항16');
commit;

-------------------------------------------------------관리자->개인회원 공지사항-----------------------------------------------------------
--0309 update
drop table noticetom cascade constraint;
CREATE TABLE noticetom
(
	noticeNum number(3) PRIMARY KEY,
	noticeContent varchar2(2000) NOT NULL,
	noticeTitle varchar2(30) NOT NULL,
	noticeWritedate date DEFAULT sysdate NOT NULL,
	noticeWriter varchar2(6) DEFAULT '관리자' NOT NULL,
	noticeReadcnt number(3)
);

CREATE SEQUENCE SEQ_noticetom_noticeNum INCREMENT BY 1 START WITH 1;

insert into noticetoso(noticeNum,noticeTitle,noticeContent) values(1,'공지사항1','공지사항1');
insert into noticetoso(noticeNum,noticeTitle,noticeContent) values(2,'공지사항2','공지사항2');
insert into noticetoso(noticeNum,noticeTitle,noticeContent) values(3,'공지사항3','공지사항3');
insert into noticetoso(noticeNum,noticeTitle,noticeContent) values(4,'공지사항4','공지사항4');
insert into noticetoso(noticeNum,noticeTitle,noticeContent) values(5,'공지사항5','공지사항5');
insert into noticetoso(noticeNum,noticeTitle,noticeContent) values(6,'공지사항6','공지사항6');
insert into noticetoso(noticeNum,noticeTitle,noticeContent) values(7,'공지사항7','공지사항7');
insert into noticetoso(noticeNum,noticeTitle,noticeContent) values(8,'공지사항8','공지사항8');
insert into noticetoso(noticeNum,noticeTitle,noticeContent) values(9,'공지사항9','공지사항9');
insert into noticetoso(noticeNum,noticeTitle,noticeContent) values(10,'공지사항10','공지사항10');
insert into noticetoso(noticeNum,noticeTitle,noticeContent) values(11,'공지사항11','공지사항11');
insert into noticetoso(noticeNum,noticeTitle,noticeContent) values(12,'공지사항12','공지사항12');
insert into noticetoso(noticeNum,noticeTitle,noticeContent) values(13,'공지사항13','공지사항13');
insert into noticetoso(noticeNum,noticeTitle,noticeContent) values(14,'공지사항114','공지사항14');
insert into noticetoso(noticeNum,noticeTitle,noticeContent) values(15,'공지사항15','공지사항15');
insert into noticetoso(noticeNum,noticeTitle,noticeContent) values(16,'공지사항16','공지사항16');
commit;


------------------------------------------------검색>키워드>점수-----------------------------------------------------------
drop table score purge;
create table score(
  sCategory varchar(10),
  sCode varchar(9),
  good number(2) default 0,
  bad number(2) default 0,
  scoreSum number(4) default 0,
  constraint score_category_sCode_pk primary key(sCategory,sCode)
);

select *from score;

insert into score values('신남','1',1,0,1);
insert into score values('조용','1',1,0,1);
insert into score values('신남','2',1,0,1);

----------------------------------------------------관심상점(좋아요 기능)----------------------------------------------------------
drop table interest cascade constraint;
CREATE TABLE interest
(
	-- 장바구니 번호 개념
	iNum number(2) PRIMARY KEY,
	-- 사용자 아이디는 이메일 형식
	mId varchar2(50) references member(mId),
	-- 사업자등록번호 뒤 7자리
	sCode varchar2(9) references shop(sCode)
);

CREATE SEQUENCE SEQ_interest_iNum INCREMENT BY 1 START WITH 1;
--기본키: iNum
--외래키: mId(member 테이블의 기본키), sCode(shop 테이블의 기본키)

