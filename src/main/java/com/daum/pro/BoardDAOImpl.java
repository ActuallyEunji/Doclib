package com.daum.pro;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDAOImpl implements BoardDAO {
	// 속성변수 sqlSession 선언하고, [SqlSessionTemplate 객체]를 생성해 저장
		// @Autowired => 속성변수에 붙은 자료형이 [인터페이스]면 이를 구현한[클래스]를 객체화 하여 저장한다.
		// @Autowired => 속성변수에 붙은 자료형이 [클래스]면 이를 객체화 하여 저장한다.
	@Autowired
	private SqlSessionTemplate sqlSession;
	   
	   // [검색한 게시판 목록 개수] 리턴하는 메소드 선언
	   public int getBoardListCnt(BoardSearchDTO boardSearchDTO) {
	      int boardListCnt = sqlSession.selectOne(		
	         "com.daum.pro.BoardDAO.getBoardListCnt"       //실행할 SQL 구문의 위치 지정
	         , boardSearchDTO                        		//실행할 SQL 구문에서 사용할 데이터 설정
	      );

		return boardListCnt; 
	}
	   //***************************************
	   //[검색한 게시판 목록]리턴하는 메소드 선언
	   //***************************************
	   public List<Map<String,String>> getBoardList( BoardSearchDTO boardSearchDTO ){
		    //--------------------------------------------------------------------------------------
		    //[SqlSessionTemplate 객체]의 selectList(~,~)메소드를 호출하여 [n행 검색 결과물]을 List<Map<String,String>>객체로 리턴하기
		    //--------------------------------------------------------------------------------------
		   List<Map<String,String>> boardList = sqlSession.selectList(
				   "com.daum.pro.BoardDAO.getBoardList"		
				   , boardSearchDTO								
				   );
		   return boardList;
	   }
	   //***************************************
	   //[게시판 글 입력 후 입력 적용 행의 개수]리턴하는 메소드 선언
	   //***************************************
	   public int insertBoard(BoardDTO boardDTO) {
		   int boardRegCnt = sqlSession.insert(					
			 "com.daum.pro.BoardDAO.insertBoard"				
			, boardDTO											
		);
		   return boardRegCnt;
	   }
	   //***************************************
	   //[1개 게시판 글 출력번호 수정하고 수정 행의 개수] 리턴하는 메소드 선언
	   //***************************************
	   public int updatePrint_no(BoardDTO boardDTO) {
		   int updatePrint_noCnt = sqlSession.update(
			 "com.daum.pro.BoardDAO.updatePrint_no"			// 실행할 SQL 구문의 위치 지정		
			, boardDTO											// 실행할 SQL 구문에서 사용할 데이터 설정.
		);
		   return updatePrint_noCnt;
	   }
	   //***************************************
	   //[게시판 글 조회수 수정하고 수정행의 개수] 리턴하는 메소드 선언
	   //***************************************
	   public int updateReadcount(int board_no) {
		   int readcount = sqlSession.update(				
			 "com.daum.pro.BoardDAO.updateReadcount"				
			, board_no	
			);
		   return readcount;
	   }
	   
	   //***************************************
	   //상세글 화면에서 보여줄[1개 게시판 글 정보] 리턴하는 메소드 선언
	   //***************************************
	   public BoardDTO getBoardDTO(int board_no) {
		   System.out.println(111111);
		   BoardDTO boardDTO = sqlSession.selectOne(				
			 "com.daum.pro.BoardDAO.getBoardDTO"				
			, board_no	
			);
		   return boardDTO;
	   }
	   
	   public List<Map<String,String>> getBoardDTO2(int board_no) {
		   System.out.println(222222);
		   List<Map<String,String>> boardDTO = sqlSession.selectList(				
			 "com.daum.pro.BoardDAO.getBoardDTO2"				
			, board_no	
			);
		   return boardDTO;
	   }

		public int updateBoard(BoardDTO boardDTO) {
			int updateBoardCnt = sqlSession.update("com.daum.pro.BoardDAO.updateBoard", boardDTO);
			return updateBoardCnt;
		}

		public int deleteBoard(BoardDTO boardDTO) {
			int deleteBoardCnt = sqlSession.delete("com.daum.pro.BoardDAO.deleteBoard", boardDTO);
			
			return deleteBoardCnt;
		}
		
		public int deleteBoard2(BoardDTO boardDTO) {
			int deleteBoardCnt = sqlSession.delete("com.daum.pro.BoardDAO.deleteBoard2", boardDTO);
			
			return deleteBoardCnt;
		}
}
