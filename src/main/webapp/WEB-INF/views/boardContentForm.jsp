<!-- JSP 기술의 한 종류인 [page Directive]를 이용하여 현 JSP 페이지 처리방식 선언하기 -->
<!-- 현재 이 JSP 페이지 실행 후 생성되는 문서는 HTML이고, 이 문서는 UTF-8 방식으로 인코딩한다고 설정 -->
<!-- ******************************************************************************** -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      
<%@include file="/WEB-INF/views/common2.jsp"%>

   <c:if test="${empty boardDTO}">
      <script>
         alert("게시판 글이 삭제되었습니다.");
         location.replace("/pro/boardList.do");
      </script>
   </c:if>

<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      
      <title>게시판</title>
      
      <script>
      
	      //=================================
	      // 본문 입력 화면으로 이동하는 함수 선언
	      //=================================
	      function goBoardRegForm(){
	         document.boardContentForm.submit();
	      }


         
         //=================================
         // 게시판 댓글수정 화면으로 이동하는 함수 선언
         //=================================
         function goReContentForm(board_no, writer, group_no){
            $("[name=goReUpDelForm]").find("[name=board_no]").val(board_no);
            $("[name=goReUpDelForm]").find("[name=writer]").val(writer);
            $("[name=goReUpDelForm]").find("[name=group_no]").val(group_no);
            document.goReUpDelForm.submit();
         }
         
         //=================================
         // 게시판 댓글 입력 화면으로 이동하는 함수 선언
         //=================================
         function goReRegForm(board_no){
        	 $("[name=goReplyRegForm]").find("[name=board_no]").val(board_no);
        	 document.goReplyRegForm.submit();
         }
         
      </script>
   </head>
<!-- ===================================================================================== -->   
   <body>
      <center>
      <form class="boardContentForm" name="boardContentForm" method="post" action="/pro/boardRegForm.do">
         <br><center> <h3 align="top"><b>[본문]</b></h3> <br>
         <table class="tbcss1" width="620px" >
            <tr align="center">
               <th class="real_table" width=60>글번호
                  <td class="real_td" width=150>${boardDTO.board_no}
               <th class="real_table" width=60>조회수
                  <td class="real_td" width=150>${boardDTO.readcount}
            <tr align="center">
               <th class="real_table">작성자
                  <td class="real_td">${boardDTO.writer}
               <th class="real_table">작성일
                  <td class="real_td">${boardDTO.reg_date}
            <tr>
               <th class="real_table">글제목
                  <td class="real_td" colspan="3">${boardDTO.subject}
            <tr>
               <th class="real_table">글내용
                  <td class="real_td" colspan="3">
                  ${boardDTO.content}</td>
                  
         <input type=hidden name="selectPageNo" value="${requestScope.selectPageNo}">
         <input type=hidden name="board_no" value="${boardDTO.board_no}"> 
         <input type=hidden name="emp_no" value="${sessionScope.emp_no}"> 
         
         </table><br>
         <c:if test="${boardDTO.writer_no == sessionScope.emp_no}">
            <span onclick="goReContentForm(${boardDTO.board_no},${sessionScope.emp_no},${boardDTO.group_no})" class="btn btn1">글 수정/삭제</span>&nbsp;
         </c:if>
         <span onclick="goBoardRegForm()" class="btn btn1">댓글쓰기</span>&nbsp;
         <spant onclick="document.boardListForm.submit();" class="btn btn1">글목록보기</spant>
         
         
         <table>
            <tr height=3>
               <td>
         </table><br><br><br>
         <c:if test="${!empty boardDTO2}">
         <h3 align="top"><b>[댓글]</b></h3>
         </c:if><br>
         <c:forEach var="list" items="${boardDTO2}" varStatus="Status">
	            <table width="600px">
	               <tr align="center">
	               <td class="real_table" height="20px"><b>${list.writer_name}</b> (${list.reg_date}) :</td>
	               <td align="left" class="real_td" width="300px" height="20px">
	              		<c:forEach begin="1" end="${list.print_level}">
                           &nbsp;&nbsp;&nbsp;&nbsp;
                        </c:forEach>
                        <c:if test="${list.print_level>1}">&nbsp;&nbsp;▶</c:if>
	               		${list.content}
	               </td>   
	               <td align="left" class="real_td" width="150px" height="20px">
	               		<center>
		               <c:if test="${sessionScope.emp_no==list.writer}">
		               <input type="button" name="rrr" class="btn btn1"  value="수정/삭제" onclick="goReContentForm(${list.board_no},${list.writer},${list.group_no})">
		               </c:if>
		               <input type="button" name="ddd" class="btn btn1"  value="댓글쓰기" onclick="goReRegForm(${list.board_no})">
		               </center>
		           </td>   
	            </table>
         </c:forEach>
         
         <br>
      </form>
      
      
      <form name="goReUpDelForm" method="post" action="/pro/boardUpDelForm.do">
         <input type="hidden" name="writer">
         <input type="hidden" name="board_no">
         <input type="hidden" name="group_no">
      </form>
      
       <form name="goReplyRegForm" method="post" action="/pro/boardRegForm.do">
         <input type="hidden" name="board_no">
      </form>     
      
      
      <form name="boardListForm" action="/pro/boardList.do">
         
      </form>
      
   </body>
</html>