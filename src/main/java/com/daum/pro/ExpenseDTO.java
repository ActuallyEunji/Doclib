package com.daum.pro;

import java.util.List;
import java.util.Map;

public class ExpenseDTO {
		
		private int revise_cnt;
		private int report_no;					// 보고서 번호
		private int report_code;				// 보고서 종류번호
		private String expense_name;			// 보고서 이름
		private int expense_field;				// 지출분야
		private String expense_price;			// 지출비용
		private int expense_method;			// 지출수단 번호
		private String expense_year;			// 지출년	
		private String expense_month;		// 지출월
		private String expense_date;			// 지출일
		private String receipt_no;				// 영수증 번호
		private String remarks;					// 비고
		private int writer;						// 보고서 작성한 직원번호
		private int emp_no;						// 로그인한 직원번호
		private String sign_date;				// 결재일
		private String sign_code;				// 결재여부 번호
		private String sign_name;
		private String upDel;
		private String sign_check;				// 결재여부
		private String no_confirm_reason;	// 반려사유
		
		private int max_return_no;				
		
		private List<Integer> insertlist;		// 차수저장리스트
		
		private List<Map<String,String>> tableList;	// 결재내역 뿌리는 리스트
		
		private List<Integer>	update_state_num_List;
		
		private List<Integer>	return_no_list;				// max_return_no저장하는 리스트
		
		

		public int getRevise_cnt() {
			return revise_cnt;
		}

		public void setRevise_cnt(int revise_cnt) {
			this.revise_cnt = revise_cnt;
		}

		public int getReport_no() {
			return report_no;
		}

		public void setReport_no(int report_no) {
			this.report_no = report_no;
		}

		public int getReport_code() {
			return report_code;
		}

		public void setReport_code(int report_code) {
			this.report_code = report_code;
		}

		public String getExpense_name() {
			return expense_name;
		}

		public void setExpense_name(String expense_name) {
			this.expense_name = expense_name;
		}

		public int getExpense_field() {
			return expense_field;
		}

		public void setExpense_field(int expense_field) {
			this.expense_field = expense_field;
		}

		public String getExpense_price() {
			return expense_price;
		}

		public void setExpense_price(String expense_price) {
			this.expense_price = expense_price;
		}

		public int getExpense_method() {
			return expense_method;
		}

		public void setExpense_method(int expense_method) {
			this.expense_method = expense_method;
		}

		public String getExpense_year() {
			return expense_year;
		}

		public void setExpense_year(String expense_year) {
			this.expense_year = expense_year;
		}

		public String getExpense_month() {
			return expense_month;
		}

		public void setExpense_month(String expense_month) {
			this.expense_month = expense_month;
		}

		public String getExpense_date() {
			return expense_date;
		}

		public void setExpense_date(String expense_date) {
			this.expense_date = expense_date;
		}

		public String getReceipt_no() {
			return receipt_no;
		}

		public void setReceipt_no(String receipt_no) {
			this.receipt_no = receipt_no;
		}

		public String getRemarks() {
			return remarks;
		}

		public void setRemarks(String remarks) {
			this.remarks = remarks;
		}

		public int getWriter() {
			return writer;
		}

		public void setWriter(int writer) {
			this.writer = writer;
		}

		public int getEmp_no() {
			return emp_no;
		}

		public void setEmp_no(int emp_no) {
			this.emp_no = emp_no;
		}

		public String getSign_date() {
			return sign_date;
		}

		public void setSign_date(String sign_date) {
			this.sign_date = sign_date;
		}

		public String getSign_code() {
			return sign_code;
		}

		public void setSign_code(String sign_code) {
			this.sign_code = sign_code;
		}

		public String getSign_name() {
			return sign_name;
		}

		public void setSign_name(String sign_name) {
			this.sign_name = sign_name;
		}

		public String getUpDel() {
			return upDel;
		}

		public void setUpDel(String upDel) {
			this.upDel = upDel;
		}

		public String getSign_check() {
			return sign_check;
		}

		public void setSign_check(String sign_check) {
			this.sign_check = sign_check;
		}

		public String getNo_confirm_reason() {
			return no_confirm_reason;
		}

		public void setNo_confirm_reason(String no_confirm_reason) {
			this.no_confirm_reason = no_confirm_reason;
		}

		public int getMax_return_no() {
			return max_return_no;
		}

		public void setMax_return_no(int max_return_no) {
			this.max_return_no = max_return_no;
		}

		public List<Integer> getInsertlist() {
			return insertlist;
		}

		public void setInsertlist(List<Integer> insertlist) {
			this.insertlist = insertlist;
		}

		public List<Map<String, String>> getTableList() {
			return tableList;
		}

		public void setTableList(List<Map<String, String>> tableList) {
			this.tableList = tableList;
		}

		public List<Integer> getUpdate_state_num_List() {
			return update_state_num_List;
		}

		public void setUpdate_state_num_List(List<Integer> update_state_num_List) {
			this.update_state_num_List = update_state_num_List;
		}

		public List<Integer> getReturn_no_list() {
			return return_no_list;
		}

		public void setReturn_no_list(List<Integer> return_no_list) {
			this.return_no_list = return_no_list;
		}

		
		
	
	
}
