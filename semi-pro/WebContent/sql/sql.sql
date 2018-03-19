--0316 update

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
	mPhone varchar2(13),
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
--0316 update sName varchar2(50)  sSubway varchar2(30)--
drop table shop cascade constraint;
CREATE TABLE shop
(
	-- 카테고리+사업자등록번호 뒤 7자리
    sCode varchar2(9) PRIMARY KEY,
    sName varchar2(50) NOT NULL,
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
    sSubway varchar2(30) default '없음'  
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
	iCode varchar2(60) not null PRIMARY KEY,
	-- 사용자 아이디는 이메일 형식
	mId varchar2(50) references member(mId) not null,
	-- 사업자등록번호 뒤 7자리
	sCode varchar2(9) references shop(sCode) not null
);

CREATE SEQUENCE SEQ_interest_iNum INCREMENT BY 1 START WITH 1;

-------------------------------------------------------7. 관리자->개인회원 공지사항-----------------------------------------------------------
--0318 update  noticeReadcnt number(3) DEFAULT 0
drop table noticetom cascade constraint;
CREATE TABLE noticetom
(
 noticeNum number(2) PRIMARY KEY,
 noticeContent varchar2(2000) NOT NULL,
 noticeTitle varchar2(30) NOT NULL,
 noticeWritedate date DEFAULT sysdate NOT NULL,
 noticeWriter varchar2(8) DEFAULT '갬성갱단' NOT NULL,
 noticeReadcnt number(3) DEFAULT 0
);

CREATE SEQUENCE SEQ_noticetom_noticeNum INCREMENT BY 1 START WITH 1;


insert into noticetom(noticeNum,noticeTitle,noticeContent) values(1,'공지사항1','공지사항1');
insert into noticetom(noticeNum,noticeTitle,noticeContent) values(2,'공지사항2','공지사항2');
insert into noticetom(noticeNum,noticeTitle,noticeContent) values(3,'공지사항3','공지사항3');
insert into noticetom(noticeNum,noticeTitle,noticeContent) values(4,'공지사항4','공지사항4');
insert into noticetom(noticeNum,noticeTitle,noticeContent) values(5,'공지사항5','공지사항5');
insert into noticetom(noticeNum,noticeTitle,noticeContent) values(6,'공지사항6','공지사항6');
insert into noticetom(noticeNum,noticeTitle,noticeContent) values(7,'공지사항7','공지사항7');
insert into noticetom(noticeNum,noticeTitle,noticeContent) values(8,'공지사항8','공지사항8');
insert into noticetom(noticeNum,noticeTitle,noticeContent) values(9,'공지사항9','공지사항9');
insert into noticetom(noticeNum,noticeTitle,noticeContent) values(10,'공지사항10','공지사항10');
insert into noticetom(noticeNum,noticeTitle,noticeContent) values(11,'공지사항11','공지사항11');
insert into noticetom(noticeNum,noticeTitle,noticeContent) values(12,'공지사항12','공지사항12');
insert into noticetom(noticeNum,noticeTitle,noticeContent) values(13,'공지사항13','공지사항13');
insert into noticetom(noticeNum,noticeTitle,noticeContent) values(14,'공지사항114','공지사항14');
insert into noticetom(noticeNum,noticeTitle,noticeContent) values(15,'공지사항15','공지사항15');
insert into noticetom(noticeNum,noticeTitle,noticeContent) values(16,'공지사항16','공지사항16');
commit;

-------------------------------------------------------8. 관리자->상점회원 공지사항-----------------------------------------------------------
--0318 update  noticeReadcnt number(3) DEFAULT 0
drop table noticetoso cascade constraint;
CREATE TABLE noticetoso
(
	noticeNum number(3) PRIMARY KEY,
	noticeContent varchar2(2000) NOT NULL,
	noticeTitle varchar2(30) NOT NULL,
	noticeWritedate date DEFAULT sysdate NOT NULL,
	noticeWriter varchar2(6) DEFAULT '관리자' NOT NULL,
	noticeReadcnt number(3) DEFAULT 0
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
	qnaComplete varchar2(8) DEFAULT '확인중'
);
CREATE SEQUENCE SEQ_soqna_qnaNum INCREMENT BY 1 START WITH 1;

--------------------------------------------10. 상점 회원->관리자 1:1 문의 답변(관리자)-------------------------------------------
drop table soqnareply cascade constraint;
CREATE TABLE soqnareply
(
	qnaReplyNum number(2)PRIMARY KEY,
	qnaNum number(2) references soqna(qnaNum),
	qnaReplyContent varchar2(300) NOT NULL
);

CREATE SEQUENCE SEQ_soqnareply_qnaReplyNum INCREMENT BY 1 START WITH 1;

------------------------------------------------11.검색>키워드>점수-----------------------------------------------------------
--0316  update 외래키 삭제--
drop table score purge;
create table score(
  category varchar(10),
  sCode varchar(9),
  good number(2) default 0,
  bad number(2) default 0,
  constraint score_category_sCode_pk primary key(Category,sCode)
);


select *from score;
commit;









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






