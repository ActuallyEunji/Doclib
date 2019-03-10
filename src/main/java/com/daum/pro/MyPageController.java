package com.daum.pro;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MyPageController {
	
	@Autowired
	private MypageService mypageService; 
	
	
	@RequestMapping(value="/myPageList.do")
	public ModelAndView getMypageList(
			@ModelAttribute("mypageListDTO") MypageListDTO mypageListDTO
			, HttpSession session
	) { 
		ModelAndView mav = new ModelAndView();
	
		//객체에 호출 jsp 페이지명 저장
		mav.setViewName("myPageList"); 
		
		try {
			
			String emp_no = (String)session.getAttribute("emp_no");
			mypageListDTO.setEmp_no( Integer.parseInt(emp_no,10) );
			// 미결재한 보고서 목록개수 불러오는 메소드 선언
			int notApprovalListAllCnt = this.mypageService.getNoApprovalListCnt(mypageListDTO);
			// 반려된 보고서 목록개수 불러오는 메소드 선언
			int refuseListAllCnt = this.mypageService.getRefuseListCnt(mypageListDTO);
			// 결재종료된 보고서 목록개수 불러오는 메소드 선언
			int finishListAllCnt = this.mypageService.getFinishListCnt(mypageListDTO);
			// 미완료된 업무보고서 목록개수 불러오는 메소드 선언
			int unfinishListAllCnt = this.mypageService.getUnFinishListCnt(mypageListDTO);
			
			int selectPageNo = mypageListDTO.getSelectPageNo();
				if(selectPageNo==0) { selectPageNo=1;}
			int rowCntPerPage = mypageListDTO.getRowCntPerPage();
				if(rowCntPerPage==0) { rowCntPerPage=10;}
			
			Map<String, Integer> pageingData = PageingData2.getPageingData(finishListAllCnt, selectPageNo, rowCntPerPage, 10);
			// 검색 총 개수와 선택 페이지와 관계를 보정하여 수정된 선택 페이지 번호를
			// BoardSearchDTO 객체에 재입력해줌.
			// 이 보정 작업은 getPageingData 메소드 호출 시 작업해준다.
			mypageListDTO.setSelectPageNo(pageingData.get("selectPageNo"));
			// 페이지 번호에 맞는 시작행 번호를 구해 boardSearchDTO 객체에 저장
			mypageListDTO.setBeginRowNo(pageingData.get("beginRowNo"));
			// 페이지 번호에 맞는 끝행 번호를 구해 boardSearchDTO 객체에 저장
			mypageListDTO.setEndRowNo(pageingData.get("endRowNo"));
			
			
			// 미결재한 보고서 목록 불러오는 메소드 선언
			List<Map<String,String>> notApprovalList = this.mypageService.getNotApprovalList( mypageListDTO );
			
			// 반려된 보고서 목록 불러오는 메소드 선언
			List<Map<String,String>> refuseList = this.mypageService.getRefuseList( mypageListDTO );
			
			// 결재종료된 보고서 목록 불러오는 메소드 선언
			List<Map<String,String>> finishList = this.mypageService.getFinishList( mypageListDTO );			
			
			// 미완료된 업무 보고서 목록 불러오는 메소드 선언
			List<Map<String,String>> unfinishList = this.mypageService.getUnFinishList( mypageListDTO );		
			
			
			// 미완료된 업무 보고서 전체비율 불러오는 메소드 선언
			int unfinishListPer = this.mypageService.getUnfinishListPer(mypageListDTO);
			
			// 미완료된 일일업무 보고서 비율 불러오는 메소드 선언
			int unfinishDailyListPer = this.mypageService.getUnfinishDailyListPer(mypageListDTO);
			
			// 미완료된 주간업무 보고서 비율 불러오는 메소드 선언
			int unfinishWeekListPer = this.mypageService.getUnfinishWeekListPer(mypageListDTO);
			
			
			// ModelAndView 객체에 [미결재한 보고서 총 개수] 저장하기.
			mav.addObject("notApprovalListAllCnt",notApprovalListAllCnt);
			
			// ModelAndView 객체에 [반려된 보고서 총 개수] 저장하기.
			mav.addObject("refuseListAllCnt",refuseListAllCnt);
			
			// ModelAndView 객체에 [결재종료된 보고서 총 개수] 저장하기.
			mav.addObject("finishListAllCnt",finishListAllCnt);
			
			// ModelAndView 객체에 [미완료된 업무 보고서 총 개수] 저장하기.
			mav.addObject("unfinishListAllCnt",unfinishListAllCnt);
			
			// ModelAndView 객체에 미결재한 보고서 목록 저장
			mav.addObject("notApprovalList",notApprovalList);
			
			// ModelAndView 객체에 반려된 보고서 목록 저장
			mav.addObject("refuseList",refuseList);
			
			// ModelAndView 객체에 결재종료된 보고서 목록 저장
			mav.addObject("finishList",finishList);
			
			// ModelAndView 객체에 미완료된 업무 보고서 목록 저장
			mav.addObject("unfinishList",unfinishList);
			
			// ModelAndView 객체에 미완료된 업무 보고서 전체비율 저장
			mav.addObject("unfinishListPer",unfinishListPer);
			
			// ModelAndView 객체에 미완료된 일일 업무 보고서 비율 저장
			mav.addObject("unfinishDailyListPer",unfinishDailyListPer);
			
			// ModelAndView 객체에 미완료된 주간 업무 보고서 비율 저장
			mav.addObject("unfinishWeekListPer",unfinishWeekListPer);
			
			// ModelAndView 객체에 페이징 처리 관련 데이터 저장
			mav.addObject("pageNoCntPerPage",pageingData.get("pageNoCntPerPage"));
			mav.addObject("selectPageNo",pageingData.get("selectPageNo"));
			mav.addObject("lastPageNo",pageingData.get("lastPageNo"));
			mav.addObject("beginPageNo",pageingData.get("beginPageNo"));
			mav.addObject("endPageNo",pageingData.get("endPageNo"));
			mav.addObject("beginRowNo",pageingData.get("beginRowNo"));
			mav.addObject("endRowNo",pageingData.get("endRowNo"));
			mav.addObject("beginRowNo_desc",pageingData.get("beginRowNo_desc"));
			
		}catch (Exception e) {
			
			System.out.println("MyPageController.getMypageList(~) 메소드 호출 시 에러발생");
			mav.setViewName("error");
			mav.addObject("msg", "MyPageController.getMypageList(~) 메소드 호출 시 에러발생");
		}
		return mav;
		
		
	}
	
	
	@RequestMapping(value="/myPageUpDelForm.do" ,method=RequestMethod.POST)
	public ModelAndView myPageUpDelForm(
			@ModelAttribute("myPageDTO") MyPageDTO myPageDTO
				, HttpSession session
	) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("myPageUpDelForm");

		int emp_no = Integer.parseInt((String)session.getAttribute("emp_no"));
		myPageDTO.setEmp_no(emp_no);
		
		try {
			// [MyPageServiceImpl] 의 getMyPage 메소드 호출로 [수정/삭제할 내정보] 데이터 얻기
			Map<String,String> mypage = this.mypageService.getMyPage(myPageDTO);

			// [MyPageServiceImpl] 의 getReports 메소드 호출로 [수정/삭제할 회사 보고서 종류] 데이터 얻기
			List<Map<String,String>> reports = this.mypageService.getReports(myPageDTO);
			
			mav.addObject("mypage", mypage);
			mav.addObject("reports", reports);
			
			myPageDTO.setReports(reports);
			
		}catch (Exception e) {
			System.out.println("MyPageController.myPageUpDelForm() 메소드 예외 발생!");
		}
		// ModelAndView 객체 리턴
		return mav;
	}
	
	
	
	
	//**************************************************************************
	// /pro/myPageUpDelProc.do 로 접근시 호출되는 메소드 선언
	//**************************************************************************
	@RequestMapping(           
			// 클의 접속 URL 설정
			value = "/myPageUpDelProc.do"     
			// 클이 파라미터를 보내는 방법은 post로 설정. 즉 post 방식으로 보낸 데이터만 받겠다는 의미
			, method=RequestMethod.POST         
			// 클이 응답받을 수 있는 데이터 형식과 문자셋 지정
			, produces="application/json;charset=UTF-8" 
			)
	@ResponseBody    
	public int myPageUpDelProc(
			//-----------------------------------------------------
			// 모든 파라미터값이 저장된 [MyPageDTO 객체]를 매개변수로 선언
			// upDel 라는 파라미터명의 파라미터값을 저장할 String 형 매개변수 선언
			//-----------------------------------------------------
			@ModelAttribute("myPageDTO") MyPageDTO myPageDTO
			,@RequestParam("upDel") String upDel 
			,HttpSession session
			){	
		//------------------------------
		// 내 정보수정 또는 회사보고서 종류수정 실행 후 수정 또는 삭제 적용 행의 개수 저장 변수 선언
		//------------------------------
		int contactUpDelCnt = 0;
		try{
			
			// 내 정보 수정일 때
			if(upDel.equals("up")) {
				contactUpDelCnt = this.mypageService.updateMyPage(myPageDTO);
			}
			// 회사 정보 수정일 때 
			else if(upDel.equals("com")) {
				contactUpDelCnt = this.mypageService.updateMyCompany(myPageDTO);
			}
		}catch(Exception ex){
			contactUpDelCnt = -1;
			System.out.println( "MyPageController.myPageUpDelProc(~) 메소드 예외 발생!");
		}  
		//------------------------------
		// 수정 또는 삭제 실행 후 수정 또는 삭제 적용 행의 개수
		//------------------------------ 
		return contactUpDelCnt;
	}

 	
}
