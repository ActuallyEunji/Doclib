<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="/WEB-INF/views/common2.jsp"%>

      <script>
      
      $(document).ready(function(){
         
         //*************************************************
         // 연락처 검색 결과물의 짝 홀수행 배경색 달리하기
         // 즉, class=contactList를 가진 태그의 후손 태그 중 첫번째 tr 태그 이후
         // tr들에 차례대로 접근하여 bgcolor의 인덱스 번호가 짝수인 tr의 속성값을 #cfcfcf로 설정한다
         //*************************************************
         $(".boardList").find("tr:eq(0)").nextAll().each(function(){
            // class=contactList를 가진 태그의 후손 중 tr 태그 중 1번째를 뺀
            // 나머지 tr중 i번째 tr 태그를 관리하는 JQuery 객체 생성하여 obj에 저장.
            var obj = $(this);
            // i번째 tr 태그가 형제 tr 중 위치하는 인덱스 번호 얻기
            // 즉, i번째 tr 태그의 형제 서열 인덱스 번호 얻기
            var index = $(this).index();
            // 형제 서열 인덱스 번호가 홀수면 배경색을 #CFCFCF로 설정하기
            // tr 태그의 bgcolor 속성값을 #CFCFCF로 설정하여 배경색을 바꾸는 원리다.
            if( index%2==0 ){
               obj.attr("bgcolor", "#f1f7fc")
            }
         });
      
         //*************************************************
         // 연락처 검색 결과물의 마우스 대면 색상 변하고 떼면 원래대로 돌리기
         //*************************************************
         $(".boardList").find("tr:eq(0)").nextAll().hover(function(){
               var obj = $(this);
               obj.attr("bgcolor", "#c1d8f0")
               }
            ,function(){
               var obj = $(this);
               var index = $(this).index();
               if( index%2==0 ){
                  obj.attr("bgcolor", "#f1f7fc")
               }else{
               obj.attr("bgcolor", "white")
               }
            }
         );  
         
      });
      
      </script>

<html>

   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   
      <title>게시판 목록</title>   
      <script>
      // body태그 안의 태그를 모두 실행한 후에 실행할 자스코드 설정
      $(document).ready(function(){
         
         // 이전 화면에서 입력, 선택한 데이터를 재 입력하여 흔적 남기기 
         //$("[name=selectPageNo]").val("${empty param.selectPageNo?1:param.selectPageNo}");
         $("[name=selectPageNo]").val("${empty param.selectPageNo?1:param.selectPageNo}");
         $("[name=rowCntPerPage]").val("${empty param.rowCntPerPage?15:param.rowCntPerPage}");
         $("[name=keyword]").val("${param.keyword}");
         //$("[name=issue]").prop('checked',"${param.issue}");
         
         <c:if test="${!empty param.keywordTarget}">
            $("[name=keywordTarget]").val("${param.keywordTarget}");
         </c:if>
         
         // 한 페이지에서 보여줄 게시판 목록 행의 개수를 조절하는
         // select 입력양식에 change 이벤트 발생시 실행할 코드 설정
         $("[name=rowCntPerPage]").change(function(){
            // name=boardListForm 을 가진 폼태그의 action값의 URL주소로 이동
            // 즉 /pro/boardList.do로 이동
            document.boardListForm.submit();
         });
         
         // 검색버튼 클릭시 실행할 코드 설정
         $(".searchBoard").click(function(){
               if( ($("[name=keyword]").val().split(" ").join("")=="") &&
                  ($("[name=issue]").prop('checked')==false) ) {
                  alert("검색 단어가 없어 검색을 할 수 없습니다.");
                  return;
               }
               goBoardListForm();
            });
         
         // 모두검색 버튼 클릭 시 실행할 코드 설정
         $(".searchBoardAll").click(function(){
            $("[name=keyword]").val("");
            
            $("[name=keywordTarget]").val("subject");
            document.boardListForm.submit();
         });
      });
      
      // 게시판 목록 화면으로 이동하는 함수 선언
      function goBoardListForm(){
         //name=boardListForm 을 가진 form 태그 안의 action에 설정된 url로 이동하기 
         //이동 시 form 태그 안의 모든 입력양식이 파라미터값으로 전송된다.
         document.boardListForm.submit();
      }
      
      function goBoardRegForm( ){
         //name=boardRegForm 을 가진 form 태그 안의 action에 설정된 url로 이동하기 
         //이동 시 form 태그 안의 모든 입력양식이 파라미터값으로 전송된다.
         document.boardRegForm.submit();
      }
      
      // [게시판 상세보기 화면] 으로 이동하는 함수 선언
      function goBoardContentForm( board_no , writer_no ){
         // 클릭한 게시판 글의 PK값을 name = boardContentForm 가진 
         // form 태그 안의 name = b_no 를 가진 입력양식에 삽입하기 
         $("[name=boardContentForm] [name=board_no]").val(board_no);
         $("[name=boardContentForm] [name=writer_no]").val(writer_no);
         // name = boardContentForm 가진 form 태그 안의 action에 설정된 URL로 이동하기
         // 이동 시 form 태그 안의 모든 입력양식이 파라미터 값으로 전송된다. 
         document.boardContentForm.submit();
      }
      </script>
   
   </head> 
<!-- ==================================================================================================== -->   
   <body>
      <center>

      <!-- [게시판 목록]을 출력하는 form 태그 선언 -->
      
      <!-- -------------------------------------- -->
      <!-- EL문법으로 HttpServletRequest 객체에  boardListAllCnt라는 키값으로 저장된 데이터 표현하기 -->
      <!-- ${requestScope.boardListAllCnt}개 -->
      <!-- -------------------------------------- -->
      <form name ="boardListForm" method="post" action="/pro/boardList.do">
      
         <input type="hidden" name="selectPageNo">
         <!-- [전체 글 수], [글쓰기] 링크 글씨 출력 -->
         <!-- <a href="javascript:goBoardRegForm();">[새 글쓰기]</a> -->
