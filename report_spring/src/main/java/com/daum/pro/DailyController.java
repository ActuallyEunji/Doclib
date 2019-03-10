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
public class DailyController {
	
	@Autowired
	private DailyService dailyService;
	
	//======================================================
	// 가상주소 /pro/dailyList.do로 접속하면 호출되는 메소드 선언
	//======================================================
	@RequestMapping(value="/dailyList.do")
	public ModelAndView getDailyBoardList(
			@ModelAttribute("dailyListDTO") DailyListDTO dailyListDTO
			, HttpSession session
	) {
		
		// ModelAndView 객체생성
		ModelAndView mav = new ModelAndView();
		
		// ModelAndView 객체에 호출 JSP 페이지명을 저장하기 (호출할 JSP페이지의 경로와 확장자명은 Spring이 찾아줌)
		mav.setViewName("dailyList");

		try {
			
			String emp_no = (String) session.getAttribute("emp_no");
			dailyListDTO.setEmp_no( Integer.parseInt(emp_no,10) );
			
			String company_no = (String) session.getAttribute("company_no");
			dailyListDTO.setCompany_no( Integer.parseInt(company_no,10) );
			
			String company_emp_no = (String) session.getAttribute("company_emp_no");
			dailyListDTO.setCompany_emp_no( Integer.parseInt(company_emp_no,10) );
			
			// DailyServiceImpl 객체의 메소드 호출로 검색한 연락처 총 개수를 얻기
			int dailyListAllCnt = this.dailyService.getDailyBoardListCnt( dailyListDTO );
			
			// 페이징 처리 관련 데이터를 얻기 위해 PageingData2클래스의 getPageingData 메소드를 호출하여 
			// 페이징 처리 관련 데이터를 HashMap 객체로 얻기
			int selectPageNo = dailyListDTO.getSelectPageNo();
			int rowCntPerPage = dailyListDTO.getRowCntPerPage();
			Map<String,Integer> pageingData = PageingData2.getPageingData(dailyListAllCnt, selectPageNo, rowCntPerPage,10);
			
			dailyListDTO.setSelectPageNo(pageingData.get("selectPageNo"));
			dailyListDTO.setBeginRowNo(pageingData.get("beginRowNo"));
			dailyListDTO.setEndRowNo(pageingData.get("endRowNo"));
			
			// DailyServiceImpl 객체의 메소드 호출로 [검색한 보고서 목록] 얻기
			List<Map<String,String>> dailyList = this.dailyService.getDailyBoardList(dailyListDTO);
			
			dailyListDTO.setDailyTableList(dailyList);
			
			// ModelAndView 객체에 [검색한 연락처 총 개수] 를 저장.
			// ModelAndView 객체에 저장된 데이터는 호출할 jsp에서 꺼내어 html 코딩과 어울리게 된다.
			mav.addObject("dailyListAllCnt",dailyListAllCnt);
			
			// ModelAndView 객체에 [검색한 연락처 목록]을 저장.
			mav.addObject("dailyList",dailyList);
			
			// ModelAndView 객체에 [페이징 처리 관련 데이터]가 저장된 HashMap 객체를 저장.
			mav.addObject("pageingData",pageingData);

		}catch (Exception e) {
			
			System.out.println("DailyController.getDailyBoardList(~) 메소드 호출 시 에러발생");
			mav.setViewName("error");
			mav.addObject("msg", "DailyController.getDailyBoardList(~) 메소드 호출 시 에러발생");
		}
		
		// ModelAndView 객체 리턴
		return mav;
				
	}
	
	
	//======================================================
	// 가상주소 /pro/daily_business_log_reg_form.do로 접속하면 호출되는 메소드 선언
	//======================================================
	@RequestMapping(value="/daily_business_log_reg_form.do")
	public ModelAndView goDailyRegForm(
			
	)  { 
		// ModelAndView 객체생성
		ModelAndView mav = new ModelAndView();
		
		// ModelAndView 객체에 호출 JSP 페이지명을 저장하기 (호출할 JSP페이지의 경로와 확장자명은 Spring이 찾아줌)
		mav.setViewName("daily_business_log_reg_form");

		// ModelAndView 객체 리턴
		return mav;
		
	}
	
	
	
	
	//======================================================
	// 가상주소 /pro/daily_business_log_reg_proc.do로 접속하면 호출되는 메소드 선언
	//======================================================
	@RequestMapping(
			// 클래스의 접속 url 설정
			value="/daily_business_log_reg_proc.do"
			// 클래스가 파라미터를 보내는 방법은 post로 설정, 즉 post방식으로 보낸 데이터만 받겠다는 의미
			,method=RequestMethod.POST
			// 클래스가 응답받을 수 있는 데이터 형식과 문자셋 지정
			,produces="application/json;charset=UTF-8"
	)
	@ResponseBody  // 메소드의 리턴값을 JSON으로 변경하여 클래스에게 전송하는 어노테이션 설정
	public int insertDaily(
			@ModelAttribute("dailyDTO") DailyDTO dailyDTO 
			, HttpSession session
	) {
		int result = 0;
		try {
			
			dailyDTO.setEmp_no(Integer.parseInt((String)session.getAttribute("emp_no")));
			//DailyServiceImpl객체의 insertDaily메소드 호출로 게시판 입력하고 입력 성공 행의 개수 얻기
			int ExpenseRegCnt = this.dailyService.insertDaily(dailyDTO);
			result = ExpenseRegCnt;
			
		}catch (Exception e) {
			
			result = -1;
			System.out.println("DailyController.insertDaily()메소드 예외발생");
			
		}
		return result;
		
	}
	
	
	

