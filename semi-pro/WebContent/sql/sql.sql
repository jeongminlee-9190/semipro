0312 update

----------------------------------------------------------1. 관리자----------------------------------------------------------
CREATE TABLE admin
(
	adminId varchar2(10) PRIMARY KEY,
	adminPasswd varchar2(10) NOT NULL
);
--시퀀스 없음

----------------------------------------------------------2. 개인 회원----------------------------------------------------------
drop table member cascade constraint;
CREATE TABLE member
(
	-- 사용자 아이디는 이메일 형식
	mId varchar2(50) PRIMARY KEY,
	mPasswd varchar2(20) NOT NULL,
	mName varchar2(10) NOT NULL UNIQUE,
	mPhone1 varchar2(3),
  	mPhone2 varchar2(4),
  	mPhone3 varchar2(4),
  	mBirth varchar2(4)
);

----------------------------------------------------------3. 상점 회원----------------------------------------------------------
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

--------------------------------------------4. 상점 등록(상점 회원)-------------------------------------------
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

----------------------------------------------------5. 개인회원>리뷰----------------------------------------------------------
drop table review cascade constraint;
CREATE TABLE review
(
  	rvNum number(3) PRIMARY KEY,
  	rvContent varchar2(300) NOT NULL,
    	mName varchar2(10) references member(mName),
    	rvWritedate date DEFAULT SYSDATE,
  	sLike number(3) DEFAULT 0,
  	sHate number(3) DEFAULT 0,
   	sCode varchar2(9) references shop(sCode)
);
CREATE SEQUENCE SEQ_reviewboard_rvNum INCREMENT BY 1 START WITH 1;

----------------------------------------------------6. 관심상점(좋아요 기능)----------------------------------------------------------
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

-------------------------------------------------------7. 관리자->개인회원 공지사항-----------------------------------------------------------
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

-------------------------------------------------------8. 관리자->상점회원 공지사항-----------------------------------------------------------
drop table noticetoso cascade constraint;
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

--------------------------------------------9. 상점 회원->관리자 1:1 문의(상점 회원)-------------------------------------------
drop table soqna cascade constraint;
CREATE TABLE soqna
(
	qnaNum number(2) PRIMARY KEY,
	soId varchar2(30) references shopowner(soId),
	qnaTitle varchar2(20) NOT NULL,
	qnaContent varchar2(100) NOT NULL,
	qnaWritedate date DEFAULT sysdate,
	qnaCategory varchar2(10),
	qnaComplete varchar2(4) DEFAULT '확인중'
);
CREATE SEQUENCE SEQ_soqna_qnaNum INCREMENT BY 1 START WITH 1;

--------------------------------------------10. 상점 회원->관리자 1:1 문의 답변(관리자)-------------------------------------------
drop table soqnareply cascade constraint;
CREATE TABLE soqnareply
(
	qnaReplyNum number(2)PRIMARY KEY,
	qnaNum number(2) references soqna(qnaNum),
	qnaReplyContent varchar2(300) NOT NULL,
);

CREATE SEQUENCE SEQ_soqnareply_qnaReplyNum INCREMENT BY 1 START WITH 1;

------------------------------------------------11.검색>키워드>점수-----------------------------------------------------------
drop table score purge;
create table score(
  category varchar(10),
  sCode varchar(9) references shop(sCode),
  good number(2) default 0,
  bad number(2) default 0,
  scoreSum number(4) default 0,
  constraint score_category_sCode_pk primary key(sCategory,sCode)
);





--관리자 1 건--
insert into admin values('admin','1234');
commit;



