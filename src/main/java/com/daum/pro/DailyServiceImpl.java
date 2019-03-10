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
public class DailyServiceImpl implements DailyService{
	
   @Autowired
   private DailyDAO dailyDAO;

   // 검색한 게시판 목록 개수 리턴하는 메소드 선언
   public int getDailyBoardListCnt(DailyListDTO dailyListDTO) {
		int businessBoardListCnt = this.dailyDAO.getDailyBoardListCnt(dailyListDTO);
		return businessBoardListCnt;
	}
	
	// 검색한 게시판 목록 리턴하는 메소드 선언
	public List<Map<String,String>> getDailyBoardList(DailyListDTO dailyListDTO){
		List<Map<String,String>> businessBoardList = this.dailyDAO.getDailyBoardList( dailyListDTO );
		return businessBoardList;
	}
	
	// 1개 업무보고서 글 입력하고 압력행의 개수 리턴하는 메소드 선언
   public int insertDaily(DailyDTO dailyDTO) {
	   int businessRegCnt = this.dailyDAO.insertDaily(dailyDTO);
	   return businessRegCnt;
   }
   
   // 선택한 업무보고서 내역 검색하는 메소드 선언
   public Map<String,String> getupDeldaily(DailyDTO dailyDTO) {
	   Map<String,String> selectReCnt = this.dailyDAO.getupDeldaily(dailyDTO);
	   return selectReCnt;
   }
   
 	// 1개 보고서 수정하고 수정 행의 개수를 리턴하는 메소드 선언
 	public int updateReport(DailyDTO dailyDTO , int form_choice) {
 		int updateReportCnt =0;
 		int checkUpdateCnt =0;
 		
 		// 로그인한 사람과 글을 쓴 사람이 같은 사람이면 
 		if( form_choice == 1 ) {
 			// 수정사항 있는지 확인하는 메소드 선언
 			checkUpdateCnt = checkUpdateCnt + this.dailyDAO.checkupdate(dailyDTO);	
 			if(checkUpdateCnt==dailyDTO.getRevise_cnt()) {
 				updateReportCnt = this.dailyDAO.updateReport1(dailyDTO);
 			}
 			else {
 				updateReportCnt = -2;
 			}
 		}
 		// 다르면 (상사가 보는 화면이면)
 		else {
 			// 수정사항 있는지 확인하는 메소드 선언
 			checkUpdateCnt = checkUpdateCnt + this.dailyDAO.checkupdate(dailyDTO);	
 			if(checkUpdateCnt==dailyDTO.getRevise_cnt()) {
	 			updateReportCnt = this.dailyDAO.updateReport2(dailyDTO);
	 			updateReportCnt = updateReportCnt + this.dailyDAO.insertInstruction(dailyDTO);
 			}
 			else {
 				updateReportCnt = -2;
 			}
 		}
 		
 		return updateReportCnt ;
 	}
 		
 	
 	// 1개 보고서 삭제하고 삭제 행의 개수를 리턴하는 메소드 선언
 	public int deleteReport(DailyDTO dailyDTO) {
 		// 지시사항 삭제
 		int deleteReportCnt = this.dailyDAO.deleteInstruction(dailyDTO);
 		// 업무보고서 삭제
 		deleteReportCnt = deleteReportCnt + this.dailyDAO.deletereport(dailyDTO);
 		return deleteReportCnt;
 	}

   
}