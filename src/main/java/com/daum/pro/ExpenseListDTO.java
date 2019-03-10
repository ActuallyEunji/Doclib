package com.daum.pro;

import java.util.List;
import java.util.Map;

public class ExpenseListDTO {
	
	private List<Map<String,String>>	tableList;			
	private List<Integer> expense_area;								// 지출분야 
	private List<Integer> expense_means;								// 지출수단
	private List<Integer> approval_rejection;							// 결재여부
	private String min_approval_year;									// 결재 최소 년도
	private String min_approval_month;								// 결재 최소 월
	private String max_approval_year;									// 결재 최대 년도
	private String max_approval_month;								// 결재 최대 월
	private int cost_min;														// 검색 최소 비용
	private int cost_max;													// 검색 최대 비용
	private String min_expense_year;									// 지출 최소 년도
	private String min_expense_month;									// 지출 최소 월
	private String max_expense_year;									// 지출 최대 년도
	private String max_expense_month;								// 지출 최대 월
	private int rowCntPerPage = 15;									// 한 화면에 보여지는 검색결과 최대행 개수 저장  <주의> 반드시 초기값 입력할 것
	private int selectPageNo = 1;											// 현재 선택된 페이지 번호 저장  <주의> 반드시 초기값 입력할 것 
	private int beginRowNo;												// 페이지 번호에 맞는 시작행 번호 저장
	private int endRowNo;													// 페이지 번호에 맞는 끝행 번호 저장
	private String keyword1;												// 검색 키워드 1
	private String keyword2;												// 검색 키워드 1
	private int or_and;														// 검색 조건 
	private int company_emp_no;										// 검색 조건 
	private int emp_no;														// 검색 조건 
	private int company_no;												// 검색 조건 
	private String sort;

	private List<Map<String,String>> expenseTableList;
	
	private int max_return_no;
	private int report_no;
	private int writer;
	private String sign_name;
	
	public List<Map<String, String>> getTableList() {
		return tableList;
	}
	public void setTableList(List<Map<String, String>> tableList) {
		this.tableList = tableList;
	}
	public List<Integer> getExpense_area() {
		return expense_area;
	}
	public void setExpense_area(List<Integer> expense_area) {
		this.expense_area = expense_area;
	}
	public List<Integer> getExpense_means() {
		return expense_means;
	}
	public void setExpense_means(List<Integer> expense_means) {
		this.expense_means = expense_means;
	}
	public List<Integer> getApproval_rejection() {
		return approval_rejection;
	}
	public void setApproval_rejection(List<Integer> approval_rejection) {
		this.approval_rejection = approval_rejection;
	}
	public String getMin_approval_year() {
		return min_approval_year;
	}
	public void setMin_approval_year(String min_approval_year) {
		this.min_approval_year = min_approval_year;
	}
	public String getMin_approval_month() {
		return min_approval_month;
	}
	public void setMin_approval_month(String min_approval_month) {
		this.min_approval_month = min_approval_month;
	}
	public String getMax_approval_year() {
		return max_approval_year;
	}
	public void setMax_approval_year(String max_approval_year) {
		this.max_approval_year = max_approval_year;
	}
	public String getMax_approval_month() {
		return max_approval_month;
	}
	public void setMax_approval_month(String max_approval_month) {
		this.max_approval_month = max_approval_month;
	}
	public int getCost_min() {
		return cost_min;
	}
	public void setCost_min(int cost_min) {
		this.cost_min = cost_min*10000;
	}
	public int getCost_max() {
		return cost_max;
	}
	public void setCost_max(int cost_max) {
		this.cost_max = cost_max*10000;
	}
	public String getMin_expense_year() {
		return min_expense_year;
	}
	public void setMin_expense_year(String min_expense_year) {
		this.min_expense_year = min_expense_year;
	}
	public String getMin_expense_month() {
		return min_expense_month;
	}
	public void setMin_expense_month(String min_expense_month) {
		this.min_expense_month = min_expense_month;
	}
	public String getMax_expense_year() {
		return max_expense_year;
	}
	public void setMax_expense_year(String max_expense_year) {
		this.max_expense_year = max_expense_year;
	}
	public String getMax_expense_month() {
		return max_expense_month;
	}
	public void setMax_expense_month(String max_expense_month) {
		this.max_expense_month = max_expense_month;
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
		System.out.println("로그인 company_emp_no 는 :   "+company_emp_no);
		this.company_emp_no = company_emp_no;
	}
	public int getEmp_no() {
		return emp_no;
	}
	public void setEmp_no(int emp_no) {
		System.out.println("로그인 emp_no 는 :   "+emp_no);
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
	public List<Map<String, String>> getExpenseTableList() {
		return expenseTableList;
	}
	public void setExpenseTableList(List<Map<String, String>> expenseTableList) {
		this.expenseTableList = expenseTableList;
	}
	public int getMax_return_no() {
		return max_return_no;
	}
	public void setMax_return_no(int max_return_no) {
		this.max_return_no = max_return_no;
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
	public String getSign_name() {
		return sign_name;
	}
	public void setSign_name(String sign_name) {
		this.sign_name = sign_name;
	}
	
	
			
	
}
