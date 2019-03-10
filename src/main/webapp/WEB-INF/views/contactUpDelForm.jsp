<!--JSP 페이지 처리 방식 선언-->
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!--현재 페이지에 common.jsp 파일 내의 소스 삽입-->
<%@include file="common2.jsp"%>


<html>
   <head>
      
      <!--만약 수정/삭제할 연락처가  없으면 경고하고 연락처 목록화면으로 이동하기-->
      <c:if test="${empty contact}">
         <script>
            alert("연락처가 삭제 되었음!")
            location.replace("/pro/contactSearchForm.do")
         </script>
      </c:if>

      <script>
      
      // body 태그를 모두 실행한 후 실행할 자스 코드 설정
      $(document).ready(function(){
         // name=contactUpDelForm 을 가진 form 태그를 관리하는 JQuery 객체 메위주 저장하기
         var contactUpDelFormObj = $("[name=contactUpDelForm]");
         // name=contact_no 을 가진 입력양식에 수정/삭제할 연락처 번호 저장하기
         contactUpDelFormObj.find("[name=contact_no]").val( "${contact.contact_no}");
         contactUpDelFormObj.find("[name=emp_no]").val( "${sessionScope.emp_no}");
         // name=contact_name 을 가진 입력양식에 수정/삭제할 연락처명 저장하기
         contactUpDelFormObj.find("[name=contact_name]").val( "${contact.contact_name}");
         // name=phone 을 가진 입력양식에 연락처 수정/삭제할 전화번호 저장하기
         contactUpDelFormObj.find("[name=phone]").val( "${contact.phone}");
         // name=saup_field 을 가진 입력양식에 수정/삭제할 데이터 체크해주기하기
         <c:forEach var="saup_field" items="${contactDTO.getSaup_field()}">
            <c:forEach var="saup_field2" items="${requestScope.saup_fieldList}">
               <c:if test="${saup_field==saup_field2.saup_field_code}">
                  $("[name=contactUpDelForm]").find("[name=saup_field]").filter("[value=${saup_field}]").prop("checked",true);
               </c:if>
            </c:forEach>
         </c:forEach>
         $("[name=contactSearchForm]").find("[name=selectPageNo]").val('${param.selectPageNo}');
              
      });

      //mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
      // 연락처 수정.삭제 입력양식의 유효성 체크하는 자바스크립트 함수 선언
      //mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
      function checkContactUpDelForm(  upDel ){
         
         var contactUpDelFormObj = $("[name=contactUpDelForm]");
         
         try{
            //**********************************************
            // 수정 버튼을 클릭한 경우
            //**********************************************
            if(upDel=="up"){
            contactUpDelFormObj.find("[name=upDel]").val( 'up' );
            //---------------------------------------
            // 연락처명 유효성 체크
            //---------------------------------------
            var contact_name = contactUpDelFormObj.find("[name=contact_name]").val( ); 

            if( new RegExp(/^[가-힣a-zA-Z0-9]{2,20}$/).test(contact_name)==false  ){
               alert( "연락처명는 공백 없이 영대소문자 또는 한글만 입력돼야 합니다.");
               contactUpDelFormObj.find("[name=contact_name]").val( "" );
               return;
            }
            //---------------------------------------
            // 전화번호 유효성 체크
            //---------------------------------------
            var phone = contactUpDelFormObj.find("[name=phone]").val( );   

            if( new RegExp( /^[0-9]{10,11}$/ ).test(phone)==false ){
               alert("전화번호는 - 없이 숫자만 최소 10글자 이상 입력 요망!");
               contactUpDelFormObj.find("[name=phone]").val( "" );
               return;
            }
            //---------------------------------------
            // 사업분야 유효성 체크
            //---------------------------------------
            var saup_fieldCnt = contactUpDelFormObj.find("[name=saup_field]").filter(":checked").length;

            if( saup_fieldCnt==0 ){
               alert( "연락처 사업분야는 반드시 1개 이상 체크해야합니다.");
               return;
            }
            
            if(confirm("정말 수정할까요")==false ){ return; }
            }
            //**********************************************
            // 삭제 버튼을 클릭한 경우
            //**********************************************
            else{
               contactUpDelFormObj.find("[name=upDel]").val( 'del' );
               if(confirm("정말 삭제할까요")==false ){ return; }
            }

            //---------------------------------------
            // 현재 화면에서 페이지 이동 없이 서버쪽 "/pro/contactUpDelProc.do"  을 호출하여
            //  [연락처 수정/식제 행 적용 개수]를 받는다.
            //**********************************************
            $.ajax({
               // ----------------------------
               // 호출할 서버쪽 URL 주소 설정
               // ----------------------------
               url : "/pro/contactUpDelProc.do"
               // ----------------------------
               // 전송 방법 설정
               // ----------------------------
               ,type : "post"
               //---------------------------------
               // 서버에 보낼 파라미터명과 파라미터값을 설정
               //---------------------------------
               ,data : contactUpDelFormObj.serialize( )
               //---------------------------------
               // 서버의 응답을 성공적으로 받았을 경우 실행할 익명함수 설정.
               // 익명함수의 매개변수 data 에는 contactUpDelProc.jsp 의 실행 결과물인 html 소스가 문자열로 들어옴.
               //---------------------------------
               ,success : function( contactUpDelCnt ){
                  // 즉 수정/삭제가 성공했으면 
                  if(contactUpDelCnt>0){
                     alert("연락처 수정/삭제 성공!");
                  }
                  // 즉  연락처 수정/삭제가 실패했으면 
                  else{
                     alert("연락처 등록 실패! 관리자에게 문의 바람!");
                     location.replace("/pro/contactSearchForm.do");
                  }
                  document.contactSearchForm.submit();
               }
               //---------------------------------
               // 서버의 응답을 못 받았을 경우 실행할 익명함수 설정.
               //---------------------------------
                  ,error : function(  ){
                     alert("서버와 통신 실패!");
                  }
            });

         }catch(e){
            alert( "checkContactUpDelForm( ) 함수 예외 발생!" );
         }
      }

      </script>
   </head>
