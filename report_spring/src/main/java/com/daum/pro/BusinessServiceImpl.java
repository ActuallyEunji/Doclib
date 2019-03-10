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
public class BusinessServiceImpl implements BusinessService{
	
   @Autowired
   private BusinessDAO businessDAO;

   // 검색한 게시판 목록 개수 리턴하는 메소드 선언
   public int getBusinessBoardListCnt(BusinessListDTO businessListDTO) {
		int businessBoardListCnt = this.businessDAO.getBusinessBoardListCnt(businessListDTO);
		return businessBoardListCnt;
	}
	
	// 검색한 게시판 목록 리턴하는 메소드 선언
	public List<Map<String,String>> getBusinessBoardList(BusinessListDTO businessListDTO){
		List<Map<String,String>> businessBoardList = this.businessDAO.getBusinessBoardList( businessListDTO );
		return businessBoardList;
	}
	
	// 결재내역 테이블 얻는 메소드 선언
	public List<Map<String,String>> getTableList(int emp_no){
		List<Map<String,String>> tableList = this.businessDAO.getTableList(emp_no);
		return tableList;
	}
	
	// 결재완료한 직원 검색하는 메소드 선언
	public List<Map<String,String>> getFinishEmp(BusinessDTO businessDTO){
		List<Map<String,String>> tableList = this.businessDAO.getFinishEmp(businessDTO);
		return tableList;
	}
	
	// 1개 게시판 글 입력하고 압력행의 개수 리턴하는 메소드 선언
   public int insertBusiness(BusinessDTO businessDTO) {
	   // 영업보고서 insert
	   int businessRegCnt = this.businessDAO.insertBusiness_report(businessDTO);
	   // 만난사람 insert
	   int salesPersonCnt = this.businessDAO.insertSales_person(businessDTO);
	   // 이어주는 테이블 insert 
	   int tableRegCnt = this.businessDAO.insertTable(businessDTO);
	   // sign_finish_report insert
	   int signRegCnt = this.businessDAO.insertSign_report(businessDTO);
	   return businessRegCnt + signRegCnt + salesPersonCnt + tableRegCnt  ;
   }
   
   
   // 상사의 보고서 결재상황 검색하는 메소드 선언
   public int getReport_Approval(BusinessDTO businessDTO) {
	   int business = this.businessDAO.getReport_Approval(businessDTO);
	   return business;
   }

   
	// 지출내역 검색하는 메소드 선언
	public Map<String,String> getupDelBusinessList(BusinessDTO businessDTO){
		Map<String,String> upDelBusinessList = this.businessDAO.getupDelBusinessList(businessDTO);
		return upDelBusinessList;
	}
	
	// 만난사람 검색하는 메소드 선언
	public List<Map<String,String>> getSalesPersonList(BusinessDTO businessDTO){
		List<Map<String,String>> salesList = this.businessDAO.getSalesPersonList(businessDTO);
		return salesList;
	}
   