--member 40건--
insert into member values('jisu@naver.com','jisu12345','김지수','010-6179-4537','1990');
insert into member values('jmin9190@daum.net','wjdals12345','이정민','010-7917-9190','1987');
insert into member values('sdfjsd@hanmail.net','sdfjmsljd9875','유성호','010-8514-3745','2000');
insert into member values('jinuman@naver.com','wlsnaos05','주진우','010-9952-3321','2005');
insert into member values('iuerhjd@nate.com','whfflqek99','이원호','010-4527-6742','1995');
insert into member values('kklo@daum.net','afkvndo12as','김건우','010-8723-6124','1992');
insert into member values('vncnc09@google.com','qklskdcmd@','최이린','010-7354-9964','1984');
insert into member values('sodfiwj14@nate.com','sdfjkake22','박금화','010-2657-3321','1988');
insert into member values('msjfusei33@google.com','vnkdjjghdfkj','하경찬','010-4514-9632','2007');
insert into member values('sfjkfkdfnvk@naver.com','popofgus2157','박소영','010-9957-3214','2001');
insert into member values('uuywerds34@daum.net','whfflqekdkdkdk2','곽찬솔','010-8944-6547','1987');
insert into member values('sanghun85@naver.com','tkdgns8585','김상훈','010-1247-5751','1985');
insert into member values('jinii0306@naver.com','wlsgml0306','이진희','010-3625-0306','1990');
insert into member values('yhun1128@google.com','dbsrud1128','서윤경','010-8877-1141','1995');
insert into member values('lkry@daum.net','rnlcksgek00','피지은','010-5547-2547','2010');
insert into member values('thfeurj@naver.com','sadicmde','김영배','010-6658-9431','1962');
insert into member values('asdfklvmeu9537@naver.com','sdjfjcn8273','박진솔','010-8273-9537','1979');
insert into member values('mijuni98@daum.net','alswnsl1234','이민준','010-7878-9898','1998');
insert into member values('byoengjin8913423@google.com','qudwlsl12938','한병진','010-4445-3145','1970');
insert into member values('gg@naver.com','sdflwjendcj##','유수진','010-3487-0872','1982');
insert into member values('ttufnsj348@google.com','sdfkjadjfj@!','김석진','010-9517-8514','1996');
insert into member values('powednfue@daum.net','sdfkvn1237*@','김기범','010-4561-4714','1998');
insert into member values('sdvkjlsjf@naver.com','dspommsue','김은영','010-8888-8888','1972');
insert into member values('qqwder@naver.com','asdkvnskdfj','박혜진','010-7741-9632','2002');
insert into member values('kmfjsncn4554@naver.com','135412dd!','황나영','010-9999-9999','2006');
insert into member values('spdincs@daum.net','asdsf234ff#','박민기','010-1111-1111','1999');
insert into member values('pvbcidse@google.com','pojsdfjk33@!23','곽두리','010-6666-4575','1990');
insert into member values('wueqaffd4@google.com','sdczzsde126^','차아롱','010-5467-8715','1992');
insert into member values('eimdritjf@daum.net','sdfqwe234323dsd','심은영','010-7778-9555','1997');
insert into member values('zsdkqwndf098@naver.com','ap12938s@@dfch','차석훈','010-4568-9475','1889');
insert into member values('bidul33@naver.com','qlenfrlrnrnrn99','비둘기','010-9854-9933','1986');
insert into member values('dodeozi@naver.com','enejwlsms22','두더지','010-7415-2222','2000');
insert into member values('jparkkk@daum.net','wpdlvkrggg','jay park','010-5555-4477','1999');
insert into member values('hosik@google.com','ghtlrdlclzls','호식이','010-6137-1482','1973');
insert into member values('mincho@naver.com','alsxmchzh22','민초','010-3917-9190','1885');
insert into member values('hojini@naver.com','tlaghwls11##@','심호진','010-4445-5544','1979');
insert into member values('sjchoen@daum.net','wocjsdlsdkfjsdk','심재천','010-7412-8451','1960');
insert into member values('wonyoung@google.com','sdfjdgkdnjsdyd','하원용','010-8888-7777','1998');
insert into member values('hoduKkakkki@naver.com','ghenRkrl@@#','호두','010-2121-3232','2004');
insert into member values('haribo@daum.net','gkflqhajrrhtlvek','하리보','010-7159-6724','2000');

commit;