package com.daum.pro;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.daum.pro.JoinListDTO;

@Controller
public class JoinController {

	@Autowired
	private JoinService joinService;
	
	//======================================================
	// 가상주소 /pro/joinForm.do로 접속하면 호출되는 메소드 선언
	//======================================================
	@RequestMapping(value="/approval_id_reg_form.do")
	public ModelAndView gojoinForm(
			
	) {
		
		// ModelAndView 객체생성
		ModelAndView mav = new ModelAndView();
		
		// ModelAndView 객체에 호출 JSP 페이지명을 저장하기 (호출할 JSP페이지의 경로와 확장자명은 Spring이 찾아줌)
		mav.setViewName("approval_id_reg_form");
		
		// ModelAndView 객체 리턴
		return mav;
				
	}
	
	
	//======================================================
	// 가상주소 /pro/joinProc.do로 접속하면 호출되는 메소드 선언
	//======================================================
	@RequestMapping(
			value="/approval_id_reg_Proc.do"		// 클라이언트 접속 URL 설정
			, method=RequestMethod.POST		// 클라이언트가 파라미터를 보내는 방법은 post로 설정. 즉 post 방식으로 보낸 데이터만 받겠다는 의미
			, produces="application/json;charset=UTF-8"		// 클라이언트가 응답받을 수 있는 데이터 형식과 문자셋 저장 
		)
		@ResponseBody		//=>메소드의 리턴값을 JSON으로 변경하여 클라이언트에게 전송하는 어노테이션 설정 
		public int joinCompany(
				@ModelAttribute("joinListDTO") JoinListDTO joinListDTO
		) {
			int result = 0;
			try {

				int searchIdCnt = this.joinService.searchemp_id(joinListDTO);
				if(searchIdCnt>0) {
					return -2;
				}
				
				// JoinServiceImpl 객체의 joinCompany 메소드 호출로 회원가입하고 입력성공 행의 개수 얻기 
				int joinCompanyCnt = this.joinService.joinCompany(joinListDTO);
				result = joinCompanyCnt;
		
			}
			catch(Exception ex) {
				// 예외 발생할 시 실행할 코드 설정
				result = -1;
				System.out.println("JoinController.joinCompany(~) 메소드 호출 시 에러발생");
			}
			return result;
			
		}
}
