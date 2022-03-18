select * from user_tables;
create table member(
	mid varchar(20) primary key,
    mname varchar(20) not null,
    mpw varchar(10) not null,
    mdate timestamp default sysdate
);
insert into member (mid,mname,mpw) values('root','관리자','1234');
select * from member;
create table board(
	bid int primary key,
    mid varchar(20) not null,
    content varchar(50) not null,
    favcnt int default 0,
    rpcnt int default 0,
    bdate timestamp default sysdate
);
insert into board (bid,mid,content) values((select nvl(max(bid),0)+1 from board),'root','공지사항');
select * from board;
create table reply(
	rid int primary key,
    bid int not null,
    mid varchar(20) not null,
    msg varchar(30) not null,
    rdate timestamp default sysdate,
    foreign key (bid) references board(bid) on delete cascade
);
insert into reply (rid,bid,mid,msg) values((select nvl(max(rid),0)+1 from reply),1,'root','첫 댓글');
select * from reply;