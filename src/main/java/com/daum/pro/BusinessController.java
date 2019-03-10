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
public class BusinessController {
	
	@Autowired
	private BusinessService businessService;
	
	//======================================================
	// 가상주소 /pro/businessList.do로 접속하면 호출되는 메소드 선언
	//======================================================
	@RequestMapping(value="/businessList.do")
	public ModelAndView getBusinessBoardList(
			@ModelAttribute("businessListDTO") BusinessListDTO businessListDTO
			, HttpSession session
	) {
		
		// ModelAndView 객체생성
		ModelAndView mav = new ModelAndView();
		
		// ModelAndView 객체에 호출 JSP 페이지명을 저장하기 (호출할 JSP페이지의 경로와 확장자명은 Spring이 찾아줌)
		mav.setViewName("businessList");

		try {
			
			String emp_no = (String) session.getAttribute("emp_no");
			businessListDTO.setEmp_no( Integer.parseInt(emp_no,10) );
			
			String company_no = (String) session.getAttribute("company_no");
			businessListDTO.setCompany_no( Integer.parseInt(company_no,10) );
			
			String company_emp_no = (String) session.getAttribute("company_emp_no");
			businessListDTO.setCompany_emp_no( Integer.parseInt(company_emp_no,10) );
			
			// BusinessServiceImpl 객체의 메소드 호출로 검색한 연락처 총 개수를 얻기
			int businessListAllCnt = this.businessService.getBusinessBoardListCnt( businessListDTO );
			
			// 페이징 처리 관련 데이터를 얻기 위해 PageingData2클래스의 getPageingData 메소드를 호출하여 
			// 페이징 처리 관련 데이터를 HashMap 객체로 얻기
			int selectPageNo = businessListDTO.getSelectPageNo();
			int rowCntPerPage = businessListDTO.getRowCntPerPage();
			Map<String,Integer> pageingData = PageingData2.getPageingData(businessListAllCnt, selectPageNo, rowCntPerPage,10);
			
			businessListDTO.setSelectPageNo(pageingData.get("selectPageNo"));
			businessListDTO.setBeginRowNo(pageingData.get("beginRowNo"));
			businessListDTO.setEndRowNo(pageingData.get("endRowNo"));
			
			// BusinessServiceImpl 객체의 메소드 호출로 [검색한 보고서 목록] 얻기
			List<Map<String,String>> businessList = this.businessService.getBusinessBoardList(businessListDTO);
			
			businessListDTO.setBusinessTableList(businessList);
			
			// ModelAndView 객체에 [검색한 연락처 총 개수] 를 저장.
			// ModelAndView 객체에 저장된 데이터는 호출할 jsp에서 꺼내어 html 코딩과 어울리게 된다.
			mav.addObject("businessListAllCnt",businessListAllCnt);
			
			// ModelAndView 객체에 [검색한 연락처 목록]을 저장.
			mav.addObject("businessList",businessList);
			
			// ModelAndView 객체에 [페이징 처리 관련 데이터]가 저장된 HashMap 객체를 저장.
			mav.addObject("pageingData",pageingData);

		}catch (Exception e) {
			
			System.out.println("BusinessController.getBusinessBoardList(~) 메소드 호출 시 에러발생");
			mav.setViewName("error");
			mav.addObject("msg", "BusinessController.getBusinessBoardList(~) 메소드 호출 시 에러발생");
		}
		
		// ModelAndView 객체 리턴
		return mav;
				
	}
	
	
	//======================================================
	// 가상주소 /pro/business_report_reg_form.do로 접속하면 호출되는 메소드 선언
	//======================================================
	@RequestMapping(value="/business_report_reg_form.do")
	public ModelAndView goBusinessRegForm(
			HttpSession session
	)  { 
		// ModelAndView 객체생성
		ModelAndView mav = new ModelAndView();
		
		// ModelAndView 객체에 호출 JSP 페이지명을 저장하기 (호출할 JSP페이지의 경로와 확장자명은 Spring이 찾아줌)
		mav.setViewName("business_report_reg_form");
		
		// 회사 결재차수 테이블 검색하는 메소드 선언
		int emp_no = Integer.parseInt((String)session.getAttribute("emp_no"));
		List<Map<String,String>> tableList = this.businessService.getTableList(emp_no);
		mav.addObject("tableList",tableList);
		
		// ModelAndView 객체 리턴
		return mav;
		
	}
	
	
	
	
	//======================================================
	// 가상주소 /pro/business_report_reg_proc.do로 접속하면 호출되는 메소드 선언
	//======================================================
	@RequestMapping(
			// 클래스의 접속 url 설정
			value="/business_report_reg_proc.do"
			// 클래스가 파라미터를 보내는 방법은 post로 설정, 즉 post방식으로 보낸 데이터만 받겠다는 의미
			,method=RequestMethod.POST
			// 클래스가 응답받을 수 있는 데이터 형식과 문자셋 지정
			,produces="application/json;charset=UTF-8"
	)
	@ResponseBody  // 메소드의 리턴값을 JSON으로 변경하여 클래스에게 전송하는 어노테이션 설정
	public int insertBusiness(
			@ModelAttribute("businessDTO") BusinessDTO businessDTO 
			, HttpSession session
	) {
		
		int result = 0;
		
		try {
			
			int max_company_emp_no = Integer.parseInt((String)session.getAttribute("max_company_emp_no"));
			int company_emp_no =  Integer.parseInt((String)session.getAttribute("company_emp_no"));
			
			// insertlist 변수에 회사차수 저장
			ArrayList<Integer>insertlist = new ArrayList<Integer>();
			for (int i =company_emp_no ; i<= max_company_emp_no; i++){
			   insertlist.add(i);
			}
			businessDTO.setInsertlist(insertlist);
			
			// 회사 결재차수 테이블 검색하는 메소드 선언
			int emp_no = Integer.parseInt((String)session.getAttribute("emp_no"));
			List<Map<String,String>> tableList = this.businessService.getTableList(emp_no);
			
			// 매퍼에서 insert하기 위해 결과값들을 DTO에 저장
			businessDTO.setTableList(tableList);
			
			//BusinessServiceImpl객체의 insertBoard메소드 호출로 게시판 입력하고 입력 성공 행의 개수 얻기
			int ExpenseRegCnt = this.businessService.insertBusiness(businessDTO);
			result = ExpenseRegCnt;
			
		}catch (Exception e) {
			result = -1;
			System.out.println("BusinessController.insertBusiness()메소드 예외발생");
		}
		
		return result;
	}
	
	
	
