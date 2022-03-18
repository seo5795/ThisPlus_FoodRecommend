create table member(
	mid varchar(20) primary key,
    mname varchar(20) not null,
    mpw varchar(10) not null,
    mdate datetime default now()
);
insert into member (mid,mname,mpw) values('root','관리자','1234');
select * from member;
create table board(
	bid int primary key auto_increment,
    mid varchar(20) not null,
    content varchar(50) not null,
    favcnt int default 0,
    rpcnt int default 0,
    bdate datetime default now()
);
insert into board (mid,content) values('root','공지사항');
select * from board;
create table reply(
	rid int primary key auto_increment,
    bid int not null,
    mid varchar(20) not null,
    msg varchar(30) not null,
    rdate datetime default now(),
    foreign key (bid) references board(bid) on delete cascade
);
insert into reply (bid,mid,msg) values(1,'root','첫 댓글');
select * from reply;