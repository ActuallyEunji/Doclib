package com.daum.pro;
import java.util.List;

public class ContactDTO{
	//*****************************************************
	// 속성변수 선언
	//*****************************************************
	// 파라미터명과 동일해야함
	private int company_no;
	private int contact_no;             // 연락처 번호 저장
	private String contact_name;        // 연락처명 저장
	private String phone;               // 전화번호 저장
	private String reg_date;            // 등록일 저장	
	private List<Integer> saup_field;	// 연락처 사업분야 저장
	private int emp_no;
	//*****************************************************
	// 메소드 선언
	//*****************************************************
	
	public int getContact_no() {
		return contact_no;
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
	public void setContact_no(int contact_no) {
		this.contact_no = contact_no;
	}
	public String getContact_name() {
		return contact_name;
	}
	public void setContact_name(String contact_name) {
		this.contact_name = contact_name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	public List<Integer> getSaup_field() {
		return saup_field;
	}
	public void setSaup_field(List<Integer> saup_field) {
		this.saup_field = saup_field;
	}	
}
