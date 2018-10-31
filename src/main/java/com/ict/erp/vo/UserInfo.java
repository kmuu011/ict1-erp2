package com.ict.erp.vo;

import org.apache.ibatis.type.Alias;

@Alias("ui")
public class UserInfo {

	private String id;
	private String pwd;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	@Override
	public String toString() {
		return "UserInfo [id=" + id + ", pwd=" + pwd + "]";
	}
	
	
}
