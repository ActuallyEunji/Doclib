package com.daum.pro;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;

public class BoardSearchDTO {
	//속성변수 선언.
   private String keyword;			// 검색 키워드 저장
   private String keywordTarget;	// 검색 키워드의 타켓 저장
   private int rowCntPerPage=15;	// 한 화면에 보여지는 검색 결과 최대행 개수 저장.
   private int selectPageNo=1;		// 현재 선택된 페이지 번호에 저장. <주의> 반드시 초기값 입력할것.
   
   private int emp_no;
   
   private int board_no;

   private int beginRowNo;		// 페이지 번호에 맞는 시작행 번호 저장
   private int endRowNo;			// 페이지 번호에 맞는 끝행 번호 저장.
   
   private String issue;
	   //메소드 선언
	
   
   
	public String getKeyword() {
		return keyword;
	}
	
	public int getBoard_no() {
		return board_no;
	}

	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}

	public int getEmp_no() {
		return emp_no;
	}

	public void setEmp_no(int emp_no) {
		this.emp_no = emp_no;
	}

	public String getIssue() {
		return issue;
	}

	public void setIssue(String issue) {
		this.issue = issue;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	
	public String getKeywordTarget() {
		return keywordTarget;
	}
	
	public void setKeywordTarget(String keywordTarget) {
		this.keywordTarget = keywordTarget;
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
		System.out.println("DTO의 beginRowNo = " +beginRowNo);
		this.beginRowNo = beginRowNo;
	}
	
	public int getEndRowNo() {
		return endRowNo;
	}
	
	public void setEndRowNo(int endRowNo) {
		System.out.println("DTO의 endRowNo = " +endRowNo);
		this.endRowNo = endRowNo;
	}
}
