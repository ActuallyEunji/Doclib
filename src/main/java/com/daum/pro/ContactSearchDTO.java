package com.daum.pro;

import java.util.List;

public class ContactSearchDTO {

	private int company_no;
	private int emp_no;
	private List<Integer> saup_field;	//연락처사업 분야 저장
	private String min_reg_year;		//등록일 최소 연도 저장
	private String min_reg_month;		//등록일 최소 월 저장
	private String max_reg_year;		//등록일 최대 연도 저장
	private String max_reg_month;		//등록일 최대 월 저장
	private String keyword1;			//첫번째 키워드 저장
	
	private int rowCntPerPage = 10;
	//한 화면에 보여지는 검색 결과 최대형 개수 저장. <주의> 반드서 초기값
	
	private int selectPageNo =1;
	// 현재 선택된 페이지 번호 저장. <주의> 반드시 초기값 입력할 것
	
	private String sort;
	// 정렬 데이터 저장. <참고> 필요에 따라 초기값 입력 가능.

	private int beginRowNo;
	private int endRowNo;
	
	
	
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

	public int getBeginRowNo() {
		return beginRowNo;
	}

	public void setBeginRowNo(int beginRowNo) {
		this.beginRowNo = beginRowNo;
	}

	public int getEndRowNo() {
		return endRowNo;
	}

	public void setEndRowNo(int endRowNo) {
		this.endRowNo = endRowNo;
	}

	public List<Integer> getSaup_field() {
		return saup_field;
	}

	public void setSaup_field(List<Integer> saup_field) {
		this.saup_field = saup_field;
	}

	public String getMin_reg_year() {
		return min_reg_year;
	}

	public void setMin_reg_year(String min_reg_year) {
		this.min_reg_year = min_reg_year;
	}

	public String getMin_reg_month() {
		return min_reg_month;
	}

	public void setMin_reg_month(String min_reg_month) {
		this.min_reg_month = min_reg_month;
	}

	public String getMax_reg_year() {
		return max_reg_year;
	}

	public void setMax_reg_year(String max_reg_year) {
		this.max_reg_year = max_reg_year;
	}

	public String getMax_reg_month() {
		return max_reg_month;
	}

	public void setMax_reg_month(String max_reg_month) {
		this.max_reg_month = max_reg_month;
	}

	public String getKeyword1() {
		return keyword1;
	}

	public void setKeyword1(String keyword1) {
		this.keyword1 = keyword1;
	}

	public int getRowCntPerPage() {
		return rowCntPerPage;
	}

	public void setRowCntPerPage(int rowCntPerPage) {
		this.rowCntPerPage = rowCntPerPage;
	}

	public int getSelectPageNo() {
		return selectPageNo;
	}

	public void setSelectPageNo(int selectPageNo) {
		this.selectPageNo = selectPageNo;
	}

	public String getSort() {
		return sort;
	}

	public void setSort(String sort) {
		this.sort = sort;
	}
}
