package com.daum.pro;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.daum.pro.PageingData2;


@Controller
public class WeekController {
	
	@Autowired
	private WeekService weekService;
	
	//======================================================
	// 가상주소 /pro/weekList.do로 접속하면 호출되는 메소드 선언
	//======================================================
	@RequestMapping(value="/weekList.do")
	public ModelAndView getWeekBoardList(
			@ModelAttribute("weekListDTO") WeekListDTO weekListDTO
			, HttpSession session
	) {
		// ModelAndView 객체생성
		ModelAndView mav = new ModelAndView();
		
		// ModelAndView 객체에 호출 JSP 페이지명을 저장하기 (호출할 JSP페이지의 경로와 확장자명은 Spring이 찾아줌)
		mav.setViewName("weekList");

		try {
			
			String emp_no = (String) session.getAttribute("emp_no");
			weekListDTO.setEmp_no( Integer.parseInt(emp_no,10) );
			
			String company_no = (String) session.getAttribute("company_no");
			weekListDTO.setCompany_no( Integer.parseInt(company_no,10) );
			
			String company_emp_no = (String) session.getAttribute("company_emp_no");
			weekListDTO.setCompany_emp_no( Integer.parseInt(company_emp_no,10) );
			
			// WeekServiceImpl 객체의 메소드 호출로 검색한 연락처 총 개수를 얻기
			int weekListAllCnt = this.weekService.getWeekBoardListCnt( weekListDTO );
			
			// 페이징 처리 관련 데이터를 얻기 위해 PageingData2클래스의 getPageingData 메소드를 호출하여 
			// 페이징 처리 관련 데이터를 HashMap 객체로 얻기
			int selectPageNo = weekListDTO.getSelectPageNo();
			int rowCntPerPage = weekListDTO.getRowCntPerPage();
			Map<String,Integer> pageingData = PageingData2.getPageingData(weekListAllCnt, selectPageNo, rowCntPerPage,10);
			
			weekListDTO.setSelectPageNo(pageingData.get("selectPageNo"));
			weekListDTO.setBeginRowNo(pageingData.get("beginRowNo"));
			weekListDTO.setEndRowNo(pageingData.get("endRowNo"));
			
			// WeekServiceImpl 객체의 메소드 호출로 [검색한 보고서 목록] 얻기
			List<Map<String,String>> weekList = this.weekService.getWeekBoardList(weekListDTO);
			
			weekListDTO.setWeekTableList(weekList);
			
			// ModelAndView 객체에 [검색한 연락처 총 개수] 를 저장.
			// ModelAndView 객체에 저장된 데이터는 호출할 jsp에서 꺼내어 html 코딩과 어울리게 된다.
			mav.addObject("weekListAllCnt",weekListAllCnt);
			
			// ModelAndView 객체에 [검색한 연락처 목록]을 저장.
			mav.addObject("weekList",weekList);
			
			// ModelAndView 객체에 [페이징 처리 관련 데이터]가 저장된 HashMap 객체를 저장.
			mav.addObject("pageingData",pageingData);

		}catch (Exception e) {
			
			System.out.println("WeekController.getWeekBoardList(~) 메소드 호출 시 에러발생");
			mav.setViewName("error");
			mav.addObject("msg", "WeekController.getWeekBoardList(~) 메소드 호출 시 에러발생");
		}
		
		// ModelAndView 객체 리턴
		return mav;
				
	}
	
	
	//======================================================
	// 가상주소 /pro/week_business_log_reg_form.do로 접속하면 호출되는 메소드 선언
	//======================================================
	@RequestMapping(value="/week_business_log_reg_form.do")
	public ModelAndView goDailyRegForm(
			
	)  { 
		// ModelAndView 객체생성
		ModelAndView mav = new ModelAndView();
		
		// ModelAndView 객체에 호출 JSP 페이지명을 저장하기 (호출할 JSP페이지의 경로와 확장자명은 Spring이 찾아줌)
		mav.setViewName("week_business_log_reg_form");

		// ModelAndView 객체 리턴
		return mav;
		
	}
	
	
	
	
	//======================================================
	// 가상주소 /pro/week_business_log_reg_proc.do로 접속하면 호출되는 메소드 선언
	//======================================================
	@RequestMapping(
			// 클래스의 접속 url 설정
			value="/week_business_log_reg_proc.do"
			// 클래스가 파라미터를 보내는 방법은 post로 설정, 즉 post방식으로 보낸 데이터만 받겠다는 의미
			,method=RequestMethod.POST
			// 클래스가 응답받을 수 있는 데이터 형식과 문자셋 지정
			,produces="application/json;charset=UTF-8"
	)
	@ResponseBody  // 메소드의 리턴값을 JSON으로 변경하여 클래스에게 전송하는 어노테이션 설정
	public int insertWeek(
			@ModelAttribute("weekDTO") WeekDTO weekDTO 
			, HttpSession session
	) {
		int result = 0;
		try {
			
			weekDTO.setEmp_no(Integer.parseInt((String)session.getAttribute("emp_no")));
			//WeekServiceImpl객체의 insertWeek메소드 호출로 게시판 입력하고 입력 성공 행의 개수 얻기
			int WeekRegCnt = this.weekService.insertWeek(weekDTO);
			result = WeekRegCnt;
			
		}catch (Exception e) {
			
			result = -1;
			System.out.println("WeekController.insertWeek()메소드 예외발생");
			
		}
		return result;
		
	}
	
	
	

