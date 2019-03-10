package com.daum.pro;

import java.util.List;
import java.util.Map;

public class WeekDTO {
	
		private int revise_cnt;
		private int report_no;									// 보고서 번호
		private int report_code;								// 보고서 종류번호
		
		private String week_business_remarks;
		
		List<Week_businessDTO> weekList;				// 행추가 
		
		private int writer;										// 보고서 작성한 직원번호
		private int emp_no;										// 로그인한 직원번호
		
		private String journal_year;							//보고일(년)
		private String journal_month;						//보고일(월)
		private String journal_date;							//보고일(일)
		
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

		public String getWeek_business_remarks() {
			return week_business_remarks;
		}

		public void setWeek_business_remarks(String week_business_remarks) {
			System.out.println("week_business_remarks = " + week_business_remarks);
			this.week_business_remarks = week_business_remarks;
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

		public List<Week_businessDTO> getWeekList() {
			return weekList;
		}

		public void setWeekList(List<Week_businessDTO> weekList) {
			this.weekList = weekList;
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

		public String getJournal_year() {
			return journal_year;
		}

		public void setJournal_year(String journal_year) {
			this.journal_year = journal_year;
		}

		public String getJournal_month() {
			return journal_month;
		}

		public void setJournal_month(String journal_month) {
			this.journal_month = journal_month;
		}

		public String getJournal_date() {
			return journal_date;
		}

		public void setJournal_date(String journal_date) {
			this.journal_date = journal_date;
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
