package DTO;

import java.sql.Date;

public class LikeyDTO {
	private int likeno;
	private String like_userid;
	private int like_bbsid;
	private int like_status;
	private Date like_date;
	public int getLikeno() {
		return likeno;
	}
	public void setLikeno(int likeno) {
		this.likeno = likeno;
	}
	public String getLike_userid() {
		return like_userid;
	}
	public void setLike_userid(String like_userid) {
		this.like_userid = like_userid;
	}
	public int getLike_bbsid() {
		return like_bbsid;
	}
	public void setLike_bbsid(int like_bbsid) {
		this.like_bbsid = like_bbsid;
	}
	public int getLike_status() {
		return like_status;
	}
	public void setLike_status(int like_status) {
		this.like_status = like_status;
	}
	public Date getLike_date() {
		return like_date;
	}
	public void setLike_date(Date like_date) {
		this.like_date = like_date;
	}
	
	
	
}
