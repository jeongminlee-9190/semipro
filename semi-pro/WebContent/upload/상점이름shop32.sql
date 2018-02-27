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
CREATE SEQUENCE SEQ_noticetom_noticeNum INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_noticetoso_noticeNum INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_qnaboardreply_qnaReplyNum INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_qnaboard_qnaNum INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_reviewboard_rvNum INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_reviewreply_rpNum INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_soqnaboardrp_qnaReplyNum INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_soqnaboard_qnaNum INCREMENT BY 1 START WITH 1;



/* Create Tables */

--------------------------------------------관리자------------------------------------------
CREATE TABLE admin
(
	aId varchar2(10) NOT NULL,
	aPasswd varchar2(10) NOT NULL,
	PRIMARY KEY (aId)
);
--시퀀스 없음
--------------------------------------------쿠폰-------------------------------------------
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
--시퀀스 SEQ_coupon_couponNum
--기본키: couponNum
--외래키: sCode(shop 테이블의 기본키)
------------------------------------------관심상점(좋아요 기능)-------------------------------------------
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
--시퀀스 SEQ_interest_iNum
--기본키: iNum
--외래키: mId(member 테이블의 기본키), sCode(shop 테이블의 기본키)
--------------------------------------------개인회원-------------------------------------------
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
--기본키: mId
--------------------------------------------관리자->개인회원 공지사항-------------------------------------------
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
--시퀀스 SEQ_noticetom_noticeNum
--기본키: noticeNum

--------------------------------------------관리자->상점회원 공지사항-------------------------------------------
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
--시퀀스 SEQ_noticetoso_noticeNum
--기본키: noticeNum

--------------------------------------------개인회원->상점 문의 게시판-------------------------------------------
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
--시퀀스 SEQ_qnaboard_qnaNum
--기본키: qnaboard
--외래키: sCode(shop 테이블의 기본키)

--------------------------------------------개인회원->상점 문의 답변 게시판(상점이 답변)-------------------------------------------
CREATE TABLE qnaboardreply
(
	qnaReplyNum number(2) NOT NULL,
	sName varchar2(20) NOT NULL,
	qnaReplyContent varchar2(100) NOT NULL,
	qnaNum number(2) NOT NULL,
	qnaReplyWritedate date,
	-- 사업자등록번호 뒤 7자리
	PRIMARY KEY (qnaReplyNum)
  
);
--시퀀스 SEQ_qnaboardreply_qnaReplyNum
--기본키: qnaReplyNum
--외래키: qnaNum(qnaboard 테이블의 기본키)

insert into qnaboardreply(qnaReplyNum,sName,qnaReplyContent,qnaNum,qnaReplyWritedate)
values(SEQ_qnaboardreply_qnaReplyNum.nextval,'aaa','1:1 문의 답변',1,default);
--------------------------------------------개인회원 후기 게시판-------------------------------------------
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
--시퀀스 SEQ_reviewboard_rvNum
--기본키: rvNum
--외래키: sCode(shop 테이블의 기본키)
--------------------------------------------개인회원 후기 게시판 리플-------------------------------------------
CREATE TABLE reviewreply
(
	rpNum number(2) NOT NULL,
	mName varchar2(10) NOT NULL,
	rpContent varchar2(100) NOT NULL,
	rpWritedate date NOT NULL,
	rvNum number(2) NOT NULL,
	PRIMARY KEY (rpNum)
);
--시퀀스 SEQ_reviewreply_rpNum
--기본키: rpNum
--외래키: rvNum(reviewboard 테이블의 기본키)
--------------------------------------------상점 등록(상점 회원)-------------------------------------------
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
--기본키: sCode
--외래키: oId(shopowner 테이블의 기본키)
--------------------------------------------상점 회원-------------------------------------------
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
--기본키: oId
--------------------------------------------상점 회원->관리자 1:1 문의(상점 회원)-------------------------------------------
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
--시퀀스 SEQ_soqnaboard_qnaNum
--기본키: qnaNum
--외래키: oId(shopowner 테이블의 기본키)

--------------------------------------------상점 회원->관리자 1:1 문의 답변(관리자)-------------------------------------------
CREATE TABLE soqnaboardreply
(
	qnaReplyNum number(2) NOT NULL,
	qnaNum number(2) NOT NULL,
	qnaReplyContent varchar2(100) NOT NULL,
	PRIMARY KEY (qnaReplyNum)
);
--시퀀스 SEQ_soqnaboardrp_qnaReplyNum
--기본키: qnaReplyNum
--외래키: qnaNum(soqnaboard 테이블의 기본키)

--------------------------------------------------------------------------------------------------------------
/* Create Foreign Keys */

ALTER TABLE interest
	ADD FOREIGN KEY (mId)
	REFERENCES member (mId)
;

ALTER TABLE interest
	ADD FOREIGN KEY (sCode)
	REFERENCES shop (sCode)
;

ALTER TABLE qnaboard
	ADD FOREIGN KEY (mName)
	REFERENCES member (mName)
;

ALTER TABLE qnaboard
	ADD FOREIGN KEY (sCode)
	REFERENCES shop (sCode)
;


ALTER TABLE qnaboardreply
	ADD FOREIGN KEY (qnaNum)
	REFERENCES qnaboard (qnaNum)
;


ALTER TABLE reviewboard
	ADD FOREIGN KEY (sCode)
	REFERENCES shop (sCode)
;

ALTER TABLE reviewboard
	ADD FOREIGN KEY (mName)
	REFERENCES member (mName)
;


ALTER TABLE reviewreply
	ADD FOREIGN KEY (rvNum)
	REFERENCES reviewboard (rvNum)
;

ALTER TABLE reviewreply
	ADD FOREIGN KEY (mName)
	REFERENCES member (mName)
;


ALTER TABLE coupon
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

