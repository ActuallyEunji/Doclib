<!--mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm-->
<!--JSP 페이지 처리 방식 선언-->
<!--mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm-->
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!--mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm-->
<!--현재 페이지에 common.jsp 파일 내의 소스 삽입-->
<!--mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm-->
<%@include file="common2.jsp"%>

<HTML>

  

   <script>




   $(document).ready(function(){
   $("[name=expenseContentForm]").hide();
   $("[name=expenseContentForm2]").hide();
   $("[name=expenseContentForm3]").hide();
   $("#confirm_button").hide();
  
   
   
      if( parseInt(${sessionScope.form_choice},10) ==1  ){ // 보고서 수정화면
         $("[name=expenseContentForm2]").show();
         $("[name=expenseContentForm]").hide();
         $("[name=expenseContentForm3]").hide();
      }
      else if( parseInt(${sessionScope.form_choice},10) ==2 ){ // 결재화면
         $("[name=expenseContentForm]").show();
         $("[name=expenseContentForm2]").hide();
         $("[name=expenseContentForm3]").hide();
         $("#confirm_button").show();
      }
      else if( parseInt(${sessionScope.form_choice},10) ==4 ){ // 반려완료된 수정화면
         $("[name=expenseContentForm2]").hide();
        $("[name=expenseContentForm]").hide();
        $("[name=expenseContentForm3]").show();
      }
      

   
 


   //mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
   // form 태그를 모두 실행한 후 실행할 자스 코드 설정 (수정화면 2,3용)
   //mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
     
      // name=expenseContentForm 을 가진 form 태그를 관리하는 JQuery 객체 메위주 저장하기
      var expenseUpDelFormObj = $("[name=expenseContentForm]");
      expenseUpDelFormObj.find("[name=expense_name]").val( "${upDelExpenseList.report_name}");
      
      var expense_field_arr = ["식대","회식비","접대비","비품","기자재","사무가구","교통비","경조사비","숙박비","의류비","도서비","홍보비","기타"];

      for (var i=0; i<expense_field_arr.length; i++){
         if( ${upDelExpenseList.expense_field==i} ){
            expenseUpDelFormObj2.find("[name=expense_field]").val(expense_field_arr[i]);
         }
      }         
    
      
      expenseUpDelFormObj.find("[name=expense_price]").val( "${upDelExpenseList.expense_price}");
      expenseUpDelFormObj.find("[name=receipt_no]").val( "${upDelExpenseList.receipt_no}");
      
	 <c:if test="${updatelist.sign_code==1}">
	 	$("#sign_check1").prop("checked",true);
	 </c:if>
	 <c:if test="${updatelist.sign_code==3}">
	 	$("#sign_check2").prop("checked",true);
	 	expenseUpDelFormObj.find("[name=no_confirm_reason]").val( "${updatelist.return_result}");
	 </c:if>
      
      expenseUpDelFormObj.find("[name=remarks]").val( "${expenseTableList.remarks}");

      $("[name=expenseContentForm]").find("[name=selectPageNo]").val( "${param.selectPageNo}");
       

      //$("#confirm_button").show();


   //mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
   // form2 태그를 모두 실행한 후 실행할 자스 코드 설정 (수정화면용)
   //mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm

      // name=expenseContentForm 을 가진 form 태그를 관리하는 JQuery 객체 메위주 저장하기
      var expenseUpDelFormObj2 = $("[name=expenseContentForm2]");
      expenseUpDelFormObj2.find("[name=expense_name]").val("${upDelExpenseList.report_name}");
      expenseUpDelFormObj2.find("[name=expense_field]").val("${upDelExpenseList.expense_field}");
      expenseUpDelFormObj2.find("[name=expense_method]").val("${upDelExpenseList.expense_method}");

 	  var expense_price = "${upDelExpenseList.expense_price}";

      var result = "";
      
      var arr = expense_price.split("");
      var cnt = 0;

      for ( var i=arr.length-1 ; i>0 ; i-- ){
         if (++cnt%3==0){
            arr[i] = "," + arr[i];
         }
      }
      var print = arr.join("");

      expenseUpDelFormObj2.find("[name=expense_price]").val( print );

      
      var expense_field_arr = ["식대","회식비","접대비","비품","기자재","사무가구","교통비","경조사비","숙박비","의류비","도서비","홍보비","기타"];

      for (var i=0; i<expense_field_arr.length; i++){
         if( ${upDelExpenseList.expense_field==i} ){
            expenseUpDelFormObj2.find("[name=expense_field]").val(expense_field_arr[i]);
         }
      }         
      
      var expense_method_arr = ["회사카드","회사현금","개인카드","개인현금"];
      
      for (var i=0; i<expense_method_arr.length; i++){
          if( ${upDelExpenseList.expense_field==i} ){
             expenseUpDelFormObj2.find("[name=expense_method]").val(expense_method_arr[i]);
          }
       }
     
      var expense_year = "${upDelExpenseList.expense_date}";
      var expense_year2 = expense_year.substring(0,4);
      var expense_month = expense_year.substring(5,7);
      var expense_date = expense_year.substring(8,10);
      var expense_day = expense_year.substring(10,11);
      
      expenseUpDelFormObj2.find("[name=expense_year]").val(expense_year2);
          
     expenseUpDelFormObj2.find("[name=expense_month]").val(expense_month);
      
     expenseUpDelFormObj2.find("[name=expense_date]").val(expense_date);
     
     expenseUpDelFormObj2.find("[name=to_today_day]").val(expense_day);
      
      expenseUpDelFormObj2.find("[name=receipt_no]").val( "${upDelExpenseList.receipt_no}");


      expenseUpDelFormObj2.find("[name=remarks]").val( "${upDelExpenseList.remarks}");



      $("[name=expenseContentForm2]").find("[name=selectPageNo]").val( "${param.selectPageNo}");



   //mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
   // form3 태그를 모두 실행한 후 실행할 자스 코드 설정 (수정화면용)
   //mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm

      // name=expenseContentForm 을 가진 form 태그를 관리하는 JQuery 객체 메위주 저장하기
      var expenseUpDelFormObj3 = $("[name=expenseContentForm3]");
      expenseUpDelFormObj3.find("[name=expense_name]").val( "${upDelExpenseList.report_name}");
      expenseUpDelFormObj3.find("[name=expense_field]").val( "${upDelExpenseList.expense_field}");
      
      var expense_price = "${upDelExpenseList.expense_price}";

      var result = "";
      
      var arr = expense_price.split("");
      var cnt = 0;

      for ( var i=arr.length-1 ; i>0 ; i-- ){
         if (++cnt%3==0){
            arr[i] = "," + arr[i];
         }
      }
      var print = arr.join("");

      expenseUpDelFormObj3.find("[name=expense_price]").val( print );
      
      expenseUpDelFormObj3.find("[name=expense_method]").val( "${upDelExpenseList.expense_method}");
      expenseUpDelFormObj3.find("[name=receipt_no]").val( "${upDelExpenseList.receipt_no}");

      var expense_year = "${upDelExpenseList.expense_date}";
      var expense_year2 = expense_year.substring(0,4);
      var expense_month = expense_year.substring(5,7);
      var expense_date = expense_year.substring(8,10);
      var expense_day = expense_year.substring(10,11);
      
      expenseUpDelFormObj3.find("[name=expense_year]").val(expense_year2);
          
      expenseUpDelFormObj3.find("[name=expense_month]").val(expense_month);
      
      expenseUpDelFormObj3.find("[name=expense_date]").val(expense_date);
     
      expenseUpDelFormObj3.find("[name=to_today_day]").val(expense_day);

      expenseUpDelFormObj3.find("[name=remarks]").val( "${upDelExpenseList.remarks}");



      $("[name=expenseContentForm3]").find("[name=selectPageNo]").val( "${param.selectPageNo}");




   //mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
   // [오늘로] 글씨를 클릭하면 실행할 구문 설정 (수정화면용)
   //mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
      
      var expenseUpDelFormObj2 = $("[name=expenseContentForm2]");

         expenseUpDelFormObj2.find(".to_today").click(function(){
         // 현재 날짜를 관리하는 Date 객체 생성해서 객체의 메위주를 today라는 변수에 저장.
         // 월을 세팅할 땐 1을 빼고, 월을 얻을 땐 1을 더하자. ex) 2월을 세팅할 땐, 1월로 집어넣기
         // n월의 마지막날을 얻고 싶으면 n월 0일을 세팅
         var today = new Date(  );
         // 현재 날짜의 년도 얻기
         var year = today.getFullYear();
         // 현재 날짜의 월 얻기. 주의> 월을 얻고 나서 1을 더할 것
         var month = today.getMonth()+1;
         var date = today.getDate();
         var day = getWeek( today.getDay() );
         if(month<10){month="0"+month}
         if(date<10){date="0"+date}
         // 현재 날짜의 월을 name=min_reg_year 을 가진 입력양식에 넣어주기
         expenseUpDelFormObj2.find("[name=expense_year]").val(year);
         // 현재 날짜의 월을 name=min_reg_month 을 가진 입력양식에 넣어주기
         expenseUpDelFormObj2.find("[name=expense_month]").val(month);
         expenseUpDelFormObj2.find("[name=expense_date]").val(date);
         expenseUpDelFormObj2.find("[name=to_today_day]").val(day);
         
      });

        


         //name=expense_price를 가진 입력 양식에서 keyup 이벤트가 발생하면 익명함수 안의 코딩을 실행
         $("[name=expense_price]").bind("keyup",function(){
         //입력양식에서 입력한 데이터를 자바스크립트 영역으로 가져와 변수에 저장
            var expense_price = $(this).val();

            //숫자문자를 변수에 저장
            var num ="0123456789";
            //숫자만 골라서 저장할 변수 선언
            var result = "";
            //expense_price 변수 안의 데이터 중 숫자만 골라 result에 축적 시킴
            for ( var i=0 ; i<expense_price.length ; i++ ){
            //expense_price 안에 데이터 중 i번째 데이터가 숫자문자면 result 변수 축적

            if(isNaN(expense_price.charAt(i))==false){//isNaN->문자일때 true, 숫자나 숫자문자일때 false
               result = result + expense_price.charAt(i);
            }

         }
         //result 변수 안의 맨 앞의 데이터가 0이면 0을 제거
         while (result.charAt(0)=="0"){
         result = result.substring(1);
         }
         $(this).val(result);
         var arr = result.split("");
         var cnt = 0;

         //Array 객체에 접근해서 배열변수 맨 뒤에서부터 세어 3의 배수에 해당하는 배열변수 안의 데이터 앞에 삽입

         for ( var i=arr.length-1 ; i>0 ; i-- ){
            if (++cnt%3==0){
            arr[i] = "," + arr[i];
            }
         }

         //Array 객체의 배열변수 안에 모든 데이터를 붙여서 name=expense_name를 가진 입력양식에 삽입
         $(this).val(arr.join(""));

        });

   //mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
   // [오늘로] 글씨를 클릭하면 실행할 구문 설정 (수정화면 4용)
   //mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
      
      var expenseUpDelFormObj3 = $("[name=expenseContentForm3]");

         expenseUpDelFormObj3.find(".to_today").click(function(){
              
         // 현재 날짜를 관리하는 Date 객체 생성해서 객체의 메위주를 today라는 변수에 저장.
         // 월을 세팅할 땐 1을 빼고, 월을 얻을 땐 1을 더하자. ex) 2월을 세팅할 땐, 1월로 집어넣기
         // n월의 마지막날을 얻고 싶으면 n월 0일을 세팅
         var today = new Date(  );
         // 현재 날짜의 년도 얻기
         var year = today.getFullYear();
         // 현재 날짜의 월 얻기. 주의> 월을 얻고 나서 1을 더할 것
         var month = today.getMonth()+1;
         var date = today.getDate();
         var day = getWeek( today.getDay() );
         if(month<10){month="0"+month}
         if(date<10){date="0"+date}
         //if(month<10){month="0"+month}
         // 현재 날짜의 월을 name=min_reg_year 을 가진 입력양식에 넣어주기
         expenseUpDelFormObj3.find("[name=expense_year]").val(year);
         // 현재 날짜의 월을 name=min_reg_month 을 가진 입력양식에 넣어주기
         expenseUpDelFormObj3.find("[name=expense_month]").val(month);
         expenseUpDelFormObj3.find("[name=expense_date]").val(date);
         expenseUpDelFormObj3.find("[name=to_today_day]").val(day);
         
      });

        

      //mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
      // 수정화면 4 제목 비움버튼
      //mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
      expenseUpDelFormObj3.find("[name=empty]").click(function(){
         expenseUpDelFormObj3.find("[name=expense_name]").val('');
      });



   })


