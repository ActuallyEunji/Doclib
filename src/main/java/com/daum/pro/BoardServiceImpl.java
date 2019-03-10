package com.daum.pro;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

//===============================================================
// [서비스클래스]인 [ BoardServiceImpl 클래스] 선언
//===============================================================
@Transactional
@Service

public class BoardServiceImpl implements BoardService {
   @Autowired
   private BoardDAO boardDAO;
   
   // [검색한 게시판 목록 개수] 리턴하는 메소드 선언
   public int getBoardListCnt( BoardSearchDTO boardSearchDTO ) {
      int boardListCnt = this.boardDAO.getBoardListCnt( boardSearchDTO );
      return boardListCnt;
   }
   //***************************************
   //[검색한 게시판 목록]리턴하는 메소드 선언
   //***************************************
   public List<Map<String,String>> getBoardList( BoardSearchDTO boardSearchDTO ){
	   List<Map<String,String>> boardList = this.boardDAO.getBoardList( boardSearchDTO );
	   return boardList;
   }

   //***************************************
   //[1개 게시판 글 입력 후 입력 적용 행의 개수]리턴하는 메소드 선언
   //***************************************
   public int insertBoard(BoardDTO boardDTO) {
	   if(boardDTO.getBoard_no()!=null && boardDTO.getBoard_no().length()>0) {
		   int updatePrint_noCnt = this.boardDAO.updatePrint_no(boardDTO);
   		}
	   int boardRegCnt = this.boardDAO.insertBoard(boardDTO);
	   return boardRegCnt;
   }
   
   //***************************************
   //상세글 화면에서 보여줄[1개 게시판 글 정보] 리턴하는 메소드 선언
   //***************************************
   public BoardDTO getBoardDTO (int board_no) {
	   int readcount = this.boardDAO.updateReadcount(board_no);
	   BoardDTO boardDTO = this.boardDAO.getBoardDTO(board_no);
	   return boardDTO;
   }
   
   //***************************************
   //상세글 화면에서 보여줄[1개 댓글 정보] 리턴하는 메소드 선언
   //***************************************
   public List<Map<String,String>> getBoardDTO2 (int board_no) {
	   List<Map<String,String>> boardDTO = this.boardDAO.getBoardDTO2(board_no);
	   return boardDTO;
   }
   
   //***************************************
   //글 수정하는 메소드 선언
   //***************************************
	public int updateBoard(BoardDTO boardDTO) {
		int updateBoardCnt = this.boardDAO.updateBoard(boardDTO);
		return updateBoardCnt;
	}
	
   //***************************************
   //글 삭제하는 메소드 선언
   //***************************************
	public int deleteBoard(BoardDTO boardDTO) {
		int deleteBoardCnt = 0;
		// 본문 삭제하는 메소드 선언
		if(boardDTO.getBoard_no().equals(boardDTO.getGroup_no() ) ) {
			deleteBoardCnt = this.boardDAO.deleteBoard(boardDTO);
		}
		else {
			deleteBoardCnt = this.boardDAO.deleteBoard2(boardDTO);
		}
		return deleteBoardCnt;
	}
	
   
   

}