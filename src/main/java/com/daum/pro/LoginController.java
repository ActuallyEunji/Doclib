package com.daum.pro;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.annotation.SessionScope;


//*********************************************************
// 가상 URL 주소로 접속하면 호출되는 메소드를 소유한 [컨트롤러 클래스] 선언
// @Controller를 붙임으로써 [컨트롤러 클래스]임을 지정한다.
//*********************************************************
@Controller
public class LoginController {
	
	@Autowired
	private LoginService loginService;
	
	//======================================================
	// 가상주소 /pro/loginForm.do로 접속하면 호출되는 메소드 선언
	//======================================================
		// 컨트롤러 클래스의 메소드에 @RequestBody가 없고 @RequestMapping가 붙고
		// 메소드의 리턴형이 String일 경우 리턴하는 문자열은 호출할 JSP 페이지명이다.
	@RequestMapping(value="/loginForm.do")
	public String loginForm(
			// HttpSession 객체가 들어올 매개변수 선언
			// 매개변수에 자료형이 HttpSession이면 웹서버가 생성한 HttpSession 객체가 들어온다.
			HttpSession session	
	) {
		// HttpSession 객체에 저장된 기존 로그인 아이디 제거하기 
		//session.removeAttribute("id");
			//+++++++++++++++++++++++++++++++++++++++++++++
			// <참고> HttpSession 객체에 저장된 모든 객체를 제거한다.
			//+++++++++++++++++++++++++++++++++++++++++++++
			 session.invalidate();
		
		// 호출할 JSP 페이지명을 리턴하기 
		return "loginForm";
	}
	
	
	
	//======================================================
	// 가상주소 /erp/loginProc.do로 접속하면 호출되는 메소드 선언
	//======================================================	
	@RequestMapping(
			// 클라이언트의 접속 URL 설정
			value="/loginProc.do"
			// 클라이언트가 파라미터를 보내는 방법은 post로 설정. 즉 post 방식으로 보낸 데이터만 받겠다는 의미
			, method=RequestMethod.POST
			// 클라이언트가 응답받을 수 있는 데이터 형식과 문자셋 지정
			, produces="application/json;charset=UTF-8"
	)
	@ResponseBody	//=>메소드의 리턴값을 JSON으로 변경하여 클라이언트에게 전송하는 어노테이션 설정
	public String loginProc(
			// admin_id 라는 파라미터명의 파라미터값이 들어올 String형 매개변수 선언
			@RequestParam(value="id") String id
			// pwd 라는 파라미터명의 파라미터값이 들어올 String형 매개변수 선언
			, @RequestParam(value="pwd") String pwd
			// is_login 라는 파라미터명의 파라미터값이 들어올 String형 매개변수 선언
			, HttpSession session
	) {
		String empCnt = "";
		try {
			// 매개변수로 들어온 [로그인 아이디, 암호]를  HashMap 객체에 저장하기.
			Map<String,String> emp_id_pwd = new HashMap<String,String>();
			emp_id_pwd.put("id",id);
			emp_id_pwd.put("pwd",pwd);
			System.out.println(emp_id_pwd);
			
			// loginServiceImpl 객체의 메소드 호출로 로그인 아이디 존재 개수 얻기 
			empCnt = this.loginService.getEmpCnt(emp_id_pwd);
			
			// 로그인 아이디 존재 개수가 1이면 
			if(empCnt.substring(0,1)=="1") {
				// Session 객체에 로그인 아이디 저장하기
				session.setAttribute("id", id);
			}
			
	        String[] split_result = empCnt.split(",");

	      
	        if(split_result[0].equals("1")) {
	        	
	           System.out.println("로그인성공");
	           empCnt = split_result[0];
	        		   
		        if(split_result[1].equals("e")) {
		        	
		            session.setAttribute("emp_name", split_result[2]);
		            session.setAttribute("jikup", split_result[3]);
		            session.setAttribute("company_name", split_result[4]);
		            session.setAttribute("company_emp_no", split_result[5]);
		            session.setAttribute("emp_no", split_result[6]);
		            session.setAttribute("company_no", split_result[7]);
		            session.setAttribute("max_company_emp_no", split_result[8]);
		            
		            int emp_no = Integer.parseInt( split_result[6] );

					// loginServiceImpl 객체의 메소드 호출로 각 회사의 선택한 보고서 종류 얻기
					List<Map<String,String>> reportlist = this.loginService.getReport(emp_no);
					System.out.println(reportlist);
		            if(reportlist.size()>0) {
		            	session.setAttribute("reportlist", new ArrayList(reportlist));
		 	           empCnt = (String)(empCnt+reportlist.get(0).get("report_url"));
		            }
		            
		        }
	        
	         
	        		
	      }
	        
		  	
		}
		catch(Exception ex) {
			System.out.println("LoginController.loginProc(~)메소드에서 에러 발생");
		}

		return empCnt;
	}
	
	
	
}
