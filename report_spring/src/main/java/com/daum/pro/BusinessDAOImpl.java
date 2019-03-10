package com.daum.pro;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;



@Repository
public class BusinessDAOImpl implements BusinessDAO {
	//======================================================
	// 속성변수 boardDAO 선언하고 BoardDAO 인터페이스를 구현받은 BoardDAOImpl객체를 생성해 저장
	//======================================================
		// @Autowired 의 역할 => 속성변수에 붙은 자료형인 인터페이스를 구현한 클래스를 객체화하여 저장한다.
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	//======================================================
	// 검색한 게시판 목록 개수 리턴하는 메소드 선언
	//======================================================
	public int getBusinessBoardListCnt( BusinessListDTO businessListDTO) {
		int businessBoardListCnt = sqlSession.selectOne(
				"com.daum.pro.BusinessDAO.getBusinessBoardListCnt"         // 실행할 SQL 구문의 위치 지정   // 패키지명 처럼 보이지만 BoardDAO라는 패키지명이 없다 근데 그게 어디있냐면  root-context.xml 파일에
				, businessListDTO                                        					  // 실행할 SQL 구문에서 사용할 데이터 설정    //파라미터값을 DTO객체로 넘겨줌
		);
		return businessBoardListCnt;	
	}
		
		
	//======================================================
	// 검색한 게시판 목록 리턴하는 메소드 선언
	//======================================================
	public List<Map<String,String>> getBusinessBoardList(BusinessListDTO businessListDTO){
		 List<Map<String,String>> businessBoardList = sqlSession.selectList(
				 "com.daum.pro.BusinessDAO.getBusinessBoardList"            
				 , businessListDTO                                       					  
			);
		 return businessBoardList;
	}
	
	//======================================================
	// 결재내역 테이블 얻어오는 메소드 선언
	//======================================================
	public List<Map<String,String>> getTableList(int emp_no){
		List<Map<String,String>> tableList = sqlSession.selectList(
				"com.daum.pro.BusinessDAO.getTableList"             
				, emp_no
		);
		return tableList;
	}
	
	
	//======================================================
	// 결재완료한 직원 검색하는 메소드 선언
	//======================================================
	public List<Map<String,String>> getFinishEmp(BusinessDTO businessDTO){
		List<Map<String,String>> tableList = sqlSession.selectList(
				"com.daum.pro.BusinessDAO.getFinishEmp"             
				, businessDTO
		);
		return tableList;
	}
	
	//======================================================
	// 영업보고서 입력하는 메소드 선언
	//======================================================
	 public int insertBusiness_report(BusinessDTO businessDTO) {
		 int businessRegCnt = sqlSession.insert(
				 "com.daum.pro.BusinessDAO.insertBusiness_report" 
				 , businessDTO
		);
		 return businessRegCnt;
	 }
	 
	 
	//======================================================
	// 만난사람 입력하는 메소드 선언
	//======================================================
	 public int insertSales_person(BusinessDTO businessDTO) {
		 List<PersonDTO> personlist = businessDTO.getPersonlist();
		 int salesPersonCnt=0;
		 for(int i=0; i<personlist.size();i++) {
			 salesPersonCnt = salesPersonCnt +  sqlSession.insert(
					 "com.daum.pro.BusinessDAO.insertSales_person" 
					 , personlist.get(i)
			);
		 };
			 return salesPersonCnt;
	 }
	 
	 
	//======================================================
	// 이어주는 테이블 입력하는 메소드 선언
	//======================================================
	 public int insertTable(BusinessDTO businessDTO) {
		 int tableRegCnt = sqlSession.insert(
				 "com.daum.pro.BusinessDAO.insertTable" 
				 , businessDTO
		);
		 return tableRegCnt;
	 }
	 
	 
	//======================================================
	// 이어주는 테이블2 입력하는 메소드 선언
	//======================================================
	 public int insertTable2(BusinessDTO businessDTO) {
		 int tableRegCnt = sqlSession.insert(
				 "com.daum.pro.BusinessDAO.insertTable2" 
				 , businessDTO
		);
		 return tableRegCnt;
	 }
	 
	 
	//======================================================
	// sign_finish_report 입력하는 메소드 선언
	//======================================================
	 public int insertSign_report(BusinessDTO businessDTO) {
		 int signRegCnt = sqlSession.insert(
				 "com.daum.pro.BusinessDAO.insertSign_report" 
				 , businessDTO
		);
		 return signRegCnt;
	 }
	 
	 
	//======================================================
	// sign_finish_report 입력하는 메소드 선언
	//======================================================
	 public int insertSign_report2(BusinessDTO businessDTO) {
		 int signRegCnt = sqlSession.insert(
				 "com.daum.pro.BusinessDAO.insertSign_report2" 
				 , businessDTO
		);
		 return signRegCnt;
	 }
	 
	 
	//======================================================
	// 상사의 보고서 결재상황 검색하는 메소드 선언
	//======================================================
	 public int getReport_Approval(BusinessDTO businessDTO) {
		 int business = sqlSession.selectOne(
				 "com.daum.pro.BusinessDAO.getReport_Approval" 
				 , businessDTO 
		);
		 return business;
	 }
	 
	 
	//======================================================
	// 영업내역 검색하는 메소드 선언
	//======================================================
	public Map<String,String> getupDelBusinessList(BusinessDTO businessDTO){
		Map<String,String> upDelBusinessList = sqlSession.selectOne(
				"com.daum.pro.BusinessDAO.getupDelBusinessList"             // 실행할 SQL 구문의 위치 지정
				, businessDTO
		);
		return upDelBusinessList;
	}
	
	
	//======================================================
	// 만난사람 검색하는 메소드 선언
	//======================================================
	 public List<Map<String,String>> getSalesPersonList(BusinessDTO businessDTO) {
		 List<Map<String,String>> selectPersonCnt = sqlSession.selectList(
				 "com.daum.pro.BusinessDAO.getSalesPersonList" 
				 , businessDTO 
		);
		 return selectPersonCnt;
	 }	 

	 
	//======================================================
	// 결제내역 검색하는 메소드 선언
	//======================================================
	 public List<Map<String,String>> selectApprovallist(BusinessDTO businessDTO) {
		 List<Map<String,String>> selectApprovalCnt = sqlSession.selectList(
				 "com.daum.pro.BusinessDAO.selectApprovallist" 
				 , businessDTO 
		);
		 return selectApprovalCnt;
	 }	 
	 
	 
	//======================================================
	// 지출보고서 결재내역 수정한 내역 불러오는 메소드 선언
	//======================================================
	public Map<String,String> updateList(BusinessDTO businessDT){
		Map<String,String> updateList = sqlSession.selectOne(
				"com.daum.pro.BusinessDAO.updateList"             
				, businessDT
		);
		return updateList;
	}
	 
	 
	 
