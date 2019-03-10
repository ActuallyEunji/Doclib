package com.daum.pro;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;



@Repository
public class ExpenseDAOImpl implements ExpenseDAO {
	//======================================================
	// 속성변수 boardDAO 선언하고 BoardDAO 인터페이스를 구현받은 BoardDAOImpl객체를 생성해 저장
	//======================================================
		// @Autowired 의 역할 => 속성변수에 붙은 자료형인 인터페이스를 구현한 클래스를 객체화하여 저장한다.
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	//======================================================
	// 검색한 게시판 목록 개수 리턴하는 메소드 선언
	//======================================================
	public int getExpenseBoardListCnt( ExpenseListDTO expenseListDTO) {
		int expenseboardListAllCnt = sqlSession.selectOne(
				"com.daum.pro.ExpenseDAO.getExpenseBoardListCnt"         // 실행할 SQL 구문의 위치 지정   // 패키지명 처럼 보이지만 BoardDAO라는 패키지명이 없다 근데 그게 어디있냐면  root-context.xml 파일에
				, expenseListDTO                                        					  // 실행할 SQL 구문에서 사용할 데이터 설정    //파라미터값을 DTO객체로 넘겨줌
		);
		return expenseboardListAllCnt;	
	}
		
		
	//======================================================
	// 검색한 게시판 목록 리턴하는 메소드 선언
	//======================================================
	public List<Map<String,String>> getExpenseBoardList(ExpenseListDTO expenseListDTO){
		 List<Map<String,String>> expenseboardList = sqlSession.selectList(
				 "com.daum.pro.ExpenseDAO.getExpenseBoardList"             // 실행할 SQL 구문의 위치 지정
				 , expenseListDTO                                       					  // 실행할 SQL 구문에서 사용할 데이터 설정
			);
		 return expenseboardList;
	}
	
	
	//======================================================
	// 지출내역 검색하는 메소드 선언
	//======================================================
	public Map<String,String> getupDelExpenseList(ExpenseDTO expenseDTO){
		Map<String,String> upDelExpenseList = sqlSession.selectOne(
				"com.daum.pro.ExpenseDAO.getupDelExpenseList"             // 실행할 SQL 구문의 위치 지정
				, expenseDTO
		);
		return upDelExpenseList;
	}
	
	
	
	//======================================================
	// 결재내역 테이블 얻어오는 메소드 선언
	//======================================================
	public List<Map<String,String>> getTableList(int emp_no){
		List<Map<String,String>> tableList = sqlSession.selectList(
				"com.daum.pro.ExpenseDAO.getTableList"             // 실행할 SQL 구문의 위치 지정
				, emp_no
		);
		return tableList;
	}
	
	
	//======================================================
	// 지출보고서 결재내역 수정한 내역 불러오는 메소드 선언
	//======================================================
	public Map<String,String> updateList(ExpenseDTO expenseDTO){
		Map<String,String> updateList = sqlSession.selectOne(
				"com.daum.pro.ExpenseDAO.updateList"             // 실행할 SQL 구문의 위치 지정
				, expenseDTO
		);
		return updateList;
	}
	
	
	//======================================================
	// 결재완료한 직원 검색하는 메소드 선언
	//======================================================
	public List<Map<String,String>> getFinishEmp(ExpenseDTO expenseDTO){
		List<Map<String,String>> tableList = sqlSession.selectList(
				"com.daum.pro.ExpenseDAO.getFinishEmp"             // 실행할 SQL 구문의 위치 지정
				, expenseDTO
		);
		return tableList;
	}
	
	//======================================================
	// 1개 보고서 입력행의 개수 리턴하는 메소드 선언
	//======================================================
	 public int insertExpense_report(ExpenseDTO expenseDTO) {
		 int expenseRegCnt = sqlSession.insert(
				 "com.daum.pro.ExpenseDAO.insertExpense_report" 
				 , expenseDTO
		);
		 return expenseRegCnt;
	 }
	 
	 
	//======================================================
	// 1개 결재상황 입력하고 압력행의 개수 리턴하는 메소드 선언
	//======================================================
	 public int insertSign_report(ExpenseDTO expenseDTO) {
		 int expenseRegCnt = sqlSession.insert(
				 "com.daum.pro.ExpenseDAO.insertSign_report" 
				 , expenseDTO
		);
		 return expenseRegCnt;
	 }
	 
/*	 
	//======================================================
	// 1개 결재 테이블 검색하고 압력행의 개수 리턴하는 메소드 선언
	//======================================================
	 public List<Map<String,String>> selectTable(ExpenseDTO expenseDTO) {
		 List<Map<String,String>> selectTableCnt = sqlSession.selectList(
				 "com.daum.pro.ExpenseDAO.selectTable" 
				 , expenseDTO 
		);
		 return selectTableCnt;
	 }
	 */
		
