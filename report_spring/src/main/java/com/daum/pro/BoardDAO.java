package com.daum.pro;

import java.util.List;
import java.util.Map;

public interface BoardDAO {
	//****************************************************
	//[검색한 게시판 목록 개수] 리턴하는 메소드 선언
	//****************************************************
	int getBoardListCnt( BoardSearchDTO boardSearchDTO );
    //***************************************
    //[검색한 게시판 목록]리턴하는 메소드 선언
    //***************************************
    public List<Map<String,String>> getBoardList( BoardSearchDTO boardSearchDTO );
    //***************************************
    //[게시판 글 입력후 입력 적용행의 개수]리턴하는 메소드 선언
    //***************************************
    int updatePrint_no(BoardDTO boardDTO);
    //***************************************
    //[1개 게시판 글 출력번호 수정하고 수정 행의 개수]리턴하는 메소드 선언
    //***************************************
    int insertBoard(BoardDTO boardDTO);
    //***********************************************
	//상세글 화면에서 보여줄[1개 게시판 글 정보] 리턴하는 메소드 선언
	//***********************************************
	BoardDTO getBoardDTO (int board_no);
    //***********************************************
	//상세글 화면에서 보여줄[1개 댓글 정보] 리턴하는 메소드 선언
	//***********************************************
	List<Map<String,String>> getBoardDTO2 (int board_no);
    //***********************************************
	//[1개 게시판 글 조회수 수정하고 수정행의 개수] 리턴하는 메소드 선언
	//***********************************************
	int updateBoard(BoardDTO boardDTO);
    //***********************************************
	//[1개 게시판 글 삭제하고 삭제행의 개수] 리턴하는 메소드 선언
	//***********************************************
	int deleteBoard(BoardDTO boardDTO);
    //***********************************************
	//[1개 게시판 댓글 삭제하고 삭제행의 개수] 리턴하는 메소드 선언
	//***********************************************
	int deleteBoard2(BoardDTO boardDTO);
	
	int updateReadcount(int board_no);
	
	
}