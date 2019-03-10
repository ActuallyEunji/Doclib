package com.daum.pro;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;



@Repository
public class WeekDAOImpl implements WeekDAO {
	//======================================================
	// 속성변수 boardDAO 선언하고 BoardDAO 인터페이스를 구현받은 BoardDAOImpl객체를 생성해 저장
	//======================================================
		// @Autowired 의 역할 => 속성변수에 붙은 자료형인 인터페이스를 구현한 클래스를 객체화하여 저장한다.
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	//======================================================
	// 검색한 게시판 목록 개수 리턴하는 메소드 선언
	//======================================================
	public int getWeekBoardListCnt( WeekListDTO weekListDTO ) {
		int weekBoardListCnt = sqlSession.selectOne(
				"com.daum.pro.WeekDAO.getWeekBoardListCnt"         // 실행할 SQL 구문의 위치 지정   // 패키지명 처럼 보이지만 BoardDAO라는 패키지명이 없다 근데 그게 어디있냐면  root-context.xml 파일에
				, weekListDTO                                        					  // 실행할 SQL 구문에서 사용할 데이터 설정    //파라미터값을 DTO객체로 넘겨줌
		);
		return weekBoardListCnt;	
	}
		
		
	//======================================================
	// 검색한 게시판 목록 리턴하는 메소드 선언
	//======================================================
	public List<Map<String,String>> getWeekBoardList( WeekListDTO weekListDTO ){
		 List<Map<String,String>> businessBoardList = sqlSession.selectList(
				 "com.daum.pro.WeekDAO.getWeekBoardList"            
				 , weekListDTO                                       					  
			);
		 return businessBoardList;
	}

	
	//======================================================
	// 주간 업무 보고서 입력 메소드 선언
	//======================================================
	 public int insertWeek(WeekDTO weekDTO) {
		 int businessRegCnt = sqlSession.insert(
				 "com.daum.pro.WeekDAO.insertWeek" 
				 , weekDTO
		);
		 return businessRegCnt;
	 }
	 
	 
	//======================================================
	// 업무일지 내용 입력 메소드 선언
	//======================================================
	 public int insertWeekContent(WeekDTO weekDTO) {
		 int contentRegCnt = sqlSession.insert(
				 "com.daum.pro.WeekDAO.insertWeekContent" 
				 , weekDTO
		);
		 return contentRegCnt;
	 }

	 
	//======================================================
	// 이어주는 테이블 입력 메소드 선언
	//======================================================
	 public int insertTable(WeekDTO weekDTO) {
		 int contentRegCnt = sqlSession.insert(
				 "com.daum.pro.WeekDAO.insertTable" 
				 , weekDTO
		);
		 return contentRegCnt;
	 }	 
	 
	 
	//======================================================
	// 이어주는 테이블2 입력 메소드 선언
	//======================================================
	 public int insertTable2(WeekDTO weekDTO) {
		 int contentRegCnt = sqlSession.insert(
				 "com.daum.pro.WeekDAO.insertTable2" 
				 , weekDTO
		);
		 return contentRegCnt;
	 }	 
 
	 
	//======================================================
	// 주간 업무 보고서 검색 메소드 선언
	//======================================================
	 public List<Map<String,String>> getupDelweek(WeekDTO weekDTO) {
		 List<Map<String,String>> selectReportCnt = sqlSession.selectList(
				 "com.daum.pro.WeekDAO.getupDelweek" 
				 , weekDTO 
		);
		 return selectReportCnt;
	 }	 
	 
	 
	//======================================================
	// 주간 업무일지 내용 검색 메소드 선언
	//======================================================
	 public List<Map<String,String>> getupDelWeekContent(WeekDTO weekDTO) {
		 List<Map<String,String>> selectReportCnt = sqlSession.selectList(
				 "com.daum.pro.WeekDAO.getupDelWeekContent" 
				 , weekDTO 
		);
		 return selectReportCnt;
	 }	 

	 
	//======================================================
	// 주간 업무 보고서 수정 메소드 선언 (내가 작성자일때)
	//======================================================
	 public int updateReport(WeekDTO weekDTO) {
		 int updateCnt = sqlSession.update(
				 "com.daum.pro.WeekDAO.updateReport" 
				 , weekDTO
		);
		 return updateCnt;
	 }
	 
	 
	 
	//======================================================
	// 주간 업무 보고서 수정 메소드 선언 (내가 상사일때)
	//======================================================
	 public int updateReport2(WeekDTO weekDTO) {
		 int updateCnt = sqlSession.update(
				 "com.daum.pro.WeekDAO.updateReport2" 
				 , weekDTO
		);
		 return updateCnt;
	 }
	 
	 
	//======================================================
	// 완료여부 업데이트 메소드 선언 (내가 상사일때)
	//======================================================
	 public int updatefinish(WeekDTO weekDTO) {
	       
	      HashMap<String, String> content;

	      int updateCnt=0;

	      for(int i=0; i<weekDTO.weekList.size(); i++){
	         content = new HashMap<String, String>();
	         content.put("completion",( weekDTO.getWeekList().get(i).getCompletion()==null)?"0":"1");
	         content.put("c_no", weekDTO.getWeekList().get(i).getC_no());
	         updateCnt = updateCnt + sqlSession.update("com.daum.pro.WeekDAO.updatefinish" , content);
	      }
	       return updateCnt; 
	    }
	 
	//======================================================
	// 이어주는 테이블 삭제 메소드 선언
	//======================================================
	 public int deleteTable(WeekDTO weekDTO) {
		 int deleteBuCnt = sqlSession.delete(
				 "com.daum.pro.WeekDAO.deleteTable" 
				 , weekDTO
		);
		 return deleteBuCnt;
	 }
	 
	 
	//======================================================
	// 주간 업무일지 내용 삭제 메소드 선언
	//======================================================
	 public int deleteReportContent(WeekDTO weekDTO) {
		 int deleteBuCnt = sqlSession.delete(
				 "com.daum.pro.WeekDAO.deleteReportContent" 
				 , weekDTO
		);
		 return deleteBuCnt;
	 }	 
		 
		 
	//======================================================
	// 주간 업무 보고서 삭제 메소드 선언
	//======================================================
	 public int deletereport(WeekDTO weekDTO) {
		 int deleteBuCnt = sqlSession.delete(
				 "com.daum.pro.WeekDAO.deletereport" 
				 , weekDTO
		);
		 return deleteBuCnt;
	 }
	 

	//======================================================
	// 지시사항 삭제 메소드 선언
	//======================================================
	 public int deleteInstruction(WeekDTO weekDTO) {
		 int deleteBuCnt = sqlSession.delete(
				 "com.daum.pro.WeekDAO.deleteInstruction" 
				 , weekDTO
		);
		 return deleteBuCnt;
	 }
	 
	 
	//======================================================
	//수정사항 있는지 확인하는 메소드 선언 
	//======================================================
	public int checkupdate( WeekDTO weekDTO ) {
		int weekBoardListCnt = sqlSession.selectOne(
				"com.daum.pro.WeekDAO.checkupdate"         
				, weekDTO                                        					 
		);
		return weekBoardListCnt;	
	}
	
	
	//======================================================
	// 보고서 수정횟수 업데이트 메소드 선언 (내가 상사일때)
	//======================================================
	 public int updateCheck(WeekDTO weekDTO) {
		 int updateCnt = sqlSession.update(
				 "com.daum.pro.WeekDAO.updateCheck" 
				 , weekDTO
		);
		 return updateCnt;
	 }

	 
}
