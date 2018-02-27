
/* Drop Triggers */

DROP TRIGGER TRI_coupon_couponNum;
DROP TRIGGER TRI_interest_iNum;
DROP TRIGGER TRI_noticetomember_noticeNum;
DROP TRIGGER TRI_noticetom_noticeNum;
DROP TRIGGER TRI_noticetoso_noticeNum;
DROP TRIGGER TRI_notice_noticeNum;
DROP TRIGGER TRI_qnaboardreply_qnaReplyNum;
DROP TRIGGER TRI_qnaboard_qnaNum;
DROP TRIGGER TRI_reviewboard_rvNum;
DROP TRIGGER TRI_reviewreply_rpNum;
DROP TRIGGER TRI_soqnaboardreply_qnaReplyNum;
DROP TRIGGER TRI_soqnaboard_qnaNum;



/* Drop Tables */

DROP TABLE admin CASCADE CONSTRAINTS;
DROP TABLE coupon CASCADE CONSTRAINTS;
DROP TABLE file CASCADE CONSTRAINTS;
DROP TABLE interest CASCADE CONSTRAINTS;
DROP TABLE qnaboardreply CASCADE CONSTRAINTS;
DROP TABLE qnaboard CASCADE CONSTRAINTS;
DROP TABLE reviewreply CASCADE CONSTRAINTS;
DROP TABLE reviewboard CASCADE CONSTRAINTS;
DROP TABLE member CASCADE CONSTRAINTS;
DROP TABLE noticetom CASCADE CONSTRAINTS;
DROP TABLE noticetoso CASCADE CONSTRAINTS;
DROP TABLE shop CASCADE CONSTRAINTS;
DROP TABLE soqnaboardreply CASCADE CONSTRAINTS;
DROP TABLE soqnaboard CASCADE CONSTRAINTS;
DROP TABLE shopowner CASCADE CONSTRAINTS;



/* Drop Sequences */

DROP SEQUENCE SEQ_coupon_couponNum;
DROP SEQUENCE SEQ_interest_iNum;
DROP SEQUENCE SEQ_noticetom_noticeNum;
DROP SEQUENCE SEQ_noticetoso_noticeNum;
DROP SEQUENCE SEQ_notice_noticeNum;
DROP SEQUENCE SEQ_qnaboardreply_qnaReplyNum;
DROP SEQUENCE SEQ_qnaboard_qnaNum;
DROP SEQUENCE SEQ_reviewboard_rvNum;
DROP SEQUENCE SEQ_reviewreply_rpNum;
DROP SEQUENCE SEQ_soqnaboardrp_qnaReplyNum;
DROP SEQUENCE SEQ_soqnaboard_qnaNum;




/* Create Sequences */

CREATE SEQUENCE SEQ_coupon_couponNum INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_interest_iNum INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_noticetomember_noticeNum INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_noticetom_noticeNum INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_noticetoso_noticeNum INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_notice_noticeNum INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_qnaboardreply_qnaReplyNum INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_qnaboard_qnaNum INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_reviewboard_rvNum INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_reviewreply_rpNum INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_soqnaboardreply_qnaReplyNum INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_soqnaboard_qnaNum INCREMENT BY 1 START WITH 1;



/* Create Tables */

CREATE TABLE admin
(
	aId varchar2(10) NOT NULL,
	aPasswd varchar2(10) NOT NULL,
	PRIMARY KEY (aId)
);


CREATE TABLE coupon
(
	couponNum number(3) NOT NULL,
	couponTitle varchar2(30) NOT NULL,
	-- 사업자등록번호 뒤 7자리
	sCode varchar2(7),
	sName varchar2(20) NOT NULL,
	couponReadcnt number(3),
	couponContent varchar2(100) NOT NULL,
	couponImage varchar2(20) NOT NULL,
	couponErolldate date,
	PRIMARY KEY (couponNum)
);


CREATE TABLE file
(

);


CREATE TABLE interest
(
	-- 장바구니 번호 개념
	iNum number(2) NOT NULL,
	-- 사용자 아이디는 이메일 형식
	mId varchar2(50) NOT NULL,
	-- 사업자등록번호 뒤 7자리
	sCode varchar2(7) NOT NULL,
	sName varchar2(20) NOT NULL,
	sImage1 varchar2(20) NOT NULL,
	PRIMARY KEY (iNum)
);


CREATE TABLE member
(
	-- 사용자 아이디는 이메일 형식
	mId varchar2(50) NOT NULL,
	mPasswd varchar2(20) NOT NULL,
	mName varchar2(10) NOT NULL UNIQUE,
	-- 핸드폰 앞 3자리
	mPhone varchar2(3) NOT NULL,
	PRIMARY KEY (mId)
);


CREATE TABLE noticetom
(
	noticeNum number(2) NOT NULL,
	noticeContent varchar2(2000) NOT NULL,
	noticeTitle varchar2(30) NOT NULL,
	noticeWritedate date DEFAULT sysdate NOT NULL,
	noticeWriter varchar2(6) DEFAULT '관리자' NOT NULL,
	noticeReadcnt number(2),
	PRIMARY KEY (noticeNum)
);