   // 결제내역 검색하는 메소드 선언
   public List<Map<String,String>> selectApprovallist(BusinessDTO businessDTO){
		List<Map<String,String>> tableList = this.businessDAO.selectApprovallist(businessDTO);
		return tableList;
	}
   
   
   // 지출보고서 결재내역 수정한 내역 불러오는 메소드 선언// 결제내역 검색하는 메소드 선언
   public Map<String,String> updateList(BusinessDTO businessDTO){
		Map<String,String> updateList = this.businessDAO.updateList(businessDTO);
		return updateList;
	}
  
   
 	// 1개 보고서 수정하고 수정 행의 개수를 리턴하는 메소드 선언
 	public int updateReport(BusinessDTO businessDTO , int form_choice) {
 		int updateReportCnt =0;
 		// 상사의 결재상황이 미결재여서 보고서 수정하는 메소드 선언
 		int checkUpdateCnt =0;
 		if(form_choice==1) {
 			// 수정사항 있는지 확인하는 메소드 선언
 			checkUpdateCnt = checkUpdateCnt + this.businessDAO.checkupdate(businessDTO);
 			if (checkUpdateCnt == businessDTO.getRevise_cnt()) {
	 			// 만난사람 이어주는 테이블 삭제 
	 			updateReportCnt = updateReportCnt + this.businessDAO.deleteSalesTable(businessDTO);
	 			// 만난사람 삭제 메소드 
	 			updateReportCnt = updateReportCnt + this.businessDAO.deletePerson(businessDTO);
	 			// 보고서 수정 메소드 
	 			updateReportCnt = updateReportCnt+ this.businessDAO.updateReport(businessDTO);
	 			// 만난사람 입력 메소드 
	 			updateReportCnt = updateReportCnt + this.businessDAO.insertSales_person(businessDTO);
	 			// 이어주는 테이블 입력 
	 			updateReportCnt = updateReportCnt + this.businessDAO.insertTable2(businessDTO);
 			}
 			else {
 				updateReportCnt=  -2;
 			}
 		}
 		// 결재 여부 업데이트 메소드 선언
 		// 만약 수정화면 2이고 결재하기 선택했고 수정하기 버튼 눌렀다면
 		else if(form_choice==2 && businessDTO.getSign_check().equals("confirm")) {
 			checkUpdateCnt = checkUpdateCnt + this.businessDAO.checkupdate(businessDTO);
 			if (checkUpdateCnt == businessDTO.getRevise_cnt()) {
	 			// 결재 여부 업데이트 메소드 
	 			updateReportCnt = updateReportCnt+ this.businessDAO.updateApproval(businessDTO);
	 			// 보고서 수정횟수 업데이트 메소드 선언
	 			updateReportCnt = updateReportCnt+ this.businessDAO.updateCheck(businessDTO);
 			}
 			else {
 				updateReportCnt=  -2;
 			}
 		}
 		// 만약 수정화면 2이고 반려하기 선택했고 수정하기 버튼 눌렀다면
 		else if(form_choice==2 && businessDTO.getSign_check().equals("no_confirm")) {
 			checkUpdateCnt = checkUpdateCnt + this.businessDAO.checkupdate(businessDTO);
 			if (checkUpdateCnt == businessDTO.getRevise_cnt()) {
	 			// 결재여부 업데이트 메소드 
	 			updateReportCnt = updateReportCnt + this.businessDAO.updateApproval2(businessDTO);
	 			// 반려사유 입력 메소드 
	 			updateReportCnt = updateReportCnt + this.businessDAO.insertSign_check(businessDTO);
	 			// 보고서 수정횟수 업데이트 메소드 선언
	 			updateReportCnt = updateReportCnt+ this.businessDAO.updateCheck(businessDTO);
 			}
 			else {
 				updateReportCnt=  -2;
 			}
 		}
 		// 만약 수정화면 4이고 수정하기 버튼 눌렀다면 
 		else if(form_choice == 4 && businessDTO.getSign_check().equals("confirm")) {
 			checkUpdateCnt = checkUpdateCnt + this.businessDAO.checkupdate(businessDTO);
 			if (checkUpdateCnt == businessDTO.getRevise_cnt()) {
	 			// 만난사람 이어주는 테이블 삭제 
	 			updateReportCnt = updateReportCnt + this.businessDAO.deleteSalesTable(businessDTO);
	 			// 만난사람 삭제 메소드 
	 			updateReportCnt = updateReportCnt + this.businessDAO.deletePerson(businessDTO);
	 			// 보고서 수정 메소드 선언
	 			updateReportCnt = updateReportCnt +this.businessDAO.updateReport(businessDTO);
	 			// sign_finish_report 입력 메소드 선언
	 			updateReportCnt = updateReportCnt + this.businessDAO.insertSign_report2(businessDTO);
	 			// 만난사람 입력 메소드 
	 			updateReportCnt = updateReportCnt + this.businessDAO.insertSales_person(businessDTO);
	 			// 이어주는 테이블 입력 
	 			updateReportCnt = updateReportCnt + this.businessDAO.insertTable2(businessDTO);
 			}
 			else {
 				updateReportCnt=  -2;
 			}
 		}
 		return updateReportCnt ;
 		
 	}
 		
 	
 	// 1개 보고서 삭제하고 삭제 행의 개수를 리턴하는 메소드 선언
 	public int deleteReport(BusinessDTO businessDTO) {
 		// return_report 삭제
 		int deleteReportCnt = this.businessDAO.deletereport(businessDTO);
 		// sign_finish_report 삭제
 		deleteReportCnt =deleteReportCnt+ this.businessDAO.deletesign(businessDTO);
 		// 만난사람 이어주는 테이블 삭제 
 		deleteReportCnt = deleteReportCnt + this.businessDAO.deleteSalesTable(businessDTO);
 		//	business_report 삭제
 		deleteReportCnt = deleteReportCnt + this.businessDAO.deletebusiness(businessDTO);
 		// 만난 사람 삭제 
 		deleteReportCnt = deleteReportCnt + this.businessDAO.deletePerson(businessDTO);
 		return deleteReportCnt;
 	}

   
}