	//======================================================
	//	만난사람 삭제
	//======================================================
	 public int deletePerson(BusinessDTO businessDTO) {
		 int deletePersonCnt = sqlSession.delete(
				 "com.daum.pro.BusinessDAO.deletePerson" 
				 , businessDTO
		);
		 return deletePersonCnt;
	 }
	 
	 
	//======================================================
	//	만난사람 이어주는 테이블 삭제
	//======================================================
	 public int deleteSalesTable(BusinessDTO businessDTO) {
		 int deletePersontableCnt = sqlSession.delete(
				 "com.daum.pro.BusinessDAO.deleteSalesTable" 
				 , businessDTO
		);
		 return deletePersontableCnt;
	 }
	 
	 
	//======================================================
	// 결재하기 전에 보고서 수정하는 메소드 선언
	//====================================================== 
	 public int updateReport(BusinessDTO businessDTO) {
		 int updateCnt = sqlSession.update(
				 "com.daum.pro.BusinessDAO.updateReport" 
				 , businessDTO
		);
		 return updateCnt;
	 } 
		 
	 

	 
	//======================================================
	//  결제 여부 업데이트 메소드 선언(만약 수정화면 2이고 결재하기 선택했고 수정하기 버튼 눌렀다면)
	//======================================================
	 public int updateApproval(BusinessDTO businessDTO) {
		 int updateCnt = sqlSession.update(
				 "com.daum.pro.BusinessDAO.updateApproval" 
				 , businessDTO
		);
		 return updateCnt;
	 }

	 
	 
	//======================================================
	//  결제 여부 업데이트 메소드 선언(만약 수정화면 2이고 결재하기 선택했고 수정하기 버튼 눌렀다면)
	//======================================================
	 public int updateApproval2(BusinessDTO businessDTO) {
		 int updateCnt = sqlSession.update(
				 "com.daum.pro.BusinessDAO.updateApproval2" 
				 , businessDTO
		);
		 return updateCnt;
	 }
	 
	 
	//======================================================
	// 결재 여부가 반려하기 선택됐을 때 반려사유 입력하는 메소드 선언
	//======================================================
	 public int insertSign_check(BusinessDTO businessDTO) {
		 int insertsignCnt = sqlSession.insert(
				 "com.daum.pro.BusinessDAO.insertSign_check" 
				 , businessDTO
		);
		 return insertsignCnt;
	 }
	 
	 
	 
	//======================================================
	//	sign_finish_report 삭제
	//======================================================
	 public int deletereport(BusinessDTO businessDTO) {
		 int deleteReCnt = sqlSession.delete(
				 "com.daum.pro.BusinessDAO.deletereport" 
				 , businessDTO
		);
		 return deleteReCnt;
	 }
	 
	 
	 
	//======================================================
	//	sign_finish_report 삭제
	//======================================================
	 public int deletesign(BusinessDTO businessDTO) {
		 int deleteSignCnt = sqlSession.delete(
				 "com.daum.pro.BusinessDAO.deletesign" 
				 , businessDTO
		);
		 return deleteSignCnt;
	 }

	 
	 
	//======================================================
	//	expense_report 삭제
	//======================================================
	 public int deletebusiness(BusinessDTO businessDTO) {
		 int deleteBuCnt = sqlSession.delete(
				 "com.daum.pro.BusinessDAO.deletebusiness" 
				 , businessDTO
		);
		 return deleteBuCnt;
	 }
	 
	 
	//======================================================
	// 수정사항 있는지 확인하는 메소드 선언
	//======================================================
	public int checkupdate(BusinessDTO businessDTO) {
		int businessBoardListCnt = sqlSession.selectOne(
				"com.daum.pro.BusinessDAO.checkupdate"         
				, businessDTO                                        					  
		);
		return businessBoardListCnt;	
	}
	
	
	//======================================================
	//  보고서 수정횟수 업데이트 메소드  선언(만약 수정화면 2이고 결재하기 선택했고 수정하기 버튼 눌렀다면)
	//======================================================
	 public int updateCheck(BusinessDTO businessDTO) {
		 int updateCnt = sqlSession.update(
				 "com.daum.pro.BusinessDAO.updateCheck" 
				 , businessDTO
		);
		 return updateCnt;
	 }
	 

	 
}
