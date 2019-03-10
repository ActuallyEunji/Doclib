package com.daum.pro;
import java.util.List;
import java.util.Map;

import com.daum.pro.*;

// BoardService 인터페이스 선언
public interface WeekService {
	//검색한 게시판 목록 개수 리턴하는 메소드 선언
	int getWeekBoardListCnt(WeekListDTO weekListDTO);
	//검색한 게시판 목록 리턴하는 메소드 선언
	List<Map<String,String>> getWeekBoardList(WeekListDTO weekListDTO);
	// 1개 보고서 글 입력하고 입력행의 개수 리턴하는 메소드 선언
	int insertWeek(WeekDTO weekDTO);
	// 업무보고서 검색하는 메소드 선언
	List<Map<String,String>> getupDelweek(WeekDTO weekDTO);
	// 업무내용 검색하는 메소드 선언
	List<Map<String,String>> getupDelWeekContent(WeekDTO weekDTO);
	// 1개 보고서 글 수정하고 수정행의 개수 리턴하는 메소드 선언
	int updateReport(WeekDTO weekDTO , int form_choice);
	// 1개 보고서 글 삭제하고 삭제행의 개수 리턴하는 메소드 선언
	int deleteReport(WeekDTO weekDTO);
}
