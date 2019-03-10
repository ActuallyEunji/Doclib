<!--JSP 페이지 처리 방식 선언-->
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!--현재 페이지에 common.jsp 파일 내의 소스 삽입-->
<%@include file="common2.jsp"%>


<html>
   <head>

      <script>
      
      // body 태그를 모두 실행한 후 실행할 자스 코드 설정
      $(document).ready(function(){
    	  
          // 접속한 차수가 최고 차수가 아닐 때 두번째 폼 숨기기
          if( ${sessionScope.company_emp_no} !=${sessionScope.max_company_emp_no} ){ 
              $("[name=myPageUpDelForm2]").hide();  
           } 

          // 접속한 차수가 최고 차수일 때 첫번째 폼 숨기기
          if( ${sessionScope.company_emp_no} ==${sessionScope.max_company_emp_no} ){ 
              $("[name=myPageUpDelForm]").hide();  
           }  
          
         // name=contactUpDelForm 을 가진 form 태그를 관리하는 JQuery 객체 메위주 저장하기
         var myPageUpDelFormObj = $("[name=myPageUpDelForm]");

         myPageUpDelFormObj.find("[name=id]").val( "${mypage.id}");
         myPageUpDelFormObj.find("[name=pwd]").val( "${mypage.pwd}");
         
         /* $("[name=myPageUpDelForm]").find("[name=selectPageNo]").val('${param.selectPageNo}'); */
         
         // name=myPageUpDelForm2 을 가진 form 태그를 관리하는 JQuery 객체 메위주 저장하기
         var myPageUpDelFormObj2 = $("[name=myPageUpDelForm2]");

         myPageUpDelFormObj2.find("[name=id]").val( "${mypage.id}");
         myPageUpDelFormObj2.find("[name=pwd]").val( "${mypage.pwd}");
         
         <c:forEach var="reports" items="${reports}" varStatus="Status">
        		myPageUpDelFormObj2.find("[name=report_field]").filter("[value=${reports.report_code}]").prop("checked",true);
         </c:forEach>
         
/*          // name=report_field 을 가진 입력양식에 수정/삭제할 데이터 체크해주기하기
         <c:forEach var="report_field" items="${myPageDTO.getReports()}">
            <c:forEach var="report_field2" items="${requestScope.report_field}">
               <c:if test="${report_field==report_field2.report_field_code}">
                  $("[name=contactUpDelForm2]").find("[name=report_field]").filter("[value=${report_field}]").prop("checked",true);
               </c:if>
            </c:forEach>
         </c:forEach> 
         
         /* $("[name=myPageUpDelForm2]").find("[name=selectPageNo]").val('${param.selectPageNo}'); */
              
      })

      //mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
      // 마이페이지 수정하는 입력양식의 유효성 체크하는 자바스크립트 함수 선언 111
      //mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
      function checkMyPageUpDelForm(  upDel ){
         var myPageUpDelFormObj = $("[name=myPageUpDelForm]");
         
         try{
            //**********************************************
            // 수정 버튼을 클릭한 경우
            //**********************************************
            if(upDel=="up"){
               myPageUpDelFormObj.find("[name=upDel]").val( 'up' );
               //---------------------------------------
                      //아이디 유효성 체크
                      //---------------------------------------
                        var id = $("[name=id]").val( );
                           //------------------------------------------------------------------------
                           //RegExp 객체를 생성
                           //------------------------------------------------------------------------
                           var regExp = new RegExp(/^[가-힣a-zA-Z]{2,20}$/);
                          
                           //------------------------------------------------------------------------
                           //RegExp 객체의 test 메소드를 호출하여 아이디의 패턴을 검사한다.
                           //아이디 패턴이 틀릴 경우 경고하고 함수는 중단.
                           //------------------------------------------------------------------------
                           if (id=="") {
                           alert("[아이디]입력란은 공백일 수 없습니다");
                              //함수 종료
                              return;
                           }
                            
                            if( new RegExp(/^[가-힣a-zA-Z0-9]{5,20}$/).test(id)==false  ){
                              alert("[아이디]는 공백없이 한글, 영어 소대문자, 숫자로 이루어진5~20자 이내여야 합니다..");
                              //함수 종료
                              return;
                           }
                            
                              
                       //---------------------------------------
                       //암호 유효성 체크
                       //---------------------------------------
                        var pwd = $("[name=pwd").val( );
                        var regExp = new RegExp(/^[가-힣a-zA-Z0-9]{2,20}$/);
                       
                        if (pwd=="") {
                              alert("[암호]입력란은 공백일 수 없습니다");
                                 //함수 종료
                                 return;
                              }
                        
                        if( new RegExp(/^[가-힣a-zA-Z0-9]{7,20}$/).test(pwd)==false  ){
                              alert("[암호]는 공백없이 한글, 영어 소대문자, 숫자로 이루어진 7~20자 이내여야 합니다.");
                              //함수 종료
                              return;
                           }
            
            if(confirm("정말 수정할까요")==false ){ return; }
            }

            //---------------------------------------
            // 현재 화면에서 페이지 이동 없이 서버쪽 "/pro/contactUpDelProc.do"  을 호출하여
            //  [연락처 수정/식제 행 적용 개수]를 받는다.
            //**********************************************
            $.ajax({
               // ----------------------------
               // 호출할 서버쪽 URL 주소 설정
               // ----------------------------
               url : "/pro/myPageUpDelProc.do"
               // ----------------------------
               // 전송 방법 설정
               // ----------------------------
               ,type : "post"
               //---------------------------------
               // 서버에 보낼 파라미터명과 파라미터값을 설정
               //---------------------------------
               ,data : myPageUpDelFormObj.serialize( )
               //---------------------------------
               // 서버의 응답을 성공적으로 받았을 경우 실행할 익명함수 설정.
               // 익명함수의 매개변수 data 에는 contactUpDelProc.jsp 의 실행 결과물인 html 소스가 문자열로 들어옴.
               //---------------------------------
               ,success : function( myPageUpDelCnt ){
                  // 즉 수정 성공했으면 
                  if(myPageUpDelCnt>0){
                     alert("회원정보 수정 성공!");
                     location.replace("/pro/loginForm.do");
                  }
                  // 즉 수정 실패했으면 
                  else{
                     alert("회원정보 수정 실패! 관리자에게 문의 바람!");
                     location.href = document.referrer;
                  }
               }
               //---------------------------------
               // 서버의 응답을 못 받았을 경우 실행할 익명함수 설정.
               //---------------------------------
                 ,error : function(  ){
                    alert("서버와 통신 실패!");
                 }
            });

         }catch(e){
            alert( "checkMyPageUpDelForm( ) 함수 예외 발생!" );
         }
      }
      

      //mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
      // 마이페이지 수정하는 입력양식의 유효성 체크하는 자바스크립트 함수 선언 222
      //mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
      function checkMyPageUpDelForm2( upDel ){
         
         var myPageUpDelFormObj2 = $("[name=myPageUpDelForm2]");
         
         try{
            //**********************************************
            // 수정 버튼을 클릭한 경우
            //**********************************************
            if(upDel=="com"){
            	myPageUpDelFormObj2.find("[name=upDel]").val( 'com' );
               //---------------------------------------
                      //아이디 유효성 체크
                      //---------------------------------------
                        var id = $("[name=id]").val( );
                           //------------------------------------------------------------------------
                           //RegExp 객체를 생성
                           //------------------------------------------------------------------------
                           var regExp = new RegExp(/^[가-힣a-zA-Z]{2,20}$/);
                          
                           //------------------------------------------------------------------------
                           //RegExp 객체의 test 메소드를 호출하여 아이디의 패턴을 검사한다.
                           //아이디 패턴이 틀릴 경우 경고하고 함수는 중단.
                           //------------------------------------------------------------------------
                           if (id=="") {
                           alert("[아이디]입력란은 공백일 수 없습니다");
                              //함수 종료
                              return;
                           }
                            
                            if( new RegExp(/^[가-힣a-zA-Z0-9]{5,20}$/).test(id)==false  ){
                              alert("[아이디]는 공백없이 한글, 영어 소대문자, 숫자로 이루어진5~20자 이내여야 합니다..");
                              //함수 종료
                              return;
                           }
                            
                              
                       //---------------------------------------
                       //암호 유효성 체크
                       //---------------------------------------
                        var pwd = $("[name=pwd").val( );
                        var regExp = new RegExp(/^[가-힣a-zA-Z0-9]{2,20}$/);
                       
                        if (pwd=="") {
                              alert("[암호]입력란은 공백일 수 없습니다");
                                 //함수 종료
                                 return;
                              }
                        
                        if( new RegExp(/^[가-힣a-zA-Z0-9]{7,20}$/).test(pwd)==false  ){
                              alert("[암호]는 공백없이 한글, 영어 소대문자, 숫자로 이루어진 7~20자 이내여야 합니다.");
                              //함수 종료
                              return;
                           }
            
            	if(confirm("정말 내 회원정보를 수정하시겠습니까?")==false ){ return; }
            }

            $.ajaxSetup({
                error: function(jqXHR, exception) {
                    if (jqXHR.status === 0) {
                        alert('Not connect.\n Verify Network.');
                    }
                    else if (jqXHR.status == 400) {
                        alert('Server understood the request, but request content was invalid. [400]');
                    }
                    else if (jqXHR.status == 401) {
                        alert('Unauthorized access. [401]');
                    }
                    else if (jqXHR.status == 403) {
                        alert('Forbidden resource can not be accessed. [403]');
                    }
                    else if (jqXHR.status == 404) {
                        alert('Requested page not found. [404]');
                    }
                    else if (jqXHR.status == 500) {
                        alert('Internal server error. [500]');
                    }
                    else if (jqXHR.status == 503) {
                        alert('Service unavailable. [503]');
                    }
                    else if (exception === 'parsererror') {
                        alert('Requested JSON parse failed. [Failed]');
                    }
                    else if (exception === 'timeout') {
                        alert('Time out error. [Timeout]');
                    }
                    else if (exception === 'abort') {
                        alert('Ajax request aborted. [Aborted]');
                    }
                    else {
                        alert('Uncaught Error.n' + jqXHR.responseText);
                    }
                }
            });

            
            //---------------------------------------
            // 현재 화면에서 페이지 이동 없이 서버쪽 "/pro/contactUpDelProc.do"  을 호출하여
            //  [연락처 수정/식제 행 적용 개수]를 받는다.
            //**********************************************
            $.ajax({
               // ----------------------------
               // 호출할 서버쪽 URL 주소 설정
               // ----------------------------
               url : "/pro/myPageUpDelProc.do"
               // ----------------------------
               // 전송 방법 설정
               // ----------------------------
               ,type : "post"
               //---------------------------------
               // 서버에 보낼 파라미터명과 파라미터값을 설정
               //---------------------------------
               ,data : myPageUpDelFormObj2.serialize( )
               //---------------------------------
               // 서버의 응답을 성공적으로 받았을 경우 실행할 익명함수 설정.
               // 익명함수의 매개변수 data 에는 contactUpDelProc.jsp 의 실행 결과물인 html 소스가 문자열로 들어옴.
               //---------------------------------
               ,success : function( myPageUpDelCnt ){
                  // 즉 수정 성공했으면 
                  if(myPageUpDelCnt>0){
                     alert("아이디/암호 수정 성공!");
                     location.replace("/pro/loginForm.do");
                  }
                  // 즉 수정 실패했으면 
                  else{
                     alert("아이디/암호 수정 실패! 관리자에게 문의 바람!");
                     location.href = document.referrer;
                  }
                 
               }
               //---------------------------------
               // 서버의 응답을 못 받았을 경우 실행할 익명함수 설정.
               //---------------------------------
                 
            });

         }catch(e){
            alert( "checkMyPageUpDelForm2( ) 함수 예외 발생!" );
         }
      }
      
      </script>
   </head>
