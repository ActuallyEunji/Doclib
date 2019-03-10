package com.daum.pro;

import java.util.List;
import java.util.Map;

// BoardDAO 인터페이스 선언
public interface BusinessDAO {
	//검색한 게시판 목록 개수 리턴하는 메소드 선언
	int getBusinessBoardListCnt(BusinessListDTO businessListDTO);
	//검색한 게시판 목록 리턴하는 메소드 선언
	List<Map<String,String>> getBusinessBoardList(BusinessListDTO businessListDTO);
	// 결재내역 테이블 얻어오는 메소드 선언
	List<Map<String,String>> getTableList(int emp_no);
	// 영업보고서 입력하는 메소드 선언
	int insertBusiness_report(BusinessDTO businessDTO);
	// 만난사람 입력하는 메소드 선언
	int insertSales_person(BusinessDTO businessDTO);
	// 이어주는 테이블 입력하는 메소드 선언
	int insertTable(BusinessDTO businessDTO);
	// 이어주는 테이블 입력하는 메소드 선언
	int insertTable2(BusinessDTO businessDTO);
	// sign_finish_report 입력하는 메소드 선언
	int insertSign_report(BusinessDTO businessDTO);
	// sign_finish_report 입력하는 메소드 선언
	int insertSign_report2(BusinessDTO businessDTO);
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
	// 보고서 수정시 만난사람 삭제하는 메소드 선언
	int deletePerson(BusinessDTO businessDTO);
	// 만난사람 이어주는 테이블 삭제하는 메소드 선언
	int deleteSalesTable(BusinessDTO businessDTO);
	// 상사결재상황 미결재라서 보고서 수정하는 메소드 선언
	int updateReport(BusinessDTO businessDTO);
	// 결제 여부 업데이트 메소드 선언(만약 수정화면 2이고 결재하기 선택했고 수정하기 버튼 눌렀다면)
	int updateApproval(BusinessDTO businessDTO);
	// 결제 여부 업데이트 메소드 선언(만약 수정화면 2이고 반려하기 선택했고 수정하기 버튼 눌렀다면)
	int updateApproval2(BusinessDTO businessDTO);
	// 결재 여부가 반려하기 선택됐을 때 반려사유 입력하는 메소드 선언
	int insertSign_check(BusinessDTO businessDTO);
	//	business_report 삭제
	int deletebusiness(BusinessDTO businessDTO);
	//	sign_finish_report 삭제
	int deletesign(BusinessDTO businessDTO);
	//	return_report 삭제
	int deletereport(BusinessDTO businessDTO);
	// 수정사항 있는지 확인하는 메소드 선언
	int checkupdate(BusinessDTO businessDTO);
	// 보고서 수정횟수 업데이트 메소드 선언
	int updateCheck(BusinessDTO businessDTO);
}
