package com.daum.pro;

import java.util.List;
import java.util.Map;

public class DailyDTO {
	
		private int revise_cnt;
		private int report_no;									// 보고서 번호
		private int report_code;								// 보고서 종류번호
		private String writer_name;							// 작성자
		private int daily_business_field;						// 업무분야 
		private String daily_business_content;				// 업무내용
		private String is_daily_business_finish;				// 완료여부 
		private String daily_business_remarks;				// 지시사항

		private String begin_daily_business_year;			// 업무시작년도
		private String begin_daily_business_month;		// 업무시작월
		private String begin_daily_business_date;			// 업무시작일
		private String begin_daily_business_hour;		// 업무시작시각(시)
		private String begin_daily_business_minute;		// 업무시작시각(분)
		
		private String end_daily_business_year;			// 업무종료년도
		private String end_daily_business_month;		// 업무종료월
		private String end_daily_business_date;				// 업무종료일
		private String end_daily_business_hour;			// 업무종료시각(시)
		private String end_daily_business_minute;		// 업무종료시각(분)
		
		private int writer;										// 보고서 작성한 직원번호
		private int emp_no;										// 로그인한 직원번호
		
		private String sign_date;								// 결재일
		private String sign_code;								// 결재여부 번호
		private String sign_name;
		private String upDel;

		private int max_return_no;				
		
		private List<Integer> insertlist;						// 차수저장리스트
		
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
			System.out.println("report_no = " + report_no);
			this.report_no = report_no;
		}

		public int getReport_code() {
			return report_code;
		}

		public void setReport_code(int report_code) {
			this.report_code = report_code;
		}

		public String getWriter_name() {
			return writer_name;
		}

		public void setWriter_name(String writer_name) {
			this.writer_name = writer_name;
		}

		public int getDaily_business_field() {
			return daily_business_field;
		}

		public void setDaily_business_field(int daily_business_field) {
			this.daily_business_field = daily_business_field;
		}

		public String getDaily_business_content() {
			return daily_business_content;
		}

		public void setDaily_business_content(String daily_business_content) {
			this.daily_business_content = daily_business_content;
		}

		public String getIs_daily_business_finish() {
			return is_daily_business_finish;
		}

		public void setIs_daily_business_finish(String is_daily_business_finish) {
			this.is_daily_business_finish = is_daily_business_finish;
		}

		public String getDaily_business_remarks() {
			return daily_business_remarks;
		}

		public void setDaily_business_remarks(String daily_business_remarks) {
			this.daily_business_remarks = daily_business_remarks;
		}

		public String getBegin_daily_business_year() {
			return begin_daily_business_year;
		}

		public void setBegin_daily_business_year(String begin_daily_business_year) {
			this.begin_daily_business_year = begin_daily_business_year;
		}

		public String getBegin_daily_business_month() {
			return begin_daily_business_month;
		}

		public void setBegin_daily_business_month(String begin_daily_business_month) {
			this.begin_daily_business_month = begin_daily_business_month;
		}

		public String getBegin_daily_business_date() {
			return begin_daily_business_date;
		}

		public void setBegin_daily_business_date(String begin_daily_business_date) {
			this.begin_daily_business_date = begin_daily_business_date;
		}

		public String getBegin_daily_business_hour() {
			return begin_daily_business_hour;
		}

		public void setBegin_daily_business_hour(String begin_daily_business_hour) {
			this.begin_daily_business_hour = begin_daily_business_hour;
		}

		public String getBegin_daily_business_minute() {
			return begin_daily_business_minute;
		}

		public void setBegin_daily_business_minute(String begin_daily_business_minute) {
			this.begin_daily_business_minute = begin_daily_business_minute;
		}

		public String getEnd_daily_business_year() {
			return end_daily_business_year;
		}

		public void setEnd_daily_business_year(String end_daily_business_year) {
			this.end_daily_business_year = end_daily_business_year;
		}

		public String getEnd_daily_business_month() {
			return end_daily_business_month;
		}

		public void setEnd_daily_business_month(String end_daily_business_month) {
			this.end_daily_business_month = end_daily_business_month;
		}

		public String getEnd_daily_business_date() {
			return end_daily_business_date;
		}

		public void setEnd_daily_business_date(String end_daily_business_date) {
			this.end_daily_business_date = end_daily_business_date;
		}

		public String getEnd_daily_business_hour() {
			return end_daily_business_hour;
		}

		public void setEnd_daily_business_hour(String end_daily_business_hour) {
			this.end_daily_business_hour = end_daily_business_hour;
		}

		public String getEnd_daily_business_minute() {
			return end_daily_business_minute;
		}

		public void setEnd_daily_business_minute(String end_daily_business_minute) {
			this.end_daily_business_minute = end_daily_business_minute;
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
			System.out.println("emp_no = " + emp_no);
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
