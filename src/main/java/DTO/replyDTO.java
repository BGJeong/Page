package DTO;

import java.sql.Date;

public class replyDTO {
	private int reply_no;
	private String reply_userid;
	private String reply_content;
	private int reply_bbsid;
	private Date reply_date;
	
	public int getReply_no() {
		return reply_no;
	}
	public void setReply_no(int reply_no) {
		this.reply_no = reply_no;
	}
	public String getReply_userid() {
		return reply_userid;
	}
	public void setReply_userid(String reply_userid) {
		this.reply_userid = reply_userid;
	}
	public String getReply_content() {
		return reply_content;
	}
	public void setReply_content(String reply_content) {
		this.reply_content = reply_content;
	}
	public int getReply_bbsid() {
		return reply_bbsid;
	}
	public void setReply_bbsid(int reply_bbsid) {
		this.reply_bbsid = reply_bbsid;
	}
	public Date getReply_date() {
		return reply_date;
	}
	public void setReply_date(Date reply_date) {
		this.reply_date = reply_date;
	}
}
