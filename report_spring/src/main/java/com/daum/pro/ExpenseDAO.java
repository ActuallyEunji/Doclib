package com.daum.pro;

import java.util.List;
import java.util.Map;

// BoardDAO 인터페이스 선언
public interface ExpenseDAO {
	//검색한 게시판 목록 개수 리턴하는 메소드 선언
	int getExpenseBoardListCnt(ExpenseListDTO expenseListDTO);
	//검색한 게시판 목록 리턴하는 메소드 선언
	List<Map<String,String>> getExpenseBoardList(ExpenseListDTO expenseListDTO);
	// 1개 보고서 입력
	int insertExpense_report(ExpenseDTO expenseDTO);
	// 1개 결재상황 입력
	int insertSign_report(ExpenseDTO expenseDTO);
	// 지출내역 검색하는 메소드 선언
	Map<String,String> getupDelExpenseList(ExpenseDTO expenseDTO);
	// 결재내역 테이블 얻어오는 메소드 선언
	List<Map<String,String>> getTableList(int emp_no);
	// 상사의 보고서 결재상황 검색하는 메소드 선언
	int getReport_Approval(ExpenseDTO expenseDTO);
	// 결제내역 검색하는 메소드 선언
	List<Map<String,String>> selectApprovallist(ExpenseDTO expenseDTO);
	// 지출보고서 결재내역 수정한 내역 불러오는 메소드 선언
	Map<String,String> updateList(ExpenseDTO expenseDTO);
	// 결재완료한 직원 검색하는 메소드 선언
	List<Map<String,String>> getFinishEmp(ExpenseDTO expenseDTO);
	// 상사결재상황이 미결재라서 결재했는데 그 사이에 수정됐을수 있으므로 확인하는 메소드 선언
	int checkUpdate(ExpenseDTO expenseDTO);
	// 상사결재상황 미결재라서 보고서 수정하는 메소드 선언
	int updateReport(ExpenseDTO expenseDTO);
	// 결제 여부 업데이트 메소드 선언(만약 수정화면 2이고 결재하기 선택했고 수정하기 버튼 눌렀다면)
	int updateApproval(ExpenseDTO expenseDTO);
	// 내가 결재하기 누를때 이미 아랫사람이 보고서를 수정했을수 있으므로 보고서 수정횟수 업데이트하는 메소드 선언
	int updateCheck(ExpenseDTO expenseDTO);
	// 결제 여부 업데이트 메소드 선언(만약 수정화면 2이고 반려하기 선택했고 수정하기 버튼 눌렀다면)
	int updateApproval2(ExpenseDTO expenseDTO);
	// 결재 여부가 반려하기 선택됐을 때 반려사유 입력하는 메소드 선언
	int insertSign_check(ExpenseDTO expenseDTO);
	// sign_finish_report 입력 메소드 선언
	int insert_sign_finish_report(ExpenseDTO expenseDTO);
	//	expense_report 삭제
	int deleteexpense(ExpenseDTO expenseDTO);
	//	sign_finish_report 삭제
	int deletesign(ExpenseDTO expenseDTO);
	//	sign_finish_report 삭제
	int deletereport(ExpenseDTO expenseDTO);
}
