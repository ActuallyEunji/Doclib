package com.daum.pro;


import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.context.annotation.SessionScope;


@Service
@Transactional
public class WeekServiceImpl implements WeekService{
	
   @Autowired
   private WeekDAO weekDAO;

   // 검색한 게시판 목록 개수 리턴하는 메소드 선언
   public int getWeekBoardListCnt(WeekListDTO weekListDTO) {
		int businessBoardListCnt = this.weekDAO.getWeekBoardListCnt(weekListDTO);
		return businessBoardListCnt;
	}
	
	// 검색한 게시판 목록 리턴하는 메소드 선언
	public List<Map<String,String>> getWeekBoardList(WeekListDTO weekListDTO){
		List<Map<String,String>> businessBoardList = this.weekDAO.getWeekBoardList( weekListDTO );
		return businessBoardList;
	}
	
	// 1개 주간 업무보고서 글 입력하고 압력행의 개수 리턴하는 메소드 선언
   public int insertWeek(WeekDTO weekDTO) {
	   // 주간 업무 보고서 입력 메소드 선언
	   int businessRegCnt = this.weekDAO.insertWeek(weekDTO);
	   // 업무일지 내용 입력 메소드 선언
	   businessRegCnt = businessRegCnt + this.weekDAO.insertWeekContent(weekDTO);
	   // 이어주는 테이블 입력 메소드 선언
	   businessRegCnt = businessRegCnt + this.weekDAO.insertTable(weekDTO);
	   return businessRegCnt;
   }
   
   // 선택한 업무보고서 검색하는 메소드 선언
   public List<Map<String,String>> getupDelweek(WeekDTO weekDTO) {
	   // 주간 업무 보고서 검색 메소드 선언
	   List<Map<String,String>> selectReCnt = this.weekDAO.getupDelweek(weekDTO);
	   return selectReCnt;
   }
   
   // 선택한 업무내용 검색하는 메소드 선언
   public List<Map<String,String>> getupDelWeekContent(WeekDTO weekDTO) {
	   // 주간 업무일지 내용 검색 메소드 선언
	   List<Map<String,String>> selectReCnt = this.weekDAO.getupDelWeekContent(weekDTO);
	   return selectReCnt;
   }
   
 	// 1개 보고서 수정하고 수정 행의 개수를 리턴하는 메소드 선언
 	public int updateReport(WeekDTO weekDTO , int form_choice) {
 		int updateReportCnt =0;
 		int checkUpdateCnt =0;
 		
 		// 로그인한 사람과 글을 쓴 사람이 같은 사람이면 
 		if( form_choice == 1 ) {
 			// 수정사항 있는지 확인하는 메소드 선언
 			checkUpdateCnt = checkUpdateCnt + this.weekDAO.checkupdate(weekDTO);	
 			if(checkUpdateCnt==weekDTO.getRevise_cnt()) {
	 			// 보고서 전체 수정메소드 선언
	 			updateReportCnt = updateReportCnt + this.weekDAO.updateReport(weekDTO);
	 			// 이어주는 테이블 삭제 메소드 선언
	 			updateReportCnt = updateReportCnt + this.weekDAO.deleteTable(weekDTO);
	 			// 보고서 업무일지 삭제 메소드 선언(행삭제)
	 			updateReportCnt = updateReportCnt + this.weekDAO.deleteReportContent(weekDTO);
	 			// 보고서 업무일지 입력 메소드 선언(행입력)
	 			updateReportCnt = updateReportCnt + this.weekDAO.insertWeekContent(weekDTO);
	 			// 이어주는 테이블 입력 메소드 선언
	 			updateReportCnt = updateReportCnt + this.weekDAO.insertTable2(weekDTO);
 			}
 			else {
 				updateReportCnt = -2;
 			}
 		}
 		// 다르면 (상사가 보는 화면이면)
 		else {
 			// 수정사항 있는지 확인하는 메소드 선언
 			checkUpdateCnt = checkUpdateCnt + this.weekDAO.checkupdate(weekDTO);	
 			if(checkUpdateCnt==weekDTO.getRevise_cnt()) {
	 			// 주간 업무 보고서 수정 메소드 선언 (내가 상사일때)
	 			updateReportCnt = this.weekDAO.updateReport2(weekDTO);
	 			// 주간 업무 보고서 수정 메소드 선언 (내가 상사일때 완료여부 업데이트)
	 			updateReportCnt = updateReportCnt + this.weekDAO.updatefinish(weekDTO);
	 			// 보고서 수정횟수 업데이트 메소드 선언
	 			updateReportCnt = updateReportCnt+ this.weekDAO.updateCheck(weekDTO);
 			}
 			else {
 				updateReportCnt = -2;
 			}
 		}
 		return updateReportCnt ;
 	}
 		
 	
 	// 1개 보고서 삭제하고 삭제 행의 개수를 리턴하는 메소드 선언
 	public int deleteReport(WeekDTO weekDTO) {
 		// 이어주는 테이블 삭제 메소드 선언
 		int deleteTableCnt = this.weekDAO.deleteTable(weekDTO);
 		// 주간 업무일지 내용 삭제 메소드 선언
 		int deleteContentCnt = this.weekDAO.deleteReportContent(weekDTO);
 		// 주간 업무 보고서 삭제 메소드 선언
 		int deleteReportCnt = this.weekDAO.deletereport(weekDTO);
 		// 지시사항 삭제 메소드 선언
 		int deleteInstructionCnt = this.weekDAO.deleteInstruction(weekDTO);
 		return deleteTableCnt + deleteContentCnt + deleteReportCnt + deleteInstructionCnt;
 	}

   
}