	//======================================================
	// 상사의 보고서 결재상황 검색하는 메소드 선언
	//======================================================
	 public int getReport_Approval(ExpenseDTO expenseDTO) {
		 System.out.println("aaaaa");
		 int expense = sqlSession.selectOne(
				 "com.daum.pro.ExpenseDAO.getReport_Approval" 
				 , expenseDTO 
		);
		 return expense;
	 }
	 

	 
	//======================================================
	// 결제내역 검색하는 메소드 선언
	//======================================================
	 public List<Map<String,String>> selectApprovallist(ExpenseDTO expenseDTO) {
		 System.out.println("ccccc");
		 List<Map<String,String>> selectApprovalCnt = sqlSession.selectList(
				 "com.daum.pro.ExpenseDAO.selectApprovallist" 
				 , expenseDTO 
		);
		 return selectApprovalCnt;
	 }	 
	 
	 
	//======================================================
	// 상사결재상황이 미결재라서 결재했는데 그 사이에 수정됐을수 있으므로 확인하는 메소드 선언
	//======================================================
	 public int checkUpdate(ExpenseDTO expenseDTO) {
		 int selectApprovalCnt = sqlSession.selectOne(
				 "com.daum.pro.ExpenseDAO.checkUpdate" 
				 , expenseDTO 
		);
		 return selectApprovalCnt;
	 }	
		
	 
	//======================================================
	// 결재하기 전에 보고서 수정하는 메소드 선언
	//====================================================== 
	 public int updateReport(ExpenseDTO expenseDTO) {
		 System.out.println(expenseDTO.getExpense_month());
		 int updateCnt = sqlSession.update(
				 "com.daum.pro.ExpenseDAO.updateReport" 
				 , expenseDTO
		);
		 return updateCnt;
	 } 
		 
	 

	 
	//======================================================
	//  결제 여부 업데이트 메소드 선언(만약 수정화면 2이고 결재하기 선택했고 수정하기 버튼 눌렀다면)
	//======================================================
	 public int updateApproval(ExpenseDTO expenseDTO) {
		 System.out.println("eeeee");
		 int updateCnt = sqlSession.update(
				 "com.daum.pro.ExpenseDAO.updateApproval" 
				 , expenseDTO
		);
		 return updateCnt;
	 }

	//======================================================
	// 내가 결재하기 누를때 이미 아랫사람이 보고서를 수정했을수 있으므로 보고서 수정횟수 업데이트하는 메소드 선언
	//======================================================
	public int updateCheck(ExpenseDTO expenseDTO) {
		int updateCnt = sqlSession.update(
				 "com.daum.pro.ExpenseDAO.updateCheck" 
				 , expenseDTO
		);
		 return updateCnt;
	}
	 
	 
	//======================================================
	//  결제 여부 업데이트 메소드 선언(만약 수정화면 2이고 결재하기 선택했고 수정하기 버튼 눌렀다면)
	//======================================================
	 public int updateApproval2(ExpenseDTO expenseDTO) {
		 System.out.println("gggggg");
		 int updateCnt = sqlSession.update(
				 "com.daum.pro.ExpenseDAO.updateApproval2" 
				 , expenseDTO
		);
		 return updateCnt;
	 }
	 
	 
	//======================================================
	// 결재 여부가 반려하기 선택됐을 때 반려사유 입력하는 메소드 선언
	//======================================================
	 public int insertSign_check(ExpenseDTO expenseDTO) {
		 System.out.println("hhhhh");
		 int insertsignCnt = sqlSession.insert(
				 "com.daum.pro.ExpenseDAO.insertSign_check" 
				 , expenseDTO
		);
		 return insertsignCnt;
	 }
	 
	 
	//======================================================
	// sign_finish_report 입력 메소드 선언
	//======================================================
	 public int insert_sign_finish_report(ExpenseDTO expenseDTO) {
		 System.out.println("iiiiii");
		 int insertsignCnt = sqlSession.insert(
				 "com.daum.pro.ExpenseDAO.insert_sign_finish_report" 
				 , expenseDTO
		);
		 return insertsignCnt;
	 }
	 
	 
	 
	 
	//======================================================
	//	sign_finish_report 삭제
	//======================================================
	 public int deletereport(ExpenseDTO expenseDTO) {
		 System.out.println("jjjjjj");
		 int deleteReCnt = sqlSession.delete(
				 "com.daum.pro.ExpenseDAO.deletereport" 
				 , expenseDTO
		);
		 return deleteReCnt;
	 }
	 
	 
	 
	//======================================================
	//	sign_finish_report 삭제
	//======================================================
	 public int deletesign(ExpenseDTO expenseDTO) {
		 System.out.println("kkkkkk");
		 int deleteSignCnt = sqlSession.delete(
				 "com.daum.pro.ExpenseDAO.deletesign" 
				 , expenseDTO
		);
		 return deleteSignCnt;
	 }

	 
	 
	//======================================================
	//	expense_report 삭제
	//======================================================
	 public int deleteexpense(ExpenseDTO expenseDTO) {
		 System.out.println("llllllll");
		 int deleteExCnt = sqlSession.delete(
				 "com.daum.pro.ExpenseDAO.deleteexpense" 
				 , expenseDTO
		);
		 return deleteExCnt;
	 }
	 

	 
	 
	 
	 
}
