select * from tab;
select * from seq;
drop table tt;

select * from tt;

	
create table tt(
	no number primary key,
	id varchar2(20),
	name varchar2(20),
	content varchar2(100),
	upload varchar2(100),
	goodcount number default 0,
	regdate date );
	
create sequence tt_seq;

select * from tt order by regdate;

create table reply(
	reply_no number primary key,
	reply_userid varchar2(20) references member(userid),
	reply_content varchar2(200),
	reply_bbsid number references tt(no),
	reply_date date
)

create sequence reply_seq
increment by 1 start with 1 nocache;




