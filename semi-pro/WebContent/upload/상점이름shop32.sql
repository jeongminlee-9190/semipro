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

--------------------------------------------������------------------------------------------
CREATE TABLE admin
(
	aId varchar2(10) NOT NULL,
	aPasswd varchar2(10) NOT NULL,
	PRIMARY KEY (aId)
);
--������ ����
--------------------------------------------����-------------------------------------------
CREATE TABLE coupon
(
	couponNum number(3) NOT NULL,
	couponTitle varchar2(30) NOT NULL,
	-- ����ڵ�Ϲ�ȣ �� 7�ڸ�
	sCode varchar2(7),
	sName varchar2(20) NOT NULL,
	couponReadcnt number(3),
	couponContent varchar2(100) NOT NULL,
	couponImage varchar2(20) NOT NULL,
	couponErolldate date,
	PRIMARY KEY (couponNum)
);
--������ SEQ_coupon_couponNum
--�⺻Ű: couponNum
--�ܷ�Ű: sCode(shop ���̺��� �⺻Ű)
------------------------------------------���ɻ���(���ƿ� ���)-------------------------------------------
CREATE TABLE interest
(
	-- ��ٱ��� ��ȣ ����
	iNum number(2) NOT NULL,
	-- ����� ���̵�� �̸��� ����
	mId varchar2(50) NOT NULL,
	-- ����ڵ�Ϲ�ȣ �� 7�ڸ�
	sCode varchar2(7) NOT NULL,
	sName varchar2(20) NOT NULL,
	sImage1 varchar2(20) NOT NULL,
	PRIMARY KEY (iNum)
);
--������ SEQ_interest_iNum
--�⺻Ű: iNum
--�ܷ�Ű: mId(member ���̺��� �⺻Ű), sCode(shop ���̺��� �⺻Ű)
--------------------------------------------����ȸ��-------------------------------------------
CREATE TABLE member
(
	-- ����� ���̵�� �̸��� ����
	mId varchar2(50) NOT NULL,
	mPasswd varchar2(20) NOT NULL,
	mName varchar2(10) NOT NULL UNIQUE,
	-- �ڵ��� �� 3�ڸ�
	mPhone varchar2(3) NOT NULL,
	PRIMARY KEY (mId)
);
--�⺻Ű: mId
--------------------------------------------������->����ȸ�� ��������-------------------------------------------
CREATE TABLE noticetom
(
	noticeNum number(2) NOT NULL,
	noticeContent varchar2(2000) NOT NULL,
	noticeTitle varchar2(30) NOT NULL,
	noticeWritedate date DEFAULT sysdate NOT NULL,
	noticeWriter varchar2(6) DEFAULT '������' NOT NULL,
	noticeReadcnt number(2),
	PRIMARY KEY (noticeNum)
);
--������ SEQ_noticetom_noticeNum
--�⺻Ű: noticeNum

--------------------------------------------������->����ȸ�� ��������-------------------------------------------
CREATE TABLE noticetoso
(
	noticeNum number(2) NOT NULL,
	noticeContent varchar2(2000) NOT NULL,
	noticeTitle varchar2(30) NOT NULL,
	noticeWritedate date DEFAULT sysdate NOT NULL,
	noticeWriter varchar2(6) DEFAULT '������' NOT NULL,
	noticeReadcnt number(2),
	PRIMARY KEY (noticeNum)
);
--������ SEQ_noticetoso_noticeNum
--�⺻Ű: noticeNum

--------------------------------------------����ȸ��->���� ���� �Խ���-------------------------------------------
CREATE TABLE qnaboard
(
	qnaNum number(2) NOT NULL,
	mName varchar2(10) NOT NULL,
	qnaContent varchar2(100) NOT NULL,
	qnaWritedate date DEFAULT sysdate,
	-- ����ڵ�Ϲ�ȣ �� 7�ڸ�
	sCode varchar2(7),
	PRIMARY KEY (qnaNum)
);
--������ SEQ_qnaboard_qnaNum
--�⺻Ű: qnaboard
--�ܷ�Ű: sCode(shop ���̺��� �⺻Ű)

