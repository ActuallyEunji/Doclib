package com.daum.pro;

import java.util.List;
import java.util.Map;

public class MyPageDTO {
	
	private int emp_no;				

	private String id;
	private String pwd;
	
	private List<Map<String,String>> reports;
	
	private List<Integer> report_field;
	
	public List<Integer> getReport_field() {
		return report_field;
	}
	public void setReport_field(List<Integer> report_field) {
		this.report_field = report_field;
	}
	public List<Map<String, String>> getReports() {
		return reports;
	}
	public void setReports(List<Map<String, String>> reports) {
		this.reports = reports;
	}
	public int getEmp_no() {
		return emp_no;
	}
	public void setEmp_no(int emp_no) {
		this.emp_no = emp_no;
	}
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

	
	
}
