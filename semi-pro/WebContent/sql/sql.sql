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
    sCode varchar2(9) references shop(sCode)
);
ALTER TABLE sfile ADD CONSTRAINT uk_sfile_sCode UNIQUE(sCode);

CREATE SEQUENCE SEQ_sfile_fileNum INCREMENT BY 1 START WITH 1;
commit;
select *from sfile;