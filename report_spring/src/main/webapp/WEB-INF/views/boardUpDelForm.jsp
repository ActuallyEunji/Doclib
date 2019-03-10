<!-- JSP 기술의 한 종류인 [page Directive]를 이용하여 현 JSP 페이지 처리방식 선언하기 -->
<!-- 현재 이 JSP 페이지 실행 후 생성되는 문서는 HTML이고, 이 문서는 UTF-8 방식으로 인코딩한다고 설정 -->
<!-- ******************************************************************************** -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      
<%@include file="/WEB-INF/views/common2.jsp"%>

<!-- 만약 RequsetServlet 객체에 boardDTO라는 키값으로 저장된 놈이 null값이면 (삭제된 글이면) -->
<!-- 경고 메세지 보이고 게시판 목록보기 화면으로 이동하기 -->
<c:if test="${empty requestScope.boardDTO}">
   <script language="JavaScript">
      alert("게시판 글이 삭제 되었습니다");
      location.replace("/pro/boardList.do")
   </script>
</c:if>
<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <script>

         // [게시판 수정/삭제화면]에 입력된 데이터의 유효성 체크 함수 선언
         function checkBoardUpDelForm(upDel){
            if(upDel == "del"){
               document.boardUpDelForm.upDel.value="del";
               // $("[name=upDel]").val("del"); 도 같은 코딩이다.
               if(confirm("정말 삭제하시겠습니까?")==false){return;}
            }
            else if(upDel=="up"){
               var subject = $("[name=subject]").val();
               <c:if test="${empty boardDTO.board_no}">
               if(subject.split(" ").join("")==""){
                  alert("제목을 입력해주십시오.");
                  $("[name=subject]").focus();
                  return;
               }
               </c:if>
               var content = $("[name=content]").val();
               if(content.split(" ").join("")==""){
                  alert("내용을 입력해주십시오.");
                  $("[name=content]").focus();
                  return;
               }
               if(confirm("정말 수정하시겠습니까?")==false){return;}
            }
            
            // 현재 화면에서 페이지 이동 없이 서버쪽 "/pro/boardUpDelProc.do"를 호출하여
            // [게시판 수정/삭제 행 적용 갯수]에 따른 명령어가 내장된 html소스를 문자열로 받는다.
            $.ajax({
               url : "/pro/boardUpDelProc.do",
               type : "post",
               data : $("[name=boardUpDelForm]").serialize(),
               dataType:"html",
               success : function(upDelCnt) {
                  if(upDelCnt > 0 ){
                     alert("수정/삭제 성공");
                  }
                  else if(upDelCnt == 0){
                     alert("수정/삭제 실패.(암호비일치 or 답글이 있는글 or 이미 삭제된 글)");
                  }
                  else{
                     alert("관리자에게 문의 바람");
                  }
                  location.replace("/pro/boardList.do");
               },
               error : function() {
                  alert("서버와 비동기 방식 통신 실패!");

               }
            });
         }
         
         function goBoardList2(){
            document.BoardList2.submit();
         }
         
      </script>
   </head> 
   
   <body>
      <center>
   
      
      <!-- [게시판 목록]을 출력하는 form 태그 선언 -->
      <form method="post" name="boardUpDelForm" action="/pro/boardUpDelProc.do">
         <br><h3 align="top"><b>[글 수정/삭제]</b></h3><br>
         <table class="tbcss1">
            <tr>
               <th class="real_table">작성자</th>
               <td class="real_td">${sessionScope.emp_name}
               </td>
            </tr>
            <c:if test="${empty boardDTO.board_no}">
            <tr>
               <th class="real_table">제 목</th>
               <td class="real_td">
                  <input type="text" size="48" maxlength="50" name ="subject" value="${boardDTO.subject}">
               </td>
            </tr>
            </c:if>
            <c:if test="${!empty boardDTO.board_no}">
            	<input type="hidden" size="48" maxlength="50" name="subject" value="">
            </c:if>
            <tr>
               <th class="real_table">내용 </th>
               <td class="real_td"><textarea name="content" rows="13" cols="50">${boardDTO.content}</textarea>
               </td>
            </tr>
         </table>
         <table><tr height=4><td></table>
         
          <input type="hidden" name="group_no" value="${boardDTO.group_no}">
         <input type="hidden" name="board_no" value="${boardDTO.board_no}">
         <input type="hidden" name="upDel" value="up">
         <c:if test="${boardDTO.writer_no == sessionScope.emp_no}">
            <span onclick="checkBoardUpDelForm('up');" class="btn btn1" style="width:30px">수정</span>
            <span onclick="checkBoardUpDelForm('del');" class="btn btn1" style="width:30px">삭제</span>
         </c:if>
         
         <span onclick="document.boardListForm.submit();" class="btn btn1">목록보기</span>
         
      </form>

      
      
      
      <form name="boardListForm" action="/pro/boardList.do">
         
      </form>
      
      
   </body>