CREATE TABLE noticetoso
(
	noticeNum number(2) NOT NULL,
	noticeContent varchar2(2000) NOT NULL,
	noticeTitle varchar2(30) NOT NULL,
	noticeWritedate date DEFAULT sysdate NOT NULL,
	noticeWriter varchar2(6) DEFAULT '관리자' NOT NULL,
	noticeReadcnt number(2),
	PRIMARY KEY (noticeNum)
);


CREATE TABLE qnaboard
(
	qnaNum number(2) NOT NULL,
	mName varchar2(10) NOT NULL,
	qnaContent varchar2(100) NOT NULL,
	qnaWritedate date DEFAULT sysdate,
	-- 사업자등록번호 뒤 7자리
	sCode varchar2(7),
	PRIMARY KEY (qnaNum)
);


CREATE TABLE qnaboardreply
(
	qnaReplyNum number(2) NOT NULL,
	sName varchar2(20) NOT NULL,
	qnaReplyContent varchar2(100) NOT NULL,
	qnaNum number(2) NOT NULL,
	qnaReplyWritedate date,
	-- 사업자등록번호 뒤 7자리
	sCode varchar2(7),
	PRIMARY KEY (qnaReplyNum)
);


CREATE TABLE reviewboard
(
	rvNum number(2) NOT NULL,
	rvTitle varchar2(20) NOT NULL,
	rvContent varchar2(900) NOT NULL,
	mName varchar2(10) NOT NULL,
	rvWritedate date NOT NULL,
	rvReadcnt number(3),
	rvRecomendedcnt number(3),
	-- 5점 만점
	sRecomendedscore number(1),
	-- 사업자등록번호 뒤 7자리
	sCode varchar2(7) NOT NULL,
	PRIMARY KEY (rvNum)
);


CREATE TABLE reviewreply
(
	rpNum number(2) NOT NULL,
	mName varchar2(10) NOT NULL,
	rpContent varchar2(100) NOT NULL,
	rpWritedate date NOT NULL,
	rvNum number(2) NOT NULL,
	PRIMARY KEY (rpNum)
);


CREATE TABLE shop
(
	-- 사업자등록번호 뒤 7자리
	sCode varchar2(7) NOT NULL,
	sName varchar2(20) NOT NULL,
	oId varchar2(50) NOT NULL,
	sAddr varchar2(500) NOT NULL,
	sPhone varchar2(12) NOT NULL,
	sRecomendedscore number(1),
	sCategory varchar2(4) NOT NULL,
	PRIMARY KEY (sCode)
);


CREATE TABLE shopowner
(
	oId varchar2(50) NOT NULL,
	oPasswd varchar2(20) NOT NULL,
	oName varchar2(20) NOT NULL,
	oPhone varchar2(13) NOT NULL,
	sName varchar2(20) NOT NULL,
	sPhone varchar2(14) NOT NULL,
	-- 하이픈 제외하고 숫자로만 10자리 입력
	sLicense varchar2(10) NOT NULL UNIQUE,
	sPost varchar2(5) NOT NULL,
	sAddr varchar2(500) NOT NULL,
	-- 0: 미승인
	-- 1: 승인, 체험
	-- 2: 승인, 유료
	-- 
	sLevel varchar2(1) NOT NULL,
	sJoindate date NOT NULL,
	PRIMARY KEY (oId)
);


CREATE TABLE soqnaboard
(
	qnaNum number(2) NOT NULL,
	oId varchar2(50) NOT NULL,
	sName varchar2(20) NOT NULL,
	qnaTitle varchar2(20) NOT NULL,
	qnaContent varchar2(100) NOT NULL,
	qnaWritedate date DEFAULT sysdate NOT NULL,
	qnaCategory varchar2(10),
	qnaComplete varchar2(10),
	PRIMARY KEY (qnaNum)
);


CREATE TABLE soqnaboardreply
(
	qnaReplyNum number(2) NOT NULL,
	qnaNum number(2) NOT NULL,
	qnaReplyContent varchar2(100) NOT NULL,
	PRIMARY KEY (qnaReplyNum)
);



/* Create Foreign Keys */

ALTER TABLE interest
	ADD FOREIGN KEY (mId)
	REFERENCES member (mId)
;


ALTER TABLE qnaboard
	ADD FOREIGN KEY (mName)
	REFERENCES member (mName)
;


ALTER TABLE reviewboard
	ADD FOREIGN KEY (mName)
	REFERENCES member (mName)
;


ALTER TABLE reviewreply
	ADD FOREIGN KEY (mName)
	REFERENCES member (mName)
;


ALTER TABLE qnaboardreply
	ADD FOREIGN KEY (qnaNum)
	REFERENCES qnaboard (qnaNum)
;


ALTER TABLE reviewreply
	ADD FOREIGN KEY (rvNum)
	REFERENCES reviewboard (rvNum)
