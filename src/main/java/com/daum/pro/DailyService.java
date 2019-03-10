package com.daum.pro;
import java.util.List;
import java.util.Map;

import com.daum.pro.*;

// BoardService 인터페이스 선언
public interface DailyService {
	//검색한 게시판 목록 개수 리턴하는 메소드 선언
	int getDailyBoardListCnt(DailyListDTO dailyListDTO);
	//검색한 게시판 목록 리턴하는 메소드 선언
	List<Map<String,String>> getDailyBoardList(DailyListDTO dailyListDTO);
	// 1개 보고서 글 입력하고 입력행의 개수 리턴하는 메소드 선언
	int insertDaily(DailyDTO dailyDTO);
	// 업무내역 검색하는 메소드 선언
	Map<String,String> getupDeldaily(DailyDTO dailyDTO);
	// 1개 보고서 글 수정하고 수정행의 개수 리턴하는 메소드 선언
	int updateReport(DailyDTO dailyDTO , int form_choice);
	// 1개 보고서 글 삭제하고 삭제행의 개수 리턴하는 메소드 선언
	int deleteReport(DailyDTO dailyDTO);
}
