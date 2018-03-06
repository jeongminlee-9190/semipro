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
	sLevel varchar2(1) default 0,
	sJoindate date default sysdate,
	PRIMARY KEY (oId)
);

update shopowner
set sLevel =1
where oId='bbb';
commit;
select *from shopowner;



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

CREATE SEQUENCE noticetoso_noticeNum INCREMENT BY 1 START WITH 1;

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


drop table soqnaboard purge;
CREATE TABLE soqnaboard
(
	qnaNum number(2) NOT NULL,
    oId varchar2(50) NOT NULL, 
	sName varchar2(20) NOT NULL,
    qnaTitle varchar2(20) NOT NULL,
	qnaContent varchar2(100) NOT NULL,
	qnaWritedate date DEFAULT sysdate NOT NULL,
    qnaCategory varchar2(10),
    qnaComplete varchar2(4) DEFAULT '확인중',
	PRIMARY KEY (qnaNum)
);
CREATE SEQUENCE SEQ_soqnaboard_qnaNum INCREMENT BY 1 START WITH 1;
insert into soqnaboard values(1,'aaa','aaa','aaa문의','문의문의문의문의',default,'이용문의',default);
insert into soqnaboard values(2,'bbb','bbb','bbb문의','문의문의문의문의',default,'정산문의',default);
select *from soqnaboard;
commit;
select count(*) from soqnaboard where oId='aaa';