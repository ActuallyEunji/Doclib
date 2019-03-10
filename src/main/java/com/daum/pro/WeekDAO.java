package com.daum.pro;

import java.util.List;
import java.util.Map;

// WeekDAO 인터페이스 선언
public interface WeekDAO {
	//검색한 게시판 목록 개수 리턴하는 메소드 선언
	int getWeekBoardListCnt(WeekListDTO weekListDTO);
	//검색한 게시판 목록 리턴하는 메소드 선언
	List<Map<String,String>> getWeekBoardList(WeekListDTO weekListDTO);
	// 주간 업무 보고서 입력 메소드 선언
	int insertWeek(WeekDTO weekDTO);
	// 업무일지 내용 입력 메소드 선언
	int insertWeekContent(WeekDTO weekDTO);
	// 이어주는 테이블 입력 메소드 선언
	int insertTable(WeekDTO weekDTO);
	// 이어주는 테이블 입력 메소드 선언
	int insertTable2(WeekDTO weekDTO);
	// 주간 업무 보고서 검색 메소드 선언
	List<Map<String,String>> getupDelweek(WeekDTO weekDTO);
	// 주간 업무일지 내용 검색 메소드 선언
	List<Map<String,String>> getupDelWeekContent(WeekDTO weekDTO);
	// 주간 업무 보고서 수정 메소드 선언 (내가 작성자일때)
	int updateReport(WeekDTO weekDTO);
	// 주간 업무 보고서 수정 메소드 선언 (내가 상사일때)
	int updateReport2(WeekDTO weekDTO);
	// 완료여부 업데이트 메소드 선언 (내가 상사일때)
	int updatefinish(WeekDTO weekDTO);
	// 주간 업무 보고서 삭제 메소드 선언
	int deletereport(WeekDTO weekDTO);
	// 주간 업무일지 내용 삭제 메소드 선언
	int deleteReportContent(WeekDTO weekDTO);
	// 이어주는 테이블 삭제 메소드 선언
	int deleteTable(WeekDTO weekDTO);
	// 지시사항 삭제 메소드 선언
	int deleteInstruction(WeekDTO weekDTO);
	// 수정사항 있는지 확인하는 메소드 선언
	int checkupdate(WeekDTO weekDTO);
	// 보고서 수정횟수 업데이트 메소드 선언
	int updateCheck(WeekDTO weekDTO);
}