	//======================================================
	// 가상주소 /pro/business_report_upDel_form.do로 접속하면 호출되는 메소드 선언
	//======================================================
	@RequestMapping(value="/business_report_upDel_form.do" ,method=RequestMethod.POST)
	public ModelAndView business_report_upDel_form(
			@ModelAttribute("businessDTO") BusinessDTO businessDTO
			, HttpSession session
	) {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("business_report_upDel_form");
		
		int login_emp_no = Integer.parseInt((String)session.getAttribute("emp_no"),10);
		String sign_name = businessDTO.getSign_name();		// 선택한 행의 결재상황? 결재완료 등등
		int form_choice = 0;	 //1이면 보고서 수정화면 / 2이면 수정화면2/     3이면 수정화면3  /  4이면 수정화면4  
		int writer = businessDTO.getWriter();		//선택한 행의 er.emp_no //(보고서 작성자)
		
		// 밑에서 쓰기위해 DTO에 emp_no 값 세팅
		businessDTO.setEmp_no(login_emp_no);
		
		// 상사의 보고서 결재상황 검색하는 메소드 선언
		int superior_sign_code = this.businessService.getReport_Approval(businessDTO);	// 0 이면 미결재 1이면 결재
		
		if( sign_name.equals("반려")  ){
			if(login_emp_no ==  writer  ) {
				// 보고서 열람상황 수정하는 메소드 선언(열람중으로)
			   form_choice=4;
			}
			else {
				form_choice=2;
			}
		}
		else if (superior_sign_code == 1 ){
		    form_choice = 2;
		}
		else if (superior_sign_code == 0){
		   if(login_emp_no ==  writer){		
		      form_choice=1; 
		   }
		   else{
		      form_choice=2;
		   }
		}
		session.setAttribute("form_choice",form_choice);
		
		int max_return_no = businessDTO.getMax_return_no();
		
		// return_no_list 변수에 1~ max_return_no 저장 (결재내역 출력을 위한 값 세팅)
		ArrayList<Integer> return_no_list = new ArrayList<Integer>();
		for (int i =1 ; i<= max_return_no; i++){
			return_no_list.add(i);
		}
		
		businessDTO.setReturn_no_list(return_no_list);
		
		// 영업내역 검색하는 메소드 선언
		Map<String,String> upDelBusinessList = this.businessService.getupDelBusinessList(businessDTO);
		
		// 만난사람 검색하는 메소드 선언
		List<Map<String,String>> salesPersonList = this.businessService.getSalesPersonList(businessDTO);
		
		// 결제내역 검색하는 메소드 선언
		List<Map<String,String>> selectApprovallist = this.businessService.selectApprovallist(businessDTO);
		
		// 지출보고서 결재내역 수정한 내역 불러오는 메소드 선언
		Map<String,String> updatelist = this.businessService.updateList(businessDTO);
		
		mav.addObject("salesPersonList",salesPersonList);
		mav.addObject("upDelBusinessList",upDelBusinessList);
		mav.addObject("selectApprovallist",selectApprovallist);
		mav.addObject("updatelist",updatelist);
		
		return mav;
	}
	
	
	//**************************************************************************
	// /pro/business_report_upDel_proc.do 로 접근시 호출되는 메소드 선언
	//**************************************************************************
	@RequestMapping(           
			// 클의 접속 URL 설정
			value = "/business_report_upDel_proc.do"     
			// 클이 파라미터를 보내는 방법은 post로 설정. 즉 post 방식으로 보낸 데이터만 받겠다는 의미
			, method=RequestMethod.POST         
			// 클이 응답받을 수 있는 데이터 형식과 문자셋 지정
			, produces="application/json;charset=UTF-8" 
	)
	@ResponseBody    
	public int business_report_upDel_proc(
			//-----------------------------------------------------
			// 모든 파라미터값이 저장된 [BusinessDTO 객체]를 매개변수로 선언
			// upDel 라는 파라미터명의 파라미터값을 저장할 String 형 매개변수 선언
			//-----------------------------------------------------
			@ModelAttribute("businessDTO") BusinessDTO businessDTO 
			,@RequestParam( value="upDel", required=false )   String upDel
			, HttpSession session
	){	
		//------------------------------
		// 수정 또는 삭제 실행 후 수정 또는 삭제 적용 행의 개수 저장 변수 선언
		//------------------------------
		int reportUpDelCnt = 0;
		int emp_no = Integer.parseInt((String)session.getAttribute("emp_no"),10);
		businessDTO.setEmp_no(emp_no);
		
		try{
			// 회사 결재차수 테이블 검색하는 메소드 선언 (반려 후에 결재올릴때 사용)
			List<Map<String,String>> tableList = this.businessService.getTableList(emp_no);
			
			businessDTO.setTableList(tableList);
			
			//------------------------------
			// 보고서 수정 모드 이면
			// [BusinessServiceImpl 객체]의 메소드 호출로 [보고서 수정]한 후 적용행의 개수 얻기
			//------------------------------
			if( upDel.equals("up") ){
				int form_choice = ((Integer)(session.getAttribute("form_choice"))).intValue();
				reportUpDelCnt = this.businessService.updateReport( businessDTO , form_choice );
			}
			//------------------------------
			// 보고서 삭제 모드 이면
			// [BusinessServiceImpl 객체]의 메소드 호출로 [보고서 삭제]한 후 적용행의 개수 얻기
			//------------------------------
			else{
				reportUpDelCnt = this.businessService.deleteReport( businessDTO );
			}
		}catch(Exception ex){
			reportUpDelCnt = -1;
			System.out.println( "BusinessController.business_report_upDel_proc(~) 메소드 예외 발생!");
		}  
		//------------------------------
		// 수정 또는 삭제 실행 후 수정 또는 삭제 적용 행의 개수
		//------------------------------ 
		return reportUpDelCnt;
	}
	
	
	