;


ALTER TABLE coupon
	ADD FOREIGN KEY (sCode)
	REFERENCES shop (sCode)
;


ALTER TABLE interest
	ADD FOREIGN KEY (sCode)
	REFERENCES shop (sCode)
;


ALTER TABLE qnaboard
	ADD FOREIGN KEY (sCode)
	REFERENCES shop (sCode)
;


ALTER TABLE qnaboardreply
	ADD FOREIGN KEY (sCode)
	REFERENCES shop (sCode)
;


ALTER TABLE reviewboard
	ADD FOREIGN KEY (sCode)
	REFERENCES shop (sCode)
;


ALTER TABLE shop
	ADD FOREIGN KEY (oId)
	REFERENCES shopowner (oId)
;


ALTER TABLE soqnaboard
	ADD FOREIGN KEY (oId)
	REFERENCES shopowner (oId)
;


ALTER TABLE soqnaboardreply
	ADD FOREIGN KEY (qnaNum)
	REFERENCES soqnaboard (qnaNum)
;



/* Create Triggers */

CREATE OR REPLACE TRIGGER TRI_coupon_couponNum BEFORE INSERT ON coupon
FOR EACH ROW
BEGIN
	SELECT SEQ_coupon_couponNum.nextval
	INTO :new.couponNum
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_interest_iNum BEFORE INSERT ON interest
FOR EACH ROW
BEGIN
	SELECT SEQ_interest_iNum.nextval
	INTO :new.iNum
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_noticetomember_noticeNum BEFORE INSERT ON noticetomember
FOR EACH ROW
BEGIN
	SELECT SEQ_noticetomember_noticeNum.nextval
	INTO :new.noticeNum
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_noticetom_noticeNum BEFORE INSERT ON noticetom
FOR EACH ROW
BEGIN
	SELECT SEQ_noticetom_noticeNum.nextval
	INTO :new.noticeNum
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_noticetoso_noticeNum BEFORE INSERT ON noticetoso
FOR EACH ROW
BEGIN
	SELECT SEQ_noticetoso_noticeNum.nextval
	INTO :new.noticeNum
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_notice_noticeNum BEFORE INSERT ON notice
FOR EACH ROW
BEGIN
	SELECT SEQ_notice_noticeNum.nextval
	INTO :new.noticeNum
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_qnaboardreply_qnaReplyNum BEFORE INSERT ON qnaboardreply
FOR EACH ROW
BEGIN
	SELECT SEQ_qnaboardreply_qnaReplyNum.nextval
	INTO :new.qnaReplyNum
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_qnaboard_qnaNum BEFORE INSERT ON qnaboard
FOR EACH ROW
BEGIN
	SELECT SEQ_qnaboard_qnaNum.nextval
	INTO :new.qnaNum
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_reviewboard_rvNum BEFORE INSERT ON reviewboard
FOR EACH ROW
BEGIN
	SELECT SEQ_reviewboard_rvNum.nextval
	INTO :new.rvNum
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_reviewreply_rpNum BEFORE INSERT ON reviewreply
FOR EACH ROW
BEGIN
	SELECT SEQ_reviewreply_rpNum.nextval
	INTO :new.rpNum
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_soqnaboardreply_qnaReplyNum BEFORE INSERT ON soqnaboardreply
FOR EACH ROW
BEGIN
	SELECT SEQ_soqnaboardreply_qnaReplyNum.nextval
	INTO :new.qnaReplyNum
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_soqnaboard_qnaNum BEFORE INSERT ON soqnaboard
FOR EACH ROW
BEGIN
	SELECT SEQ_soqnaboard_qnaNum.nextval
	INTO :new.qnaNum
	FROM dual;
END;

/




/* Comments */

COMMENT ON COLUMN coupon.sCode IS '사업자등록번호 뒤 7자리';
COMMENT ON COLUMN interest.iNum IS '장바구니 번호 개념';
COMMENT ON COLUMN interest.mId IS '사용자 아이디는 이메일 형식';
COMMENT ON COLUMN interest.sCode IS '사업자등록번호 뒤 7자리';
COMMENT ON COLUMN member.mId IS '사용자 아이디는 이메일 형식';
COMMENT ON COLUMN member.mPhone IS '핸드폰 앞 3자리';
COMMENT ON COLUMN qnaboard.sCode IS '사업자등록번호 뒤 7자리';
COMMENT ON COLUMN qnaboardreply.sCode IS '사업자등록번호 뒤 7자리';
COMMENT ON COLUMN reviewboard.sRecomendedscore IS '5점 만점';
COMMENT ON COLUMN reviewboard.sCode IS '사업자등록번호 뒤 7자리';
COMMENT ON COLUMN shop.sCode IS '사업자등록번호 뒤 7자리';
COMMENT ON COLUMN shopowner.sLicense IS '하이픈 제외하고 숫자로만 10자리 입력';
COMMENT ON COLUMN shopowner.sLevel IS '0: 미승인
1: 승인, 체험
2: 승인, 유료
';