//----------------------------------------------------------------------------------------------------

   //mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
   // 수정화면2 결재/반려 버튼에 적용하는 유효성 체크 함수 선언
   //mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm

        function checkExpenseUpDelForm( upDel ){
           var expenseUpFormObj = $("[name=expenseContentForm]");
       try{
              if(upDel=="up"){
                 
               expenseUpFormObj.find("[name=upDel]").val( 'up' );
      
               if ( $('input:radio[name=sign_check]').is(':checked') == false ){
                  alert("결제하기 또는 반려하기를 선택해주세요");
                  return;
               }
               
               // 결제하기 버튼을 눌렀을 때 반려사유 없게하기
               if ( $('input:radio[value=confirm]').is(':checked') == true ){
                   if( expenseUpFormObj.find("[name=no_confirm_reason]").val() !="" ){
                     alert("반려사유를 쓰시고 싶으시면 반려하기를 선택해주세요.");
                     expenseUpFormObj.find("[name=no_confirm_reason]").val("");
                   }
               }
               
               // 만약 반려버튼을 눌렀는 데 반려사유를 안 썼음면 경고문 띄우기
               if ( $('input:radio[value=no_confirm]').is(':checked') == true ){
                  if ( expenseUpFormObj.find("[name=no_confirm_reason]").val() =="" ){
                     alert("반려사유를 작성해주세요"); 
                    return;
                  }
         
                }
         
               // 반려사유에 첫 글자가 공백 불가, 최소 
               var no_confirm_reason = $("[name=no_confirm_reason]").val();
               if ( expenseUpFormObj.find("[name=no_confirm_reason]").val() !="" ){
                  if ( new RegExp(/^[가-힣a-zA-Z0-9][가-힣a-zA-Z0-9 ]{0,50}$/).test(no_confirm_reason)==false  ){
                  alert("첫 글자 공백 불가,다시 작성해주세요");
                  expenseUpFormObj.find("[name=no_confirm_reason]").val("");
                  return;
                  }
               }
            
               if(confirm("정말 수정할까요")==false ){ return; }
      
            }
           
   
         //---------------------------------------
         // 현재 화면에서 페이지 이동 없이 서버쪽 "/pro/expenseUpProc.do"  을 호출하여
         //       연락처 입력 후 입력 행의 개수를 받아 처리한다.
         //---------------------------------------
         $.ajax({
            // ------------------
            // 호출할 서버쪽 URL 주소 설정
            // ------------------
            url : "/pro/expense_report_upDel_proc.do"
            // ------------------
            // 전송 방법 설정
            // ------------------
            ,type : "post"
            ,dataType: "json"
            // ------------------
            // 서버에 보낼 파라미터명과 파라미터값을 설정
            // ------------------
            ,data :  $("form").filter("[name=expenseContentForm]").serialize()
            // ------------------
            // 서버의 응답을 성공적으로 받았을 경우 실행할 익명함수 설정.
            // 익명함수의 매개변수 contactRegCnt 에는 연락처 입력 적용행의 개수가 들어온다.
            // ------------------
            ,success : function( expenseUpDelCnt ){
               
            // 연락처 수정 적용 행의 개수가 1개 이상이면
            // 즉 수정이 성공했으면
               if( expenseUpDelCnt>0 ){
                  // alert 상자 띄우고 재 등록할지 물어본다
                  alert( "지출보고서 수정 또는 삭제 성공!" );
                  location.href = document.referrer;
               }
               else if(expenseUpDelCnt==-1){
                      alert( "지출보고서 수정 또는 삭제 실패! 관리자에게 문의 바람!" );
                       location.replace("/pro/expenseList.do");
                }
                else if(expenseUpDelCnt==-2) {
                    if(confirm( "이미 수정된 내역이 존재합니다. 다시 불러오시겠습니까?" )==true) {
                       document.expenseContentForm4.submit();
                     }
                    else {
                    	location.href = document.referrer;
                    }
                 }
              
               //location.replace("/erp/contactSearchForm.do");
            }
            //---------------------------------
            // 서버의 응답을 못 받았을 경우 실행할 익명함수 설정.
            //---------------------------------
            ,error : function(  ){
               alert("서버와 통신 실패!");
            }
      
         });
   
   }catch(e){alert( "checkExpenseUpDelForm( ) 함수 예외 발생!" );}
         
       
      }

      

   //----------------------------------------------------------------------------------------
   // 등록하기 버튼 
   //----------------------------------------------------------------------------------------

      
   /*     
  
      // 등록 확인 메시지
      if (confirm("정말 등록하시겠습니까?")==false){
         document.expense.reset();
         return;
      }
      // 등록 성공 확인 메시지 띄우고 검색화면으로 돌아가기
      else {
         alert("결제 / 반려 성공");
         location.replace('/report/expense_report_search_form.do');
         return;
      }
       
   */
   

