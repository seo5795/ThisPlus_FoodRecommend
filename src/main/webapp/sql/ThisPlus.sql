
-- 테이블 종류
-- 1.member(회원정보); 2.resdb(식당정보); 3.review(리뷰); 4.notice(공지); 5.menu(메뉴)
-- 구성
-- 테이블 조회 / 테이블 삭제 / 테이블 생성 / 데이터 삽입 / 데이터 수정 / 데이터 삭제

-- 회원정보 테이블 조회
select * from member;
-- 회원정보 테이블 삭제
drop table member;
-- 회원정보 테이블 생성
create table member(
	memId varchar(50) primary key,
	memPw varchar(50),
	memName varchar(50),
	memEmail varchar(50),
	memRank int default 0,
	memPoint int default 5000,
	memPhone varchar(50),
	memAddress varchar(200),
	memPic varchar(200),
	memCol1 varchar(20),
	memCol2 varchar(20)
);
-- 회원 데이터 삽입
insert into member (memId,memPw,memName,memEmail,memAddress,memPic)
 values ('muscleboy1234','1111','김꺽정','muscle@naver.com','서울시 관악구','/admin/img/testimonial-1.jpa');
 insert into member (memId,memPw,memName,memEmail,memAddress,memPic,memRank)
 values ('admin','1234','admin','muscle@naver.com','서울시 관악구','/images/member/ksj.jpeg',2);
-- 회원 데이터 수정(회원권한)
update member set memPw='1234',memEmail='muscle@gmail.com',memPhone='010-1111-2222',memAddress='경기도 안산시 상록구',memPic='' where memId='muscleboy';
-- 회원 데이터 수정(관리자권한)
update member set memEmail='muscle@gmail.com',memRank='1',memPoint=memPoint+100,memPhone='010-1111-2222',memAddress='경기도 안산시 상록구',memPic='' where memId='muscleboy';
-- 회원 데이터 삭제
delete from member where memid='muscleboy';
delete from member where memid='seo5795';

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

-- 식당정보 테이블 조회
select * from restaurant;
-- 식당정보 테이블 삭제
drop table restaurant;
-- 식당정보 테이블 생성
create table restaurant(
	resId int primary key,
	resName varchar(100) not null,
	resAvg number(3,2) default 0.0,
	resAdd varchar(200),
	resPhone varchar(50),
	resCategory varchar(50),
	resPark int default 0,
	resPic varchar(200),
	res1 varchar(20),
	res2 varchar(20),
	res3 varchar(20)
);
-- 기준 데이터 삽입(아이디 정리용)
insert into restaurant (resId,resName) values (1000,'기준식당');
-- 식당 데이터 삽입
insert into restaurant (resId,resName,resAvg,resAdd,resPhone,resCategory,resPic)
 values ((select nvl(max(resId),0)+1 from restaurant),'햄을품은닭',2.5,'오늘도 몹시 먹으리','033-123-4567','분식','/images/restaurant/ksj.jpeg');
-- 식당 데이터 수정
update restaurant set resName='왕할머니통닭',resAvg=0.5,resAdd='살포시 먹이구 잡으리',resPhone='02-123-4567',resCategory='한식',resPic='' where resId=101;
-- 식당 데이터 삭제
delete from restaurant where resId=101;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

-- 리뷰 테이블 조회
select * from review;
-- 리뷰 테이블 삭제
drop table review;
-- 리뷰 테이블 생성
create table review(
	revId int primary key,
	memId varchar(50),
    constraint memFk foreign key (memId) references member (memId) on delete cascade,
    memName varchar(20) not null,
	resId int,
    constraint resFk foreign key (resId) references restaurant (resId) on delete cascade,
    revTitle varchar(50) not null,
    revCont varchar(500) not null,
    revDate date DEFAULT SYSDATE,
    revScore number(3,2),
    revPic varchar(200),
    revCol01 varchar(20),
    revCol02 varchar(20)
);
-- 기준 데이터 삽입(아이디 정리용)
insert into review (revId,memId,memName,resId,revTitle,revCont) values (100,'muscleboy','기준작성자',100,'기준제목','기준글');
-- 리뷰 데이터 삽입
insert into review (revId,memId,memName,resId,revTitle,revCont,revScore,revPic) values ((select nvl(max(revId),2000)+1 from review),'muscleboy','근육남',101,'울지마','근손실온다',3.5,'/images/review/ksj.jpeg');
-- 리뷰 데이터 수정
update review set revTitle='화내지마',revCont='근손실온다',revScore=1.5,revPic='' where revId=101;
-- 리뷰 데이터 삭제
delete from review where revId=101;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

