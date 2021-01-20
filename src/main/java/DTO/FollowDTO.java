package DTO;

import java.sql.Date;

public class FollowDTO {

	private int fol_idx;
	private String mem_id;
	private String target_id;
	private Date fol_date;
	public int getFol_idx() {
		return fol_idx;
	}
	public void setFol_idx(int fol_idx) {
		this.fol_idx = fol_idx;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getTarget_id() {
		return target_id;
	}
	public void setTarget_id(String target_id) {
		this.target_id = target_id;
	}
	public Date getFol_date() {
		return fol_date;
	}
	public void setFol_date(Date fol_date) {
		this.fol_date = fol_date;
	}
	
	
}
