create table member(
	userid varchar2(20) primary key,
	passwd varchar2(20) not null,
	email varchar2(20) not null,
	email_conf number(10) not null,
	reg_date date not null,
	reg_status number(10),
	profile_img varchar2(100),
	nickname varchar2(100),
	birth varchar2(20)
)

create table follow(
	fol_idx number(10) primary key,
	mem_id varchar2(20) references member(userid),
	target_id varchar2(20) references member(userid),
	fol_date date not null
)
create sequence fol_seq
increment by 1 start with 1 nocache;
select * from member;
select * from follow;
delete from member ;
delete from follow;
select * from follow where mem_id='ddddd' and target_id='test123';

delete from MEMBER where profile_img is null;
delete from follow;
select a.target_id, b.profile_img from FOLLOW a, member b where a.target_id = b.userid and a.mem_id='ddddd';
select * from member;
select a.userid, a.profile_img, b.content, b.upload, b.id from member a, board b where a.userid = b.id;