--shopowner&shop--
select *from shop order by soId;
insert into shopowner values('shop1@gaemsung.com','12345678','사업주1','010-1111-1111','1100151238','04550','서울특별시 중구 을지로14길/20',default,default);
Insert into shop values ('w0151238','분카샤','shop1@gaemsung.com','04550','서울 중구 을지로14길 18 (을지로3가)/2층','02-2269-6947','12:00~23:00/12:00~18:00/매주 월요일','Y','Y','와인/쁘띠폴리:프랑스, 레드와인:39000/카르멘톨텐쇼비뇽블랑:칠레, 화이트와인:27000/본상스모스카토:스파클링와인:27000','칵테일/오미자 진토닉:오미자:9000/허니 아포카토: :9000/허니 스파클링: :9000','Wine','w0151238_sImage1.png/w0151238_sImage2.png/w0151238_sImage3.png/w0151238_sImage4.png/w0151238_sImage5.png',0,0,null,'을지로3가');
insert into shopowner values('shop2@gaemsung.com','12345678','사업주2','010-2222-2222','1100221452','04543','서울특별시 중구 충무로9길/12',default,default);
Insert into shop values ('w0221452','쎄투','shop2@gaemsung.com','04543','서울 중구 을지로3가 95-4/401호','010-9363-2597','12:30~19:00/12:30~19:00/일요일, 월요일, 공휴일 휴무','Y','Y','칵테일,와인/엘더플라워:칵테일:10000/라즈베리모히토:칵테일:10000/쇼비뇽 블랑:와인:34000','디저트/파이티라미수:티라미수:7000/팔레트토스트:토스트:6500/레어치즈케이크:케이크:6500','Wine','w0221452_sImage1.png/w0221452_sImage2.png/w0221452_sImage3.png/w0221452_sImage4.png/w0221452_sImage5.png',0,0,null,'을지로3가');
insert into shopowner values('shop3@gaemsung.com','12345678','사업주3','010-3333-3333','1100314526','04561','서울특별시 중구 을지로/230-1',default,default);
Insert into shop values ('c0314526','투피스','shop3@gaemsung.com','04561','서울 중구 을지로5가 76-1/계림빌딩 5층 6층','02-0000-0000','12:00 - 18:00/14:00 - 20:00/월요일,일요일 휴무','Y','Y','커피/비엔나 커피:대표:5500/드립커피::5000/카페라떼::5000','/::/::/::','Cafe','c0314526_sImage1.png/c0314526_sImage2.png/c0314526_sImage3.png/c0314526_sImage4.png/c0314526_sImage5.png',0,0,null,'을지로3가');
insert into shopowner values('shop4@gaemsung.com','12345678','사업주4','010-4444-4444','1100498125','04542','서울특별시 중구 삼일대로12길/16-6',default,default);
Insert into shop values ('c0498125','커피한약방','shop4@gaemsung.com','04542','서울 중구 을지로2가 101-34/','070-4148-4242','08:00 - 22:30/12:00 - 20:00/공휴일','N','Y','음료/필터커피:커피:4200/더치:커피:5500/유기농 꽃차:티:4000','디저트,시즌메뉴/하우스 샌드위치:디저트:4500/상그리아:시즌메뉴-하절기:6000/글뤼바인:시즌메뉴-동절기:4500','Cafe','c0498125_sImage1.png/c0498125_sImage2.png/c0498125_sImage3.png/c0498125_sImage4.png/c0498125_sImage5.png',0,0,null,'을지로3가');
insert into shopowner values('shop5@gaemsung.com','12345678','사업주5','010-5555-5555','1100533214','04545','서울특별시 중구 을지로/157',default,default);
Insert into shop values ('c0533214','호랑이','shop5@gaemsung.com','04545','서울 중구 산림동 207-2/3층 351','02-2269-5880','11:00 - 22:30/11:00 - 22:30/매주 일요일 휴무','Y','Y','커피/호랑이 라떼:대표:3500/아메리카노::3000/::','디저트/베트남 샌드위치:당일 한정 12개 판매:6000/바게트:5조각+생크림:2500/후르츠 산도:계절메뉴:5000','Cafe','c0533214_sImage1.png/c0533214_sImage2.png/c0533214_sImage3.png/c0533214_sImage4.png/c0533214_sImage5.png',0,0,null,'을지로3가');
insert into shopowner values('shop6@gaemsung.com','12345678','사업주6','010-6666-6666','1100677412','04550','서울특별시 중구 수표로/52',default,default);
Insert into shop values ('c0677412','잔','shop6@gaemsung.com','04550','서울 중구 을지로3가 349-1/3층','02-2285-4854','11:00 - 24:00/11:00 - 24:00/일요일','N','Y','커피/아메리카노:챔프 알리 블랜딩:4500/잔라떼:마음에 드는 잔을 선택할 수 있음:5000/베트남연유커피:베트남 산 원두:6000','음료/사과즙:무주 구천동:6000/오미자 티:무주 구천동:6000/오미자 에이드:무주 구천동:6000','Cafe','c0677412_sImage1.png/c0677412_sImage2.png/c0677412_sImage3.png/c0677412_sImage4.png/c0677412_sImage5.png',0,0,null,'을지로3가');
insert into shopowner values('shop7@gaemsung.com','12345678','사업주7','010-7777-7777','1100799965','04550','서울특별시 중구 을지로/130-1',default,default);
Insert into shop values ('w0799965','물결','shop7@gaemsung.com','04550','서울 중구 을지로3가 295-1/401호','070-4142-7202','18:00~23:30/18:00~23:30/일요일','N','N','주류/샹그리아:wine:7000/글라스와인:red wine:6000/레페브라운:beer:9000','티/페퍼민트:hot/ice:5000/루이보스:hot/ice:5000/얼그레이:hot/ice:5000','Wine','w0799965_sImage1.png/w0799965_sImage2.png/w0799965_sImage3.png/w0799965_sImage4.png/w0799965_sImage5.png',0,0,null,'을지로3가');
insert into shopowner values('shop8@gaemsung.com','12345678','사업주8','010-8888-8888','1100811245','04550','서울특별시 중구 수표로 42-9',default,default);
Insert into shop values ('w0811245','십분의일','shop8@gaemsung.com','04550','서울 중구 저동2가 5-2/2층','010-9167-8051','18:00 - 23:30/18:00 - 24:00/일요일','N','N','와인/엘리샤 세미 스위트:스페인산 레드와인:29000/빈7479 샤도네이:칠레산 화이트 와인:39000/셰필드 타우니 포트:포트와인:49000','푸드/올리브:그린 블랙 반반:5000/감바스 알 하이요:새우와 비스킷:13000/멜론 프로슈토:멜론의 단맛과 프로슈토의 짠맛:13000','Wine','w0811245_sImage1.png/w0811245_sImage2.png/w0811245_sImage3.png/w0811245_sImage4.png/w0811245_sImage5.png',0,0,null,'을지로3가');
insert into shopowner values('shop9@gaemsung.com','12345678','사업주9','010-9999-9999','1100974158','63362','제주특별자치도 제주시 구좌읍 면수1길/48',default,default);
Insert into shop values ('c0974158','카페 한라산','shop9@gaemsung.com','63362','제주특별자치도 제주시 구좌읍 하도리 3200-12/카페 한라산','064-783-1522','10:00 - 20:00/10:00 - 20:00/미정','Y','Y','커피,티/에스프레소:커피, ice 500원 추가:4500/블랙퍼스트:티, ice 1000원 추가:5000/캐모마일:티, ice 1000원 추가:5000','디저트/제주당근케익:제주 구화읍산:6500/::/::','Cafe','c0974158_sImage1.png/c0974158_sImage2.png/c0974158_sImage3.png/c0974158_sImage4.png/c0974158_sImage5.png',0,0,null,'없음');
insert into shopowner values('shop10@gaemsung.com','12345678','사업주10','010-1010-1010','1101044523','63528','제주특별자치도 서귀포시 안덕면 형제해안로/72',default,default);
Insert into shop values ('c1044523','헤이브라더','shop10@gaemsung.com','63528','제주특별자치도 서귀포시 안덕면 사계리 2294-21/헤이브라더','064-794-0072','09:30 - 22:00/09:30 - 22:00/목요일','Y','Y','음료/아메리카노:샷추가 500원:4500/고구마라떼:제주산:5500/딸기바나나 스무디:제주산:6500','푸드/피쉬앤칩스:대표 메뉴:16000/치킨텐더앤칩스:대표 메뉴:14000/소세지앤칩스:대표 메뉴:16000','Cafe','c1044523_sImage1.png/c1044523_sImage2.png/c1044523_sImage3.png/c1044523_sImage4.png/c1044523_sImage5.png',0,0,null,'없음');
insert into shopowner values('shop11@gaemsung.com','12345678','사업주11','010-1011-1011','1101129752','63359','제주 제주시 구좌읍 해맞이해안로 1028/한동리 화수목',default,default);
Insert into shop values ('d1129752','한동리화수목','shop11@gaemsung.com','63359','제주특별자치도 제주시 구좌읍 한동리 1338-4/한동리화수목','010-2214-8795','10:00 - 19:00/10:00 - 19:00/화요일','Y','Y','커피/에스프레소:러스트레토 45ml:4000/이시돌플랫화이트:이시돌 목장 우유:5000/라온인 크림라떼:정의준 핸드드립:7000','디저트/소프트 아이스크림:이시돌 목장 유기농 원유:5000/화수목 아이스크림:검정색 수제콘:6500/파운드 케익:당근, 녹차:4000','Dessert','d1129752_sImage1.png/d1129752_sImage2.png/d1129752_sImage3.png/d1129752_sImage4.png/d1129752_sImage5.png',0,0,null,'없음');
insert into shopowner values('shop12@gaemsung.com','12345678','사업주12','010-1012-1012','1101228471','63360','제주 제주시 구좌읍 평대2길/39',default,default);
Insert into shop values ('c1228471','CAFERI','shop12@gaemsung.com','63360','제주특별자치도 제주시 구좌읍 평대리 1947-4/CAFERI','010-2047-8244','10:00~20:00/10:00~20:00/월요일','Y','Y','커피,우유/죠리퐁라떼:죠리퐁우유:7000/로즈라떼:로즈우유:7000/아인슈페너:생크림 아메리카노:6000','디저트/당근케익:제주도산:6000/마카롱:딸기,인절미,레몬:2000/가또쇼콜라:쇼콜라:6000','Cafe','c1228471_sImage1.png/c1228471_sImage2.png/c1228471_sImage3.png/c1228471_sImage4.png/c1228471_sImage5.png',0,0,null,'없음');
insert into shopowner values('shop13@gaemsung.com','12345678','사업주13','010-1013-1013','1101319534','63636','제주 서귀포시 성산읍 신풍하동로19번길/59',default,default);
Insert into shop values ('c1319534','아줄레주','shop13@gaemsung.com','63636','제주특별자치도 서귀포시 성산읍 신풍하동로19번길 59 (신풍리)/아줄레주','010-8518-4052','11:00 - 19:00/11:00 - 19:00/매주 화,수 정기휴무','Y','Y','음료/거창사과청:시그니쳐:7000/제주키위청:BEST, 시그니쳐:7500/제주소유자청:시그니쳐:7500','커피/아메리카노:ice 500원 추가:5000/카페라떼:ice 500원 추가:5500/바닐라라떼:ice 500원 추가:6000','Cafe','c1319534_sImage1.png/c1319534_sImage2.png/c1319534_sImage3.png/c1319534_sImage4.png/c1319534_sImage5.png',0,0,null,'없음');
insert into shopowner values('shop14@gaemsung.com','12345678','사업주14','010-1014-1014','1101475269','63215','제주 제주시 고마로 136/은경빌딩 2층',default,default);
Insert into shop values ('c1475269','UTP COFFEE','shop14@gaemsung.com','63215','제주특별자치도 제주시 고마로 136 (이도2동, 은경빌딩)/은경빌딩 2층','064-752-0060','11:00 - 23:00/11:00 - 23:00/월요일','Y','Y','coffee/아메리카노:아이스 500원 추가:3500/더블그린라떼:그린티플렛+쿠키, 아이스만 가능:6000/크림라떼:아이스만 가능:5000','non coffee/UTP 스무디:블루베리+바나나+아몬드:6000/그린티 크림라떼:아이스 500원 추가:5000/수제 자몽티:아이스 불가:5000','Cafe','c1475269_sImage1.png/c1475269_sImage2.png/c1475269_sImage3.png/c1475269_sImage4.png/c1475269_sImage5.png',0,0,null,'없음');
insert into shopowner values('shop15@gaemsung.com','12345678','사업주15','010-1015-1015','1101531497','63140','제주 제주시 연화중길 21/1층',default,default);
Insert into shop values ('c1531497','제3공간','shop15@gaemsung.com','63140','제주특별자치도 제주시 연화중길 21 (연동)/제3공간','010-2228-6608','11:00 - 22:00/11:00 - 22:00/화요일','Y','N','차/국화차:hot only:5000/히비스커스:hot only:5000/블루멜로우:hot only:5000','디저트/밀키롤:부드러운 식감:5500/당근 생크림 케이크:제주산 당근:5500/오레오 치즈 케이크:오레오+치즈:4800','Cafe','c1531497_sImage1.png/c1531497_sImage2.png/c1531497_sImage3.png/c1531497_sImage4.png/c1531497_sImage5.png',0,0,null,'없음');
insert into shopowner values('shop16@gaemsung.com','12345678','사업주16','010-1016-1016','1101693154','63540','제주특별자치도 서귀포시 일주서로 626/1층',default,default);
Insert into shop values ('c1693154','볼스카페','shop16@gaemsung.com','63540','제주특별자치도 서귀포시 일주서로 626 (회수동)/1층','070-7779-1981','10:00 - 20:00/10:00 - 21:00/미정','Y','Y','커피/아인슈페너:비엔나:6500/밀크티 카페라떼:밀크티 첨가:6000/바닐라 라떼:바닐라 시럽 첨가:5500','티/얼그레이:hot ice 가격 동일:4500/루이보스:hot ice 가격 동일:4500/한라봉청:제주도산 한라봉:5000','Cafe','c1693154_sImage1.png/c1693154_sImage2.png/c1693154_sImage3.png/c1693154_sImage4.png/c1693154_sImage5.png',0,0,null,'없음');
insert into shopowner values('shop17@gaemsung.com','12345678','사업주17','010-1017-1017','1101793154','04009','서울특별시 마포구 포은로 89/1층',default,default);
Insert into shop values ('c1793154','카페청사진','shop17@gaemsung.com','04009','서울 마포구 포은로 89 (망원동)/1층','010-6292-2498','12:00 - 23:00/12:00 - 23:00/미정','Y','Y','디저트/망원동 파블로바:머랭케이크:8000/망원동 마약케이크:대표메뉴:7500/수제 러시안룰렛:레드벨벳케이크:6500','음료/블루밍:대표메뉴, 딸기 베리 녹차:6000/오스트리아커피:아인슈페너:5500/콜드브루에이드:네덜란드 커피:6500','Cafe','c1793154_sImage1.png/c1793154_sImage2.png/c1793154_sImage3.png/c1793154_sImage4.png/c1793154_sImage5.png',0,0,null,'망원');
insert into shopowner values('shop18@gaemsung.com','12345678','사업주18','010-1018-1018','1101845215','04014','서울 마포구 월드컵로13길 79/1층',default,default);
Insert into shop values ('d1845215','자판기','shop18@gaemsung.com','04014','서울 마포구 월드컵로13길 79 (망원동, 해오름 주상복합)/1층','02-325-8185','12:00 - 22:00/12:00 - 22:00/미정','N','N','틴케이크/Tree:트리 아이싱:14500/Mermaid:머메이드 아이싱:9500/Doughnut:도넛:5000','음료/Aurora:모카,초코:7500/Ringo:소다/티:7500/Fortune :딸기 베이스 라떼:8500','Dessert','d1845215_sImage1.png/d1845215_sImage2.png/d1845215_sImage3.png/d1845215_sImage4.png/d1845215_sImage5.png',0,0,null,'망원');
insert into shopowner values('shop19@gaemsung.com','12345678','사업주19','010-1019-1019','1101943718','04011','서울특별시 마포구 포은로6길 39/1층',default,default);
Insert into shop values ('c1943718','프릭스','shop19@gaemsung.com','04011','서울 마포구 포은로6길 39 (망원동)/1층','010-9091-9059','13:00 - 10:00/13:00 - 10:00/월요일','N','N','커피/프릭스 커피:대표메뉴, 마카롱 첨가:6000/밀크초코:대표메뉴, 마카롱 첨가:6000/체리콘파냐:체리첨가:5500','디저트/마카롱:대표메뉴:2500/베어 토스트:초코+바닐라+생크림:5000/젤리 치즈 케이크:젤리+치즈:7500','Cafe','c1943718_sImage1.png/c1943718_sImage2.png/c1943718_sImage3.png/c1943718_sImage4.png/c1943718_sImage5.png',0,0,null,'망원');
insert into shopowner values('shop20@gaemsung.com','12345678','사업주20','010-1020-1020','1102093154','04009','서울특별시 마포구 망원로6길 37/1층',default,default);
Insert into shop values ('d2093154','미완성식탁','shop20@gaemsung.com','04009','서울 마포구 망원로6길 37 (망원동)/1층','010-6406-2713','12:00 - 18:00/12:00 - 18:00/일요일','Y','Y','마카롱/피스타치오:테이크아웃:2500/패션후르츠:테이크아웃:2500/그린올리브:테이크아웃:2500','차/유자 다즐링:테이크아웃:7000/레몬 진져:테이크아웃:7000/루이보스:테이크아웃:7000','Dessert','d2093154_sImage1.png/d2093154_sImage2.png/d2093154_sImage3.png/d2093154_sImage4.png/d2093154_sImage5.png',0,0,null,'망원');
insert into shopowner values('shop21@gaemsung.com','12345678','사업주21','010-1021-1021','1102132145','03955','서울특별시 마포구 방울내로7길 29/1층',default,default);
Insert into shop values ('c2132145','오늘의 위로','shop21@gaemsung.com','03955','서울 마포구 방울내로7길 29 (망원동)/1층','02-322-5203','13:00 - 20:00/13:00 - 20:00/일요일,월요일','N','N','디저트/블루베리파이:아이스크림 포함:7000/바나나타르트:바나나 원산지 필리핀:6000/복숭아타르트:복숭아 원산지 한국:6500','티/마르코폴로:ice 500원 추가:5000/웨딩인페리얼:ice 500원 추가:/오페라:ice 500원 추가:','Cafe','c2132145_sImage1.png/c2132145_sImage2.png/c2132145_sImage3.png/c2132145_sImage4.png/c2132145_sImage5.png',0,0,null,'망원');
insert into shopowner values('shop22@gaemsung.com','12345678','사업주22','010-1022-1022','1102274123','34836','대전 중구 대종로 521번길 29/1층',default,default);
Insert into shop values ('d2274123','알로하녹','shop22@gaemsung.com','34836','대전 중구 대종로521번길 29 (선화동)/1층','070-7799-2368','12:30~20:30/12:30~20:30/미정','Y','Y','디저트/말차브라우니:말차 첨가:6000/마틸다케이크:원산지..:6500/당근케이크:원산지 한국:6000','음료/인절미구마라떼:인절미가루+고구마:5000/자두에이드:복숭아로 대체가능:5500/한라봉스무디:제주도산 한라봉:6000','Dessert','d2274123_sImage1.png/d2274123_sImage2.png/d2274123_sImage3.png/d2274123_sImage4.png/d2274123_sImage5.png',0,0,null,'중앙로');
insert into shopowner values('shop23@gaemsung.com','12345678','사업주23','010-1023-1023','1102341512','34136','대전 유성구 한밭대로371번길/25-3',default,default);
Insert into shop values ('c2341512','커피인터뷰','shop23@gaemsung.com','34136','대전 유성구 한밭대로371번길 25-3 (궁동)/1층','042-823-3712','10:00 - 22:00/10:00 - 22:00/미정','Y','Y','/핸드드립커피:Gold coffee award 수상:5500/플랫화이트:에스프레소 기반 커피:4500/아포카토:바닐라맛 젤라또 첨가:4000','cold drink/망고스무디:망고 외국산:6000/리얼블루바나나:바나나 필리핀산:7000/자몽에이드:자몽 외국산:7000','Cafe','c2341512_sImage1.png/c2341512_sImage2.png/c2341512_sImage3.png/c2341512_sImage4.png/c2341512_sImage5.png',0,0,null,'구암');
insert into shopowner values('shop24@gaemsung.com','12345678','사업주24','010-1024-1024','1102412541','46041','부산 기장군 일광면 동백리 449',default,default);
Insert into shop values ('c2412541','헤이든','shop24@gaemsung.com','46041','부산 기장군 일광면 동백리 449/1층','051-727-4717','11:00 - 22:30/11:00 - 22:30/미정','Y','Y','커피/아메리카노:고급원두:5000/카페모카:에스프레소+휘핑+초코시럽:6500/돌체라떼:연유 첨가:6500','베이커리/숯불소시지빵:숯불로 구운 소시지 첨가:5500/블루베리식빵:블루베리 첨가:6500/팡도리:이탈리아 전통빵:','Cafe','c2412541_sImage1.png/c2412541_sImage2.png/c2412541_sImage3.png/c2412541_sImage4.png/c2412541_sImage5.png',0,0,null,'없음');
insert into shopowner values('shop25@gaemsung.com','12345678','사업주25','010-1025-1025','1102588425','04047','서울 마포구 양화로6길 50/1층',default,default);
Insert into shop values ('d2588425','타르타르 홍대점','shop25@gaemsung.com','04047','서울 마포구 양화로6길 50 (합정동)/1층','02-1800-2533','11:00 - 23:00/11:00 - 23:00/미정','N','N','타르트/치즈 타르트:대표메뉴:2700/캬라멜호두 타르트:호두를 캬라멜에 듬뿍 넣은 타르트:5500/요거트 타르트:산딸기 첨가:6800','기타 디저트/자몽 몽블랑:자몽+오렌지+자몽크림:6800/돔 쇼콜라:다크 초콜릿+생크림+쿠키:6800/카푸치노 케이크:쁘띠, 초코시트+카푸치노 크림:5800','Dessert','d2588425_sImage1.png/d2588425_sImage2.png/d2588425_sImage3.png/d2588425_sImage4.png/d2588425_sImage5.png',0,0,null,'합정');
insert into shopowner values('shop26@gaemsung.com','12345678','사업주26','010-1026-1026','1102674157','04391','서울 용산구 이태원로26길/16-8',default,default);
Insert into shop values ('d2674157','키에리','shop26@gaemsung.com','04391','서울 용산구 이태원로26길 16-8 (이태원동)/1층','02-798-3441','14:00 - 20:00/14:00 - 20:00/화요일','Y','Y','케이크/인진쑥팥크림케이크:모든 재료 국내산:7500/할머니의케이크:현미,쌀 케이크:7500/호박고구마케이크:모든 재료 국내산:9800','음료/뱅쇼:11월~3월, 직접 끓여요:9000/애플시나몬티:사과청 첨가:7000/트리플베리티:베리 3가지 종류 혼합:7000','Dessert','d2674157_sImage1.png/d2674157_sImage2.png/d2674157_sImage3.png/d2674157_sImage4.png/d2674157_sImage5.png',0,0,null,'이태원');
insert into shopowner values('shop27@gaemsung.com','12345678','사업주27','010-1027-1027','1102735648','05618','서울 송파구 오금로16길 4/1층',default,default);
Insert into shop values ('d2735648','라라브레드','shop27@gaemsung.com','05618','서울 송파구 오금로16길 4 (송파동)/1층','02-1800-1990','10:00 - 22:00/10:00 - 22:00/월요일','N','Y','디저트/7번 방의 연어:샐러드야채,연어,요거트소스:11000/에그헬데이:토마토,양파,라코타,모짜렐라:7000/아보카도 새우의역습:대표메뉴:10,500','쥬스/사과 케일:ice 만 가능:6500/청포도 케일:ice 만 가능:6500/오렌지 크렌베리:ice 만 가능:6500','Dessert','d2735648_sImage1.png/d2735648_sImage2.png/d2735648_sImage3.png/d2735648_sImage4.png/d2735648_sImage5.png',0,0,null,'잠실');
insert into shopowner values('shop28@gaemsung.com','12345678','사업주28','010-1028-1028','1102821452','04391','서울 용산구 이태원로20가길 7-6/1층',default,default);
Insert into shop values ('c2821452','탄탈라이즈','shop28@gaemsung.com','04391','서울 용산구 이태원로20가길 7-6 (이태원동)/1층','02-0000-0000','12:00~21:00/12:00~21:00/미정','N','N','커피/블랙:케냐,에디오피아,코스타리카:4500/플랫화이트:뉴질랜드:5000/푸어오버:케냐, 브라질:6000','non 커피/시트러스티:상큼한 향:6000/발로나 초코:프랑스산 초코:5500/로즈밀크:로즈시럽:6000','Cafe','c2821452_sImage1.png/c2821452_sImage2.png/c2821452_sImage3.png/c2821452_sImage4.png/c2821452_sImage5.png',0,0,null,'이태원');
insert into shopowner values('shop29@gaemsung.com','12345678','사업주29','010-1029-1029','1102945785','06995','서울 동작구 동작대로35길 10/1층',default,default);
--0316 update--
Insert into shop values ('d2945785','오다가다','shop29@gaemsung.com','06995','서울 동작구 동작대로35길 10 (사당동)/1층','070-8876-6424','12:00 - 22:00/12:00 - 22:00/일요일','N','N','디저트/순수말차케이크:말차 함유:6800/당근케이크:당근 함유:6800/플로랑탱:쫀득한 식감:3800','커피/플랫화이트:+바닐라:4500/타히티바닐라라떼:+바닐라:4500/벨베리블라스터:블루베리와 탄산 첨가:5000','Dessert','d2945785_sImage1.png/d2945785_sImage2.png/d2945785_sImage3.png/d2945785_sImage4.png/d2945785_sImage5.png',0,0,null,'이수');
insert into shopowner values('shop30@gaemsung.com','12345678','사업주30','010-1030-1030','1103027364','06128','서울 강남구 강남대로102길 38-6/1층',default,default);
Insert into shop values ('d3027364','더달달 역삼점','shop30@gaemsung.com','06128','서울 강남구 강남대로102길 38-6 (역삼동)/1층','02-562-3737','10:30 - 24:00/10:30 - 24:00/명절','N','N','디저트/모카 쇼콜라:모카:6500/달달 유기농 펜케이:대표메뉴:12000/달달 와플:대표메뉴:12000','음료/달달카페모카:커피, 인기메뉴:7000/핫핑크:초콜릿 음료:8000/달달초코 스무디:추천 메뉴:7000','Dessert','d3027364_sImage1.png/d3027364_sImage2.png/d3027364_sImage3.png/d3027364_sImage4.png/d3027364_sImage5.png',0,0,null,'강남');
insert into shopowner values('shop31@gaemsung.com','12345678','사업주31','010-1031-1031','1103123973','06123','서울 강남구 강남대로102길 13-5',default,default);
Insert into shop values ('c3123973','뉴코피커피','shop31@gaemsung.com','06123','서울 강남구 강남대로102길 13-5 (역삼동)/1층','02-552-8522','10:00 - 22:30/10:00 - 22:30/연중무휴','Y','Y','커피/사이공 샤케라또:ice만 가능:7500/엘살바도르:변동될 수 있음:8500/헤이즐럿 카푸치노:추천메뉴:6000','프라페/모카:카페인:7500/자바칩 민트초코:강하지 않은 민트초코:7500/캬라멜:카페인:7500','Cafe','c3123973_sImage1.png/c3123973_sImage2.png/c3123973_sImage3.png/c3123973_sImage4.png/c3123973_sImage5.png',0,0,null,'신논현(9)');
insert into shopowner values('shop32@gaemsung.com','12345678','사업주32','010-1032-1032','1103293164','06123','서울 강남구 강남대로102길 13-8/1층',default,default);
Insert into shop values ('d3293164','커피갤러리','shop32@gaemsung.com','06123','서울 강남구 강남대로102길 13-8 (역삼동)/1층','02-553-9545','10:00 - 23:00/10:00 - 23:00/연중무휴','N','N','디저트/베이직와플:대표메뉴:10800/쇼콜라아망디에:추천메뉴:3000/티라미수:인기메뉴:9000','커피/아메리카노:1회 리필 1000원 추가:5500/헤이즐럿 라떼:헤이즐럿 파우더 사용:6500/큐브라떼:인기메뉴:7500','Dessert','d3293164_sImage1.png/d3293164_sImage2.png/d3293164_sImage3.png/d3293164_sImage4.png/d3293164_sImage5.png',0,0,null,'신논현(9)');
insert into shopowner values('shop33@gaemsung.com','12345678','사업주33','010-1016-1016','1103383154','06128','서울 강남구 강남대로102길 28/1층',default,default);
Insert into shop values ('c3383154','스탠다드커피바','shop33@gaemsung.com','06128','서울 강남구 강남대로102길 28 (역삼동)/1층','070-4251-0639','11:00 - 23:30/11:00 - 23:30/연중무휴','Y','Y','커피/에스프레소 콘파냐:샷추가 1000원:4700/아포카토:아메리카노 리필 1500원:7000/바닐라라떼:바닐라시럽:6000','브루잉 커피/케냐:아이스 1000원 추가:6800/이디오피아:아이스 1000원 추가:6800/과테말라:아이스 1000원 추가:6800','Cafe','c3383154_sImage1.png/c3383154_sImage2.png/c3383154_sImage3.png/c3383154_sImage4.png/c3383154_sImage5.png',0,0,null,'신논현(9)');
insert into shopowner values('shop34@gaemsung.com','12345678','사업주34','010-1034-1034','1103423554','06123','서울 강남구 봉은사로4길 31/1층',default,default);
Insert into shop values ('d3423554','마망갸또 강남점','shop34@gaemsung.com','06123','서울 강남구 봉은사로4길 31 (역삼동)/','02-556-3937','11:00 - 23:00/11:00 - 22:00/미정','N','N','케이크1/캬라멜 롤케이크:대표메뉴, 홀사이즈 35,000:6000/캬라멜 티라미수:타르트:7000/캬라멜 치즈케이크:수제 캬라멜, 진한 치즈:6000','케이크2/바나나푸딩케이크:바나나 커스터드 크림과 생 바나나:4000/코코 그라데이션:코코넛 젤리 첨가:6000/당근 케이크:얇게 갈린 당근과 시나몬 가루:6000','Dessert','d3423554_sImage1.png/d3423554_sImage2.png/d3423554_sImage3.png/d3423554_sImage4.png/d3423554_sImage5.png',0,0,null,'신논현(9)');
insert into shopowner values('shop35@gaemsung.com','12345678','사업주35','010-1035-1035','1103500000','06129','서울 강남구 테헤란로1길 48/1층',default,default);
Insert into shop values ('c3500000','빌리엔젤 강남점','shop35@gaemsung.com','06129','서울 강남구 테헤란로1길 48 (역삼동, 강남ELS빌딩)/1층','070-5051-8135','11:00 - 23:00/11:00 - 23:00/연중무휴','N','N','케이크/당근케이크:대표메뉴:7200/밀크크레이프:대표메뉴:7500/몽블랑:우유크림:6000','음료/초코라떼:민트초코, 다크초코 선택:5300/로즈 모히또:에이드:6200/피치우롱:티, 아이스 500원 추가:4300','Cafe','c3500000_sImage1.png/c3500000_sImage2.png/c3500000_sImage3.png/c3500000_sImage4.png/c3500000_sImage5.png',0,0,null,'강남(2)');
insert into shopowner values('shop36@gaemsung.com','12345678','사업주36','010-1036-1036','1103600001','06232','서울 강남구 강남대로84길 15/1층',default,default);
Insert into shop values ('c3600001','수수커피','shop36@gaemsung.com','06232','서울 강남구 강남대로84길 15 (역삼동)/1층','070-8803-4369','08:00 - 22:00/12:00 - 22:00/연중무휴','Y','Y','COFFEE/아메리카노:대표메뉴:4500/피콜로:-:4500/더티:-:4500','VARIATION/바닐라빈라떼:-:5500/더티비엔나:인기메뉴:5800/아포카토:-:6500','Cafe','c3600001_sImage1.png/c3600001_sImage2.png/c3600001_sImage3.png/c3600001_sImage4.png/c3600001_sImage5.png',0,0,null,'강남(2)');
insert into shopowner values('shop37@gaemsung.com','12345678','사업주37','010-1037-1037','1103782734','06129','서울 강남구 강남대로98길 16/1층',default,default);
Insert into shop values ('w3782734','아실라','shop37@gaemsung.com','06129','서울 강남구 강남대로98길 16 (역삼동, 파빌리온)/1층','02-508-4665','18:00 - 02:00/12:00 - 02:00/연중무휴','Y','N','wine/비알래토 로쏘:레드 스위트, 이탈리:29000/샤또 샤스 스플린:레드, 프랑스:169000/페폴리 키안티:레드, 이탈리:87000','wine plate/아폴로 과일치즈:+껍질째 먹는 포도:23500/브리치즈와 홉스:메이플 시럽, 견과류 첨가:25800/모듬 치즈 플레이트::38500','Wine','w3782734_sImage1.png/w3782734_sImage2.png/w3782734_sImage3.png/w3782734_sImage4.png/w3782734_sImage5.png',0,0,null,'강남(2)');
insert into shopowner values('shop38@gaemsung.com','12345678','사업주38','010-1038-1038','1103800002','06612','서울 서초구 서초대로77길 45/3층',default,default);
Insert into shop values ('w3800002','메종드연어','shop38@gaemsung.com','06612','서울 서초구 서초대로77길 45 (서초동, 실버타운오피스텔)/3층','02-595-1308','17:30 - 02:00/17:30 - 02:00/연중무휴','Y','N','wine/엘리샤화이트:화이트:36000~/모스비 모스카토:스파클링:42000~/빌라엠:스파클링:52000~','plate/프레쉬살몬:대표메뉴:25000/리코타연어샐러드:직접 만든 생 리코타치즈와 연어:17000/토마토콜드파스타:연어,토마토 특제 드레싱, 냉파스타:17000','Wine','w3800002_sImage1.png/w3800002_sImage2.png/w3800002_sImage3.png/w3800002_sImage4.png/w3800002_sImage5.png',0,0,null,'신논현(9)');
insert into shopowner values('shop39@gaemsung.com','12345678','사업주39','010-1039-1039','1103900003','06123','서울 강남구 봉은사로4길 29/지하1층',default,default);
Insert into shop values ('w3900003','아브라소812','shop39@gaemsung.com','06123','서울 강남구 봉은사로4길 29 (역삼동)/지하 1층','070-8810-0812','18:30 - 02:30/17:30 - 02:00/연중무휴','Y','N','wine/블러토니포트:레드, 호주:49000/모스카토 다스티:스파클링, 이탈리아:49000/캘러웨이 샤도네이:화이트, 미국:49800','plate/찹스테이크:대표메뉴:19000/2단 아브라소:데이트 추천 메뉴:34000/매콤 로제 떡볶이:베스트 메뉴:16000','Wine','w3900003_sImage1.png/w3900003_sImage2.png/w3900003_sImage3.png/w3900003_sImage4.png/w3900003_sImage5.png',0,0,null,'신논현(9)');
insert into shopowner values('shop40@gaemsung.com','12345678','사업주40','010-1040-1040','1104000005','06626','서울 서초구 강남대로53길 11/1층',default,default);
Insert into shop values ('w4000005','먼데이블루스','shop40@gaemsung.com','06626','서울 서초구 강남대로53길 11 (서초동, 서초동삼성쉐르빌2)/1층','02-521-0542','18:00 - 01:00/18:00 - 01:00/일요일','Y','N','wine/베라몬테 리저브:화이트, 칠레:43000/인페리:레드, 이탈리아:89000/프리머스:레드, 칠레:59000','plate/치킨카프레제스테이크:대표메뉴:35000/깔라브레제 리조또:크림, 대표메뉴:29000/비프스테이크:채끝살:42000','Wine','w4000005_sImage1.png/w4000005_sImage2.png/w4000005_sImage3.png/w4000005_sImage4.png/w4000005_sImage5.png',0,0,null,'강남(2)');


