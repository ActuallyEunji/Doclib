package com.daum.pro;

import java.util.List;
import java.util.Map;

// BoardDAO 인터페이스 선언
public interface DailyDAO {
	//검색한 게시판 목록 개수 리턴하는 메소드 선언
	int getDailyBoardListCnt(DailyListDTO dailyListDTO);
	//검색한 게시판 목록 리턴하는 메소드 선언
	List<Map<String,String>> getDailyBoardList(DailyListDTO dailyListDTO);
	// 이어주는 테이블 입력하는 메소드 선언
	int insertDaily(DailyDTO dailyDTO);
	// 업무보고서 내역 검색하는 메소드 선언
	Map<String,String> getupDeldaily(DailyDTO dailyDTO);
	// 내가 보고서 쓴 사람일때 수정하는 메소드 선언
	int updateReport1(DailyDTO dailyDTO);
	// 상사가 보고서 수정하는 메소드 선언
	int updateReport2(DailyDTO dailyDTO);
	// 지시사항 입력 메소드 선언
	int insertInstruction(DailyDTO dailyDTO);
	//	업무보고서 삭제
	int deletereport(DailyDTO dailyDTO);
	// 지시사항 삭제
	int deleteInstruction(DailyDTO dailyDTO);
	// 수정사항 있는지 확인하는 메소드 선언
	int checkupdate(DailyDTO dailyDTO);
}