//----------------------------------------------------------------------------------------------------

   //************************************************************************
   //존재하는 년,월,일 인지의 여부를 리턴하는 함수
   //존재하는 년,월,일이면 true를 리턴
   //************************************************************************
      function is_valid_date(year, month, date){   
   
         year = parseInt( year, 10);  
         month = parseInt( month, 10);
         date = parseInt( date, 10);

         //------------------------------------------------------------------------
         //매개변수로 들어온 년,월,일을 관리하는 Date 객체 생성
         //------------------------------------------------------------------------
         var xxx = new Date(year, month-1, date);
         var flag = false;

         //------------------------------------------------------------------------
         //매개변수로 들어온 년,월,일과 Date 객체가 관리하는 년,월,일이 동일하면 
         //flag 변수에 true 저장
         //------------------------------------------------------------------------
         if ( year==xxx.getFullYear() &&  month==xxx.getMonth()+1 &&  date==xxx.getDate() ){
                     flag = true;
         }
         //------------------------------------------------------------------------
         //존재하는 년,월,일 인지의 여부를 리턴
         //------------------------------------------------------------------------
         return flag;

      }


      //************************************************************************
      //지출일 년,월,일 선택하면 호출되는 함수 (지출 보고서 수정화면용)
      //************************************************************************
      function checkAvailableDay2(){

         var expenseUpDelFormObj2 = $("[name=expenseContentForm2]");
       
         //------------------------------------------------------------------------
         //선택한 생일의 년,월,일을 변수에 저장
         //------------------------------------------------------------------------
         var check_year = expenseUpDelFormObj2.find("[name=expense_year]").val( ); 
         var check_month = expenseUpDelFormObj2.find("[name=expense_month]").val( );
         var check_date = expenseUpDelFormObj2.find("[name=expense_date]").val( );
   
   
          //---------------------------------------------------------------------
          //년도 먼저 설정하도록 함
          //---------------------------------------------------------------------
               if (check_year==""&&check_month !="")
               {
                  alert("년도를 먼저 선택해주세요");
            expenseUpDelFormObj2.find("[name=expense_year]").val("");
            expenseUpDelFormObj2.find("[name=expense_month]").val("");
            expenseUpDelFormObj2.find("[name=expense_date]").val("");
            expenseUpDelFormObj2.find("[name=to_today_day]").val("");
                  return;
               }
               if (check_year==""&&check_date !="")
               {
                  alert("년도를 먼저 선택해주세요");
            expenseUpDelFormObj2.find("[name=expense_year]").val("");
            expenseUpDelFormObj2.find("[name=expense_month]").val("");
            expenseUpDelFormObj2.find("[name=expense_date]").val("");
            expenseUpDelFormObj2.find("[name=to_today_day]").val("");
                  return;
               }
          //---------------------------------------------------------------------
          //월 먼저 설정하도록 함
          //---------------------------------------------------------------------
               if (check_month==""&&check_date !="")
               {
                  alert("월을 먼저 선택해주세요");
            expenseUpDelFormObj2.find("[name=expense_year]").val("");
            expenseUpDelFormObj2.find("[name=expense_month]").val("");
            expenseUpDelFormObj2.find("[name=expense_date]").val("");
            expenseUpDelFormObj2.find("[name=to_today_day]").val("");
                  return;
               }

   
         //------------------------------------------------------------------------
         //선택한 생일의 년,월,일 중에 하나라도 비어있으면 함수 중단
         //------------------------------------------------------------------------
         if( check_year=="" || check_month=="" || check_date=="" ){return;}
      

         //------------------------------------------------------------------------
         //is_valid_date 함수 호출하여 선택한 생일의 년,월,일의 실존 여부를 판단하여
         //존재하지 않는 생일이면 경고하고
         //------------------------------------------------------------------------
         if (  check_year!= null && check_month!=null && check_date!=null  ){

            if( is_valid_date(check_year, check_month, check_date)==false){
               alert("날짜가 존재하지 않습니다");
               expenseUpDelFormObj2.find("[name=expense_year]").val("");
               expenseUpDelFormObj2.find("[name=expense_month]").val("");
               expenseUpDelFormObj2.find("[name=expense_date]").val("");
               expenseUpDelFormObj2.find("[name=to_today_day]").val("");
               return;
            }
            else{
               var select_day = new Date( check_year, check_month-1, check_date );
               var month = select_day.getMonth()+1;
               var date = select_day.getDate();
               var day = getWeek( select_day.getDay() );
               expenseUpDelFormObj2.find("[name=to_today_day]").val(day);
            }
         }
      }



      //mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
      // 지출 보고서 수정화면(form2)에 대한 유효성 체크 함수 선언 
      //mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm

      function checkExpenseUpDelForm2( upDel ){
         var expenseUpDelFormObj2 = $("[name=expenseContentForm2]");


   
         try{
               //**********************************************
               // 수정 버튼을 클릭한 경우
               //**********************************************
               if(upDel=="up"){
                  expenseUpDelFormObj2.find("[name=upDel]").val( 'up' );
   
                  //지출 제목 유효성 검사
                  var expense_name = expenseUpDelFormObj2.find("[name=expense_name]").val( );  
   
                  if ( expense_name=="" ){
                  alert("지출 제목을 입력해주세요.");
                  return;
                  }
   
                  //지출 분야 유효성 검사
                  var expense_field = expenseUpDelFormObj2.find("[name=expense_field]").val();
   
                  if (expense_field==""){
                  alert("지출분야를 입력해주세요.");
                  return;
                  }
   
                  //비용 유효성 검사
                  var expense_price = expenseUpDelFormObj2.find("[name=expense_price]").val( ); 
                  if (expense_price==""){
                  alert("비용을 입력해주세요.");
                  return;
                  }
   
                  //지출 수단 유효성 검사
                  var expense_method = expenseUpDelFormObj2.find("[name=expense_method]").val();
                  if (expense_method==""){
                  alert("지출수단을 입력해주세요."); 
                  return;
                  }
   
                  //지출일 유효성 검사
                  var check_year = expenseUpDelFormObj2.find("[name=expense_year]").val( ); 
                  var check_month = expenseUpDelFormObj2.find("[name=expense_month]").val( );
                  var check_date = expenseUpDelFormObj2.find("[name=expense_date]").val( );
   
                  if(check_year=="" || check_month=="" || check_date==""){
                  alert("지출일을 입력해주세요");
                  return;
                  }
   
   
                  //결재하기 체크박스 체크여부
                  if($('input:checkbox[name="sign_check"]').is(":checked")){
                     if (confirm("정말 수정하시겠습니까?")==false ){
                           return;
                     }
   
                  }else{
                  alert('결재여부가 체크 되어있지 않습니다.');
                        return;
                  }
               }



               //**********************************************
               // 삭제 버튼을 클릭한 경우
               //**********************************************
               else{
                  expenseUpDelFormObj2.find("[name=upDel]").val( 'del' );
                  if(confirm("정말 삭제할까요")==false ){ return; }
               }



            //---------------------------------------
            // 현재 화면에서 페이지 이동 없이 서버쪽 "/pro/expenseUpProc.do"  을 호출하여
            //       연락처 입력 후 입력 행의 개수를 받아 처리한다.
            //---------------------------------------
            $.ajax({
               // ------------------
               // 호출할 서버쪽 URL 주소 설정
               // ------------------
               url : "/pro/expense_report_upDel_proc.do"
               // ------------------
               // 전송 방법 설정
               // ------------------
               ,type : "post"
               ,dataType: "json"
               // ------------------
               // 서버에 보낼 파라미터명과 파라미터값을 설정
               // ------------------
               ,data :  $("form").filter("[name=expenseContentForm2]").serialize()
               // ------------------
               // 서버의 응답을 성공적으로 받았을 경우 실행할 익명함수 설정.
               // 익명함수의 매개변수 contactRegCnt 에는 연락처 입력 적용행의 개수가 들어온다.
               // ------------------
               ,success : function( expenseUpDelCnt ){
               // 연락처 수정 적용 행의 개수가 1개 이상이면
               // 즉 수정이 성공했으면
               if( expenseUpDelCnt>0 ){
               // alert 상자 띄우고 재 등록할지 물어본다
                     alert( "지출보고서 수정 또는 삭제 성공!" );
                     location.href = document.referrer;
               }
               else if(expenseUpDelCnt==-1){
                     alert( "지출보고서 수정 또는 삭제 실패! 관리자에게 문의 바람!" );
                     location.replace("/pro/expenseList.do");
               }
               else if(expenseUpDelCnt==-2) {
                  if(confirm( "이미 수정된 내역이 존재합니다. 다시 불러오시겠습니까?" )==true) {
                        document.expenseContentForm4.submit();
                  }
                 else {
                	 location.href = document.referrer;
                 }
                }
              // location.replace("/pro/expenseList.do");
               //location.replace("/erp/contactSearchForm.do");
               }
               //---------------------------------
               // 서버의 응답을 못 받았을 경우 실행할 익명함수 설정.
               //---------------------------------
               ,error : function(  ){
               alert("서버와 통신 실패!");
               }

            });

         }catch(e){alert( "checkExpenseUpDelForm2( ) 함수 예외 발생!" );}
      }