<!-- ============================================================================================================= -->
   <body>
   
   <center><br>

      <form name="contactUpDelForm" method="post"  action="/pro/contactUpDelProc.do">
      
         <br> <h3 align="top"><b>[연락처 수정/삭제]</b></h3><br>
         
         <table class="tbcss1"  width=330 height=220>
            <tr>
               <th align="center" class="real_table"  style="width:70px;">연락처명</th>
               <td align="center" class="real_td"><input type="text" name="contact_name" size="25"></td>
            </tr>   
            <tr>
               <th align="center" class="real_table"  style="width:70px;">전화</th>
               <td align="center" class="real_td"><input type="text" name="phone" size="25" maxlength="11"></td>
            </tr>   
            <tr>
              <th align="center" class="real_table"  style="width:70px;">사업분야</th>
              <td align="center" class="real_td">
                  <!----------------------------------------->
                  <!--HttpServletRequest 객체에 saup_fieldList 라는 킷값으로 저장된 List<Map> 객체에 저장된 -->
                  <!--[사업분야번호]와 [사업분야이름]을 꺼내어 checkbox 양식에 name 속성값과 value 속성값으로 표현해 출력하기-->
                  <!----------------------------------------->
                  <c:forEach var="saup_field" items="${requestScope.saup_fieldList}">
                     <input type="checkbox" name="saup_field"  value="${saup_field.saup_field_code}">${saup_field.saup_field_name}
                  </c:forEach>
               </td>
            </tr>   
            <tr>
              <th align="center" class="real_table"  style="width:70px;">등록일</th>
               <td align="center" class="real_td">${contact.reg_date}</td>
            </tr>   
         </table>
         <input type="hidden" name="emp_no" >
         <input type="hidden" name="contact_no" >
         <input type="hidden" name="upDel">
         
      <div style="height:15px"></div> 
         
         <span onClick="checkContactUpDelForm( 'up' )" class="btn btn1" style="width:36px">수정</span>
         <span onClick="checkContactUpDelForm( 'del' )"class="btn btn1" style="width:36px">삭제</span>
         <span style="cursor:pointer" onclick="document.contactSearchForm.submit()" class="btn btn1">연락처 목록보기</span>
         
      </form>
      
      <form name="contactSearchForm" method=post action="/pro/contactSearchForm.do">
          <input type="hidden" name="selectPageNo">
      </form>

   </body>
</html>