--------------------------------------------����ȸ��->���� ���� �亯 �Խ���(������ �亯)-------------------------------------------
CREATE TABLE qnaboardreply
(
	qnaReplyNum number(2) NOT NULL,
	sName varchar2(20) NOT NULL,
	qnaReplyContent varchar2(100) NOT NULL,
	qnaNum number(2) NOT NULL,
	qnaReplyWritedate date,
	-- ����ڵ�Ϲ�ȣ �� 7�ڸ�
	PRIMARY KEY (qnaReplyNum)
  
);
--������ SEQ_qnaboardreply_qnaReplyNum
--�⺻Ű: qnaReplyNum
--�ܷ�Ű: qnaNum(qnaboard ���̺��� �⺻Ű)

insert into qnaboardreply(qnaReplyNum,sName,qnaReplyContent,qnaNum,qnaReplyWritedate)
values(SEQ_qnaboardreply_qnaReplyNum.nextval,'aaa','1:1 ���� �亯',1,default);
--------------------------------------------����ȸ�� �ı� �Խ���-------------------------------------------
CREATE TABLE reviewboard
(
	rvNum number(2) NOT NULL,
	rvTitle varchar2(20) NOT NULL,
	rvContent varchar2(900) NOT NULL,
	mName varchar2(10) NOT NULL,
	rvWritedate date NOT NULL,
	rvReadcnt number(3),
	rvRecomendedcnt number(3),
	-- 5�� ����
	sRecomendedscore number(1),
	-- ����ڵ�Ϲ�ȣ �� 7�ڸ�
	sCode varchar2(7) NOT NULL,
	PRIMARY KEY (rvNum)
);
--������ SEQ_reviewboard_rvNum
--�⺻Ű: rvNum
--�ܷ�Ű: sCode(shop ���̺��� �⺻Ű)
--------------------------------------------����ȸ�� �ı� �Խ��� ����-------------------------------------------
CREATE TABLE reviewreply
(
	rpNum number(2) NOT NULL,
	mName varchar2(10) NOT NULL,
	rpContent varchar2(100) NOT NULL,
	rpWritedate date NOT NULL,
	rvNum number(2) NOT NULL,
	PRIMARY KEY (rpNum)
);
--������ SEQ_reviewreply_rpNum
--�⺻Ű: rpNum
--�ܷ�Ű: rvNum(reviewboard ���̺��� �⺻Ű)
--------------------------------------------���� ���(���� ȸ��)-------------------------------------------
CREATE TABLE shop
(
	-- ����ڵ�Ϲ�ȣ �� 7�ڸ�
	sCode varchar2(7) NOT NULL,
	sName varchar2(20) NOT NULL,
	oId varchar2(50) NOT NULL,
	sAddr varchar2(500) NOT NULL,
	sPhone varchar2(12) NOT NULL,
	sRecomendedscore number(1),
	sCategory varchar2(4) NOT NULL,
	PRIMARY KEY (sCode)
);
--�⺻Ű: sCode
--�ܷ�Ű: oId(shopowner ���̺��� �⺻Ű)
--------------------------------------------���� ȸ��-------------------------------------------
CREATE TABLE shopowner
(
	oId varchar2(50) NOT NULL,
	oPasswd varchar2(20) NOT NULL,
	oName varchar2(20) NOT NULL,
	oPhone varchar2(13) NOT NULL,
	sName varchar2(20) NOT NULL,
	sPhone varchar2(14) NOT NULL,
	-- ������ �����ϰ� ���ڷθ� 10�ڸ� �Է�
	sLicense varchar2(10) NOT NULL UNIQUE,
	sPost varchar2(5) NOT NULL,
	sAddr varchar2(500) NOT NULL,
	-- 0: �̽���
	-- 1: ����, ü��
	-- 2: ����, ����
	-- 
	sLevel varchar2(1) NOT NULL,
	sJoindate date NOT NULL,
	PRIMARY KEY (oId)
);
--�⺻Ű: oId
--------------------------------------------���� ȸ��->������ 1:1 ����(���� ȸ��)-------------------------------------------
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
--������ SEQ_soqnaboard_qnaNum
--�⺻Ű: qnaNum
--�ܷ�Ű: oId(shopowner ���̺��� �⺻Ű)

--------------------------------------------���� ȸ��->������ 1:1 ���� �亯(������)-------------------------------------------
CREATE TABLE soqnaboardreply
(
	qnaReplyNum number(2) NOT NULL,
	qnaNum number(2) NOT NULL,
	qnaReplyContent varchar2(100) NOT NULL,
	PRIMARY KEY (qnaReplyNum)
);
--������ SEQ_soqnaboardrp_qnaReplyNum
--�⺻Ű: qnaReplyNum
--�ܷ�Ű: qnaNum(soqnaboard ���̺��� �⺻Ű)

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

