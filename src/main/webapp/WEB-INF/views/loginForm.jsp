<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      
<%@include file="/WEB-INF/views/common1.jsp"%>

<HTML>
 <HEAD>
  <TITLE> New Document </TITLE>

<style>



body{

   background-image:url("/pro/resources/login.png"); 
   background-repeat:no-repeat;
   background-size:100%;

}

</style>


  <script>

function checkCompanyLoginForm(){
      
   var company_id = $("[name=id]").val();
   var pwd = $("[name=pwd]").val();
   
   if( company_id.split(" ").join("")==""){
       alert("아이디 입력 요망");
       $("[name=id]").val("");
       return;
   }
   
   if( pwd.split(" ").join()==""){
       $("[name=pwd]").val("");
       alert("암호 입력 요망");
       return;
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
   
   $.ajax({
      url : "/pro/loginProc.do"
      , type : "post"
      , data : $("form").filter("[name=login_Form]").serialize()
      , dataType : "text"
      , success : function( company_idCnt ){
         if( company_idCnt.substring(0,1)=="1"){
            var url = company_idCnt.substring(1);
           location.replace(url);
         }
         else if( company_idCnt.substring(0,1)=="0" ){
            alert("아이디 암호가 틀립니다");
            $(".id").val("");
            $(".id").focus();
         }
         else{
            alert("관리자에게 문의 바람");
         }        
      }
      
   });
}
        
        
        
  </script>
 </HEAD>



 <BODY>
 <BR><BR><BR><BR><BR><BR>
<center> 


<div style="height:100px"></div>
<br><br>
<table class="login" border="1" >
   <tr>
   <td>

<form name="login_Form" method="post" action="/pro/loginProc.do">
   <TABLE class="tbcss1" style="margin-left: auto; margin-right: auto;">
   <TR>
      <TD align="center" class="real_table"  border="1">아이디</TD>
      <TD align="center" class="real_td"  border="1"><input type="text" name="id" style="width:180px;" ></TD>
   </TR>
   <TR>
      <TD align="center" class="real_table"  border="1">암호</TD>
      <TD align="center" class="real_td"  border="1"><input type="password" name="pwd" style="width:180px;"></TD>
   </TR>
   </TABLE>
   <div style="height:15px"></div>
   <center><span style="cursor:pointer" onclick="checkCompanyLoginForm( )" class="btn btn1">로그인</span>

   </form>
     <!-- <input type="button" style="cursor:pointer" onclick="location.replace('/pro/approval_id_reg_form.do')">[회원가입]</button> -->
      <span style="cursor:pointer" onclick="location.replace('/pro/approval_id_reg_form.do')" class="btn btn1">회원가입</span>
   <br><br><br>
   1차 테스트 아이디:  jiseon789<br>
   테스트 암호: 45678946512<br><br>
   2차 테스트 아이디: jisung00123<br>
   테스트 암호: wltjdqkr<br><br>
   3차 테스트 아이디: kim4401235<br>
   테스트 암호: zlazlawltjs<br><br>
<!--     4차 테스트 아이디: gkrtn000<br>
   테스트 암호: gkrtn000<br><br> -->
   
      </td>
      </tr>
   </table>

 </BODY>
</HTML>
</html>