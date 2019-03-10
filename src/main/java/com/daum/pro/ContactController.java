package com.daum.pro;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ContactController {
	
	// 속성변수 contactService 선언하고, ContactService인터페이스를 구현한 클래스를 객체 생성해 저장.
	// ContactService 인터페이스를 구현한 클래스명은 알 필요가 없다
	
	
	@Autowired
	private ContactService contactService;
	
	@ModelAttribute("saup_fieldList") 
	public List<Map<String,String>> getSaup_fieldList(){
		
		//db에 있는 사업분야 목록을 검색해 List<Map<String,String>>객체에 저장.
		List<Map<String,String>> saup_fieldList = this.contactService.getSaup_fieldList();
		return saup_fieldList;
	}
	
	@ModelAttribute("saup_fieldMap") // 메소드앞에 붙을때와 매개변수 앞에 붙을때가 있다. -> 결국 키값지정임.
	public Map<String,String> getSaup_fieldMap(){
		
		List<Map<String,String>> saup_fieldList = getSaup_fieldList();
		Map<String,String> saup_fieldMap = new HashMap<String,String>();
		for(Map<String,String> tmp : saup_fieldList) {
			saup_fieldMap.put(tmp.get("saup_field_code"),tmp.get("saup_field_name"));
		}
		return saup_fieldMap;
	}
	
	// 컨트롤러 클래스의 메소드에 @ResponseBody가 없고, @RequestMapping이 붙고
	// 메소드의 리턴형이 String일 경우 리턴하는 문자열은 호출할 JSP페이지명이다.
	
	@RequestMapping(value="/contactSearchForm.do")
	public ModelAndView contactSearchForm(
			// 모든 파라미터값이 저장된 contactSearchDTO 객체를 매개변수로 선언
			// 이 파라미터값들은 연락처 검색 화면을 구현하는데 필요한 데이터들이다.
			@ModelAttribute("contactSearchDTO") ContactSearchDTO contactSearchDTO 
			, HttpSession session			//로그인거치기1
			
			) {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("contactSearchForm");
		
		try {
			contactSearchDTO.setEmp_no(Integer.parseInt((String)session.getAttribute("emp_no")));
			contactSearchDTO.setCompany_no(Integer.parseInt((String)session.getAttribute("company_no")));
			// ContractServiceImpl 객체의 메소드 호출로 검색한 연락처 총 개수를 얻기
			int contactListAllCnt = this.contactService.getContactListAllCnt( contactSearchDTO );
			
			// 페이징 처리 관련 데이터를 얻기 위해 PageingData2클래스의 getPageingData 메소드를 호출하여 
			// 페이징 처리 관련 데이터를 HashMap 객체로 얻기
			int selectPageNo = contactSearchDTO.getSelectPageNo();
			int rowCntPerPage = contactSearchDTO.getRowCntPerPage();
			Map<String,Integer> pageingData = PageingData2.getPageingData(contactListAllCnt, selectPageNo, rowCntPerPage,10);
			
			contactSearchDTO.setSelectPageNo(pageingData.get("selectPageNo"));
			contactSearchDTO.setBeginRowNo(pageingData.get("beginRowNo"));
			contactSearchDTO.setEndRowNo(pageingData.get("endRowNo"));
			
			
			//검색 총 개수에 따른 선택 페이지 번호를 보정하여 BoardSearchDTO 객체에 재입력해준다.
			// 이 보정 작업은 getPageingData 메소드 호출 시 작업해 준다.
			
			
			// ContactServiceImpl 객체의 메소드 호출로 [검색한 연락처 목록] 얻기
			List<Map<String,String>> contactList = this.contactService.getContactList(contactSearchDTO);
			
			// ModelAndView 객체에 [검색한 연락처 총 개수] 를 저장.
			// ModelAndView 객체에 저장된 데이터는 호출할 jsp에서 꺼내어 html 코딩과 어울리게 된다.
			mav.addObject("contactListAllCnt",contactListAllCnt);
			
			// ModelAndView 객체에 [검색한 연락처 목록]을 저장.
			mav.addObject("contactList",contactList);
			
			// ModelAndView 객체에 [페이징 처리 관련 데이터]가 저장된 HashMap 객체를 저장.
			mav.addObject("pageingData",pageingData);
			
		}catch (Exception e) {
			System.out.println("ContactController.contactSearchForm() 메소드 호출 시 에러발생");
		}
		return mav;
	}
	
	//가상주소 /erp/contactRegForm.do 로 접속하면 호출되는 메소드 선언
	
	// 컨트롤러 클래스의 메소드에 @ResponseBody가 없고, @RequestMapping이 붙고
	// 메소드의 리턴형이 String일 경우 리턴하는 문자열은 호출할 JSP페이지명이다.
	@RequestMapping(value="/contactRegForm.do")
	public String contactRegForm() {
		return "contactRegForm";
	}
	
	  // /erp/contactRegProc.do로 접근시 호출되는 메소드 선언
    // @ResponseBody를 붙임으로서 이 메소드가 리턴하는 데이터가 JSON으로 변경되어 클에게 전송된다.
	@RequestMapping( 
       // 클의 접속 URL 설정
       value="/contactRegProc.do"
       // 클이 파라미터를 보내는 방법은 post로 설정, 즉 post 방식으로 보낸 데이터만 받겠다는 의미
       , method=RequestMethod.POST
       // 클이 응답받을 수 있는 데이터 형식과 문자셋 지정
       , produces="application/json;charset=UTF-8"       
    )   
	@ResponseBody   // 메소드의 리턴값을 JSON으로 변경하여 클에게 전송하는 어노테이션 설정
	public int insertContact(
			//------------------------------------------
			// 모든 파라미터값이 저장된 [contactDTO 객체]를 매개변수로 선언
			//------------------------------------------
			@ModelAttribute("contactDTO") ContactDTO contactDTO
			, HttpSession session
     ) {
		contactDTO.setEmp_no(Integer.parseInt((String)session.getAttribute("emp_no")));
	    // 연락처 입력 적용 행의 개수 저장 변수 선언
	    int contactRegCnt = 0;
	    try {
	        //------------------------------------------
	        // ContactServiceImpl 객체의 메소드 호출로 연락처 입력하고 입력 행의 개수 얻기
	        //------------------------------------------
	    	contactRegCnt = this.contactService.insertContact(contactDTO);
	       //contactRegCnt=2;
	    }catch(Exception ex) {
	       System.out.println( "ContactController.insertContact(~) 메소드 예외 발생");
	       contactRegCnt=-1;
	    }
	    return contactRegCnt;
 
	}
	
	@RequestMapping(value="/contactUpDelForm.do" ,method=RequestMethod.POST)
	public ModelAndView contactUpDelForm(
			@ModelAttribute("contactDTO") ContactDTO contactDTO
				, HttpSession session
	) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("contactUpDelForm");

		int emp_no = Integer.parseInt((String)session.getAttribute("emp_no"));
		contactDTO.setEmp_no(emp_no);
		
		try {
			// [ContactServiceImpl] 의 getContact 메소드 호출로 [수정/삭제할 연락처] 데이터 얻기
			// ModelAndView 객체에 호출 JSP 페이지에서 반영할 [수정/삭제할 연락처] 저장하기
			Map<String,String> contact = this.contactService.getContact(contactDTO);
			mav.addObject("contact", contact);
		}catch (Exception e) {
			// TODO: handle exception
			System.out.println("ContactController.contactUpDelForm() 메소드 예외 발생!");
		}
		// ModelAndView 객체 리턴
		return mav;
	}


	//**************************************************************************
	// /pro/contactUpDelProc.do 로 접근시 호출되는 메소드 선언
	//**************************************************************************
	@RequestMapping(           
			// 클의 접속 URL 설정
			value = "/contactUpDelProc.do"     
			// 클이 파라미터를 보내는 방법은 post로 설정. 즉 post 방식으로 보낸 데이터만 받겠다는 의미
			, method=RequestMethod.POST         
			// 클이 응답받을 수 있는 데이터 형식과 문자셋 지정
			, produces="application/json;charset=UTF-8" 
			)
	@ResponseBody    
	public int contactUpDelProc(
			//-----------------------------------------------------
			// 모든 파라미터값이 저장된 [ContactDTO 객체]를 매개변수로 선언
			// upDel 라는 파라미터명의 파라미터값을 저장할 String 형 매개변수 선언
			//-----------------------------------------------------
			@ModelAttribute("contactDTO") ContactDTO contactDTO
			,@RequestParam( value="upDel", required=false )   String upDel
			){	
		//------------------------------
		// 수정 또는 삭제 실행 후 수정 또는 삭제 적용 행의 개수 저장 변수 선언
		//------------------------------
		int contactUpDelCnt = 0;
		try{
			//------------------------------
			// 연락처 수정 모드 이면
			// [ContactServiceImpl 객체]의 메소드 호출로 [연락처 수정]한 후 적용행의 개수 얻기
			//------------------------------
			if( upDel.equals("up") ){			
				contactUpDelCnt = this.contactService.updateContact( contactDTO  );
			}
			//------------------------------
			// 연락처 삭제 모드 이면
			// [ContactServiceImpl 객체]의 메소드 호출로 [연락처 삭제]한 후 적용행의 개수 얻기
			//------------------------------
			else{
				contactUpDelCnt = this.contactService.deleteContact( contactDTO.getContact_no( )  );
			}
		}catch(Exception ex){
			contactUpDelCnt = -1;
			System.out.println( "ContactController.contactUpDelProc(~) 메소드 예외 발생!");
		}  
		//------------------------------
		// 수정 또는 삭제 실행 후 수정 또는 삭제 적용 행의 개수
		//------------------------------ 
		return contactUpDelCnt;
	}
	
	// 현재 이 [컨트롤러 클래스] 내의 @RequestMapping 이 붙은 메소드 호출 시 예외발생하면 호출되는 메소드 선언
	@ExceptionHandler(Exception.class) 
	public String handleException( HttpServletRequest request) {
		// HttpServletRequest 객체에 클라이언트의 URL주소를 담기
		request.setAttribute("msg", request.getRequestURI()+ "접속 시 에러 발생");
		// 호출할 error.jsp 페이지를 문자열로 리턴
		return "error";
	}


}
