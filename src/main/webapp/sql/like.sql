create table likey(
	likeno number primary key,
	like_userid varchar2(20) references member(userid),
	like_bbsid number references tt(no),
	like_status number default 0,
	like_date date not null
)
create sequence likey_seq
increment by 1 start with 1 nocache;

select * from tt;
insert into likey values (likey_seq.nextval, 'ddddd', 81, 1, sysdate)
select * from likey where like_userid='ddddd' and like_bbsid=81;
select * from likey
update likey set like_status=1 where like_userid='ddddd';
delete from likey;

select a.id, b.target_id, a.no, a.name, a.content, a.regdate from tt a, follow b where a.id = b.mem_id and b.mem_id = 'ddddd' order by regdate desc;
select * from tt;