commit;




insert into score values ('식사','w0151238',40,5);
insert into score values ('회식','w0151238',70,20);
insert into score values ('데이트','w0151238',50,11);
insert into score values ('파티','w0151238',65,3);
insert into score values ('식사','w0221452',20,10);
insert into score values ('회식','w0221452',25,20);
insert into score values ('데이트','w0221452',70,3);
insert into score values ('파티','w0221452',65,15);
insert into score values ('식사','c0314526',50,1);
insert into score values ('회식','c0314526',30,10);
insert into score values ('데이트','c0314526',45,3);
insert into score values ('파티','c0314526',70,1);
insert into score values ('식사','c0498125',10,0);
insert into score values ('회식','c0498125',20,3);
insert into score values ('데이트','c0498125',70,25);
insert into score values ('파티','c0498125',50,0);
insert into score values ('식사','c0533214',70,5);
insert into score values ('회식','c0533214',60,10);
insert into score values ('데이트','c0533214',30,11);
insert into score values ('파티','c0533214',45,30);
insert into score values ('식사','c0677412',10,5);
insert into score values ('회식','c0677412',30,0);
insert into score values ('데이트','c0677412',66,23);
insert into score values ('파티','c0677412',12,10);
insert into score values ('식사','w0799965',10,9);
insert into score values ('회식','w0799965',70,0);
insert into score values ('데이트','w0799965',54,7);
insert into score values ('파티','w0799965',61,22);
insert into score values ('식사','w0811245',33,9);
insert into score values ('회식','w0811245',22,0);
insert into score values ('데이트','w0811245',70,11);
insert into score values ('파티','w0811245',70,3);
insert into score values ('식사','c0974158',70,0);
insert into score values ('회식','c0974158',70,10);
insert into score values ('데이트','c0974158',50,3);
insert into score values ('파티','c0974158',65,30);
insert into score values ('식사','c1044523',22,0);
insert into score values ('회식','c1044523',44,4);
insert into score values ('데이트','c1044523',66,6);
insert into score values ('파티','c1044523',33,0);
insert into score values ('식사','d1129752',70,0);
insert into score values ('회식','d1129752',70,29);
insert into score values ('데이트','d1129752',60,3);
insert into score values ('파티','d1129752',55,11);
insert into score values ('식사','c1228471',50,24);
insert into score values ('회식','c1228471',70,0);
insert into score values ('데이트','c1228471',50,13);
insert into score values ('파티','c1228471',65,0);
insert into score values ('식사','c1319534',0,9);
insert into score values ('회식','c1319534',10,10);
insert into score values ('데이트','c1319534',70,3);
insert into score values ('파티','c1319534',50,3);
insert into score values ('식사','c1475269',40,0);
insert into score values ('회식','c1475269',50,0);
insert into score values ('데이트','c1475269',10,0);
insert into score values ('파티','c1475269',35,0);
insert into score values ('식사','c1531497',22,0);
insert into score values ('회식','c1531497',56,1);
insert into score values ('데이트','c1531497',63,3);
insert into score values ('파티','c1531497',68,8);
insert into score values ('식사','c1693154',70,19);
insert into score values ('회식','c1693154',70,20);
insert into score values ('데이트','c1693154',70,3);
insert into score values ('파티','c1693154',65,30);
insert into score values ('식사','c1793154',40,4);
insert into score values ('회식','c1793154',50,10);
insert into score values ('데이트','c1793154',50,7);
insert into score values ('파티','c1793154',55,9);
insert into score values ('식사','d1845215',65,0);
insert into score values ('회식','d1845215',57,10);
insert into score values ('데이트','d1845215',53,7);
insert into score values ('파티','d1845215',70,0);
insert into score values ('식사','c1943718',70,4);
insert into score values ('회식','c1943718',50,0);
insert into score values ('데이트','c1943718',70,31);
insert into score values ('파티','c1943718',55,0);
insert into score values ('식사','d2093154',30,4);
insert into score values ('회식','d2093154',30,2);
insert into score values ('데이트','d2093154',30,6);
insert into score values ('파티','d2093154',30,0);
insert into score values ('식사','c2132145',10,4);
insert into score values ('회식','c2132145',0,10);
insert into score values ('데이트','c2132145',70,0);
insert into score values ('파티','c2132145',70,11);
insert into score values ('식사','d2274123',40,19);
insert into score values ('회식','d2274123',40,0);
insert into score values ('데이트','d2274123',40,0);
insert into score values ('파티','d2274123',40,3);
insert into score values ('식사','c2341512',60,4);
insert into score values ('회식','c2341512',60,10);
insert into score values ('데이트','c2341512',60,7);
insert into score values ('파티','c2341512',65,9);
insert into score values ('식사','c2412541',0,0);
insert into score values ('회식','c2412541',0,0);
insert into score values ('데이트','c2412541',0,0);
insert into score values ('파티','c2412541',0,0);
insert into score values ('식사','d2588425',0,0);
insert into score values ('회식','d2588425',0,0);
insert into score values ('데이트','d2588425',0,0);
insert into score values ('파티','d2588425',0,0);
insert into score values ('식사','d2674157',0,0);
insert into score values ('회식','d2674157',0,0);
insert into score values ('데이트','d2674157',0,0);
insert into score values ('파티','d2674157',0,0);
insert into score values ('식사','d2735648',0,0);
insert into score values ('회식','d2735648',0,0);
insert into score values ('데이트','d2735648',0,0);
insert into score values ('파티','d2735648',0,0);
insert into score values ('식사','c2821452',0,0);
insert into score values ('회식','c2821452',0,0);
insert into score values ('데이트','c2821452',0,0);
insert into score values ('파티','c2821452',0,0);
insert into score values ('식사','d2945785',0,0);
insert into score values ('회식','d2945785',0,0);
insert into score values ('데이트','d2945785',0,0);
insert into score values ('파티','d2945785',0,0);
insert into score values ('식사','d3027364',0,0);
insert into score values ('회식','d3027364',0,0);
insert into score values ('데이트','d3027364',0,0);
insert into score values ('파티','d3027364',0,0);
insert into score values ('식사','c3123973',0,0);
insert into score values ('회식','c3123973',0,0);
insert into score values ('데이트','c3123973',0,0);
insert into score values ('파티','c3123973',0,0);
insert into score values ('식사','d3293164',0,0);
insert into score values ('회식','d3293164',0,0);
insert into score values ('데이트','d3293164',0,0);
insert into score values ('파티','d3293164',0,0);
insert into score values ('식사','c3383154',0,0);
insert into score values ('회식','c3383154',0,0);
insert into score values ('데이트','c3383154',0,0);
insert into score values ('파티','c3383154',0,0);
insert into score values ('식사','d3423554',0,0);
insert into score values ('회식','d3423554',0,0);
insert into score values ('데이트','d3423554',0,0);
insert into score values ('파티','d3423554',0,0);
insert into score values ('식사','c3500000',0,0);
insert into score values ('회식','c3500000',0,0);
insert into score values ('데이트','c3500000',0,0);
insert into score values ('파티','c3500000',0,0);
insert into score values ('식사','c3600001',0,0);
insert into score values ('회식','c3600001',0,0);
insert into score values ('데이트','c3600001',0,0);
insert into score values ('파티','c3600001',0,0);
insert into score values ('식사','w3782734',0,0);
insert into score values ('회식','w3782734',0,0);
insert into score values ('데이트','w3782734',0,0);
insert into score values ('파티','w3782734',0,0);
insert into score values ('식사','w3800002',0,0);
insert into score values ('회식','w3800002',0,0);
insert into score values ('데이트','w3800002',0,0);
insert into score values ('파티','w3800002',0,0);
insert into score values ('식사','w3900003',0,0);
insert into score values ('회식','w3900003',0,0);
insert into score values ('데이트','w3900003',0,0);
insert into score values ('파티','w3900003',0,0);
insert into score values ('식사','w4000005',0,0);
insert into score values ('회식','w4000005',0,0);
insert into score values ('데이트','w4000005',0,0);
insert into score values ('파티','w4000005',0,0);

commit;

select *from score;