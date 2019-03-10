package com.daum.pro;
import java.util.List;
import java.util.Map;

import com.daum.pro.*;

// BoardService 인터페이스 선언
public interface BusinessService {
	//검색한 게시판 목록 개수 리턴하는 메소드 선언
	int getBusinessBoardListCnt(BusinessListDTO businessListDTO);
	//검색한 게시판 목록 리턴하는 메소드 선언
	List<Map<String,String>> getBusinessBoardList(BusinessListDTO businessListDTO);
	// 결재내역 테이블 얻어오는 메소드 선언
	List<Map<String,String>> getTableList(int emp_no);
	// 1개 보고서 글 입력하고 입력행의 개수 리턴하는 메소드 선언
	int insertBusiness(BusinessDTO businessDTO);
	// 상사의 보고서 결재상황 검색하는 메소드 선언
	int getReport_Approval(BusinessDTO businessDTO);
	// 지출내역 검색하는 메소드 선언
	Map<String,String> getupDelBusinessList(BusinessDTO businessDTO);
	// 만난사람 검색하는 메소드 선언
	List<Map<String,String>> getSalesPersonList(BusinessDTO businessDTO);
	// 결제내역 검색하는 메소드 선언
	List<Map<String,String>> selectApprovallist(BusinessDTO businessDTO);
	// 결재완료한 직원 검색하는 메소드 선언
	List<Map<String,String>> getFinishEmp(BusinessDTO businessDTO);
	// 지출보고서 결재내역 수정한 내역 불러오는 메소드 선언
	Map<String,String> updateList(BusinessDTO businessDTO);
	// 1개 보고서 글 수정하고 수정행의 개수 리턴하는 메소드 선언
	int updateReport(BusinessDTO businessDTO , int form_choice);
	// 1개 보고서 글 삭제하고 삭제행의 개수 리턴하는 메소드 선언
	int deleteReport(BusinessDTO businessDTO);
}
