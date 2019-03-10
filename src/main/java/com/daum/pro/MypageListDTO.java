package com.daum.pro;

import java.util.List;
import java.util.Map;

public class MypageListDTO {
	
   private int rowCntPerPage=15;	// 한 화면에 보여지는 검색 결과 최대행 개수 저장.
   private int selectPageNo=1;		// 현재 선택된 페이지 번호에 저장. <주의> 반드시 초기값 입력할것.

   private int beginRowNo;		// 페이지 번호에 맞는 시작행 번호 저장
   private int endRowNo;			// 페이지 번호에 맞는 끝행 번호 저장.
	
	private int emp_no;				// 검색 조건 

	private int report_no;
	private int writer;
	private String sign_name;
	
	private int max_return_no;
	
	
	public int getMax_return_no() {
		return max_return_no;
	}
	public void setMax_return_no(int max_return_no) {
		this.max_return_no = max_return_no;
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
	public int getEmp_no() {
		return emp_no;
	}
	public void setEmp_no(int emp_no) {
		this.emp_no = emp_no;
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
