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
public class BoardController {
	
	@Autowired
	private BoardService boardService; 
	
	
	@RequestMapping(value="/boardList.do")
	public ModelAndView getBoardList(
			@ModelAttribute("boardListDTO") BoardSearchDTO boardSearchDTO
			, HttpSession session
	) { 
		
		ModelAndView mav = new ModelAndView();
	
		//객체에 호출 jsp 페이지명 저장
		mav.setViewName("boardList"); 
		
		
		try {
			
			String emp_no = (String) session.getAttribute("emp_no");
			boardSearchDTO.setEmp_no( Integer.parseInt(emp_no,10) );
			
			int boardListAllCnt = this.boardService.getBoardListCnt( boardSearchDTO );
									//위에서 선언한 boardService변수.
			
			int selectPageNo = boardSearchDTO.getSelectPageNo();
			int rowCntPerPage = boardSearchDTO.getRowCntPerPage();
			
			Map<String, Integer> pageingData = PageingData2.getPageingData(boardListAllCnt, selectPageNo, rowCntPerPage, 10);
			// 검색 총 개수와 선택 페이지와 관계를 보정하여 수정된 선택 페이지 번호를
			// BoardSearchDTO 객체에 재입력해줌.
			// 이 보정 작업은 getPageingData 메소드 호출 시 작업해준다.
			boardSearchDTO.setSelectPageNo(pageingData.get("selectPageNo"));
			// 페이지 번호에 맞는 시작행 번호를 구해 boardSearchDTO 객체에 저장
			boardSearchDTO.setBeginRowNo(pageingData.get("beginRowNo"));
			// 페이지 번호에 맞는 끝행 번호를 구해 boardSearchDTO 객체에 저장
			boardSearchDTO.setEndRowNo(pageingData.get("endRowNo"));
			
			//BoardServiceImpl 객체의 getBoardList(BoardListDTO)  메소드 호출로 검색한 게시판목록 얻기
			List<Map<String,String>> boardList = this.boardService.getBoardList( boardSearchDTO );
			
			// ModelAndView 객체에 [검색한 게시판 총 개수] 저장하기.
			mav.addObject("boardListAllCnt",boardListAllCnt);
			
			// ModelAndView 객체에 검색한 게시판 목록 저장
			mav.addObject("boardList",boardList);
			
			// ModelAndView 객체에 페이징 처리 관련 데이터 저장
			mav.addObject("pageingData",pageingData);
			
		}catch (Exception e) {
			
			System.out.println("BoardController.getBoardList(~) 메소드 호출 시 에러발생");
			mav.setViewName("error");
			mav.addObject("msg", "BoardController.getBoardList(~) 메소드 호출 시 에러발생");
		}
		return mav;
		
		
	}

	
	
	@RequestMapping(value="/boardRegForm.do")
	public ModelAndView goBoardRegForm(
			@ModelAttribute("boardDTO") BoardDTO boardDTO   
			//@RequestParam(value="b_no", required=false) String b_no
			)  { 
		ModelAndView mav = new ModelAndView();
		//호출 jsp 페이지명을 저장
		mav.setViewName("boardRegForm");
		
		return mav;
	}
	
	
	// /pro/boardREgProc.do로 접근하면 호출되는 메소드 선언
	
	@RequestMapping(
			// 클래스의 접속 url 설정
			value="/boardRegProc.do"
			// 클래스가 파라미터를 보내는 방법은 post로 설정, 즉 post방식으로 보낸 데이터만 받겠다는 의미
			,method=RequestMethod.POST
			// 클래스가 응답받을 수 있는 데이터 형식과 문자셋 지정
			,produces="application/json;charset=UTF-8"
			)
	@ResponseBody  // 메소드의 리턴값을 JSON으로 변경하여 클래스에게 전송하는 어노테이션 설정
	public int insertBoard(
		@ModelAttribute("boardDTO") BoardDTO boardDTO   
		//메소드 호출 전 setter메서드가 작동될 때 int형이라 오류가 남.객체형이어야함(null값을 넣어줄때가 있기 때문에)
	){
		int result = 0;
		
		try {
			//BoardServiceImpl객체의 insertBoard메소드 호출로 게시판 입력하고 입력 성공 행의 개수 얻기
			int boardRegCnt = this.boardService.insertBoard(boardDTO);
			result = boardRegCnt;
		}catch (Exception e) {
			result = -1;
			System.out.println("BoardController.insertBoard()메소드 예외발생");
		}
		
		return result;
	}
	
	
	