	@RequestMapping(value="/wordDown_business.do" ,method=RequestMethod.POST)
	public ModelAndView gowordDown_business(
			@ModelAttribute("businessDTO") BusinessDTO businessDTO
			, HttpSession session
	) {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("wordDown_business");
		
		int login_emp_no = Integer.parseInt((String)session.getAttribute("emp_no"),10);
		
		int max_return_no = businessDTO.getMax_return_no();
		
		// return_no_list 변수에 1~ max_return_no 저장 (결재내역 출력을 위한 값 세팅)
		ArrayList<Integer> return_no_list = new ArrayList<Integer>();
		for (int i =1 ; i<= max_return_no; i++){
			return_no_list.add(i);
		}
		
		businessDTO.setReturn_no_list(return_no_list);
		
		// 영업내역 검색하는 메소드 선언
		Map<String,String> upDelBusinessList = this.businessService.getupDelBusinessList(businessDTO);
		
		// 만난사람 검색하는 메소드 선언
		List<Map<String,String>> salesPersonList = this.businessService.getSalesPersonList(businessDTO);
		
		// 결재완료한 직원 검색하는 메소드 선언
		List<Map<String,String>> finishEmplist = this.businessService.getFinishEmp(businessDTO);
		
		mav.addObject("finishEmplist",finishEmplist);
		mav.addObject("salesPersonList",salesPersonList);
		mav.addObject("upDelBusinessList",upDelBusinessList);
		
		return mav;
	}
	

	
}