//----------------------------------------------------------------------------------------------------------

      //************************************************************************
      //지출일 년,월,일 선택하면 호출되는 함수 (수정화면4용)
      //************************************************************************
      function checkAvailableDay3(){

         var expenseUpDelFormObj3 = $("[name=expenseContentForm3]");
       
         //------------------------------------------------------------------------
         //선택한 생일의 년,월,일을 변수에 저장
         //------------------------------------------------------------------------
         var check_year = expenseUpDelFormObj3.find("[name=expense_year]").val( ); 
         var check_month = expenseUpDelFormObj3.find("[name=expense_month]").val( );
         var check_date = expenseUpDelFormObj3.find("[name=expense_date]").val( );
   
   
          //---------------------------------------------------------------------
          //년도 먼저 설정하도록 함
          //---------------------------------------------------------------------
               if (check_year==""&&check_month !="")
               {
                  alert("년도를 먼저 선택해주세요");
            expenseUpDelFormObj3.find("[name=expense_year]").val("");
            expenseUpDelFormObj3.find("[name=expense_month]").val("");
            expenseUpDelFormObj3.find("[name=expense_date]").val("");
            expenseUpDelFormObj3.find("[name=to_today_day]").val("");
                  return;
               }
               if (check_year==""&&check_date !="")
               {
                  alert("년도를 먼저 선택해주세요");
            expenseUpDelFormObj3.find("[name=expense_year]").val("");
            expenseUpDelFormObj3.find("[name=expense_month]").val("");
            expenseUpDelFormObj3.find("[name=expense_date]").val("");
            expenseUpDelFormObj3.find("[name=to_today_day]").val("");
                  return;
               }
          //---------------------------------------------------------------------
          //월 먼저 설정하도록 함
          //---------------------------------------------------------------------
               if (check_month==""&&check_date !="")
               {
                  alert("월을 먼저 선택해주세요");
            expenseUpDelFormObj3.find("[name=expense_year]").val("");
            expenseUpDelFormObj3.find("[name=expense_month]").val("");
            expenseUpDelFormObj3.find("[name=expense_date]").val("");
            expenseUpDelFormObj3.find("[name=to_today_day]").val("");
                  return;
               }

   
         //------------------------------------------------------------------------
         //선택한 생일의 년,월,일 중에 하나라도 비어있으면 함수 중단
         //------------------------------------------------------------------------
         if( check_year=="" || check_month=="" || check_date=="" ){return;}
      

         //------------------------------------------------------------------------
         //is_valid_date 함수 호출하여 선택한 생일의 년,월,일의 실존 여부를 판단하여
         //존재하지 않는 생일이면 경고하고
         //------------------------------------------------------------------------
         if (  check_year!= null && check_month!=null && check_date!=null  ){

            if( is_valid_date(check_year, check_month, check_date)==false){
               alert("날짜가 존재하지 않습니다");
               expenseUpDelFormObj3.find("[name=expense_year]").val("");
               expenseUpDelFormObj3.find("[name=expense_month]").val("");
               expenseUpDelFormObj3.find("[name=expense_date]").val("");
               expenseUpDelFormObj3.find("[name=to_today_day]").val("");
               return;
            }
            else{
               var select_day = new Date( check_year, check_month-1, check_date );
               var month = select_day.getMonth()+1;
               var date = select_day.getDate();
               var day = getWeek( select_day.getDay() );
               expenseUpDelFormObj3.find("[name=to_today_day]").val(day);
            }
         }
      }



      //mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
      // 지출 보고서 수정화면(form3)에 대한 유효성 체크 함수 선언 
      //mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm

      function checkExpenseUpDelForm3( upDel ){
      var expenseUpDelFormObj3 = $("[name=expenseContentForm3]");


   
         try{
               //**********************************************
               // 수정 버튼을 클릭한 경우
               //**********************************************
               if(upDel=="up"){
               expenseUpDelFormObj3.find("[name=upDel]").val( 'up' );

               //지출 제목 유효성 검사
               var expense_name = expenseUpDelFormObj3.find("[name=expense_name]").val( );  

               if ( expense_name=="" ){
               alert("지출 제목을 입력해주세요.");
               return;
               }

               //지출 분야 유효성 검사
               var expense_field = expenseUpDelFormObj3.find("[name=expense_field]").val();

               if (expense_field==""){
               alert("지출분야를 입력해주세요.");
               return;
               }

               //비용 유효성 검사
               var expense_price = expenseUpDelFormObj3.find("[name=expense_price]").val( ); 
               if (expense_price==""){
               alert("비용을 입력해주세요.");
               return;
               }

               //지출 수단 유효성 검사
               var expense_method = expenseUpDelFormObj3.find("[name=expense_method]").val();
               if (expense_method==""){
               alert("지출수단을 입력해주세요."); 
               return;
               }

               //지출일 유효성 검사
               var check_year = expenseUpDelFormObj3.find("[name=expense_year]").val( ); 
               var check_month = expenseUpDelFormObj3.find("[name=expense_month]").val( );
               var check_date = expenseUpDelFormObj3.find("[name=expense_date]").val( );

               if(check_year=="" || check_month=="" || check_date==""){
               alert("지출일을 입력해주세요");
               return;
               }


               //결재하기 체크박스 체크여부
               if($('input:checkbox[name="sign_check"]').is(":checked")){
                  if (confirm("정말 수정 하시겠습니까?")==false ){
                  return;
                  }

               }else{
                  alert('결재여부가 체크 되어있지 않습니다.');
                  return;
               }
            }



               //**********************************************
               // 삭제 버튼을 클릭한 경우
               //**********************************************
               else{
                  expenseUpDelFormObj3.find("[name=upDel]").val( 'del' );
                  if(confirm("정말 삭제할까요")==false ){ return; }
               }



            //---------------------------------------
            // 현재 화면에서 페이지 이동 없이 서버쪽 "/pro/expenseUpProc.do"  을 호출하여
            //       연락처 입력 후 입력 행의 개수를 받아 처리한다.
            //---------------------------------------
            $.ajax({
               // ------------------
               // 호출할 서버쪽 URL 주소 설정
               // ------------------
               url : "/pro/expense_report_upDel_proc.do"
               // ------------------
               // 전송 방법 설정
               // ------------------
               ,type : "post"
               ,dataType: "json"
               // ------------------
               // 서버에 보낼 파라미터명과 파라미터값을 설정
               // ------------------
               ,data :  $("form").filter("[name=expenseContentForm3]").serialize()
               // ------------------
               // 서버의 응답을 성공적으로 받았을 경우 실행할 익명함수 설정.
               // 익명함수의 매개변수 contactRegCnt 에는 연락처 입력 적용행의 개수가 들어온다.
               // ------------------
               ,success : function( expenseUpDelCnt ){
               // 연락처 수정 적용 행의 개수가 1개 이상이면
               // 즉 수정이 성공했으면
               if( expenseUpDelCnt>0 ){
               // alert 상자 띄우고 재 등록할지 물어본다
                  alert( "지출보고서 수정 성공!" );
                  location.href = document.referrer;
               }
               else if(expenseUpDelCnt==-1) {
                  alert( "지출보고서 수정 실패! 관리자에게 문의 바람!" );
                  location.replace("/pro/expenseList.do");
               }
               else if(expenseUpDelCnt==-2) {
                  if(confirm( "이미 수정된 내역이 존재합니다. 다시 불러오시겠습니까?" )==true) {
                       document.expenseContentForm4.submit();
                     }
                    else {
                    	location.href = document.referrer;
                    }
               }
              // location.replace("/pro/expenseList.do");
               //location.replace("/erp/contactSearchForm.do");
               }
               //---------------------------------
               // 서버의 응답을 못 받았을 경우 실행할 익명함수 설정.
               //---------------------------------
               ,error : function(  ){
                   alert("서버와 통신 실패!");
               }

            });

         }catch(e){alert( "checkExpenseUpDelForm3( ) 함수 예외 발생!" );}
      }


      function reset(){
         var expenseUpDelFormObj2 = $("[name=expenseContentForm2]");
         expenseUpDelFormObj2.find("[name=expense_price]").val('');
         expenseUpDelFormObj2.find("[name=expense_name]").val('');
      }
      
      function goDownload(){
    	  document.downLoad.submit();
      }
 
   
   </script>
           
              
            
