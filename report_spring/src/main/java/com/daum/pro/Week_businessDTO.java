package com.daum.pro;

import java.util.List;
import java.util.Map;

public class Week_businessDTO {
		
		private String c_no;
		private int week_list;									// 업무분야 
		private String week_content;							// 업무내용
		private String completion;							// 완료여부 

		private String begin_journal_year;					// 업무시작년도
		private String begin_journal_month;				// 업무시작월
		private String begin_journal_date;					// 업무시작일
		private String begin_journal_hour;					// 업무시작시각(시)
		private String begin_journal_minute;				// 업무시작시각(분)
		
		private String end_journal_year;						// 업무종료년도
		private String end_journal_month;					// 업무종료월
		private String end_journal_date;						// 업무종료일
		private String end_journal_hour;						// 업무종료시각(시)
		private String end_journal_minute;					// 업무종료시각(분)
		
		
		

		public String getC_no() {
			return c_no;
		}
		public void setC_no(String c_no) {
			System.out.println("c_no = " + c_no);
			this.c_no = c_no;
		}
		public int getWeek_list() {
			return week_list;
		}
		public void setWeek_list(int week_list) {
			this.week_list = week_list;
		}
		public String getWeek_content() {
			return week_content;
		}
		public void setWeek_content(String week_content) {
			System.out.println("week_content = " + week_content);
			this.week_content = week_content;
		}
		public String getCompletion() {
			return completion;
		}
		public void setCompletion(String completion) {
			System.out.println("completion = " + completion);
			this.completion = completion;
		}
		public String getBegin_journal_year() {
			return begin_journal_year;
		}
		public void setBegin_journal_year(String begin_journal_year) {
			this.begin_journal_year = begin_journal_year;
		}
		public String getBegin_journal_month() {
			return begin_journal_month;
		}
		public void setBegin_journal_month(String begin_journal_month) {
			this.begin_journal_month = begin_journal_month;
		}
		public String getBegin_journal_date() {
			return begin_journal_date;
		}
		public void setBegin_journal_date(String begin_journal_date) {
			this.begin_journal_date = begin_journal_date;
		}
		public String getBegin_journal_hour() {
			return begin_journal_hour;
		}
		public void setBegin_journal_hour(String begin_journal_hour) {
			this.begin_journal_hour = begin_journal_hour;
		}
		public String getBegin_journal_minute() {
			return begin_journal_minute;
		}
		public void setBegin_journal_minute(String begin_journal_minute) {
			this.begin_journal_minute = begin_journal_minute;
		}
		public String getEnd_journal_year() {
			return end_journal_year;
		}
		public void setEnd_journal_year(String end_journal_year) {
			this.end_journal_year = end_journal_year;
		}
		public String getEnd_journal_month() {
			return end_journal_month;
		}
		public void setEnd_journal_month(String end_journal_month) {
			this.end_journal_month = end_journal_month;
		}
		public String getEnd_journal_date() {
			return end_journal_date;
		}
		public void setEnd_journal_date(String end_journal_date) {
			this.end_journal_date = end_journal_date;
		}
		public String getEnd_journal_hour() {
			return end_journal_hour;
		}
		public void setEnd_journal_hour(String end_journal_hour) {
			this.end_journal_hour = end_journal_hour;
		}
		public String getEnd_journal_minute() {
			return end_journal_minute;
		}
		public void setEnd_journal_minute(String end_journal_minute) {
			this.end_journal_minute = end_journal_minute;
		}
		
		
		
}
