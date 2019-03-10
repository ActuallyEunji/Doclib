<!-- JSP 기술의 한 종류인 Page Directive를 이용하여 현 JSP 페이지 처리 방식 선언하기 -->

<!-- JSP 페이지에서 사용할 사용자 정의 태그인 JSTL의 C코어 태그 선언 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 현재 페이지에 common.jsp 파일 내의 소스 삽입 -->
<%@include file="common2.jsp"%>


<html>
   
   <head>
      <script>
         //**********************************************
         // body 태그를 모두 실행한 후에 실행할 자스 코드 설정
         //**********************************************
         function contactRegFormCheck( ){
         
         var contactRegFormObj = $("[name=contactRegForm]");
         
            try{
           
               //---------------------------------------
               // 연락처명 유효성 체크
               //---------------------------------------
               var contact_name = contactRegFormObj.find("[name=contact_name]").val( ); // 입력한 연락처명 가져오기
               // 만약 연락처명이 한글 또는 영어, 숫자가 아니면 경고하고, 지우고 ,함수 멈추기         
               if( contact_name==""  ){
                  alert( "연락처명을 입력해 주세요.");
                  contactRegFormObj.find("[name=contact_name]").val( "" );
                  return;
               }
            
               //---------------------------------------
               // 전화번호 유효성 체크
               //---------------------------------------
               var phone = contactRegFormObj.find("[name=phone]").val( );   // 입력한 전화번호 가져오기
               // 만약 전화번호가 숫자가 아니면 경고하고, 지우고 ,함수 멈추기
               if( new RegExp( /^[0-9]{9,11}$/ ).test(phone)==false ){
                  alert("전화번호는 - 없이 숫자만 최소 9글자 이상 입력 요망!");
                  contactRegFormObj.find("[name=phone]").val( "" );
                  return;
               }
               
               //---------------------------------------
               // 사업분야 유효성 체크
               //---------------------------------------
               // 사업분야 체크개수 가져오기
               var saup_fieldCnt = contactRegFormObj.find("[name=saup_field]").filter(":checked").length;
               // 사업분야 체크개수가 0개면 경고하고, 함수 멈추기
               if( saup_fieldCnt==0 ){
                  alert( "연락처 사업분야는 반드시 1개 이상 체크해야합니다.");
                  return;
               }
            
               if(confirm("정말 등록할까요")==false ){ return; }
               
               //---------------------------------------
               // 현재 화면에서 페이지 이동 없이 서버쪽 "/pro/contactRegProc.do"  을 호출하여
               //       연락처 입력 후 입력 행의 개수를 받아 처리한다.
               //---------------------------------------
               $.ajax({
                  // ------------------
                  // 호출할 서버쪽 URL 주소 설정
                  // ------------------
                  url : "/pro/contactRegProc.do"
                  // ------------------
                  // 전송 방법 설정
                  // ------------------
                  ,type : "post"
                  // ------------------
                  // 서버에 보낼 파라미터명과 파라미터값을 설정
                  // ------------------
                  ,data : contactRegFormObj.serialize( )   
                  // ------------------
                  // 서버의 응답을 성공적으로 받았을 경우 실행할 익명함수 설정.
                  // 익명함수의 매개변수 contactRegCnt 에는 연락처 입력 적용행의 개수가 들어온다.
                  // ------------------
                  ,success : function( contactRegCnt ){
                     // 연락처 입력 적용 행의 개수가 1개 이상이면
                     // 즉, 연락처 등록이 성공했으면 
                     if(contactRegCnt>0){
                        // confirm 상자 띄우고 재등록할지 몰어본다.
                        if( confirm("연락처 등록 성공! 다른 연락처를 입력 하시겠습니까?")==true ){
                           document.contactRegForm.reset();
                        }
                        else{
                           location.replace("/pro/contactSearchForm.do");
                        }
                     }
                     // 연락처 입력 적용 행의 개수가 1개 미만이면
                     // 즉, 연락처 등록이 실패했으면 
                     else{
                        alert("연락처 등록 실패! 관리자에게 문의 바람")
                        location.replace("/pro/contactSearchForm.do");
                     }
                  } 
                  // ------------------
                  // 서버의 응답을 못 받았을 경우 실행할 익명함수 설정.
                  // ------------------
                  ,error : function(  ){
                     alert("서버접속 실패! 관리자에게 문의 바람!");
                  }
               });
            
            }catch(e){
               alert( "contactRegFormCheck( ) 함수 예외 발생!" );
            }
            
         }
      </script>
   </head>

<!-- =========================================================================== -->

   <body>
   
   <center><br>
      <!--mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm-->
      <!--[연락처 등록] 화면을 출력하는 form 태그 선언-->
      <!--mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm-->
      <form name="contactRegForm" method="post"  action="/pro/contactRegProc.do">
      
         <br> <h3 align="top"><b>[연락처 등록]</b></h3><br>
         
            <TABLE class="tbcss1" width=330 height=165>
               <tr>
               <th align="center" class="real_table"  style="width:70px;">연락처명</th>
               <td align="center" class="real_td"><input type="text" name="contact_name" size="30" maxlength="40"></td>
            </tr>   
            <tr>
               <th align="center" class="real_table"  style="width:70px;">전화</th>
               <td align="center" class="real_td"><input type="text" name="phone" size="30" maxlength="11"></td>
            </tr>   
            <tr>
               <th align="center" class="real_table"  style="width:70px;">사업분야</th>
               <td align="center" class="real_td">
                  <c:forEach var="saup_field" items="${requestScope.saup_fieldList}">
                     <input type="checkbox" align="middle" name="saup_field"  value="${saup_field.saup_field_code}">${saup_field.saup_field_name}
                  </c:forEach>
               </td>
            </tr>      
            
            </table>
            <br>
            <input type="hidden" name="company_no" value="${sessionScope.company_no}">
         <div style="height:15px"></div> 
         &emsp;<span class="xxx btn btn1"  onClick="contactRegFormCheck( )" style="width:40px;">등록</span>
         <span style="cursor:pointer" onclick="location.replace('/pro/contactSearchForm.do');" class="btn btn1" >연락처 목록으로</span>
      </form>
      </center>

   </body>      
</html>