<!----------------------------------------------------------------------------------------------------------------------------------------------->



   <BODY>
      

   <center><form name="expenseContentForm" method="post" enctype="multipart/form-data" action="/pro/expense_report_upDel_proc.do">
   <br><h3 align="top"><b>[지출 보고서 결재]</b></h3> <br>
   
   <TABLE class="tbcss1" >
   <TR>
         <Th align="left" class="real_table">1.지출 제목</Th>
           <TD align="left" class="real_td" name="expense_name" >&emsp;${upDelExpenseList.report_name}</TD>
   </TR>

   <TR>
         <Th align="left" class="real_table">2.지출 내역</Th>
         <TD align="left" class="real_td">
            <table class="tbcss1">
               <TR>
                     <Th align="center" class="th_color" style="width:90px;">지출분야</Th>
                     <Th align="center" class="th_color" style="width:90px;">비용</Th>
                     <Th align="center" class="th_color" style="width:90px;">지출수단
                     <Th align="center" class="th_color">영수증번호
                     <Th align="center" class="th_color" >지출일
                     <Th align="center" class="th_color" >비고
               </TR>
               
               <TR>
                     <td align="center" class="td_color"  name="expense_field">
                        <c:if test="${upDelExpenseList.expense_field=='1'}">
                      식대
                    </c:if>
                  <c:if test="${upDelExpenseList.expense_field=='2'}">
                      회식비
                    </c:if>
                  <c:if test="${upDelExpenseList.expense_field=='3'}">
                      접대비
                    </c:if>
                  <c:if test="${upDelExpenseList.expense_field=='4'}">
                      비품
                    </c:if>
                  <c:if test="${upDelExpenseList.expense_field=='5'}">
                      기자재
                    </c:if>
                  <c:if test="${upDelExpenseList.expense_field=='6'}">
                      사무가구
                    </c:if>
                  <c:if test="${upDelExpenseList.expense_field=='7'}">
                      교통비
                    </c:if>
                  <c:if test="${upDelExpenseList.expense_field=='8'}">
                      경조사비
                    </c:if>
                  <c:if test="${upDelExpenseList.expense_field=='9'}">
                      숙박비
                    </c:if>
                  <c:if test="${upDelExpenseList.expense_field=='10'}">
                      의류비
                   </c:if>
                  <c:if test="${upDelExpenseList.expense_field=='11'}">
                      도서비
                   </c:if>
                  <c:if test="${upDelExpenseList.expense_field=='12'}">
                     홍보비
                   </c:if>
                  <c:if test="${upDelExpenseList.expense_field=='13'}">
                      기타
                       </c:if>
                     <td name="expense_price" align="center" class="td_color">
                     	<script>
			            	 var expense_price = "${upDelExpenseList.expense_price}";
			
			                 var result = "";
			                 
			                 var arr = expense_price.split("");
			                 var cnt = 0;
			
			                 for ( var i=arr.length-1 ; i>0 ; i-- ){
			                    if (++cnt%3==0){
			                       arr[i] = "," + arr[i];
			                    }
			                 }
			                 var print = arr.join("");
			                 document.write(print);
		            	</script>
                     </td>
                     <td name="expense_method" align="center" class="td_color">
                  <c:if test="${upDelExpenseList.expense_method=='1'}">
                      회사카드
                       </c:if>
                       <c:if test="${upDelExpenseList.expense_method=='2'}">
                      회사현금
                       </c:if>
                       <c:if test="${upDelExpenseList.expense_method=='3'}">
                      개인카드
                       </c:if>
                       <c:if test="${upDelExpenseList.expense_method=='4'}">
                      개인현금
                       </c:if>
                     <td name="receipt_no" align="center" class="td_color">${upDelExpenseList.receipt_no}
                     <td name="expense_date" align="center" class="td_color">${upDelExpenseList.expense_date}
                     <td name="remarks" align="center" class="td_color" >${upDelExpenseList.remarks}
               </TR>
              </table>
   </TR>

   <TR>
         <Th align="left" class="real_table">3.결재 내역</Th>
         <TD align="left" class="real_td">
            <c:forEach var="list" items="${selectApprovallist}" begin="1" end="${selectApprovallist[0].max_return_no}" varStatus="idx" >
            <table class="tbcss1">
            <TR>
                  <Th align="center" class="th_color" style="width:90px;">결재 차수</Th>
                  <Th align="center" class="th_color" style="width:150px;">결재자명</Th>
                  <Th align="center" class="th_color" style="width:150px;">결재 여부</Th>
            </TR>
             
                <c:forEach var="list2" items="${selectApprovallist}" varStatus="loopTagStatus2" 
                         begin="${selectApprovallist.size()/selectApprovallist[0].max_return_no*(idx.index-1)}" 
                         end="${selectApprovallist.size()/selectApprovallist[0].max_return_no*idx.index-1}">
                  <TR>
                     <TD align="center" class="td_color">${list2.row_num}
                     <td align="center" class="td_color">${list2.emp_name}
                     <td align="center" class="td_color">
                        <div id="confirm_button">
                        <c:if test="${list2.sign_state=='결재하기'}">
                           <input type ="radio" id="sign_check1" name="sign_check" value="confirm">결재하기
                           <input type ="radio" id="sign_check2"  name="sign_check" value="no_confirm">반려하기&nbsp;
                           (반려사유 :
                           <input type="text" name="no_confirm_reason" style="width:90px;">)
                        </c:if>
                        <c:if test="${list2.sign_state!='결재하기'}">
                           ${list2.sign_state}
                        </c:if>
                        </div>
                    </tr>
                </c:forEach> 
            </table>
            <br>
       </c:forEach>
   </TR>
    <input type="hidden" name="upDel" >
    <input type="hidden" name="report_no" value="${expenseDTO.report_no}">
    <input type="hidden" name="revise_cnt" value="${upDelExpenseList.revise_cnt}">
   </TABLE>
   
   <div style="height:5px"></div>
   
   <TABLE>
      <TR>
       <TD>
       <c:forEach var="list2" items="${selectApprovallist}">
             <c:if test="${list2.sign_state=='결재하기'}">
             <div><input type="button" value="수정" style="width:100px;" onclick="checkExpenseUpDelForm( 'up' )" class="btn btn1">&nbsp;&nbsp;</div>
             </c:if>
          </c:forEach>
       </TD>
         <TD><div><input type="button" value="화면닫기" style="width:100px;" onclick="location.replace('/pro/expenseList.do')" class="btn btn1">&nbsp;&nbsp;</div></TD>
         <TD><div><input type="button" value="보고서 출력" style="width:100px;" onclick="goDownload()" class="btn btn1">&nbsp;&nbsp;</div></TD>
      </TR>
   </TABLE><br>

   </center>
   </form>

