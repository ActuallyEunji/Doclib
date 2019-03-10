package com.daum.pro;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;


//인터페이스 선언.
public interface BoardService {
	//***********************************************
	//[검색한 게시판 목록 개수] 리턴하는 메소드 선언
	//***********************************************
	
	int getBoardListCnt( BoardSearchDTO boardSearchDTO);
	
	//***********************************************
	//[검색한 게시판 목록 ] 리턴하는 메소드 선언
	//***********************************************
	List<Map<String,String>> getBoardList (BoardSearchDTO boardSearchDTO);
	
	
	//***********************************************
	//[게시판 글 입력 후 입력 적용 행의 개수] 리턴하는 메소드 선언
	//***********************************************
	int insertBoard( BoardDTO boardDTO);
	

	//***********************************************
	//상세글 화면에서 보여줄[1개 게시판 글 정보] 리턴하는 메소드 선언
	//***********************************************
	BoardDTO getBoardDTO (int board_no);
	
	List<Map<String,String>> getBoardDTO2 (int board_no);
	
	int updateBoard(BoardDTO boardDTO);
	
	int deleteBoard(BoardDTO boardDTO);
	
}