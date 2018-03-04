--0303 update

--------------------------------------------관리자------------------------------------------
CREATE TABLE admin
(
	aId varchar2(10) PRIMARY KEY,
	aPasswd varchar2(10) NOT NULL
);
--시퀀스 없음
--------------------------------------------상점 회원-------------------------------------------
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
	sBusinesshours varchar2(20) NOT NULL,
    sParkinglot varchar2(1) NOT NULL,
    sTerrace varchar2(1) NOT NULL,
    sMenu varchar2(100) NOT NULL,
	sCategory varchar2(10) NOT NULL,
    sImage varchar2(200),
    sLike number(3) default 0,
  	sHate number(3) default 0
);
commit;

--------------------------------------------------------상점 이미지 등록---------------------------------------------------------------
drop table sfile purge;
CREATE TABLE sfile
(   
	fileNum number(5) primary key,
	fileName varchar2(200),
    soId varchar2(50) references shopowner(soId)
);
ALTER TABLE sfile ADD CONSTRAINT uk_sfile_sCode UNIQUE(soId);

CREATE SEQUENCE SEQ_sfile_fileNum INCREMENT BY 1 START WITH 1;
commit;
select *from sfile;




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
