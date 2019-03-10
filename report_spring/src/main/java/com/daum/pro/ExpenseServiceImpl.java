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
public class ExpenseServiceImpl implements ExpenseService{
	
   @Autowired
   private ExpenseDAO expenseDAO;

   // 검색한 게시판 목록 개수 리턴하는 메소드 선언
   public int getExpenseBoardListCnt(ExpenseListDTO expenseListDTO) {
		int expenseboardListAllCnt = this.expenseDAO.getExpenseBoardListCnt(expenseListDTO);
		return expenseboardListAllCnt;
	}
	
	// 검색한 게시판 목록 리턴하는 메소드 선언
	public List<Map<String,String>> getExpenseBoardList(ExpenseListDTO expenseListDTO){
		List<Map<String,String>> expenseboardList = this.expenseDAO.getExpenseBoardList( expenseListDTO );
		return expenseboardList;
	}
	
	// 지출내역 검색하는 메소드 선언
	public Map<String,String> getupDelExpenseList(ExpenseDTO expenseDTO){
		Map<String,String> upDelExpenseList = this.expenseDAO.getupDelExpenseList(expenseDTO);
		return upDelExpenseList;
	}
	
	// 결재내역 테이블 얻는 메소드 선언
	public List<Map<String,String>> getTableList(int emp_no){
		List<Map<String,String>> tableList = this.expenseDAO.getTableList(emp_no);
		return tableList;
	}
	
	// 1개 게시판 글 입력하고 압력행의 개수 리턴하는 메소드 선언
   public int insertExpense(ExpenseDTO expenseDTO) {
	   int expenseRegCnt = this.expenseDAO.insertExpense_report(expenseDTO);
	   int signRegCnt = this.expenseDAO.insertSign_report(expenseDTO);
	   return expenseRegCnt + signRegCnt ;
   }
   
   // 상사의 보고서 결재상황 검색하는 메소드 선언
   public int getReport_Approval(ExpenseDTO expenseDTO) {
	   int expense = this.expenseDAO.getReport_Approval(expenseDTO);
	   return expense;
   }
	// 결재완료한 직원 검색하는 메소드 선언
   public List<Map<String,String>> getFinishEmp(ExpenseDTO expenseDTO){
	   List<Map<String,String>> finishemp = this.expenseDAO.getFinishEmp(expenseDTO);
	   return finishemp;
   }
   
   // 결제내역 검색하는 메소드 선언
   public List<Map<String,String>> selectApprovallist(ExpenseDTO expenseDTO){
		List<Map<String,String>> tableList = this.expenseDAO.selectApprovallist(expenseDTO);
		return tableList;
	}
   
   
   // 지출보고서 결재내역 수정한 내역 불러오는 메소드 선언// 결제내역 검색하는 메소드 선언
   public Map<String,String> updateList(ExpenseDTO expenseDTO){
		Map<String,String> updateList = this.expenseDAO.updateList(expenseDTO);
		return updateList;
	}
   
   
	// 1개 보고서 수정하고 수정 행의 개수를 리턴하는 메소드 선언
	public int updateReport(ExpenseDTO expenseDTO , int form_choice) {
		int updateReportCnt = 0;
		int checkUpdateCnt = 0;
		// 상사의 결재상황이 미결재여서 보고서 수정하는 메소드 선언
		if(form_choice==1) {
			checkUpdateCnt = checkUpdateCnt + this.expenseDAO.checkUpdate(expenseDTO);
			System.out.println("dddddd" +expenseDTO.getRevise_cnt()); 
			if (checkUpdateCnt==expenseDTO.getRevise_cnt()) {
				// 보고서 수정 메소드 
				updateReportCnt = updateReportCnt+ this.expenseDAO.updateReport(expenseDTO);
			}
			else {
				// 수정내역 존재함
				updateReportCnt = -2;
			}
		}
		// 결재 여부 업데이트 메소드 선언
		// 만약 수정화면 2이고 결재하기 선택했고 수정하기 버튼 눌렀다면
		else if(form_choice==2 && expenseDTO.getSign_check().equals("confirm")) {
			checkUpdateCnt = checkUpdateCnt + this.expenseDAO.checkUpdate(expenseDTO);
			if (checkUpdateCnt==expenseDTO.getRevise_cnt()) {
				// 결재 여부 업데이트 메소드 
				updateReportCnt = updateReportCnt+ this.expenseDAO.updateApproval(expenseDTO);
				// 보고서 업데이트 메소드 (수정횟수 업데이트)
				updateReportCnt = updateReportCnt+ this.expenseDAO.updateCheck(expenseDTO);
			}
			else {
				// 수정내역 존재함
				updateReportCnt = -2;
			}
		}
		// 만약 수정화면 2이고 반려하기 선택했고 수정하기 버튼 눌렀다면
		else if(form_choice==2 && expenseDTO.getSign_check().equals("no_confirm")) {
			checkUpdateCnt = checkUpdateCnt + this.expenseDAO.checkUpdate(expenseDTO);
			if (checkUpdateCnt==expenseDTO.getRevise_cnt()) {
				// 결재여부 업데이트 메소드 
				updateReportCnt = updateReportCnt + this.expenseDAO.updateApproval2(expenseDTO);
				// 반려사유 입력 메소드 
				updateReportCnt = updateReportCnt + this.expenseDAO.insertSign_check(expenseDTO);
				// 보고서 업데이트 메소드 (수정횟수 업데이트)
				updateReportCnt = updateReportCnt+ this.expenseDAO.updateCheck(expenseDTO);
			}
			else {
				// 수정내역 존재함
				updateReportCnt = -2;
			}
		}
		// 만약 수정화면 4이고 수정하기 버튼 눌렀다면 
		else if(form_choice == 4 && expenseDTO.getSign_check().equals("confirm")) {
				// 보고서 수정 메소드 선언
				updateReportCnt = updateReportCnt +this.expenseDAO.updateReport(expenseDTO);
				// sign_finish_report 입력 메소드 선언
				updateReportCnt = updateReportCnt + this.expenseDAO.insert_sign_finish_report(expenseDTO);
		}
		return updateReportCnt ;
	}
		
	// 1개 보고서 삭제하고 삭제 행의 개수를 리턴하는 메소드 선언
	public int deleteReport(ExpenseDTO expenseDTO) {
		
		// return_report 삭제
		int deleteReportCnt = this.expenseDAO.deletereport(expenseDTO);
		// sign_finish_report 삭제
		deleteReportCnt =deleteReportCnt+ this.expenseDAO.deletesign(expenseDTO);
		//	expense_report 삭제
		deleteReportCnt = deleteReportCnt + this.expenseDAO.deleteexpense(expenseDTO);
		return deleteReportCnt;
	}

}