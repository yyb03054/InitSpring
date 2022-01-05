package com.init.resume.main.vo;

public class QualificationCodeVO {
    private String qualifi_nm;
    private String qualifi_name;
    private String issuer;
    private int rnum;
    private int totcnt;
	public String getQualifi_nm() {
		return qualifi_nm;
	}
	public void setQualifi_nm(String qualifi_nm) {
		this.qualifi_nm = qualifi_nm;
	}
	public String getQualifi_name() {
		return qualifi_name;
	}
	public void setQualifi_name(String qualifi_name) {
		this.qualifi_name = qualifi_name;
	}
	public String getIssuer() {
		return issuer;
	}
	public void setIssuer(String issuer) {
		this.issuer = issuer;
	}
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	public int getTotcnt() {
		return totcnt;
	}
	public void setTotcnt(int totcnt) {
		this.totcnt = totcnt;
	}
	@Override
	public String toString() {
		return "QualificationCodeVO [qualifi_nm=" + qualifi_nm + ", qualifi_name=" + qualifi_name + ", issuer=" + issuer
				+ ", rnum=" + rnum + ", totcnt=" + totcnt + "]";
	}
    
}
