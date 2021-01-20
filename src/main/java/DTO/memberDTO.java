package DTO;

public class memberDTO {

	private String userid;
	private String passwd;
	private String email;
	private int email_conf;
	private String reg_date;
	private int reg_status;
	private String profile_img;
	private String nickname;
	private String birth;
	
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getEmail_conf() {
		return email_conf;
	}
	public void setEmail_conf(int email_conf) {
		this.email_conf = email_conf;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	public int getReg_status() {
		return reg_status;
	}
	public void setReg_status(int reg_status) {
		this.reg_status = reg_status;
	}
	public String getProfile_img() {
		return profile_img;
	}
	public void setProfile_img(String profile_img) {
		this.profile_img = profile_img;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	
}
