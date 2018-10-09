package com.ict.erp.vo;

import org.apache.ibatis.type.Alias;

@Alias("ti")
public class TestInfo {
	
	private Integer tid;
	private String ttext;
	private String tdesc;
	
	public TestInfo() {
	}
	
	public Integer getTid() {
		return tid;
	}
	public void setTid(Integer tid) {
		this.tid = tid;
	}
	public String getTtext() {
		return ttext;
	}
	public void setTtext(String ttext) {
		this.ttext = ttext;
	}
	public String getTdesc() {
		return tdesc;
	}
	public void setTdesc(String tdesc) {
		this.tdesc = tdesc;
	}

	@Override
	public String toString() {
		return "TestInfo [tid=" + tid + ", ttext=" + ttext + ", tdesc=" + tdesc + "]";
	}
	
	
	

}