	@RequestMapping(value="/boardContentForm.do",method=RequestMethod.POST)
	public ModelAndView goBoardContentForm(@RequestParam(value="board_no") int board_no, HttpSession session) {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("boardContentForm");
		
		try {
			// 본문 select
			BoardDTO boardDTO = this.boardService.getBoardDTO(board_no);
			mav.addObject("boardDTO",boardDTO);
			
			// 댓글 select
			List<Map<String,String>> boardDTO2 = this.boardService.getBoardDTO2(board_no);
			mav.addObject("boardDTO2",boardDTO2);
			
		}catch (Exception e) {
			System.out.println("BoardController.goBoardContentForm() 메소드 예외 발생");
		}
		return mav;
	}
	
	
	
	//가상주소  /boardUpDelForm.do로 접근하면 호출되는 메소드 선언
	@RequestMapping(value="/boardUpDelForm.do", method=RequestMethod.POST)
	public ModelAndView goBoardUpDelForm(
							@RequestParam(value="board_no") int board_no
	)  { 
		
		ModelAndView mav = new ModelAndView();
		//호출 jsp 페이지명을 저장
		mav.setViewName("boardUpDelForm");
		
		try {
			
			//BoardServiceImpl객체의 getBoard메소드 호출로 수정/삭제 할 1개의 게시판 글 정보 얻기
			BoardDTO boardDTO = this.boardService.getBoardDTO(board_no);
			// ModelAndView 객체에 호출 jsp 페이지에 반영할 수정/삭제 할 1개의 게시판 글 정보 저장
			mav.addObject("boardDTO",boardDTO);
			
			List<Map<String,String>> boardDTO2 = this.boardService.getBoardDTO2(board_no);
			mav.addObject("boardDTO2",boardDTO2);
			
		}catch (Exception e) {
			System.out.println("BoardController.goBoardUpDelForm() 메소드에서 예외발생");
		}
		return mav;
	}
	
	
	
	
	@RequestMapping(
			value="/boardUpDelProc.do"					//클래스의 접속 url
			, method=RequestMethod.POST					//클래스가 파라미터를 보내는 방법은 post로 설정, 즉 post방식으로 보낸 데이터만 받겠다
			, produces="application/json;charset=UTF-8")//클래스가 기본형 또는 json으로 응답받을 수 있게 지정
	@ResponseBody	// 메소드의 리턴값을 json으로 변경하여 클래스에게 전송하는 어노테이션 설정
	public int boardUpDelProc(
			@ModelAttribute("boardDTO") BoardDTO boardDTO 	//파라미터 값을 저장할 BoardDTO 객체를 매개변수로 선언
			, @RequestParam(value="upDel") String upDel		//upDel이라는 파라미터명의 파라미터값을 받은 String 형 매개변수 선언
			, HttpSession session
	) {
		
		int upDelCnt = 0;
		
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("boardUpDelProc");
		
		boardDTO.setEmp_no(Integer.parseInt((String)session.getAttribute("emp_no")));
		
		try {
			// MAV객체에 호출 jsp페이지에 반영할 정보 저장
			//만약 수정모드이면 수정 실행하고 수정 적용행의 개수를 저장
			if(upDel.equals("up")) {
				upDelCnt = this.boardService.updateBoard(boardDTO);
			}
			// 만약 삭제모드이면 삭제 실행하고 삭제 적용행의 개수를 지정
			else {
				upDelCnt = this.boardService.deleteBoard(boardDTO);
			}
		}catch (Exception e) {
			upDelCnt = -3;
			System.out.println("BoardController.boardUpDelProc() 메소드 예외 발생!");
		}
		return upDelCnt;
		
	}
 	
}
