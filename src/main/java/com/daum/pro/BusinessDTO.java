package com.daum.pro;

import java.util.List;
import java.util.Map;

public class BusinessDTO {
	
		private int revise_cnt;
		private int report_no;					// 보고서 번호
		private int report_code;				// 보고서 종류번호
		private String business_name;			// 보고서 이름
		private int business_field;				// 방문목적
		
		private List<PersonDTO> personlist;	// 만난사람 

		private String min_business_year;	// 방문년	도
		private String min_business_month;		// 방문월
		private String min_business_day;			// 방문일
		private String min_business_hour;			// 방문시각(시)
		private String min_business_minute;		// 방문시각(분)
		
		private String max_business_year;	// 방문년	도
		private String max_business_month;		// 방문월
		private String max_business_day;			// 방문일
		private String max_business_hour;			// 방문시각(시)
		private String max_business_minute;		// 방문시각(분)
		
		private String business_content;					// 영업내용
		
		private String business_result;		// 영업성과
		
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

		public String getBusiness_name() {
			return business_name;
		}

		public void setBusiness_name(String business_name) {
			this.business_name = business_name;
		}

		public int getBusiness_field() {
			return business_field;
		}

		public void setBusiness_field(int business_field) {
			this.business_field = business_field;
		}

		public List<PersonDTO> getPersonlist() {
			return personlist;
		}

		public void setPersonlist(List<PersonDTO> personlist) {
			this.personlist = personlist;
		}

		public String getMin_business_year() {
			return min_business_year;
		}

		public void setMin_business_year(String min_business_year) {
			this.min_business_year = min_business_year;
		}

		public String getMin_business_month() {
			return min_business_month;
		}

		public void setMin_business_month(String min_business_month) {
			this.min_business_month = min_business_month;
		}

		public String getMin_business_day() {
			return min_business_day;
		}

		public void setMin_business_day(String min_business_day) {
			this.min_business_day = min_business_day;
		}

		public String getMin_business_hour() {
			return min_business_hour;
		}

		public void setMin_business_hour(String min_business_hour) {
			this.min_business_hour = min_business_hour;
		}

		public String getMin_business_minute() {
			return min_business_minute;
		}

		public void setMin_business_minute(String min_business_minute) {
			this.min_business_minute = min_business_minute;
		}

		public String getMax_business_year() {
			return max_business_year;
		}

		public void setMax_business_year(String max_business_year) {
			this.max_business_year = max_business_year;
		}

		public String getMax_business_month() {
			return max_business_month;
		}

		public void setMax_business_month(String max_business_month) {
			this.max_business_month = max_business_month;
		}

		public String getMax_business_day() {
			return max_business_day;
		}

		public void setMax_business_day(String max_business_day) {
			this.max_business_day = max_business_day;
		}

		public String getMax_business_hour() {
			return max_business_hour;
		}

		public void setMax_business_hour(String max_business_hour) {
			this.max_business_hour = max_business_hour;
		}

		public String getMax_business_minute() {
			return max_business_minute;
		}

		public void setMax_business_minute(String max_business_minute) {
			this.max_business_minute = max_business_minute;
		}

		public String getBusiness_content() {
			return business_content;
		}

		public void setBusiness_content(String business_content) {
			this.business_content = business_content;
		}

		public String getBusiness_result() {
			return business_result;
		}

		public void setBusiness_result(String business_result) {
			this.business_result = business_result;
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