	//======================================================
	// 가상주소 /pro/week_business_log_upDel_form.do로 접속하면 호출되는 메소드 선언
	//======================================================
	@RequestMapping(value="/week_business_log_upDel_form.do" ,method=RequestMethod.POST)
	public ModelAndView week_business_log_upDel_form(
			@ModelAttribute("weekDTO") WeekDTO weekDTO 
			, HttpSession session
	) {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("week_business_log_upDel_form");
		
		try {
			
			// 주간 업무 보고서 검색 메소드 선언(보고서 전체)
			List<Map<String,String>> weeklist = this.weekService.getupDelweek(weekDTO);
		    // 주간 업무일지 내용 검색 메소드 선언(행)
		    List<Map<String,String>> contentlist = this.weekService.getupDelWeekContent(weekDTO);
			
			int login_emp_no = Integer.parseInt((String)session.getAttribute("emp_no"),10);
			int form_choice = 0;	 
			int writer = weekDTO.getWriter();		//선택한 행의 er.emp_no //(보고서 작성자)
			
			// 밑에서 쓰기위해 DTO에 emp_no 값 세팅
			weekDTO.setEmp_no(login_emp_no);
			
			if(login_emp_no ==  writer  ) {
				// 내가 썼을때 수정화면
			   form_choice=1;
			}
			else {
				// 상사한테 보이는 수정화면
				form_choice=2;
			}
			
			session.setAttribute("form_choice",form_choice);
			
			mav.addObject("weeklist", weeklist);
			
			mav.addObject("contentlist", contentlist);
			
		}catch (Exception e) {
			
			System.out.println("WeekController.week_business_log_upDel_form() 메소드 예외 발생!");
			
		}
		
		return mav;
	}
	
	
	
	//**************************************************************************
	// /pro/week_business_log_upDel_proc.do 로 접근시 호출되는 메소드 선언
	//**************************************************************************
	@RequestMapping(           
			// 클의 접속 URL 설정
			value = "/week_business_log_upDel_proc.do"     
			// 클이 파라미터를 보내는 방법은 post로 설정. 즉 post 방식으로 보낸 데이터만 받겠다는 의미
			, method=RequestMethod.POST         
			// 클이 응답받을 수 있는 데이터 형식과 문자셋 지정
			, produces="application/json;charset=UTF-8" 
	)
	@ResponseBody    
	public int week_business_log_upDel_proc(
			//-----------------------------------------------------
			// 모든 파라미터값이 저장된 [BusinessDTO 객체]를 매개변수로 선언
			// upDel 라는 파라미터명의 파라미터값을 저장할 String 형 매개변수 선언
			//-----------------------------------------------------
			@ModelAttribute("weekDTO") WeekDTO weekDTO  
			,@RequestParam( value="upDel", required=false )   String upDel
			, HttpSession session
	){	
		//------------------------------
		// 수정 또는 삭제 실행 후 수정 또는 삭제 적용 행의 개수 저장 변수 선언
		//------------------------------
		int reportUpDelCnt = 0;
		int emp_no = Integer.parseInt((String)session.getAttribute("emp_no"),10);
		weekDTO.setEmp_no(emp_no);
		
		try{
			//------------------------------
			// 보고서 수정 모드 이면
			// [WeekServiceImpl 객체]의 메소드 호출로 [보고서 수정]한 후 적용행의 개수 얻기
			//------------------------------
			if( upDel.equals("up") ){
				int form_choice = ((Integer)(session.getAttribute("form_choice"))).intValue();
				reportUpDelCnt = this.weekService.updateReport( weekDTO , form_choice);
			}
			//------------------------------
			// 보고서 삭제 모드 이면
			// [WeekServiceImpl 객체]의 메소드 호출로 [보고서 삭제]한 후 적용행의 개수 얻기
			//------------------------------
			else{
				reportUpDelCnt = this.weekService.deleteReport( weekDTO );
			}
			
		}catch(Exception ex){
			reportUpDelCnt = -1;
			System.out.println( "WeekController.week_business_log_upDel_proc(~) 메소드 예외 발생!");
		}  
		//------------------------------
		// 수정 또는 삭제 실행 후 수정 또는 삭제 적용 행의 개수
		//------------------------------ 
		return reportUpDelCnt;
	}

	
	
}