-- 공지 테이블 조회
select * from notice;
-- 공지 테이블 삭제
drop table notice;
-- 공지 테이블 생성
create table notice(
	notId int primary key,
	notTitle varchar(100) not null,
	notContent varchar(500) not null,
	notDate date DEFAULT SYSDATE,
	notShow int default 0,
	nCol varchar(20)
);
-- 기준 데이터 삽입(아이디 정리용)
insert into notice (notId,notTitle,notContent) values (100,'기준제목','기준내용');
-- 공지 데이터 삽입
insert into notice (notId,notTitle,notContent)
 values ((select nvl(max(notId),3000)+1 from notice),'보라','연보라진보라');
-- 공지 데이터 수정
update notice set notTitle='안녕하새우',notContent='곰방와',notShow=1 where notId=101;
-- 공지 데이터 삭제
delete from notice where notId=101;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

-- 메뉴 테이블 조회
select * from menu;
-- 메뉴  테이블 삭제
drop table menu;
-- 메뉴  테이블 생성
create table menu(
	menuId int primary key,
	resId int,
    constraint menuFk foreign key (resId) references restaurant (resId) on delete cascade,
	menuName varchar(100) not null,
	menuPrice int not null,
	menuCategory varchar(100) not null,
	menuPic varchar(200)
);
-- 기준 데이터 삽입(아이디 정리용)
insert into menu (menuId,resId,menuName,menuPrice,menuCategory)
 values (100,100,'기준메뉴',3500,'한식');
-- 메뉴 데이터 삽입
insert into menu (menuId,resId,menuName,menuPrice,menuCategory,menuPic)
 values ((select nvl(max(menuId),4000)+1 from menu),101,'불탄볶음밥',10000,'분식','/images/coupon/ksj.jpeg');
-- 메뉴 데이터 수정
update menu set menuName='파멸의짬뽕',menuPrice=4000,menuCategory='중식',menuPic='' where menuId=101;
-- 메뉴 데이터 삭제
delete from menu where menuId=101;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

-- 쿠폰 테이블 조회
select * from coupon;
-- 쿠폰  테이블 삭제
drop table coupon;
-- 쿠폰  테이블 생성
create table coupon(
	cpnId int primary key,
	resName varchar(100) not null,
	cpnName varchar(100) not null,
	discount int not null,
	price int not null,
	disprice int not null,
	cpnPic varchar(200)
);
-- 기준 데이터 삽입(아이디 정리용)
insert into coupon (cpnId,resName,cpnName,discount,price,disprice)
 values (100,'기준식당','기준쿠폰',10,2000,1800);
-- 쿠폰 데이터 삽입(크롤링 필요)
insert into coupon (cpnId,resName,cpnName,discount,price,disprice,cpnPic)
 values ((select nvl(max(cpnId),5000)+1 from coupon),'김밥파라다이스','김밥만반값',50,2000,1000,'/images/coupon/ksj.jpeg');
-- 쿠폰 데이터 수정
update coupon set resName='김밥지옥',cpnName='할인은무슨',discount=0,price=2000,disprice=2000 where cpnId=101;
-- 쿠폰 데이터 삭제
delete from coupon where cpnId=101;

-- 6자리 난수 생성(중복처리는 아직 안함)
SELECT TRUNC(DBMS_RANDOM.VALUE(100000, 999999)) FROM DUAL;
-- cpnId에 난수가 들어가도록 데이터 삽입(중복발생시 에러)
insert into coupon (cpnId,resName,cpnName,discount,price,disprice,cpnPic)
 values ((SELECT TRUNC(DBMS_RANDOM.VALUE(100000, 999999)) FROM DUAL),'김밥파라다이스','김밥만반값',50,2000,1000,'/images/coupon/ksj.jpeg');

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

-- 테이블 조회
-- 테이블 삭제
-- 테이블 생성
-- 데이터 삽입
-- 데이터 수정(회원권한)
-- 데이터 수정(관리자권한)
-- 데이터 삭제