package com.daum.pro;

import java.util.List;

public class JoinListDTO {
	
	private List<JoinDTO> joinList;
	
	private int emp_no;
	private int company_no;
	private int company_emp_no;

	private List<Integer> report_field;
	
	private String company_name;
	
	

	public List<JoinDTO> getJoinList() {
		return joinList;
	}
	public void setJoinList(List<JoinDTO> joinList) {
		this.joinList = joinList;
	}
	public int getEmp_no() {
		return emp_no;
	}
	public void setEmp_no(int emp_no) {
		this.emp_no = emp_no;
	}
	public int getCompany_no() {
		return company_no;
	}
	public void setCompany_no(int company_no) {
		this.company_no = company_no;
	}
	public int getCompany_emp_no() {
		return company_emp_no;
	}
	public void setCompany_emp_no(int company_emp_no) {
		this.company_emp_no = company_emp_no;
	}
	public List<Integer> getReport_field() {
		return report_field;
	}
	public void setReport_field(List<Integer> report_field) {
		this.report_field = report_field;
	}
	public String getCompany_name() {
		return company_name;
	}
	public void setCompany_name(String company_name) {
		this.company_name = company_name;
	}
	
	
}
