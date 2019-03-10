<!-- JSP 기술의 한 종류인 [page Directive]를 이용하여 현 JSP 페이지 처리방식 선언하기 -->
<!-- 현재 이 JSP 페이지 실행 후 생성되는 문서는 HTML이고, 이 문서는 UTF-8 방식으로 인코딩한다고 설정 -->
<!-- ******************************************************************************** -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="common1.jsp" %>

<%@page import="java.util.ArrayList" %>
<%@page import="java.util.List" %>
<%@page import="java.util.Map" %>
<%@page import ="javax.servlet.http.HttpSession" %>
<%@page import ="org.springframework.web.context.annotation.SessionScope" %>
<!-- ******************************************************************************** -->
<!-- JSP 페이징서 사용할 CSS 파일 수입 -->
<!-- ******************************************************************************** -->

<style>

   .img_s { height: 40px; 
   position: fixed;
   top:5px;
   left: 10px;
   }


   body {
      padding-top: 50px;
   }
   
   #topMenu { 
      height: 50px; 
      width: 1920px; 
      background-color: #1c2744;
     /*  border-radius: 4px; */
      position : fixed;
      top : 0;  
      
   }
   
   ul {
      text-align:center;
      display:inline-block;
    margin-left: auto;
      margin-right: auto; 
      vertical-align: middle; 
        margin: 10px;
        padding: 0px;
        height: 35px; 
      
   }
   
   #topMenu ul li {
      list-style: none; 
      color: white; 
      background-color: #fdadce5; 
      float: left;  
      line-height: 30px; 
      vertical-align: middle; 
      text-align: center;  
   }
   
   #topMenu .menuLink {
      text-decoration:none;
      color: white;
      display: block;
      width: 167px;
      font-size: 18px;
      font-weight: bold; 
      font-family: Nanum Square,tahoma,verdana;
   }
   
   #topMenu .menuLink:hover {
      color: white;
      background-color: #3f5384;
   }
   /* 
   .banner {width:100%; margin:0 auto; background:#1c2744; z-index:1000; }
   
   .banner_Fixed { position: fixed; top: 0px; } 
 */
 
 .iGraph{ white-space:nowrap; line-height:normal;}
.iGraph .gBar{ display:inline-block; width:250px; height:14px; margin:0 5px 0 0; border:1px solid #ccc; background:#e9e9e9; font-size:11px;}
.iGraph .gAction{ display:inline-block; height:14px; border:1px solid #8c9bac; background:#99a6b6; margin:-1px;}
.iGraph .gPercent{ font:16px Arial, Helvetica, sans-serif; color:#ccc;}
.iGraph .gPercent strong{ font-size:18px; color:#e88b30;}
</style>

<script>
/* 
   $( document ).ready( function() { // 문서가 읽히는 것을 확인.
   
      var jbOffset = $( '.banner' ).offset(); // 대상이 될 개체의 위치를 확인.
      
      $( window ).scroll( function() { // 화면이 스크롤되면 작동.
      
         if ( $( document ).scrollTop() > jbOffset.top ) { // 화면의 상단 높이와 대상 개체의 높이를 비교.
      
            $( '.banner' ).addClass( 'banner_Fixed' ); // 새 레이어 속성으로 바꾸기.
      
         } // 화면 스크롤 부분의 코드를 종료.
      
         else { // 위의 경우가 아니라면 작동될 코드.
            
            $( '.banner' ).removeClass( 'banner_Fixed' ); // 새 레이어 속성을 지워버리기.
      
         } // 경우가 아닌 부분의 코드 종료.
      
      }); // 화면 스크롤 작동 부분 종료.
   
   }); // 문서 읽히기 부분 종료.
 */
</script>

<body>


   <center>   
   
   <br>
   <!-- 
   <div class="banner"> -->
   
      <table>
         <tr>
            <nav id="topMenu" >
               <ul>
                   <a href="#"><img src="/pro/resources/logo.png" class="img_s" align="left"></a>
                   
                  <c:forEach var="list" items="${sessionScope.reportlist}" varStatus="Status">
                  
                  <li><a class="menuLink"  href="${list.report_url}"><c:out value="${list.report_name}"></c:out></a></li>
                  
                  </c:forEach>
                  
                  
                  <li><a class="menuLink"  href="/pro/boardList.do">게시판</a></li>
                  <li><a class="menuLink"  href="/pro/contactSearchForm.do">연락처</a></li>
                  <li><a class="menuLink"  href="/pro/myPageList.do">마이페이지</a></li>
               </ul>
            </nav>
         </tr>
      </table>
<!-- 
   </div> -->
   
   </center>
   <br>
   
   <br><br>

</body>