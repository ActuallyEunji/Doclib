<!-- JSP 기술의 한 종류인 [page directive] 를 이용하여 현 JSP 페이지 처리방식 선언하기 -->
<!-- 현재 이 JSP 페이지실행 후 생성되는 문서는 HTML이고 이문서는 UTF-8 방식으로 인코딩한다라고 설정함 -->
<!-- 현재 이 JSP 페이지는 UTF-8 방식으로 인코딩한다 -->
<!-- UTF-8 인코딩 방식은 한글을 포함한 전 세계 문자열을 부호화할 수 있는 방법이다 -->
<%@page contentType = "text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="/WEB-INF/views/common2.jsp" %>

<html>
   <head>
   
   <title>게시판</title>
      
      <script>
         // [게시판 새 글쓰기 화면]에 입력된 데이터의 유효성 체크 함수 선언
         function checkBoardRegForm(){
            // 입력된 [제목] 가져와서 변수에 저장
            var subject = $("[name=subject]").val();
            <c:if test="${empty boardDTO.board_no}">
	            // [제목]이 입력되지 않으면 경고하고 함수 중단
	            if(subject.split(" ").join("")==""){
	               alert("제목을 입력해 주십시요");
	               $("[name=subject]").focus();
	               return;
	            }
            </c:if>
            var content = $("[name=content]").val();
            // [제목]이 입력되지 않으면 경고하고 함수 중단
            if(content.split(" ").join("")==""){
               alert("내용을 입력해 주십시요");
               $("[name=content]").focus();
               return;
            }
            
            if( confirm("정말 저장하시겠습니까?")==false){ return; }

            
            // 현재화면에서 페이지 이동 없이 서버쪽 "/erp/boardRegProc.do" 을 호출하여
            // 게시판글 입력 후 취할 행동이 있는 html 소스를 문자열로 받기
             $.ajax({
                     // 서버쪽 호출 URL 주소 지정
                     url : "/pro/boardRegProc.do"
                     // form 태그 안의 데이터를 보내는 방법 지정
                     , type : "post"
                     // 서버가 응답할 페이지 종류, html 일 경우 생략 가능
                     , datatype : "json"
                     // 서버에 보낼 파라미터명과 파라미터 값을 설정
                     , data : $("form").filter("[name=boardRegForm]").serialize()
                     // 서버의 응답을 성공적으로 받았을 경우 실행할 익명함수 설정.
                     // 익명함수의 매개변수 html에는 boardRegProc.jsp 의 실행 결과물인 HTML 소스가 문자열로 들어옴.
                     , success : function(insertCnt){
                        if(insertCnt>0){
	                        if($("[name=board_no]").val()!=null && $("[name=board_no]").val()!=''){
	                           alert("게시판 댓글쓰기 입력성공 ");
	                        }
	                        else{
	                           alert("게시판 새글쓰기 입력성공 ");
	                        }
	                           location.replace("/pro/boardList.do");
                        }
                        else{
                           alert("게시판 새글쓰기 실패...관리자에게 문의 바람");
                        }
                        location.replace("/pro/boardList.do");
                     }
                     // 서버의 응답을 못 받았을 경우 실행할 익명함수 설정.
                     , error : function(){
                        alert("서버와 비동기 방식 통신 실패!");
                     }
              }); 
         }
         
         function goBoardContentForm(){
            document.goBoardContentForm.submit();
         }
      </script>
   </head>
<!-- ================================================================= -->   
   <body>
   <br>
   <center>
   
      <!-- [게시판 등록] 화면을 출력하는 form 태그 선언 -->
      <form method="post" name="boardRegForm" action="/pro/boardRegProc.do">
         
         <c:if test="${empty boardDTO.board_no}">
            <br><center> <h3 align="top"><b>[새 글쓰기]</b></h3> <br>
         </c:if>
         <c:if test="${!empty boardDTO.board_no}">
            <br><center> <h3 align="top"><b>[댓 글쓰기]</b></h3> <br>
         </c:if>
         
         <!-- ------------------------------------- -->
         <table class="tbcss1" >
            <tr>
               <th align="center" class="real_table">이 름
               <td align="left" class="real_td">${sessionScope.emp_name}
            </tr>
            <c:if test="${empty boardDTO.board_no}">
            <tr>
               <th align="center" class="real_table">제 목
               <td align="left" class="real_td"><input type="text" size="48" maxlength="50" name="subject">
            </tr>
            </c:if>
            <c:if test="${!empty boardDTO.board_no}">
            	<input type="hidden" size="48" maxlength="50" name="subject" value="">
            </c:if>
            <tr>
               <th align="center" class="real_table">내 용
               <td align="left" class="real_td"><textarea name="content"  rows="13" cols="50"></textarea>
            </tr>
         </table>
         
         <table><tr height=4><td></table>
         
         <!-- ★☆★☆★☆★☆★☆★☆★히든★☆★☆★☆★☆★☆★☆★☆★☆★ -->
         <input type="hidden" name="board_no" value="${boardDTO.board_no}">
         <input type="hidden" name="emp_no" value="${sessionScope.emp_no}">
         <!-- ★☆★☆★☆★☆★☆★☆★히든★☆★☆★☆★☆★☆★☆★☆★☆★ -->
         
         <input type="button" value="저장" onClick="checkBoardRegForm()" class="btn btn1" >
         <input type="reset" value="다시작성" class="btn btn1">
         <input type="button" value="목록보기" onClick="location.replace('/pro/boardList.do')" class="btn btn1">
      </form>

   
   </body>
</html>