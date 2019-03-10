package com.daum.pro;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;



@Repository
public class DailyDAOImpl implements DailyDAO {
	//======================================================
	// 속성변수 boardDAO 선언하고 BoardDAO 인터페이스를 구현받은 BoardDAOImpl객체를 생성해 저장
	//======================================================
		// @Autowired 의 역할 => 속성변수에 붙은 자료형인 인터페이스를 구현한 클래스를 객체화하여 저장한다.
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	//======================================================
	// 검색한 게시판 목록 개수 리턴하는 메소드 선언
	//======================================================
	public int getDailyBoardListCnt( DailyListDTO dailyListDTO ) {
		int dailyBoardListCnt = sqlSession.selectOne(
				"com.daum.pro.DailyDAO.getDailyBoardListCnt"         // 실행할 SQL 구문의 위치 지정   // 패키지명 처럼 보이지만 BoardDAO라는 패키지명이 없다 근데 그게 어디있냐면  root-context.xml 파일에
				, dailyListDTO                                        					  // 실행할 SQL 구문에서 사용할 데이터 설정    //파라미터값을 DTO객체로 넘겨줌
		);
		return dailyBoardListCnt;	
	}
		
		
	//======================================================
	// 검색한 게시판 목록 리턴하는 메소드 선언
	//======================================================
	public List<Map<String,String>> getDailyBoardList(DailyListDTO dailyListDTO){
		 List<Map<String,String>> businessBoardList = sqlSession.selectList(
				 "com.daum.pro.DailyDAO.getDailyBoardList"            
				 , dailyListDTO                                       					  
			);
		 return businessBoardList;
	}

	
	//======================================================
	// 일일 업무보고서 입력하는 메소드 선언
	//======================================================
	 public int insertDaily(DailyDTO dailyDTO) {
		 System.out.println(1111);
		 int businessRegCnt = sqlSession.insert(
				 "com.daum.pro.DailyDAO.insertDaily" 
				 , dailyDTO
		);
		 System.out.println(2222);
		 return businessRegCnt;
	 }
 
	 
	//======================================================
	// 일일 업무보고서 내역 검색하는 메소드 선언
	//======================================================
	 public Map<String,String> getupDeldaily(DailyDTO dailyDTO) {
		 Map<String,String> selectApprovalCnt = sqlSession.selectOne(
				 "com.daum.pro.DailyDAO.getupDeldaily" 
				 , dailyDTO 
		);
		 return selectApprovalCnt;
	 }	 

	 
	//======================================================
	//  내가 보고서 쓴 사람일때 수정하는 메소드 선언
	//======================================================
	 public int updateReport1(DailyDTO dailyDTO) {
		 int updateCnt = sqlSession.update(
				 "com.daum.pro.DailyDAO.updateReport1" 
				 , dailyDTO
		);
		 return updateCnt;
	 }

	 
	 
	//======================================================
	// 상사가 보고서 수정하는 메소드 선언
	//======================================================
	 public int updateReport2(DailyDTO dailyDTO) {
		 int updateCnt = sqlSession.update(
				 "com.daum.pro.DailyDAO.updateReport2" 
				 , dailyDTO
		);
		 return updateCnt;
	 }
	 
	 
	//======================================================
	// 지시사항 입력하는 메소드 선언
	//======================================================
	 public int insertInstruction(DailyDTO dailyDTO) {
		 int insertCnt = sqlSession.insert(
				 "com.daum.pro.DailyDAO.insertInstruction" 
				 , dailyDTO
		);
		 return insertCnt;
	 }	 
	
	 
	//======================================================
	//	업무보고서 삭제
	//======================================================
	 public int deletereport(DailyDTO dailyDTO) {
		 int deleteBuCnt = sqlSession.delete(
				 "com.daum.pro.DailyDAO.deletereport" 
				 , dailyDTO
		);
		 return deleteBuCnt;
	 }
	 
	 
	//======================================================
	//	지시사항 삭제
	//======================================================
	 public int deleteInstruction(DailyDTO dailyDTO) {
		 int deleteBuCnt = sqlSession.delete(
				 "com.daum.pro.DailyDAO.deleteInstruction" 
				 , dailyDTO
		);
		 return deleteBuCnt;
	 }
	 
	 
	//======================================================
	// 일일 업무보고서 내역 검색하는 메소드 선언
	//======================================================
	 public int checkupdate(DailyDTO dailyDTO) {
		 int selectApprovalCnt = sqlSession.selectOne(
				 "com.daum.pro.DailyDAO.checkupdate" 
				 , dailyDTO 
		);
		 return selectApprovalCnt;
	 }	
	 
}
