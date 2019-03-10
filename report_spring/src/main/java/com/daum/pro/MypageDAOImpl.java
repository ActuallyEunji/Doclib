package com.daum.pro;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;



@Repository
public class MypageDAOImpl implements MypageDAO {
	//======================================================
	// 속성변수 boardDAO 선언하고 BoardDAO 인터페이스를 구현받은 BoardDAOImpl객체를 생성해 저장
	//======================================================
		// @Autowired 의 역할 => 속성변수에 붙은 자료형인 인터페이스를 구현한 클래스를 객체화하여 저장한다.
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	//======================================================
	// 미결재한 보고서 목록개수 불러오는 메소드 선언
	//======================================================
	public int getNoApprovalListCnt(MypageListDTO mypageListDTO) {
		int getNoApprovalListCnt = sqlSession.selectOne(
				"com.daum.pro.MypageDAO.getNoApprovalListCnt"         
				, mypageListDTO                                        					  
		);
		return getNoApprovalListCnt;	
	}
	
	//======================================================
	// 반려된 보고서 목록개수 불러오는 메소드 선언
	//======================================================
	public int getRefuseListCnt(MypageListDTO mypageListDTO) {
		int getNoApprovalListCnt = sqlSession.selectOne(
				"com.daum.pro.MypageDAO.getRefuseListCnt"         
				, mypageListDTO                                        					  
		);
		return getNoApprovalListCnt;	
	}
	
	//======================================================
	// 결재종료된 보고서 목록개수 불러오는 메소드 선언
	//======================================================
	public int getFinishListCnt(MypageListDTO mypageListDTO) {
		int getFinishListCnt = sqlSession.selectOne(
				"com.daum.pro.MypageDAO.getFinishListCnt"         
				, mypageListDTO                                        					  
		);
		return getFinishListCnt;	
	}
	
	//======================================================
	// 미완료된 업무보고서 목록개수 불러오는 메소드 선언
	//======================================================
	public int getUnFinishListCnt(MypageListDTO mypageListDTO) {
		int getFinishListCnt = sqlSession.selectOne(
				"com.daum.pro.MypageDAO.getUnFinishListCnt"         
				, mypageListDTO                                        					  
		);
		return getFinishListCnt;	
	}
		
		
	//======================================================
	// 미결재한 보고서 목록 불러오는 메소드 선언
	//======================================================
	public List<Map<String,String>> getNotApprovalList(MypageListDTO mypageListDTO){
		System.out.println("rrrrrr");
		 List<Map<String,String>> getNotApprovalList = sqlSession.selectList(
				 "com.daum.pro.MypageDAO.getNotApprovalList"             
				 , mypageListDTO                                       					  
			);
		 return getNotApprovalList;
	}
	
	//======================================================
	// 반려된 보고서 목록 불러오는 메소드 선언
	//======================================================
	public List<Map<String,String>> getRefuseList(MypageListDTO mypageListDTO){
		System.out.println("ㅁㅁㅁㅁㅁ");
		 List<Map<String,String>> getRefuseList = sqlSession.selectList(
				 "com.daum.pro.MypageDAO.getRefuseList"             
				 , mypageListDTO                                       					  
			);
		 return getRefuseList;
	}
	
	//======================================================
	// 결재종료된 보고서 목록 불러오는 메소드 선언
	//======================================================
	public List<Map<String,String>> getFinishList(MypageListDTO mypageListDTO){
		 List<Map<String,String>> getFinishList = sqlSession.selectList(
				 "com.daum.pro.MypageDAO.getFinishList"             
				 , mypageListDTO                                       					  
			);
		 return getFinishList;
	}
	
	//======================================================
	// 미완료된 업무 보고서 목록 불러오는 메소드 선언
	//======================================================
	public List<Map<String,String>> getUnFinishList(MypageListDTO mypageListDTO){
		System.out.println(11111);
		 List<Map<String,String>> getFinishList = sqlSession.selectList(
				 "com.daum.pro.MypageDAO.getUnFinishList"             
				 , mypageListDTO                                       					  
			);
		 System.out.println(22222);
		 return getFinishList;
	}
	
	//======================================================
	// 미완료된 업무 보고서비율 불러오는 메소드 선언
	//======================================================
	public int getUnfinishListPer(MypageListDTO mypageListDTO){
		int getunFinishListper = sqlSession.selectOne(
				 "com.daum.pro.MypageDAO.getUnfinishListPer"             
				 , mypageListDTO                                       					  
		);
		 return getunFinishListper;
	}
	
	//======================================================
	// 미완료된 일일업무 보고서 비율 불러오는 메소드 선언
	//======================================================
	public int getUnfinishDailyListPer(MypageListDTO mypageListDTO){
		int getUnfinishDailyListPer = sqlSession.selectOne(
				 "com.daum.pro.MypageDAO.getUnfinishDailyListPer"             
				 , mypageListDTO                                       					  
		);
		 return getUnfinishDailyListPer;
	}
	
	//======================================================
	// 미완료된 주간업무 보고서 비율 불러오는 메소드 선언
	//======================================================
	public int getUnfinishWeekListPer(MypageListDTO mypageListDTO){
		int getUnfinishWeekListPer = sqlSession.selectOne(
				 "com.daum.pro.MypageDAO.getUnfinishWeekListPer"             
				 , mypageListDTO                                       					  
		);
		 return getUnfinishWeekListPer;
	}


	
	//======================================================
	// 내 정보 불러오는 메소드 선언
	//======================================================
	public Map<String,String> getMyPage(MyPageDTO myPageDTO){
		 Map<String,String> getMyPage = sqlSession.selectOne(
				 "com.daum.pro.MypageDAO.getMyPage"             
				 , myPageDTO                                       					  
		);
		 return getMyPage;
	}	
	
	
	//======================================================
	// 회사 보고서 종류 불러오는 메소드 선언
	//======================================================
	public List<Map<String,String>> getReports(MyPageDTO myPageDTO){
		 List<Map<String,String>> getReports = sqlSession.selectList(
				 "com.daum.pro.MypageDAO.getReports"             
				 , myPageDTO                                       					  
		);
		 return getReports;
	}
	
	
	//======================================================
	// 내 정보 수정하고 완료행 갯수 리턴하는 메소드 선언
	//======================================================
	public int updateMyPage(MyPageDTO myPageDTO){
		System.out.println(8888);
		int getMyPage = sqlSession.update(
				 "com.daum.pro.MypageDAO.updateMyPage"             
				 , myPageDTO                                       					  
		);
		System.out.println(9999);
		 return getMyPage;
	}	
	 

	//======================================================
	// 이어주는 테이블 삭제하는 메소드 선언
	//======================================================
	public int deleteTable(MyPageDTO myPageDTO){
		int getMyPage = sqlSession.delete(
				 "com.daum.pro.MypageDAO.deleteTable"             
				 , myPageDTO                                       					  
		);
		 return getMyPage;
	}
	
	
	//======================================================
	// 보고서 종류 입력하는 메소드 선언
	//======================================================
	public int insertMyReport(MyPageDTO myPageDTO){
		System.out.println(5555);
		int getMyPage = sqlSession.insert(
				 "com.daum.pro.MypageDAO.insertMyReport"             
				 , myPageDTO                                       					  
		);
		 return getMyPage;
	}			
	
}
