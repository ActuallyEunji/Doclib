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
public class MypageServiceImpl implements MypageService{
	
   @Autowired
   private MypageDAO mypageDAO;

	// 미결재한 보고서 목록개수 불러오는 메소드 선언
   public int getNoApprovalListCnt(MypageListDTO mypageListDTO) {
		int getNoApprovalListCnt = this.mypageDAO.getNoApprovalListCnt(mypageListDTO);
		return getNoApprovalListCnt;
	}
   
	// 반려된 보고서 목록개수 불러오는 메소드 선언
   public int getRefuseListCnt(MypageListDTO mypageListDTO) {
		int getRefuseListCnt = this.mypageDAO.getRefuseListCnt(mypageListDTO);
		return getRefuseListCnt;
	}
   
	// 결재종료된 보고서 목록개수 불러오는 메소드 선언
   public int getFinishListCnt(MypageListDTO mypageListDTO) {
		int getFinishListCnt = this.mypageDAO.getFinishListCnt(mypageListDTO);
		return getFinishListCnt;
	}
   
	// 미완료된 업무보고서 목록개수 불러오는 메소드 선언
   public int getUnFinishListCnt(MypageListDTO mypageListDTO) {
		int getFinishListCnt = this.mypageDAO.getUnFinishListCnt(mypageListDTO);
		return getFinishListCnt;
	}
	
	// 미결재한 보고서 목록 불러오는 메소드 선언
	public List<Map<String,String>> getNotApprovalList(MypageListDTO mypageListDTO){
		List<Map<String,String>> notApprovalList = this.mypageDAO.getNotApprovalList( mypageListDTO );
		return notApprovalList;
	}
	
	// 반려된 보고서 목록 불러오는 메소드 선언
	public List<Map<String,String>> getRefuseList(MypageListDTO mypageListDTO){
		List<Map<String,String>> refuseList = this.mypageDAO.getRefuseList( mypageListDTO );
		return refuseList;
	}
	
	// 결재종료된 보고서 목록 불러오는 메소드 선언
	public List<Map<String,String>> getFinishList(MypageListDTO mypageListDTO){
		List<Map<String,String>> fnishList = this.mypageDAO.getFinishList( mypageListDTO );
		return fnishList;
	}
	
	// 미완료된 업무 보고서 목록 불러오는 메소드 선언
	public List<Map<String,String>> getUnFinishList(MypageListDTO mypageListDTO){
		List<Map<String,String>> unfnishList = this.mypageDAO.getUnFinishList( mypageListDTO );
		return unfnishList;
	}
	
	// 미완료된 업무비율 불러오는 메소드 선언
	public int getUnfinishListPer(MypageListDTO mypageListDTO){
		int unfnishListper = this.mypageDAO.getUnfinishListPer( mypageListDTO );
		return unfnishListper;
	}
	
	// 미완료된 일일업무 보고서 비율 불러오는 메소드 선언
	public int getUnfinishDailyListPer(MypageListDTO mypageListDTO){
		int unfnishListper = this.mypageDAO.getUnfinishDailyListPer( mypageListDTO );
		return unfnishListper;
	}
	
	// 미완료된 주간업무 보고서 비율 불러오는 메소드 선언
	public int getUnfinishWeekListPer(MypageListDTO mypageListDTO){
		int unfnishListper = this.mypageDAO.getUnfinishWeekListPer( mypageListDTO );
		return unfnishListper;
	}
	
	// [수정/삭제할 내정보] 데이터 얻는 메소드 선언
	public Map<String,String> getMyPage(MyPageDTO myPageDTO){
		Map<String,String> myPages = this.mypageDAO.getMyPage(myPageDTO);
		return myPages;
	}
	
	// [수정/삭제할 회사 보고서 종류] 데이터 얻는 메소드 선언
	public List<Map<String,String>> getReports(MyPageDTO myPageDTO){
		List<Map<String,String>> myPages = this.mypageDAO.getReports(myPageDTO);
		return myPages;
	}
	
	// 내 정보 수정하고 성공행의 갯수 리턴하는 메소드 선언
	public int updateMyPage(MyPageDTO myPageDTO){
		System.out.println(7777);
		int myPages = this.mypageDAO.updateMyPage(myPageDTO);
		System.out.println(9999);
		return myPages;
	}
	
	// 내 회사 보고서 종류 수정하고 성공행의 갯수 리턴하는 메소드 선언
	public int updateMyCompany(MyPageDTO myPageDTO){
		// 이어주는 테이블 삭제하는 메소드 선언
		int myCompanys = this.mypageDAO.deleteTable(myPageDTO);
		// 보고서 종류 입력하는 메소드 선언
		myCompanys = myCompanys + this.mypageDAO.insertMyReport(myPageDTO);
		return myCompanys;
	}
   
}