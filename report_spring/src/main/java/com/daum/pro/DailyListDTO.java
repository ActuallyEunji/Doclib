package com.daum.pro;

import java.util.List;
import java.util.Map;

public class DailyListDTO {
	
	private List<Map<String,String>> dailyTableList;
	private List<Integer> daily_business_field;								// 업무분야
	private List<Integer> is_daily_business_finish;							// 업무완료여부
	private String min_daily_business_year;									// 업무 최소 년도
	private String min_daily_business_month;								// 업무 최소 월
	private String min_daily_business_date;									// 업무 최소 일
	private String min_daily_business_hour;									// 업무 최소 시
	private String min_daily_business_minute;								// 업무 최소 분
	private String max_daily_business_year;									// 업무 최대 년도
	private String max_daily_business_month;								// 업무 최대 월
	private String max_daily_business_date;									// 업무 최대 일
	private String max_daily_business_hour;									// 업무 최대 시
	private String max_daily_business_minute;								// 업무 최대 분
	private int rowCntPerPage = 15;									// 한 화면에 보여지는 검색결과 최대행 개수 저장  <주의> 반드시 초기값 입력할 것
	private int selectPageNo = 1;											// 현재 선택된 페이지 번호 저장  <주의> 반드시 초기값 입력할 것 
	private int beginRowNo;												// 페이지 번호에 맞는 시작행 번호 저장
	private int endRowNo;													// 페이지 번호에 맞는 끝행 번호 저장
	private String keyword1;												// 검색 키워드 1
	private String keyword2;												// 검색 키워드 2
	private int or_and;														// 검색 조건 
	private int company_emp_no;										
	private int emp_no;														
	private int company_no;											
	private String sort;
	
	private int report_no;
	private int writer;
	
	
	public List<Map<String, String>> getDailyTableList() {
		return dailyTableList;
	}
	public void setDailyTableList(List<Map<String, String>> dailyTableList) {
		this.dailyTableList = dailyTableList;
	}
	public List<Integer> getDaily_business_field() {
		return daily_business_field;
	}
	public void setDaily_business_field(List<Integer> daily_business_field) {
		this.daily_business_field = daily_business_field;
	}
	public List<Integer> getIs_daily_business_finish() {
		return is_daily_business_finish;
	}
	public void setIs_daily_business_finish(List<Integer> is_daily_business_finish) {
		this.is_daily_business_finish = is_daily_business_finish;
	}
	public String getMin_daily_business_year() {
		return min_daily_business_year;
	}
	public void setMin_daily_business_year(String min_daily_business_year) {
		this.min_daily_business_year = min_daily_business_year;
	}
	public String getMin_daily_business_month() {
		return min_daily_business_month;
	}
	public void setMin_daily_business_month(String min_daily_business_month) {
		this.min_daily_business_month = min_daily_business_month;
	}
	public String getMin_daily_business_date() {
		return min_daily_business_date;
	}
	public void setMin_daily_business_date(String min_daily_business_date) {
		this.min_daily_business_date = min_daily_business_date;
	}
	public String getMin_daily_business_hour() {
		return min_daily_business_hour;
	}
	public void setMin_daily_business_hour(String min_daily_business_hour) {
		this.min_daily_business_hour = min_daily_business_hour;
	}
	public String getMin_daily_business_minute() {
		return min_daily_business_minute;
	}
	public void setMin_daily_business_minute(String min_daily_business_minute) {
		this.min_daily_business_minute = min_daily_business_minute;
	}
	public String getMax_daily_business_year() {
		return max_daily_business_year;
	}
	public void setMax_daily_business_year(String max_daily_business_year) {
		this.max_daily_business_year = max_daily_business_year;
	}
	public String getMax_daily_business_month() {
		return max_daily_business_month;
	}
	public void setMax_daily_business_month(String max_daily_business_month) {
		this.max_daily_business_month = max_daily_business_month;
	}
	public String getMax_daily_business_date() {
		return max_daily_business_date;
	}
	public void setMax_daily_business_date(String max_daily_business_date) {
		this.max_daily_business_date = max_daily_business_date;
	}
	public String getMax_daily_business_hour() {
		return max_daily_business_hour;
	}
	public void setMax_daily_business_hour(String max_daily_business_hour) {
		this.max_daily_business_hour = max_daily_business_hour;
	}
	public String getMax_daily_business_minute() {
		return max_daily_business_minute;
	}
	public void setMax_daily_business_minute(String max_daily_business_minute) {
		this.max_daily_business_minute = max_daily_business_minute;
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
	public String getKeyword1() {
		return keyword1;
	}
	public void setKeyword1(String keyword1) {
		this.keyword1 = keyword1;
	}
	public String getKeyword2() {
		return keyword2;
	}
	public void setKeyword2(String keyword2) {
		this.keyword2 = keyword2;
	}
	public int getOr_and() {
		return or_and;
	}
	public void setOr_and(int or_and) {
		this.or_and = or_and;
	}
	public int getCompany_emp_no() {
		return company_emp_no;
	}
	public void setCompany_emp_no(int company_emp_no) {
		this.company_emp_no = company_emp_no;
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
	public String getSort() {
		return sort;
	}
	public void setSort(String sort) {
		this.sort = sort;
	}
	public int getReport_no() {
		return report_no;
	}
	public void setReport_no(int report_no) {
		this.report_no = report_no;
	}
	public int getWriter() {
		return writer;
	}
	public void setWriter(int writer) {
		this.writer = writer;
	}
	
	
}