	//======================================================
	// 가상주소 /pro/daily_business_log_upDel_form.do로 접속하면 호출되는 메소드 선언
	//======================================================
	@RequestMapping(value="/daily_business_log_upDel_form.do" ,method=RequestMethod.POST)
	public ModelAndView daily_business_log_upDel_form(
			@ModelAttribute("dailyDTO") DailyDTO dailyDTO
			, HttpSession session
	) {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("daily_business_log_upDel_form");
		
		try {
			
			Map<String,String> dailylist = this.dailyService.getupDeldaily(dailyDTO);
			System.out.println(dailylist);
			
			int login_emp_no = Integer.parseInt((String)session.getAttribute("emp_no"),10);
			int form_choice = 0;	 //1이면 보고서 수정화면 / 2이면 수정화면2/     3이면 수정화면3  /  4이면 수정화면4  
			int writer = dailyDTO.getWriter();		//선택한 행의 er.emp_no //(보고서 작성자)
			
			// 밑에서 쓰기위해 DTO에 emp_no 값 세팅
			dailyDTO.setEmp_no(login_emp_no);
			
			if(login_emp_no ==  writer  ) {
				// 내가 썼을때 수정화면
			   form_choice=1;
			}
			else {
				// 상사한테 보이는 수정화면
				form_choice=2;
			}
			
			session.setAttribute("form_choice",form_choice);
			
			mav.addObject("dailylist", dailylist);
			
		}catch (Exception e) {
			
			System.out.println("DailyController.daily_business_log_upDel_form() 메소드 예외 발생!");
			
		}
		
		return mav;
	}
	
	
	
	//**************************************************************************
	// /pro/daily_business_log_upDel_proc.do 로 접근시 호출되는 메소드 선언
	//**************************************************************************
	@RequestMapping(           
			// 클의 접속 URL 설정
			value = "/daily_business_log_upDel_proc.do"     
			// 클이 파라미터를 보내는 방법은 post로 설정. 즉 post 방식으로 보낸 데이터만 받겠다는 의미
			, method=RequestMethod.POST         
			// 클이 응답받을 수 있는 데이터 형식과 문자셋 지정
			, produces="application/json;charset=UTF-8" 
	)
	@ResponseBody    
	public int daily_business_log_upDel_proc(
			//-----------------------------------------------------
			// 모든 파라미터값이 저장된 [BusinessDTO 객체]를 매개변수로 선언
			// upDel 라는 파라미터명의 파라미터값을 저장할 String 형 매개변수 선언
			//-----------------------------------------------------
			@ModelAttribute("dailyDTO") DailyDTO dailyDTO 
			,@RequestParam( value="upDel", required=false )   String upDel
			, HttpSession session
	){	
		//------------------------------
		// 수정 또는 삭제 실행 후 수정 또는 삭제 적용 행의 개수 저장 변수 선언
		//------------------------------
		int reportUpDelCnt = 0;
		int emp_no = Integer.parseInt((String)session.getAttribute("emp_no"),10);
		dailyDTO.setEmp_no(emp_no);
		
		try{
			
			//------------------------------
			// 보고서 수정 모드 이면
			// [BusinessServiceImpl 객체]의 메소드 호출로 [보고서 수정]한 후 적용행의 개수 얻기
			//------------------------------
			if( upDel.equals("up") ){
				int form_choice = ((Integer)(session.getAttribute("form_choice"))).intValue();
				reportUpDelCnt = this.dailyService.updateReport( dailyDTO , form_choice);
			}
			//------------------------------
			// 보고서 삭제 모드 이면
			// [BusinessServiceImpl 객체]의 메소드 호출로 [보고서 삭제]한 후 적용행의 개수 얻기
			//------------------------------
			else{
				reportUpDelCnt = this.dailyService.deleteReport( dailyDTO );
			}
			
		}catch(Exception ex){
			reportUpDelCnt = -1;
			System.out.println( "DailyController.daily_business_log_upDel_proc(~) 메소드 예외 발생!");
		}  
		//------------------------------
		// 수정 또는 삭제 실행 후 수정 또는 삭제 적용 행의 개수
		//------------------------------ 
		return reportUpDelCnt;
	}

	
	
}