<!--          <table class="color_list1" width=200 height=40>
               <th style="color:white;">[게시판]
         </table><br> -->
         <br><center> <h2 align="top"><b>[게시판]</b></h2> <br><br><br>
         
         <span style="font-size:1.1em;"><b>[전체 글 수]</b> : ${requestScope.boardListAllCnt}개</span>
                  &nbsp;&nbsp;
                  <span style="font-size:1.1em;">
	                  <select name="rowCntPerPage">
	                     <option value=10>10</option>
	                     <option value=15>15</option>
	                     <option value=20>20</option>
	                     <option value=25>25</option>
	                     <option value=30>30</option>
	                  </select>&nbsp;행보기
                  </span>
         
         
            
         
               
               &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
               &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
               &emsp;&emsp;&emsp;&emsp;
               
               <!-- 검색 결과물의 개수가 1개 이상이면 -->
      <c:if test="${boardListAllCnt>0}">
      
         <c:if test="${pageingData.beginPageNo>pageingData.pageNoCntPerPage}">
            <a href="javascript:$('[name=selectPageNo]').val('1');goBoardListForm();">[처음]</a>
            <a href="javascript:$('[name=selectPageNo]').val('${pageingData.beginPageNo-1}');goBoardListForm();">
               [이전]&nbsp;&nbsp;
            </a>
         </c:if>
         <!-- [시작페이지 번호]부터 [마지막 페이지 번호]까지 페이지번호를 출력하기 -->
         
         <c:forEach var="pageNo" begin="${pageingData.beginPageNo}" end="${pageingData.endPageNo}">
            <c:if test="${pageingData.selectPageNo!=pageNo}">
               <a href="javascript:$('[name=selectPageNo]').val('${pageNo}');goBoardListForm();" class="pageNo">
                  [${pageNo}]
               </a>
            </c:if>
            <c:if test="${pageingData.selectPageNo==pageNo}">
                ${pageNo}
             </c:if>
         </c:forEach>
         
         <c:if test="${pageingData.endPageNo<pageingData.lastPageNo}">
            <a href="javascript:$('[name=selectPageNo]').val('${pageingData.endPageNo+1}');goBoardListForm();">
               &nbsp;&nbsp;[다음]
            </a>
            <a href="javascript:$('[name=selectPageNo]').val('${pageingData.lastPageNo}');goBoardListForm();">
               [마지막]
            </a>
         </c:if>
         
      </c:if>
         
      <c:set  value="${selectPageNo}" var = "selectPageNo"/> 
               
               
               
               
               &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
               &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
               &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
               &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
                <span style="cursor:pointer; font-size:1.1em;" onclick="goBoardRegForm();"><b>[새 글쓰기]</b></span>
                <div style="height:10px"></div>  
         <!-- -------------------------------------- -->
         <!-- 페이징 번호 출력 -->
         <!-- -------------------------------------- -->
         
         <!-- [게시판 검색 결과물] 출력 -->
         <table class="tbcss2 boardList" border="1" width="1000">
               <th class="color_list_left">번호
               <th class="color_list" align="center">제목
               <th class="color_list">작성자
               <th class="color_list">작성일
               <th class="color_list_right">조회수         
            <!-- -------------------------------------- -->
            <c:forEach var="board" items="${boardList}" varStatus="loopTagStatus"> 
               <tr align=center style="cursor:pointer" onClick="goBoardContentForm(${board.board_no},${board.writer_no});">
                  <td>${pageingData.beginRowNo_desc - loopTagStatus.index}</td>
                  <td align=left>
                     <c:if test="${board.print_level>0}">ㄴ</c:if>
                    &nbsp;&nbsp;&nbsp;&nbsp; ${board.subject}<font color="#bb0000">${board.cnt}</font>
                  </td>
                  <td>${board.writer}</td>
                  <td>${board.reg_date}</td>
                  <td>${board.readcount}
                     <input type="hidden" name="content" value="${board.content}">
                  </td>
                </tr>
            </c:forEach>

         </table><br>
         <c:if test="${empty boardList}">
         	<b>게시판 글이 없습니다.</b>
         </c:if><br><br>

         
         
         <select name="keywordTarget" style="width:72px">
            <option value="subject" selected>제목</option>
            <option value="content">내용</option>
            <option value="writer">작성자</option>
         </select>
         
         <input type="text" name="keyword">
         <input type="hidden" name="selectPageNo">
            
         <span  class="searchBoard btn btn1">검색</span>&nbsp;
         <span class="searchBoardAll btn btn1">모두 검색/새로고침</center>
         
         
      </form>
            
         
      <form name="boardRegForm" method="post" action ="/pro/boardRegForm.do">
          <input type="hidden" name="selectPageNo">
      </form>
         
      <!-- [선택한 게시판 상세보기 화면]으로 이동하는 주소를 가진 form 태그 선언하기  -->
      <form name="boardContentForm" method="post" action ="boardContentForm.do">
         <!-- [게시판 글 고유번호] 가 저장되는 hidden 입력양식 선언 -->
         <input type="hidden" name="board_no">
         <input type="hidden" name="writer_no">
         <input type="hidden" name="selectPageNo">
      </form>
      <%--
      HttpSession session_pageNo = request.getSession();
      session.setAttribute("session_pageNo", pageContext.getAttribute("selectPageNo").toString() );
      --%>
         
   </body>