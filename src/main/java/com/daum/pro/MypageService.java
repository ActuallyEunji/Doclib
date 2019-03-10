package com.daum.pro;
import java.util.List;
import java.util.Map;

import com.daum.pro.*;

// BoardService 인터페이스 선언
public interface MypageService {
	// 미결재한 보고서 목록개수 불러오는 메소드 선언
	int getNoApprovalListCnt(MypageListDTO mypageListDTO);
	// 반려된 보고서 목록개수 불러오는 메소드 선언
	int getRefuseListCnt(MypageListDTO mypageListDTO);
	// 결재종료된 보고서 목록개수 불러오는 메소드 선언
	int getFinishListCnt(MypageListDTO mypageListDTO);
	// 미완료된 업무보고서 목록개수 불러오는 메소드 선언
	int getUnFinishListCnt(MypageListDTO mypageListDTO);
	// 미결재한 보고서 목록 불러오는 메소드 선언
	List<Map<String,String>> getNotApprovalList(MypageListDTO mypageListDTO);
	// 반려된 보고서 목록 불러오는 메소드 선언
	List<Map<String,String>> getRefuseList(MypageListDTO mypageListDTO);	
	// 결재종료된 보고서 목록 불러오는 메소드 선언
	List<Map<String,String>> getFinishList(MypageListDTO mypageListDTO);	
	// 미완료된 업무 보고서 목록 불러오는 메소드 선언
	List<Map<String,String>> getUnFinishList(MypageListDTO mypageListDTO);
	// 미완료된 업무 보고서 목록비율 불러오는 메소드 선언
	int getUnfinishListPer(MypageListDTO mypageListDTO);
	// 미완료된 일일업무 보고서 비율 불러오는 메소드 선언
	int getUnfinishDailyListPer(MypageListDTO mypageListDTO);
	// 미완료된 주간업무 보고서 비율 불러오는 메소드 선언
	int getUnfinishWeekListPer(MypageListDTO mypageListDTO);
	// [수정/삭제할 내정보] 데이터 얻는 메소드 선언
	Map<String,String> getMyPage(MyPageDTO myPageDTO);
	// [수정/삭제할 회사 보고서 종류] 데이터 얻기
	List<Map<String,String>> getReports(MyPageDTO myPageDTO);
	// 내 정보 업데이트하고 성공개수 리턴하는 메소드 선언
	int updateMyPage(MyPageDTO myPageDTO);
	// 내 회사 보고서 종류 업데이트하고 성공개수 리턴하는 메소드 선언
	int updateMyCompany(MyPageDTO myPageDTO);
}