<!-- ============================================================================================================= -->
   <body>
   
   <center><br>

      <form name="myPageUpDelForm" method="post"  action="/pro/myPageUpDelProc.do">
      
         <br> <h3 align="top"><b>[아이디/암호 수정]</b></h3><br>
         
         <table class="tbcss1"  width=330>
            <tr>
               <th align="center" class="real_table"  style="width:70px;">아이디</th>
               <td align="center" class="real_td"><input type="text" name="id" size="30"></td>
            </tr>   
            <tr>
               <th align="center" class="real_table"  style="width:70px;">비밀번호</th>
               <td align="center" class="real_td"><input type="password" name="pwd" size="30"></td>
            </tr>   
         </table>
         <input type="hidden" name="emp_no" value="${sessionScope.emp_no}">
         <input type="hidden" name="upDel">
         
      <div style="height:15px"></div> 
         
         <span onClick="checkMyPageUpDelForm( 'up' )" class="btn btn1" style="width:36px">수정</span>
         <span style="cursor:pointer" onclick="location.replace('/pro/myPageList.do')" class="btn btn1">마이페이지로</span>
         
      </form>
      

   </body>

<!-- ============================================================================================================= -->
   <body>
   
   <center><br>

      <form name="myPageUpDelForm2" method="post"  action="/pro/myPageUpDelProc.do">
      
         <br> <h3 align="top"><b>[아이디/암호 수정]-최고차수용</b></h3><br>
         
           <table class="tbcss1"  width=350>
            <tr>
               <th align="center" class="real_table"  style="width:70px;">아이디</th>
               <td align="center" class="real_td"><input type="text" name="id" size="35"></td>
            </tr>   
            <tr>
               <th align="center" class="real_table"  style="width:70px;">비밀번호</th>
               <td align="center" class="real_td"><input type="password" name="pwd" size="35"></td>
            </tr>
            <tr>
              <th align="center" class="real_table"  style="width:70px;">보고서<br>종류</th>
              <td align="center" class="real_td">
                  <!----------------------------------------->
                  <!--HttpServletRequest 객체에 saup_fieldList 라는 킷값으로 저장된 List<Map> 객체에 저장된 -->
                  <!--[사업분야번호]와 [사업분야이름]을 꺼내어 checkbox 양식에 name 속성값과 value 속성값으로 표현해 출력하기-->
                  <!----------------------------------------->
                  <input type="checkbox" name="report_field"  value=1>지출보고서
                  <input type="checkbox" name="report_field"  value=2>영업보고서<br>
                  <input type="checkbox" name="report_field"  value=3>일일 업무보고서
                  <input type="checkbox" name="report_field"  value=4>주간 업무보고서
               </td>
            </tr>      
         </table>
         <input type="hidden" name="emp_no" value="${sessionScope.emp_no}">
         <input type="hidden" name="upDel">
         
      <div style="height:15px"></div> 
         
         <span onClick="checkMyPageUpDelForm2( 'com' )" class="btn btn1" style="width:36px">수정</span>
         <span style="cursor:pointer" onclick="location.replace('/pro/myPageList.do')" class="btn btn1">마이페이지로</span>
         
      </form>
      

   </body>


</html>