<!----------------------------------------------------------------------------------------------------------------------------------------------->

<center><form name="expenseContentForm2" action="/pro/expense_report_upDel_proc.do">
   <BR><center><h3 align="top"><b>[지출 보고서 수정]</b></h3><BR>
   
   <TABLE class="tbcss1" >
   <TR><th align="left" class="real_table">1.지출 제목</Th>
            <TD align="left" class="real_td">&emsp;<input type="text" name="expense_name" size="30" value=""></TD>
   </TR>

   <TR>
      <th align="left" class="real_table">2.지출 내역</th>
      <TD align="left" class="real_td"><table class="tbcss1">
         <TR><th align="center" class="th_color" style="width:70px;">지출분야</th>
         <th align="center" class="th_color" style="width:90px;">비용</th>
         <th align="center" class="th_color" style="width:90px;">지출수단
         <th align="center" class="th_color">영수증번호
         <th align="center" class="th_color">지출일
         <th align="center" class="th_color">비고
         </TR>
      </TD>

   </TR>  


   <TR>

      <TD align="center" class="td_color">*
         <select name="expense_field" id="expense_field">
            <option value="">선택요망</option>
            <option value="1"> 식대</option>
            <option value="2" > 회식비</option>
            <option value="3" > 접대비</option>
            <option value="4"  > 비품</option>
            <option value="5"  > 기자재</option>
            <option value="6"  > 사무가구</option>
            <option value="7" > 교통비</option>
            <option value="8" > 경조사비</option>
            <option value="9"  > 숙박비</option>
            <option value="10"> 의류비</option>
            <option value="11"> 도서비</option>
            <option value="12" > 홍보비</option>
            <option value="13" > 기타</option>
         </select>

      </TD>

      <TD align="center" class="td_color">* <input type="text" name="expense_price" style="width:70px;" value="" maxlength="20">원</td>

      <TD align="center" class="td_color">*
         <select name="expense_method">
            <option value="">선택요망</option>
            <option value="1" >회사카드</option>
            <option value="2" >회사현금</option>
            <option value="3" >개인카드</option>
            <option value="4">개인현금</option>
         </select>
      </TD>
            
        <td align="center" class="td_color"><input type="text" name="receipt_no" style="width:100px;" value="" maxlength="10"></td>
        <td align="center" class="td_color">* 
            <select name="expense_year" onChange="checkAvailableDa2()">
            <option value="">
            <option value="1999">1999
            <option value="2000">2000
            <option value="2001">2001
            <option value="2002">2002
            <option value="2003">2003
            <option value="2004">2004
            <option value="2005">2005
            <option value="2006">2006
            <option value="2007">2007
            <option value="2008">2008
            <option value="2009">2009
            <option value="2010">2010
            <option value="2011">2011
            <option value="2012">2012
            <option value="2013">2013
            <option value="2014">2014
            <option value="2015">2015
            <option value="2016">2016
            <option value="2017">2017
            <option value="2018">2018
            <option value="2019">2019
            </select>&nbsp;&nbsp;년&nbsp;
            <select name="expense_month" onChange="checkAvailableDay2()">
            <option value="">
            <option value="01">01
            <option value="02">02
            <option value="03">03
            <option value="04">04
            <option value="05">05
            <option value="06">06
            <option value="07">07
            <option value="08">08
            <option value="09">09
            <option value="10">10
            <option value="11">11
            <option value="12">12
            </select>&nbsp;&nbsp;월&nbsp;
            <select name="expense_date" onChange="checkAvailableDay2()">
            <option value="">
            <option value="01">01
            <option value="02">02
            <option value="03">03
            <option value="04">04
            <option value="05">05
            <option value="06">06
            <option value="07">07
            <option value="08">08
            <option value="09">09
            <option value="10">10
            <option value="11">11
            <option value="12">12
            <option value="13">13
            <option value="14">14
            <option value="15">15
            <option value="16">16
            <option value="17">17
            <option value="18">18
            <option value="19">19
            <option value="20">20
            <option value="21">21
            <option value="22">22
            <option value="23">23
            <option value="24">24
            <option value="25">25
            <option value="26">26
            <option value="27">27
            <option value="28">28
            <option value="29">29
            <option value="30">30
            <option value="31">31
         </select>&nbsp;&nbsp;일&nbsp;
                     
         <input type="text"  name="to_today_day" style="width:25px;" readonly>

         <span style="cursor:pointer" class="to_today">[오늘로]</span>

            <td align="center" class="td_color"><input type="text" name="remarks" style="width:100px;" value=""></td>
            
         </select>
      </TD>
    </TR>
    </table>

   <TR>
          <th align="left" class="real_table">3.결재 내역</Th>
         <TD align="left" class="real_td"><c:forEach var="list" items="${selectApprovallist}" begin="1" end="${selectApprovallist[0].max_return_no}" varStatus="idx" >
            <table class="tbcss1">
            <TR>
                  <Th align="center" class="th_color"  style="width:90px;">결재 차수</Th>
                  <Th align="center" class="th_color"  style="width:150px;">결재자명</Th>
                  <Th align="center" class="th_color"  style="width:150px;">결재 여부</Th>
            </TR>
             
                <c:forEach var="list2" items="${selectApprovallist}" varStatus="loopTagStatus2" 
                         begin="${selectApprovallist.size()/selectApprovallist[0].max_return_no*(idx.index-1)}" 
                         end="${selectApprovallist.size()/selectApprovallist[0].max_return_no*idx.index-1}">
                  <TR>
                     <TD align="center" class="td_color" >${list2.row_num}
                     <td align="center" class="td_color" >${list2.emp_name}
                     <td align="center" class="td_color" >
                     <c:if test="${selectApprovallist[0].max_return_no == idx.count && loopTagStatus2.count==1 }">
                        <div id="confirm_button">
                              <input type ="checkbox" name="sign_check" value="confirm" checked="checked">결재하기
                           </div>
                     </c:if>
                     <c:if test="${!(selectApprovallist[0].max_return_no == idx.count && loopTagStatus2.count==1 )}">
                     <div id="confirm_button">
                           ${list2.sign_state}
                        </div>
                     </c:if>
                    </tr>
                </c:forEach> 
             
            
            </table>
            <br>
       </c:forEach>
            
   </TR>
   </TABLE>
   
   
   </center>
   <div style="height:15px"></div>  
      <center>
      <input type="hidden" name="upDel">
      <input type="hidden" name="report_no" value="${expenseDTO.report_no}">
      <input type="button" value="수정" onClick="checkExpenseUpDelForm2( 'up' )" class="btn btn1">&nbsp;&nbsp;
      <input type="button" value="삭제" onClick="checkExpenseUpDelForm2( 'del' )" class="btn btn1">&nbsp;&nbsp;
      <input type="button" value="화면닫기" style="width:100px;" onclick="location.replace('/pro/expenseList.do')" class="btn btn1">&nbsp;&nbsp;
      <input type="button" value="보고서 출력" style="width:100px;" onclick="goDownload()" class="btn btn1">&nbsp;&nbsp;
      <input type="reset" value="초기화" class="btn btn1"></input>&nbsp;&nbsp;</center>
      <input type="hidden" name="report_field" value="1">
      <input type="hidden" name="revise_cnt" value="${upDelExpenseList.revise_cnt}">

   <c:if test="${!empty sessionScope.emp_no}">
      <input type="hidden" name="emp_no" value="${sessionScope.emp_no}">   
   </c:if>

   </form></center>   

   

