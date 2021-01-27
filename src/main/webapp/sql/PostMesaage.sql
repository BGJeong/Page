create table PM(
	message_id number primary key,
	message_sender varchar2(20) references member(userid),
	message_receiver varchar2(20) references member(userid),
	message_content varchar2()
)