<!-- ==================================================================================================================================================================== -->

  <center><form name="expenseContentForm3" action="/pro/expense_report_upDel_proc.do">
   <BR><center><h3 align="top"><b>[반려 보고서 수정]</b></h3><BR>
   
   <TABLE class="tbcss1" >
   <TR><var="selectExpenselist" items="${selectExpenselist}" varStatus="loopTagStatus">
            <th align="left" class="real_table">1.지출 제목</Th>
            <TD  align="left" class="real_td">&emsp;<input type="text" name="expense_name" size="30" value=""></TD>
   </TR>

   <TR>
      <th align="left" class="real_table">2.지출 내역</th>
      <TD  align="left" class="real_td"><table class="tbcss1">
         <TR><th align="center" class="th_color" style="width:60px;">지출분야</th>
         <th align="center" class="th_color" style="width:90px;">비용</th>
         <th align="center" class="th_color" style="width:90px;">지출수단
         <th align="center" class="th_color">영수증번호
         <th align="center" class="th_color">지출일
         <th align="center" class="th_color">비고
         </TR>
      </TD>

   </TR>  


   <TR>

      <TD align="center" class="td_color">*
         <select name="expense_field" id="expense_field">
            <option value="">선택요망</option>
            <option value="1"> 식대</option>
            <option value="2" > 회식비</option>
            <option value="3" > 접대비</option>
            <option value="4"  > 비품</option>
            <option value="5"  > 기자재</option>
            <option value="6"  > 사무가구</option>
            <option value="7" > 교통비</option>
            <option value="8" > 경조사비</option>
            <option value="9"  > 숙박비</option>
            <option value="10"> 의류비</option>
            <option value="11"> 도서비</option>
            <option value="12" > 홍보비</option>
            <option value="13" > 기타</option>
         </select>

      </TD>

      <TD align="center" class="td_color">* <input type="text" name="expense_price" style="width:70px;" value="" maxlength="20">원</td>

      <TD align="center" class="td_color">*
         <select name="expense_method">
            <option value="">선택요망</option>
            <option value="1" >회사카드</option>
            <option value="2" >회사현금</option>
            <option value="3" >개인카드</option>
            <option value="4">개인현금</option>
         </select>
      </TD>
            
        <td align="center" class="td_color"><input type="text" name="receipt_no" style="width:100px;" value="" maxlength="10"></td>
        <td align="center" class="td_color">* 
            <select name="expense_year" onChange="checkAvailableDay3()">
            <option value="">
           		<script>
                    for (var i=1990; i<=new Date().getFullYear()+1 ; i++ )
                    {   document.write("<option value="+i+">"+i);
                    }
                 </script> 
            </select>&nbsp;&nbsp;년&nbsp;
            <select name="expense_month" onChange="checkAvailableDay3()">
            <option value="">
            <option value="01">01
            <option value="02">02
            <option value="03">03
            <option value="04">04
            <option value="05">05
            <option value="06">06
            <option value="07">07
            <option value="08">08
            <option value="09">09
            <option value="10">10
            <option value="11">11
            <option value="12">12
            </select>&nbsp;&nbsp;월&nbsp;
            <select name="expense_date" onChange="checkAvailableDay3()">
            <option value="">
            <option value="01">01
            <option value="02">02
            <option value="03">03
            <option value="04">04
            <option value="05">05
            <option value="06">06
            <option value="07">07
            <option value="08">08
            <option value="09">09
            <option value="10">10
            <option value="11">11
            <option value="12">12
            <option value="13">13
            <option value="14">14
            <option value="15">15
            <option value="16">16
            <option value="17">17
            <option value="18">18
            <option value="19">19
            <option value="20">20
            <option value="21">21
            <option value="22">22
            <option value="23">23
            <option value="24">24
            <option value="25">25
            <option value="26">26
            <option value="27">27
            <option value="28">28
            <option value="29">29
            <option value="30">30
            <option value="31">31
         </select>&nbsp;&nbsp;일&nbsp;
                     
         <input type="text"  name="to_today_day" style="width:25px;" readonly>

         <span style="cursor:pointer" class="to_today">[오늘로]</span>

            <td align="center" class="td_color"><input type="text" name="remarks" style="width:100px;" value=""></td>
            
         </select>
      </TD>
    </TR>
    </table>

   <TR>
         <Th align="left" class="real_table">3.결재 내역</Th>
         <TD align="left" class="real_td">
         <c:forEach var="list" items="${selectApprovallist}" begin="1" end="${selectApprovallist[0].max_return_no}" varStatus="idx" >
            <table class="tbcss1">
            <TR>
                  <Th align="center" class="th_color" style="width:90px;">결재 차수</Th>
                  <Th align="center" class="th_color" style="width:150px;">결재자명</Th>
                  <Th align="center" class="th_color" style="width:150px;">결재 여부</Th>
            </TR>
             
                <c:forEach var="list2" items="${selectApprovallist}" varStatus="loopTagStatus2" 
                         begin="${selectApprovallist.size()/selectApprovallist[0].max_return_no*(idx.index-1)}" 
                         end="${selectApprovallist.size()/selectApprovallist[0].max_return_no*idx.index-1}">
                  <TR>
                     <TD align="center" class="td_color" ><center>${list2.row_num}</center>
                     <td align="center" class="td_color"><center>${list2.emp_name}</center>
                     <td align="center" class="td_color"><center>
                        <div id="confirm_button">
                           ${list2.sign_state}
                        </div></center>
                    </tr>
                </c:forEach> 
             
            
            </table>
            <br>
       </c:forEach>
            <table class="tbcss1">
            <TR>
                  <Th align="center" class="th_color" style="width:90px;">결재 차수</Th>
                  <Th align="center" class="th_color" style="width:150px;">결재자명</Th>
                  <Th align="center" class="th_color" style="width:150px;">결재 여부</Th>
            </TR>
            
            <c:forEach var="selectApprovallist" items="${selectApprovallist}" varStatus="loopTagStatus" begin="0" end="${selectApprovallist.size()/selectApprovallist[0].max_return_no-1}">
            <TR>
                  <TD align="center" class="td_color" name="sign_no">${selectApprovallist.row_num}
                  <td align="center" class="td_color"  name="sign_emp_name">${selectApprovallist.emp_name}
                  <td align="center" class="td_color">
                      <c:if test="${loopTagStatus.count==1}">
                           <div id="confirm_button">
                              <input type ="checkbox" name="sign_check" value="confirm">결재하기
                           </div>
                        </c:if>
                        <c:if test="${loopTagStatus.count!=1}">
                            결재예정
                       </c:if>
                 </TR>
                 
             </c:forEach>
            </table>
   </TR>
   </TABLE>
   
      <br><br>
   
   </center>
   <div style="height:15px"></div> 
   
   <center>
   
      <input type="hidden" name="upDel">
       <input type="hidden" name="report_no" value="${expenseDTO.report_no}">
       <input type="button" value="수정" onClick="checkExpenseUpDelForm3( 'up' )" class="btn btn1">&nbsp;&nbsp;
       <input type="button" value="삭제" onClick="checkExpenseUpDelForm3( 'del' )"class="btn btn1">&nbsp;&nbsp;
       <input type="button" value="화면닫기" style="width:100px;" onclick="location.replace('/pro/expenseList.do')" class="btn btn1">&nbsp;&nbsp;
       <input type="button" value="보고처 출력" style="width:100px;" onclick="goDownload()" class="btn btn1">&nbsp;&nbsp;
       <input type="reset" value="초기화" class="btn btn1"></input>&nbsp;&nbsp;</center>
       <input type="hidden" name="report_field" value="1">
      <input type="hidden" name="revise_cnt" value="${upDelExpenseList.revise_cnt}">
       <c:if test="${!empty sessionScope.emp_no}">
       <input type="hidden" name="emp_no" value="${sessionScope.emp_no}">   
         </c:if>
   </form></center>   
   
   <form name="expenseContentForm4" method="post" action="/pro/expense_report_upDel_form.do">
         <input type="hidden" name="report_no" value="${expenseDTO.report_no}">
         <input type="hidden" name="writer" value="${expenseDTO.writer}">   
         <input type="hidden" name="sign_name" value="${expenseDTO.sign_name}">   
         <input type="hidden" name="max_return_no" value="${expenseDTO.max_return_no}">   
   </form>
   
   
   <form name="downLoad" method="post" action="/pro/wordDown_expense.do">
   		<input type="hidden" name="report_no" value="${expenseDTO.report_no}">
   		<input type="hidden" name="max_return_no" value="${expenseDTO.max_return_no}">   
   </form>
   
   </BODY>
   <br>
</HTML>