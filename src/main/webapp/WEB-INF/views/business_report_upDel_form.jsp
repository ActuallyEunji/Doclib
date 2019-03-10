<!--mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm-->
<!--JSP 페이지 처리 방식 선언-->
<!--mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm-->
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!--mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm-->
<!--현재 페이지에 common.jsp 파일 내의 소스 삽입-->
<!--mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm-->
<%@include file="common2.jsp"%>


<HTML>



   <script src="jquery-1.11.0.min.js" type="text/javascript"></script>

   <script>
   
      function getWeek (num) {

        var week = ["일","월","화","수","목","금","토"]
        return week[num];

      };

   </script>
  

   <script>




   $(document).ready(function(){
	   
 	  // 초기화 버튼 함수 (수정)
		var businessUpDelFormObj2=$("[name=businessContentForm2]");	
		
		businessUpDelFormObj2.find(".reset").click(function(){
			businessUpDelFormObj2.find("[name=business_check]").prop("checked",false); 
			businessUpDelFormObj2.find("[name=business_field]").val('');
			businessUpDelFormObj2.find("[name=business_name]").val('');
			businessUpDelFormObj2.find("[name^=personlist]").val('');
			businessUpDelFormObj2.find("[name^=min_business]").val(""); 
			businessUpDelFormObj2.find("[name^=max_business]").val(""); 
			businessUpDelFormObj2.find("[name=business_content]").val(""); 
			businessUpDelFormObj2.find("[name=business_result]").val(""); 

	     })  
		
		// 초기화 버튼 함수 (반려)
		var businessUpDelFormObj3=$("[name=businessContentForm3]");	
		
		businessUpDelFormObj3.find(".reset2").click(function(){
			businessUpDelFormObj3.find("[name=sign_check]").prop("checked",false); 
			businessUpDelFormObj3.find("[name=business_field]").val('');
			businessUpDelFormObj3.find("[name=business_name]").val('');
			businessUpDelFormObj3.find("[name^=personlist]").val('');
			businessUpDelFormObj3.find("[name^=min_business]").val(""); 
			businessUpDelFormObj3.find("[name^=max_business]").val(""); 
			businessUpDelFormObj3.find("[name=business_content]").val(""); 
			businessUpDelFormObj3.find("[name=business_result]").val(""); 

	     })
   
   
      if( parseInt(${sessionScope.form_choice},10) ==1  ){ //미결재
	      $("[name=businessContentForm").hide();
	      $("[name=businessContentForm3]").hide();
	      <c:forEach var="salesPerson" items="${salesPersonList}" varStatus="loopStatus">
			$("[name=businessContentForm2]").find("[name='personlist[${loopStatus.index}].person_name']").val("${salesPerson.p_name}");
			$("[name=businessContentForm2]").find("[name='personlist[${loopStatus.index}].business_jikup']").val("${salesPerson.jikup}");
			$("[name=businessContentForm2]").find("[name='personlist[${loopStatus.index}].person_phone']").val("${salesPerson.phone}");
			<c:if test="${loopStatus.count != salesPersonList.size()}">
				addTR('xxx1','0');
			</c:if>
	      </c:forEach>
      }
      else if( parseInt(${sessionScope.form_choice},10) ==2 ){ //결재하기 화면
	      $("[name=businessContentForm2]").hide();
	      $("[name=businessContentForm3]").hide();
      }
      else if( parseInt(${sessionScope.form_choice},10) ==4 ){ //반려완료된 수정화면
         $("[name=businessContentForm2]").hide();
	     $("[name=businessContentForm]").hide();
	     <c:forEach var="salesPerson" items="${salesPersonList}" varStatus="loopStatus">
			$("[name=businessContentForm3]").find("[name='personlist[${loopStatus.index}].person_name']").val("${salesPerson.p_name}");
			$("[name=businessContentForm3]").find("[name='personlist[${loopStatus.index}].business_jikup']").val("${salesPerson.jikup}");
			$("[name=businessContentForm3]").find("[name='personlist[${loopStatus.index}].person_phone']").val("${salesPerson.phone}");
			<c:if test="${loopStatus.count != salesPersonList.size()}">
				addTR('xxx3','0');
			</c:if>
	      </c:forEach>
      }
      

   
 


    //mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
	   // form 태그를 모두 실행한 후 실행할 자스 코드 설정 (수정화면 2,3용)
	   //mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
	   
	   // name=expenseContentForm 을 가진 form 태그를 관리하는 JQuery 객체 메위주 저장하기
	    var businessUpDelFormObj = $("[name=businessContentForm]");
	   
	   businessUpDelFormObj.find("[name=business_name]").val( "${upDelBusinessList.report_name}");
	   businessUpDelFormObj.find("[name=business_field]").val("${upDelBusinessList.sales_type}");
	   
	   $("[name=businessContentForm]").find("[name=selectPageNo]").val( "${param.selectPageNo}"); 
	    
	 	 <c:if test="${updatelist.sign_code==1}">
		 	$("#sign_check1").prop("checked",true);
		 </c:if>
		 <c:if test="${updatelist.sign_code==3}">
		 	$("#sign_check2").prop("checked",true);
		 	businessUpDelFormObj.find("[name=no_confirm_reason]").val( "${updatelist.return_result}");
		 </c:if>
	   
	   
	   //mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
	   // form2 태그를 모두 실행한 후 실행할 자스 코드 설정 (수정화면용)
	   //mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
	
	   // name=businessContentForm2 을 가진 form 태그를 관리하는 JQuery 객체 메위주 저장하기
	   var businessUpDelFormObj2 = $("[name=businessContentForm2]");
	   businessUpDelFormObj2.find("[name=business_name]").val("${upDelBusinessList.report_name}");
	   businessUpDelFormObj2.find("[name=business_field]").val("${upDelBusinessList.sales_type}");
	   
	   
	   var min_business_year = "${upDelBusinessList.sales_start_date}";
	   var min_business_year2 = min_business_year.substring(0,4);
	   var min_business_month = min_business_year.substring(5,7);
	   var min_business_date = min_business_year.substring(8,10);
	   var min_business_hour = min_business_year.substring(11,13);
	   var min_business_min = min_business_year.substring(14,16);
	         
	   businessUpDelFormObj2.find("[name=min_business_year]").val(min_business_year2);
	   businessUpDelFormObj2.find("[name=min_business_month]").val(min_business_month);
	   businessUpDelFormObj2.find("[name=min_business_day]").val(min_business_date);
	   businessUpDelFormObj2.find("[name=min_business_hour]").val(min_business_hour);
	   businessUpDelFormObj2.find("[name=min_business_minute]").val(min_business_min);
	   
	   var max_business_year = "${upDelBusinessList.sales_end_date}";
	   var max_business_year2 = max_business_year.substring(0,4);
	   var max_business_month = max_business_year.substring(5,7);
	   var max_business_date = max_business_year.substring(8,10);
	   var max_business_hour = max_business_year.substring(11,13);
	   var max_business_min = max_business_year.substring(14,16);
	         
	   businessUpDelFormObj2.find("[name=max_business_year]").val(max_business_year2);
	   businessUpDelFormObj2.find("[name=max_business_month]").val(max_business_month);
	   businessUpDelFormObj2.find("[name=max_business_day]").val(max_business_date);
	   businessUpDelFormObj2.find("[name=max_business_hour]").val(max_business_hour);
	   businessUpDelFormObj2.find("[name=max_business_minute]").val(max_business_min);
	   
	   businessUpDelFormObj2.find("[name=business_content]").val("${upDelBusinessList.sales_content}");
	   businessUpDelFormObj2.find("[name=business_result]").val( "${upDelBusinessList.sales_result}"); 
	   
	   $("[name=businessContentForm2]").find("[name=selectPageNo]").val( "${param.selectPageNo}");
	   
	   //mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
	   // form3 태그를 모두 실행한 후 실행할 자스 코드 설정 (수정화면용)
	   //mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
	
	   // name=expenseContentForm 을 가진 form 태그를 관리하는 JQuery 객체 메위주 저장하기
	   var businessUpDelFormObj3 = $("[name=businessContentForm3]");
	   businessUpDelFormObj3.find("[name=business_name]").val("${upDelBusinessList.report_name}");
	   businessUpDelFormObj3.find("[name=business_field]").val("${upDelBusinessList.sales_type}");
	

	   var min_business_year = "${upDelBusinessList.sales_start_date}";
	   var min_business_year2 = min_business_year.substring(0,4);
	   var min_business_month = min_business_year.substring(5,7);
	   var min_business_date = min_business_year.substring(8,10);
	   var min_business_hour = min_business_year.substring(11,13);
	   var min_business_min = min_business_year.substring(14,16);
	         
	   businessUpDelFormObj3.find("[name=min_business_year]").val(min_business_year2);
	   businessUpDelFormObj3.find("[name=min_business_month]").val(min_business_month);
	   businessUpDelFormObj3.find("[name=min_business_day]").val(min_business_date);
	   businessUpDelFormObj3.find("[name=min_business_hour]").val(min_business_hour);
	   businessUpDelFormObj3.find("[name=min_business_minute]").val(min_business_min);
	   
	   var max_business_year = "${upDelBusinessList.sales_end_date}";
	   var max_business_year2 = max_business_year.substring(0,4);
	   var max_business_month = max_business_year.substring(5,7);
	   var max_business_date = max_business_year.substring(8,10);
	   var max_business_hour = max_business_year.substring(11,13);
	   var max_business_min = max_business_year.substring(14,16);
	         
	   businessUpDelFormObj3.find("[name=max_business_year]").val(max_business_year2);
	   businessUpDelFormObj3.find("[name=max_business_month]").val(max_business_month);
	   businessUpDelFormObj3.find("[name=max_business_day]").val(max_business_date);
	   businessUpDelFormObj3.find("[name=max_business_hour]").val(max_business_hour);
	   businessUpDelFormObj3.find("[name=max_business_minute]").val(max_business_min);
	   
	   businessUpDelFormObj3.find("[name=business_content]").val("${upDelBusinessList.sales_content}");
	   businessUpDelFormObj3.find("[name=business_result]").val( "${upDelBusinessList.sales_result}"); 
	   $("[name=businessContentForm3]").find("[name=selectPageNo]").val( "${param.selectPageNo}");
	      
	   //mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
	   // 수정화면 4 제목 비움버튼
	   //mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
	   businessUpDelFormObj3.find("[name=empty]").click(function(){
	      businessUpDelFormObj3.find("[name=business_name]").val('');
	   });  
	   

   }); //Ready  끝


//----------------------------------------------------------------------------------------------------

   function addTR( classN, check_1 ){
       try{
         //---------------
         // checkbox 와 radio 입력 양식을 가르키는 [선택자 문자열] 저장.
         // checkbox 와 radio 입력 양식을 제외한 입력 양식 태그를 가르키는 [선택자 문자열] 저장.
         // 모든 입력 양식 태그를 가르키는 [선택자 문자열] 저장.
         //---------------
         var cr_selector = "[type=checkbox],[type=radio]";
         var not_cr_selector = "select,textarea,[type=text],[type=password],[type=hidden],[type=file]"
         var all_selector = cr_selector + "," +not_cr_selector;
         //---------------
         // 매개변수로 들어온 선택자가 가르키는 태그를 관리하는 JQuery 객체 생성.
         // 매개변수로 들어온 선택자가 가르키는 태그 중 마지막 놈을 관리하는 JQuery 객체 생성.
         //---------------
         var obj = $("."+classN);
         var lastObj = obj.last( );
         //---------------
         // 매개변수로 들어온 선택자가 가르키는 태그 내부의 입력 양식에 입력된 데이터 개수 누적하기
         //---------------
         var dataCnt = 0; var flag = true;
         lastObj.find( cr_selector+ ", "+not_cr_selector ).each( function(){
              if( flag == false) { return; }
              // i번째 입력양식을 관리하는 JQuery 객체를 생성해서 저장
              var thisObj = $(this);
              var nameV = thisObj.attr("name");
              if( nameV.indexOf("[")<0 || nameV.indexOf("]")<0 ) {
                alert( "1행의 [" + nameV+"] 라는 입력양식의 이름에는 [i]가 있어야 합니다."); flag = false;
              }
              else{
                // i번째 입력양식이 checkbox 또는 radio 면
                if( thisObj.is(":radio") || thisObj.is(":checkbox") ){
                  if( thisObj.filter(":checked").length>0){ dataCnt++;  }
                }
                // i번째 입력양식이 checkbox 도 아니고 radio 도 아니면
                else{
                  // i번째 입력양식의 입력값이 있으면 dataCnt 변수안에 1증가
                  var val = thisObj.val( );
                    if( val.split(" ").join("")!="" && check_1=='1'){dataCnt++; } 

                }
              }
         })
         if( flag == false) { return; }
         //---------------
         // 매개변수로 들어온 선택자가 가르키는 태그 내부의 입력 양식에 입력된 데이터 개수가 0개면 함수중단하기
         //---------------
          if(dataCnt<=2  && check_1=='1') { alert("마지막 행에 테이터가 비어있어 행 추가 불가능!"); return; }   
         //---------------
         // 마지막 행 복사해 마지막 다음에 삽입하기
         // 삽입한 행의 입력 양식에 데이터 비우기
         //---------------
         lastObj.after( lastObj.clone() );
         var lastObj = lastObj.next( );
         lastObj.find(cr_selector).attr("checked",false)
         lastObj.find(not_cr_selector).val("")
         //---------------
         // 매개변수로 들어온 선택자가 가르키는 모든 태그 내부의 입력 양식의 name 속성값의 중간에 [i] 삽입하기
         //---------------
         obj = $("."+classN);
         obj.each( function(i){
              var obj3 = $(this).find(all_selector);
              obj3.each( function(){
                var thisObj = $(this);
                var nameV = thisObj.attr("name");
                //-----
                var arr1  = nameV.split("[");
                var arr2  = arr1[1].split("]");
                nameV = arr1[0] + "["+(i)+"]" +arr2[1];
                thisObj.attr( "name",  nameV   );
              })
         });
         //---------------
         // name 값 출력하기. 추후 주석 처리할 것
         //---------------
        // print_nameV( classN );
       }catch(e){
         alert("addTR(~) 함수 호출 시 에러 발생!");
       }
     }
     //***********************************************************
     // 행 삭제하는 함수 선언
     //***********************************************************
     function delLastTR( classN ){
       try{
         //---------------
         // checkbox 와 radio 입력 양식을 가르키는 [선택자 문자열] 저장.
         // checkbox 와 radio 입력 양식을 제외한 입력 양식 태그를 가르키는 [선택자 문자열] 저장.
         // 모든 입력 양식 태그를 가르키는 [선택자 문자열] 저장.
         //---------------
         var cr_selector = "[type=checkbox],[type=radio]";
         var not_cr_selector = "select,textarea,[type=text],[type=password],[type=hidden],[type=file]";
         var all_selector = cr_selector + "," +not_cr_selector;
         //---------------
         // 매개변수로 들어온 선택자가 가르키는 태그를 관리하는 JQuery 객체 생성.
         // 매개변수로 들어온 선택자가 가르키는 태그가 1개면 함수 중단.
         //---------------
         var obj = $("."+classN);
         obj.each( function(i){
             var obj3 = $(this).find(all_selector);
             obj3.each( function(){
               var thisObj = $(this);
               var nameV = thisObj.attr("name");
               //-----
               var arr1  = nameV.split("[");
               var arr2  = arr1[1].split("]");
               nameV = arr1[0] + "["+(i)+"]" +arr2[1];
               thisObj.attr( "name",  nameV   );
             })
        });
         if( obj.length==1 ) { return; }
         //---------------
         // 매개변수로 들어온 선택자가 가르키는 태그 중 마지막 놈을 관리하는 JQuery 객체 생성.
         // 매개변수로 들어온 선택자가 가르키는 태그 중 마지막 놈을 삭제하기.
         //---------------
         var lastObj = obj.last( );
         if( confirm("정말 삭제하시겠습니까?")==false ) { return; }
         lastObj.remove();
         //---------------
         // name 값 출력하기. 주석 처리할 것
         //---------------
        // print_nameV( classN )
       }catch(e){
         alert("delLastTR(~) 함수 호출 시 에러 발생!");
       }
     }
     
     //***********************************************************
     // 행 안의 입력 양식의 name 출력하는 함수 선언
     //***********************************************************
     function print_nameV( classN ){
       try{
         $(".xxxxx").remove();
         $("body").append("<center><div class=xxxxx></div></center>");
         var xxxxxObj = $(".xxxxx");
         var cr_selector = "[type=checkbox],[type=radio]";
         var not_cr_selector = "select,textarea,[type=text],[type=password],[type=hidden],[type=file]";
         var all_selector = cr_selector + "," +not_cr_selector;
         obj = $("."+classN);
         xxxxxObj.html(" ");
         var htmls = [];
         obj.each( function(i){
              var obj3 = $(this).find(all_selector);
              obj3.each( function(){
                var thisObj = $(this); var nameV = thisObj.attr("name");
                htmls.push( nameV + " / " );
              })
              htmls.push("<br>");
         });
       xxxxxObj.append( htmls.join("") );
       }catch(e){
         alert("print_nameV(~) 함수 호출 시 에러 발생!");
       }
     }

   
   
   //mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
   // 수정화면2 결재/반려 버튼에 적용하는 유효성 체크 함수 선언
   //mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm

   function checkBusinessUpDelForm( upDel ){
      var businessUpFormObj = $("[name=businessContentForm]");
      try{
         if(upDel=="up"){
             businessUpFormObj.find("[name=upDel]").val( 'up' );
             if ( $('input:radio[name=sign_check]').is(':checked') == false ){
               alert("결제하기 또는 반려하기를 선택해주세요");
               return;
            }
      
            // 결제하기 버튼을 눌렀을 때 반려사유 없게하기
            if ( $('input:radio[value=confirm]').is(':checked') == true ){
               if( businessUpFormObj.find("[name=no_confirm_reason]").val() !="" ){
                  alert("반려사유를 쓰시고 싶으시면 반려하기를 선택해주세요.");
                  businessUpFormObj.find("[name=no_confirm_reason]").val("");
                }
            }
            // 만약 반려버튼을 눌렀는 데 반려사유를 안 썼음면 경고문 띄우기
            if ( $('input:radio[value=no_confirm]').is(':checked') == true ){
               if ( businessUpFormObj.find("[name=no_confirm_reason]").val() =="" ){
               alert("반려사유를 작성해주세요"); 
               return;
               }
            }
            // 반려사유에 첫 글자가 공백 불가, 최소 
            var no_confirm_reason = $("[name=no_confirm_reason]").val();
            
            if ( businessUpFormObj.find("[name=no_confirm_reason]").val() !="" ){
               if ( new RegExp(/^[가-힣a-zA-Z0-9][가-힣a-zA-Z0-9 ]{0,50}$/).test(no_confirm_reason)==false  ){
                  alert("첫 글자 공백 불가,다시 작성해주세요");
                  businessUpFormObj.find("[name=no_confirm_reason]").val("");
                  return;
               }
            }
            if(confirm("정말 수정할까요")==false ){ 
               return; 
            }
         }
      
         //---------------------------------------
         // 현재 화면에서 페이지 이동 없이 서버쪽 "/pro/expenseUpProc.do"  을 호출하여
         //       연락처 입력 후 입력 행의 개수를 받아 처리한다.
         //---------------------------------------
         $.ajax({
            // ------------------
            // 호출할 서버쪽 URL 주소 설정
            // ------------------
            url : "/pro/business_report_upDel_proc.do"
            // ------------------
            // 전송 방법 설정
            // ------------------
            ,type : "post"
            // ------------------
            // 서버에 보낼 파라미터명과 파라미터값을 설정
            // ------------------
            ,data :  $("form").filter("[name=businessContentForm]").serialize()
            // ------------------
            // 서버의 응답을 성공적으로 받았을 경우 실행할 익명함수 설정.
            // 익명함수의 매개변수 contactRegCnt 에는 연락처 입력 적용행의 개수가 들어온다.
            // ------------------
         
            ,success : function( businessUpDelCnt ){
	            // 연락처 수정 적용 행의 개수가 1개 이상이면
	            // 즉 수정이 성공했으면
	            if( businessUpDelCnt>0 ){
	               // alert 상자 띄우고 재 등록할지 물어본다
	               alert( "영업보고서 수정 또는 삭제 성공!" );
	               location.href = document.referrer;
	            }
	            else if(businessUpDelCnt==-1){
	               alert( "영업보고서 수정 또는 삭제 실패! 관리자에게 문의 바람!" );
	               location.replace("/pro/businessList.do");
	            }
	            else if(businessUpDelCnt==-2){
	            	if(confirm( "이미 수정된 내역이 존재합니다. 다시 불러오시겠습니까?" )==true) {
	               	 	document.businessContentForm4.submit();
	                 }
	                else {
	                	location.href = document.referrer;
	                }
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
         alert( "checkBusinessUpDelForm( ) 함수 예외 발생!" );
      }  
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
   //방문시작일 년,월,일 선택하면 호출되는 함수 (지출 보고서 수정화면용)
   //************************************************************************
   function checkApprovalDay2(){
   
      var businessUpDelFormObj2 = $("[name=businessContentForm2]");
      
      //------------------------------------------------------------------------
      //선택한 방문시작일의 년,월,일을 변수에 저장
      //------------------------------------------------------------------------
      var check_year = businessUpDelFormObj2.find("[name=min_business_year]").val( ); 
      var check_month = businessUpDelFormObj2.find("[name=min_business_month]").val( );
      var check_date = businessUpDelFormObj2.find("[name=min_business_day]").val( );
      var check_hour = businessUpDelFormObj2.find("[name=min_business_hour]").val( );
      var check_minute = businessUpDelFormObj2.find("[name=min_business_minute]").val( );


      var check_year1 = businessUpDelFormObj2.find("[name=max_business_year]").val( ); 
      var check_month1 = businessUpDelFormObj2.find("[name=max_business_month]").val( );
      var check_date1 = businessUpDelFormObj2.find("[name=max_business_day]").val( );
      var check_hour1 = businessUpDelFormObj2.find("[name=max_business_hour]").val( );
      var check_minute1 = businessUpDelFormObj2.find("[name=max_business_minute]").val( );
   
      
       //---------------------------------------------------------------------
       //년도 먼저 설정하도록 함
       //---------------------------------------------------------------------
      if (check_year==""&&check_month !=""){
          alert("년도를 먼저 선택해주세요");
          businessUpDelFormObj2.find("[name=min_business_year]").val("");
          businessUpDelFormObj2.find("[name=min_business_month]").val("");
          businessUpDelFormObj2.find("[name=min_business_day]").val("");
          businessUpDelFormObj2.find("[name=min_business_hour]").val("");
          businessUpDelFormObj2.find("[name=min_business_minute]").val("");
          return;
         }
         if (check_year==""&&check_date !=""){
          alert("년도를 먼저 선택해주세요");
          businessUpDelFormObj2.find("[name=min_business_year]").val("");
          businessUpDelFormObj2.find("[name=min_business_month]").val("");
          businessUpDelFormObj2.find("[name=min_business_day]").val("");
          businessUpDelFormObj2.find("[name=min_business_hour]").val("");
          businessUpDelFormObj2.find("[name=min_business_minute]").val("");
           return;
         }
         if (check_year==""&&check_hour !=""){
             alert("년도를 먼저 선택해주세요");
             businessUpDelFormObj2.find("[name=min_business_year]").val("");
             businessUpDelFormObj2.find("[name=min_business_month]").val("");
             businessUpDelFormObj2.find("[name=min_business_day]").val("");
             businessUpDelFormObj2.find("[name=min_business_hour]").val("");
             businessUpDelFormObj2.find("[name=min_business_minute]").val("");
              return;
            }
         if (check_year==""&&check_minute !=""){
             alert("년도를 먼저 선택해주세요");
             businessUpDelFormObj2.find("[name=min_business_year]").val("");
             businessUpDelFormObj2.find("[name=min_business_month]").val("");
             businessUpDelFormObj2.find("[name=min_business_day]").val("");
             businessUpDelFormObj2.find("[name=min_business_hour]").val("");
             businessUpDelFormObj2.find("[name=min_business_minute]").val("");
              return;
            }
 	      //---------------------------------------------------------------------
 	      //월 먼저 설정하도록 함
 	      //---------------------------------------------------------------------
 	        if (check_month==""&&check_date !=""){
 	         alert("월을 먼저 선택해주세요");
 	          businessUpDelFormObj2.find("[name=min_business_year]").val("");
 	          businessUpDelFormObj2.find("[name=min_business_month]").val("");
 	          businessUpDelFormObj2.find("[name=min_business_day]").val("");
 	          businessUpDelFormObj2.find("[name=min_business_hour]").val("");
 	          businessUpDelFormObj2.find("[name=min_business_minute]").val("");
 	         return;
 	        }
 	        if (check_month==""&&check_hour !=""){
 	            alert("월을 먼저 선택해주세요");
 	           businessUpDelFormObj2.find("[name=min_business_year]").val("");
 	          businessUpDelFormObj2.find("[name=min_business_month]").val("");
 	          businessUpDelFormObj2.find("[name=min_business_day]").val("");
 	          businessUpDelFormObj2.find("[name=min_business_hour]").val("");
 	          businessUpDelFormObj2.find("[name=min_business_minute]").val("");
 	            return;
 	           }
 	        if (check_month==""&&check_minute !=""){
 	            alert("월을 먼저 선택해주세요");
 	           businessUpDelFormObj2.find("[name=min_business_year]").val("");
 	          businessUpDelFormObj2.find("[name=min_business_month]").val("");
 	          businessUpDelFormObj2.find("[name=min_business_day]").val("");
 	          businessUpDelFormObj2.find("[name=min_business_hour]").val("");
 	          businessUpDelFormObj2.find("[name=min_business_minute]").val("");
 	            return;
 	           }
 		   
 		   //---------------------------------------------------------------------
 		   //일 먼저 설정하도록 함
 		   //--------check_date------------------------------------------------------------
	 		 if (check_date==""&&check_hour !=""){
	 		  alert("일을 먼저 선택해주세요");
	          businessUpDelFormObj2.find("[name=min_business_year]").val("");
	          businessUpDelFormObj2.find("[name=min_business_month]").val("");
	          businessUpDelFormObj2.find("[name=min_business_day]").val("");
	          businessUpDelFormObj2.find("[name=min_business_hour]").val("");
	          businessUpDelFormObj2.find("[name=min_business_minute]").val("");
	 		  return;
	 		 }
	 		 if (check_date==""&&check_minute !=""){
	 		  alert("일을 먼저 선택해주세요");
	          businessUpDelFormObj2.find("[name=min_business_year]").val("");
	          businessUpDelFormObj2.find("[name=min_business_month]").val("");
	          businessUpDelFormObj2.find("[name=min_business_day]").val("");
	          businessUpDelFormObj2.find("[name=min_business_hour]").val("");
	          businessUpDelFormObj2.find("[name=min_business_minute]").val("");
	 		  return;
	 		 }
            //---------------------------------------------------------------------
            //시 먼저 설정하도록 함
            //---------------------------------------------------------------------
	 		if (check_hour==""&&check_minute !="")
	 		{
	 		   alert("시간을 먼저 선택해주세요");
	           businessUpDelFormObj2.find("[name=min_business_year]").val("");
	           businessUpDelFormObj2.find("[name=min_business_month]").val("");
	           businessUpDelFormObj2.find("[name=min_business_day]").val("");
	           businessUpDelFormObj2.find("[name=min_business_hour]").val("");
	           businessUpDelFormObj2.find("[name=min_business_minute]").val("");
	 		   return;
	 		}
	      //------------------------------------------------------------------------
	      //선택한 방문시작일의 년,월,일 중에 하나라도 비어있으면 함수 중단
	      //------------------------------------------------------------------------
	      if( check_year=="" || check_month=="" || check_date=="" ){
	         return;
	      }
	      //------------------------------------------------------------------------
	      //is_valid_date 함수 호출하여 선택한 방문시작일의 년,월,일의 실존 여부를 판단하여
	      //존재하지 않는 생일이면 경고하고
	      //------------------------------------------------------------------------
	      if (  check_year!= null && check_month!=null && check_date!=null  ){
	         if( is_valid_date(check_year, check_month, check_date)==false){
	            alert("날짜가 존재하지 않습니다");
	            businessUpDelFormObj2.find("[name=min_business_year]").val("");
	            businessUpDelFormObj2.find("[name=min_business_month]").val("");
	            businessUpDelFormObj2.find("[name=min_business_day]").val("");
	            return;
	            }
	            else{
	            var select_day = new Date( check_year, check_month-1, check_date );
	            var month = select_day.getMonth()+1;
	            var date = select_day.getDate();
	            }
	      }
           
       if( (check_year!=null && check_year.length>0) 
          && (check_month!=null && check_month.length>0)
          &&(check_date!=null && check_date.length>0) 
          && (check_year1!=null && check_year1.length>0) 
          && (check_month1!=null && check_month1.length>0)
          &&(check_date1!=null && check_date1.length>0)   ){

          var max_date = businessUpDelFormObj2.find("[name=max_business_year]").val(  )
                      +businessUpDelFormObj2.find("[name=max_business_month]").val(  )
					  +businessUpDelFormObj2.find("[name=max_business_day]").val(  );
          var min_date = businessUpDelFormObj2.find("[name=min_business_year]").val(  )      
                      +businessUpDelFormObj2.find("[name=min_business_month]").val(  )
                      +businessUpDelFormObj2.find("[name=min_business_day]").val(  );

          if( parseInt(max_date,10) < parseInt(min_date,10) ) {
          
             alert("[최소 년월]이 [최대 년월] 보다 큽니다. 재 선택 바람!");
             businessUpDelFormObj2.find("[name^=min_business_]").val("");
             businessUpDelFormObj2.find("[name^=max_business_]").val("");
             return;
           }

       }

       if(   (check_hour!=null && check_hour.length>0) 
          && (check_minute!=null && check_minute.length>0)
          &&(check_hour1!=null && check_hour1.length>0) 
          && (check_minute1!=null && check_minute1.length>0)   ){

          var max_date1 = businessUpDelFormObj2.find("[name=max_business_hour]").val(  )
                      +businessUpDelFormObj2.find("[name=max_business_minute]").val(  );
          var min_date1 = businessUpDelFormObj2.find("[name=min_business_hour]").val(  )      
                      +businessUpDelFormObj2.find("[name=min_business_minute]").val(  );
          if( parseInt(max_date1,10) < parseInt(min_date1,10) ) {
             alert("[최소 time]이 [최대 time] 보다 큽니다. 재 선택 바람!");
             businessUpDelFormObj2.find("[name^=max_business_]").val("");
             businessUpDelFormObj2.find("[name^=min_business_]").val("");
             return;
           }

        }
   }
   
   //************************************************************************
   //방문종료일 년,월,일 선택하면 호출되는 함수 (지출 보고서 수정화면용)
   //************************************************************************
   function checkApprovalDay22(){
   
      var businessUpDelFormObj2 = $("[name=businessContentForm2]");
       
      //------------------------------------------------------------------------
      //선택한 방문종료일의 년,월,일을 변수에 저장
      //------------------------------------------------------------------------
      var check_year = businessUpDelFormObj2.find("[name=min_business_year]").val( ); 
      var check_month = businessUpDelFormObj2.find("[name=min_business_month]").val( );
      var check_date = businessUpDelFormObj2.find("[name=min_business_day]").val( );
      var check_hour = businessUpDelFormObj2.find("[name=min_business_hour]").val( );
      var check_minute = businessUpDelFormObj2.find("[name=min_business_minute]").val( );

      var check_year1 = businessUpDelFormObj2.find("[name=max_business_year]").val( ); 
      var check_month1 = businessUpDelFormObj2.find("[name=max_business_month]").val( );
      var check_date1 = businessUpDelFormObj2.find("[name=max_business_day]").val( );
      var check_hour1 = businessUpDelFormObj2.find("[name=max_business_hour]").val( );
      var check_minute1 = businessUpDelFormObj2.find("[name=max_business_minute]").val( );
      //---------------------------------------------------------------------
      //년도 먼저 설정하도록 함
      //---------------------------------------------------------------------
      if (check_year1==""&&check_month1 !=""){
          alert("년도를 먼저 선택해주세요");
          businessUpDelFormObj2.find("[name=max_business_year]").val("");
          businessUpDelFormObj2.find("[name=max_business_month]").val("");
          businessUpDelFormObj2.find("[name=max_business_day]").val("");
          businessUpDelFormObj2.find("[name=max_business_hour]").val("");
          businessUpDelFormObj2.find("[name=max_business_minute]").val("");
          return;
         }
         if (check_year1==""&&check_date1 !=""){
          alert("년도를 먼저 선택해주세요");
          businessUpDelFormObj2.find("[name=max_business_year]").val("");
          businessUpDelFormObj2.find("[name=max_business_month]").val("");
          businessUpDelFormObj2.find("[name=max_business_day]").val("");
          businessUpDelFormObj2.find("[name=max_business_hour]").val("");
          businessUpDelFormObj2.find("[name=max_business_minute]").val("");
           return;
         }
         if (check_year1==""&&check_hour1 !=""){
             alert("년도를 먼저 선택해주세요");
             businessUpDelFormObj2.find("[name=max_business_year]").val("");
             businessUpDelFormObj2.find("[name=max_business_month]").val("");
             businessUpDelFormObj2.find("[name=max_business_day]").val("");
             businessUpDelFormObj2.find("[name=max_business_hour]").val("");
             businessUpDelFormObj2.find("[name=max_business_minute]").val("");
              return;
            }
         if (check_year1==""&&check_minute1 !=""){
             alert("년도를 먼저 선택해주세요");
             businessUpDelFormObj2.find("[name=max_business_year]").val("");
             businessUpDelFormObj2.find("[name=max_business_month]").val("");
             businessUpDelFormObj2.find("[name=max_business_day]").val("");
             businessUpDelFormObj2.find("[name=max_business_hour]").val("");
             businessUpDelFormObj2.find("[name=max_business_minute]").val("");
              return;
            }
 	      //---------------------------------------------------------------------
 	      //월 먼저 설정하도록 함
 	      //---------------------------------------------------------------------
 	        if (check_month1==""&&check_date1 !=""){
 	         alert("월을 먼저 선택해주세요");
 	          businessUpDelFormObj2.find("[name=max_business_year]").val("");
 	          businessUpDelFormObj2.find("[name=max_business_month]").val("");
 	          businessUpDelFormObj2.find("[name=max_business_day]").val("");
 	          businessUpDelFormObj2.find("[name=max_business_hour]").val("");
 	          businessUpDelFormObj2.find("[name=max_business_minute]").val("");
 	         return;
 	        }
 	        if (check_month1==""&&check_hour1 !=""){
 	            alert("월을 먼저 선택해주세요");
 	           businessUpDelFormObj2.find("[name=max_business_year]").val("");
 	          businessUpDelFormObj2.find("[name=max_business_month]").val("");
 	          businessUpDelFormObj2.find("[name=max_business_day]").val("");
 	          businessUpDelFormObj2.find("[name=max_business_hour]").val("");
 	          businessUpDelFormObj2.find("[name=max_business_minute]").val("");
 	            return;
 	           }
 	        if (check_month1==""&&check_minute1 !=""){
 	            alert("월을 먼저 선택해주세요");
 	           businessUpDelFormObj2.find("[name=max_business_year]").val("");
 	          businessUpDelFormObj2.find("[name=max_business_month]").val("");
 	          businessUpDelFormObj2.find("[name=max_business_day]").val("");
 	          businessUpDelFormObj2.find("[name=max_business_hour]").val("");
 	          businessUpDelFormObj2.find("[name=max_business_minute]").val("");
 	            return;
 	           }
 		   
 		   //---------------------------------------------------------------------
 		   //일 먼저 설정하도록 함
 		   //---------------------------------------------------------------------
 		 if (check_date1==""&&check_hour1 !=""){
 		  alert("일을 먼저 선택해주세요");
          businessUpDelFormObj2.find("[name=max_business_year]").val("");
          businessUpDelFormObj2.find("[name=max_business_month]").val("");
          businessUpDelFormObj2.find("[name=max_business_day]").val("");
          businessUpDelFormObj2.find("[name=max_business_hour]").val("");
          businessUpDelFormObj2.find("[name=max_business_minute]").val("");
 		  return;
 		 }
 		 if (check_date1==""&&check_minute1 !=""){
 		  alert("일을 먼저 선택해주세요");
          businessUpDelFormObj2.find("[name=max_business_year]").val("");
          businessUpDelFormObj2.find("[name=max_business_month]").val("");
          businessUpDelFormObj2.find("[name=max_business_day]").val("");
          businessUpDelFormObj2.find("[name=max_business_hour]").val("");
          businessUpDelFormObj2.find("[name=max_business_minute]").val("");
 		  return;
 		 }
            //---------------------------------------------------------------------
            //시 먼저 설정하도록 함
            //---------------------------------------------------------------------
 		if (check_hour1==""&&check_minute1 !="")
 		{
 		   alert("시간을 먼저 선택해주세요");
           businessUpDelFormObj2.find("[name=max_business_year]").val("");
           businessUpDelFormObj2.find("[name=max_business_month]").val("");
           businessUpDelFormObj2.find("[name=max_business_day]").val("");
           businessUpDelFormObj2.find("[name=max_business_hour]").val("");
           businessUpDelFormObj2.find("[name=max_business_minute]").val("");
 		   return;
 		}
      //------------------------------------------------------------------------
      //선택한 방문종료일의 년,월,일 중에 하나라도 비어있으면 함수 중단
      //------------------------------------------------------------------------
      if( check_year1=="" || check_month1=="" || check_date1=="" ){
         return;
      }
      //------------------------------------------------------------------------
      //is_valid_date 함수 호출하여 선택한 방문종료일의 년,월,일의 실존 여부를 판단하여
      //존재하지 않는 생일이면 경고하고
      //------------------------------------------------------------------------
      if (  check_year1!= null && check_month1!=null && check_date1!=null  ){

         if( is_valid_date(check_year1, check_month1, check_date1)==false){
            alert("날짜가 존재하지 않습니다");
            businessUpDelFormObj2.find("[name=max_business_year]").val("");
            businessUpDelFormObj2.find("[name=max_business_month]").val("");
            businessUpDelFormObj2.find("[name=max_business_day]").val("");
            return;
            }
            else{
            var select_day = new Date( check_year1, check_month1-1, check_date1 );
            var month = select_day.getMonth()+1;
            var date = select_day.getDate();
            }
      }
	  
           
       if( (check_year!=null && check_year.length>0) 
          && (check_month!=null && check_month.length>0)
          &&(check_date!=null && check_date.length>0) 
          && (check_year1!=null && check_year1.length>0) 
          && (check_month1!=null && check_month1.length>0)
          &&(check_date1!=null && check_date1.length>0)   ){

          var max_date = businessUpDelFormObj2.find("[name=max_business_year]").val(  )
                      +businessUpDelFormObj2.find("[name=max_business_month]").val(  )
					  +businessUpDelFormObj2.find("[name=max_business_day]").val(  );

          var min_date = businessUpDelFormObj2.find("[name=min_business_year]").val(  )      
                      +businessUpDelFormObj2.find("[name=min_business_month]").val(  )
                      +businessUpDelFormObj2.find("[name=min_business_day]").val(  );

          if( parseInt(max_date,10) < parseInt(min_date,10) ) {
             alert("[최소 년월]이 [최대 년월] 보다 큽니다. 재 선택 바람!");
             businessUpDelFormObj2.find("[name^=min_business_]").val("");
             businessUpDelFormObj2.find("[name^=max_business_]").val("");
             return;
           }

       }
	   
       if(   (check_hour!=null && check_hour.length>0) 
          && (check_minute!=null && check_minute.length>0)
          &&(check_hour1!=null && check_hour1.length>0) 
          && (check_minute1!=null && check_minute1.length>0)   ){

          var max_date1 = businessUpDelFormObj2.find("[name=max_business_hour]").val(  )
                      +businessUpDelFormObj2.find("[name=max_business_minute]").val(  );
          var min_date1 = businessUpDelFormObj2.find("[name=min_business_hour]").val(  )      
                      +businessUpDelFormObj2.find("[name=min_business_minute]").val(  );
          if( parseInt(max_date1,10) < parseInt(min_date1,10) ) {
             alert("[최소 time]이 [최대 time] 보다 큽니다. 재 선택 바람!");
             businessUpDelFormObj2.find("[name^=max_business_]").val("");
             businessUpDelFormObj2.find("[name^=min_business_]").val("");
             return;
           }

        }
   }
      
   //mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
   // 영업 보고서 수정화면(form2)에 대한 유효성 체크 함수 선언 
   //mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm

   function checkBusinessUpDelForm2( upDel ){
      var businessUpDelFormObj2 = $("[name=businessContentForm2]");
   
      try{
         //**********************************************
         // 수정 버튼을 클릭한 경우
         //**********************************************
         if(upDel=="up"){
            businessUpDelFormObj2.find("[name=upDel]").val( 'up' );

            
            //제목 유효성 검사
            var business_name = businessUpDelFormObj2.find("[name=business_name]").val( );  
   
            if ( business_name=="" ){
               alert("제목을 입력해주세요.");
               return;
            }
   
            //방문 목적 유효성 검사
            var business_field = businessUpDelFormObj2.find("[name=business_field]").val();
   
            if (business_field==""){
               alert("방문 목적을 입력해주세요.");
               return;
            }
   
                        
            //영업내용 유효성 검사
            var business_content = businessUpDelFormObj2.find("[name=business_content]").val( ); 
            
            if (business_content==""){
               alert("영업내용을 입력해주세요.");
               return;
            }
                  
            //영업성과 유효성 검사
            var business_result = businessUpDelFormObj2.find("[name=business_result]").val( ); 
            
            if (business_result==""){
               alert("영업성과를 입력해주세요.");
               return;
            }
            
            for ( var i=0 ; i<$(".xxx1").length ; i++ ){
     		   var person_name =  $("[name='personlist["+i+"].person_name']").val( );
     		   var business_jikup =  $("[name='personlist["+i+"].business_jikup']").val( );
     		   var person_phone =  $("[name='personlist["+i+"].person_phone']").val( );
     		   
         	   for ( var j=i+1 ; j<=$(".xxx1").length ; j++ ){
         		   var person_name2 =  $("[name='personlist["+j+"].person_name']").val( );
         		   var business_jikup2 =  $("[name='personlist["+j+"].business_jikup']").val( );
         		   var person_phone2 =  $("[name='personlist["+j+"].person_phone']").val( );
         		   
         		   if(person_name==person_name2 && business_jikup==business_jikup2 && person_phone==person_phone2){
         			   alert("동일한 만난 사람을 추가할 수 없습니다.");
         			   return;
         		   }
         	   }
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
            businessUpDelFormObj2.find("[name=upDel]").val( 'del' );
            if(confirm("정말 삭제할까요")==false ){ 
               return; 
            }
         }

         //---------------------------------------
         // 현재 화면에서 페이지 이동 없이 서버쪽 "/pro/businessUpProc.do"  을 호출하여
         //       연락처 입력 후 입력 행의 개수를 받아 처리한다.
         //---------------------------------------
         $.ajax({
            // ------------------
            // 호출할 서버쪽 URL 주소 설정
            // ------------------
            url : "/pro/business_report_upDel_proc.do"
            // ------------------
            // 전송 방법 설정
            // ------------------
            ,type : "post"
            // ------------------
            // 서버에 보낼 파라미터명과 파라미터값을 설정
            // ------------------
            ,data :  $("form").filter("[name=businessContentForm2]").serialize()
            // ------------------
            // 서버의 응답을 성공적으로 받았을 경우 실행할 익명함수 설정.
            // 익명함수의 매개변수 contactRegCnt 에는 연락처 입력 적용행의 개수가 들어온다.
            // ------------------
            
            ,success : function( businessUpDelCnt ){
               // 연락처 수정 적용 행의 개수가 1개 이상이면
               // 즉 수정이 성공했으면
            	if( businessUpDelCnt>0 ){
 	               // alert 상자 띄우고 재 등록할지 물어본다
 	               alert( "영업보고서 수정 또는 삭제 성공!" );
 	               location.href = document.referrer;
 	            }
 	            else if(businessUpDelCnt==-1){
 	               alert( "영업보고서 수정 또는 삭제 실패! 관리자에게 문의 바람!" );
 	               location.replace("/pro/businessList.do");
 	            }
 	            else if(businessUpDelCnt==-2){
 	            	if(confirm( "이미 수정된 내역이 존재합니다. 다시 불러오시겠습니까?" )==true) {
 	               	 	document.businessContentForm4.submit();
 	                 }
 	                else {
 	                	location.href = document.referrer;;
 	                }
 	             }
            }
            //---------------------------------
            // 서버의 응답을 못 받았을 경우 실행할 익명함수 설정.
            //---------------------------------
            ,error : function(  ){
            	alert($("form").filter("[name=businessContentForm2]").serialize());
               alert("서버와 통신 실패!");
            }
         });
      }catch(e){
         alert( "checkBusinessUpDelForm2( ) 함수 예외 발생!" );
      }
   }
//------------------------------------------------------------------------------------------------

   //************************************************************************
   //방문일 년,월,일 선택하면 호출되는 함수 (수정화면4용)
   //************************************************************************
   function checkApprovalDay3(){

      var businessUpDelFormObj3 = $("[name=businessContentForm3]");
      
      //------------------------------------------------------------------------
      //선택한 방문시작일의 년,월,일을 변수에 저장
      //------------------------------------------------------------------------
      var check_year = businessUpDelFormObj3.find("[name=min_business_year]").val( ); 
      var check_month = businessUpDelFormObj3.find("[name=min_business_month]").val( );
      var check_date = businessUpDelFormObj3.find("[name=min_business_date]").val( );
      
      //---------------------------------------------------------------------
      //년도 먼저 설정하도록 함
      //---------------------------------------------------------------------
      if (check_year==""&&check_month !=""){
         alert("년도를 먼저 선택해주세요");
         businessUpDelFormObj3.find("[name=min_business_year]").val("");
         businessUpDelFormObj3.find("[name=min_business_month]").val("");
         businessUpDelFormObj3.find("[name=min_business_date]").val("");
         return;
      }
      if (check_year==""&&check_date !=""){
         alert("년도를 먼저 선택해주세요");
         businessUpDelFormObj3.find("[name=min_business_year]").val("");
         businessUpDelFormObj3.find("[name=min_business_month]").val("");
         businessUpDelFormObj3.find("[name=min_business_date]").val("");
         return;
      }
      //---------------------------------------------------------------------
      //월 먼저 설정하도록 함
      //---------------------------------------------------------------------
      if (check_month==""&&check_date !=""){
         alert("월을 먼저 선택해주세요");
         businessUpDelFormObj3.find("[name=min_business_year]").val("");
         businessUpDelFormObj3.find("[name=min_business_month]").val("");
         businessUpDelFormObj3.find("[name=min_business_date]").val("");
         return;
      }
      //------------------------------------------------------------------------
      //선택한 방문시작일의 년,월,일 중에 하나라도 비어있으면 함수 중단
      //------------------------------------------------------------------------
      if( check_year=="" || check_month=="" || check_date=="" ){
         return;
      }
      //------------------------------------------------------------------------
      //is_valid_date 함수 호출하여 선택한 방문시작일의 년,월,일의 실존 여부를 판단하여
      //존재하지 않는 생일이면 경고하고
      //------------------------------------------------------------------------
      if (  check_year!= null && check_month!=null && check_date!=null  ){

         if( is_valid_date(check_year, check_month, check_date)==false){
            alert("날짜가 존재하지 않습니다");
            businessUpDelFormObj3.find("[name=min_business_year]").val("");
            businessUpDelFormObj3.find("[name=min_business_month]").val("");
            businessUpDelFormObj3.find("[name=min_business_date]").val("");
            return;
         }
            else{
            var select_day = new Date( check_year, check_month-1, check_date );
            var month = select_day.getMonth()+1;
            var date = select_day.getDate();
            var day = getWeek( select_day.getDay() );
         }
      }
   }
   //************************************************************************
   //방문종료일 년,월,일 선택하면 호출되는 함수 (지출 보고서 수정화면용)
   //************************************************************************
   function checkApprovalDay33(){

      var businessUpDelFormObj3 = $("[name=businessContentForm3]");
       
      //------------------------------------------------------------------------
      //선택한 방문종료일의 년,월,일을 변수에 저장
      //------------------------------------------------------------------------
      var check_year = businessUpDelFormObj3.find("[name=min_business_year]").val( ); 
      var check_month = businessUpDelFormObj3.find("[name=min_business_month]").val( );
      var check_date = businessUpDelFormObj3.find("[name=min_business_day]").val( );
      var check_hour = businessUpDelFormObj3.find("[name=min_business_hour]").val( );
      var check_minute = businessUpDelFormObj3.find("[name=min_business_minute]").val( );

      var check_year1 = businessUpDelFormObj3.find("[name=max_business_year]").val( ); 
      var check_month1 = businessUpDelFormObj3.find("[name=max_business_month]").val( );
      var check_date1 = businessUpDelFormObj3.find("[name=max_business_day]").val( );
      var check_hour1 = businessUpDelFormObj3.find("[name=max_business_hour]").val( );
      var check_minute1 = businessUpDelFormObj3.find("[name=max_business_minute]").val( );

      //---------------------------------------------------------------------
      //년도 먼저 설정하도록 함
      //---------------------------------------------------------------------
      if (check_year1==""&&check_month1 !=""){
         alert("년도를 먼저 선택해주세요");
         businessUpDelFormObj3.find("[name=max_business_year]").val("");
         businessUpDelFormObj3.find("[name=max_business_month]").val("");
         businessUpDelFormObj3.find("[name=max_business_date]").val("");
         return;
      }
      if (check_year1==""&&check_date1 !=""){
         alert("년도를 먼저 선택해주세요");
         businessUpDelFormObj3.find("[name=max_business_year]").val("");
         businessUpDelFormObj3.find("[name=max_business_month]").val("");
         businessUpDelFormObj3.find("[name=max_business_date]").val("");
         return;
      }
      //---------------------------------------------------------------------
      //월 먼저 설정하도록 함
      //---------------------------------------------------------------------
      if (check_month1==""&&check_date1 !=""){
         alert("월을 먼저 선택해주세요");
         businessUpDelFormObj3.find("[name=max_business_year]").val("");
         businessUpDelFormObj3.find("[name=max_business_month]").val("");
         businessUpDelFormObj3.find("[name=max_business_date]").val("");
         return;
      }
      //------------------------------------------------------------------------
      //선택한 방문종료일의 년,월,일 중에 하나라도 비어있으면 함수 중단
      //------------------------------------------------------------------------
      if( check_year1=="" || check_month1=="" || check_date1=="" ){
         return;
      }
      //------------------------------------------------------------------------
      //is_valid_date 함수 호출하여 선택한 방문종료일의 년,월,일의 실존 여부를 판단하여
      //존재하지 않는 날이면 경고하고
      //------------------------------------------------------------------------
      if (  check_year1!= null && check_month1!=null && check_date1!=null  ){

         if( is_valid_date(check_year1, check_month1, check_date1)==false){
            alert("날짜가 존재하지 않습니다");
            businessUpDelFormObj3.find("[name=max_business_year]").val("");
            businessUpDelFormObj3.find("[name=max_business_month]").val("");
            businessUpDelFormObj3.find("[name=max_business_date]").val("");
            return;
         }
         else{
            var select_day = new Date( check_year1, check_month1-1, check_date1 );
            var month = select_day.getMonth()+1;
            var date = select_day.getDate();
            var day = getWeek( select_day.getDay() );
         }
      }
      
      if( (check_year!=null && check_year.length>0) 
              && (check_month!=null && check_month.length>0)
              &&(check_date!=null && check_date.length>0) 
              && (check_year1!=null && check_year1.length>0) 
              && (check_month1!=null && check_month1.length>0)
              &&(check_date1!=null && check_date1.length>0)   ){

              var max_date = businessUpDelFormObj3.find("[name=max_business_year]").val(  )
                          +businessUpDelFormObj3.find("[name=max_business_month]").val(  )
    					  +businessUpDelFormObj3.find("[name=max_business_day]").val(  );

              var min_date = businessUpDelFormObj3.find("[name=min_business_year]").val(  )      
                          +businessUpDelFormObj3.find("[name=min_business_month]").val(  )
                          +businessUpDelFormObj3.find("[name=min_business_day]").val(  );

              if( parseInt(max_date,10) < parseInt(min_date,10) ) {
                 alert("[최소 년월]이 [최대 년월] 보다 큽니다. 재 선택 바람!");
                 businessUpDelFormObj3.find("[name^=min_business_]").val("");
                 businessUpDelFormObj3.find("[name^=max_business_]").val("");
                 return;
               }

           }
    	   
           if(   (check_hour!=null && check_hour.length>0) 
              && (check_minute!=null && check_minute.length>0)
              &&(check_hour1!=null && check_hour1.length>0) 
              && (check_minute1!=null && check_minute1.length>0)   ){

              var max_date1 = businessUpDelFormObj3.find("[name=max_business_hour]").val(  )
                          +businessUpDelFormObj3.find("[name=max_business_minute]").val(  );
              var min_date1 = businessUpDelFormObj3.find("[name=min_business_hour]").val(  )      
                          +businessUpDelFormObj3.find("[name=min_business_minute]").val(  );
              if( parseInt(max_date1,10) < parseInt(min_date1,10) ) {
                 alert("[최소 time]이 [최대 time] 보다 큽니다. 재 선택 바람!");
                 businessUpDelFormObj3.find("[name^=max_business_]").val("");
                 businessUpDelFormObj3.find("[name^=min_business_]").val("");
                 return;
               }

            }
      
   }
      
   //mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
   // 영업 보고서 수정화면(form3)에 대한 유효성 체크 함수 선언 
   //mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm

   function checkBusinessUpDelForm3( upDel ){
      
      var businessUpDelFormObj3 = $("[name=businessContentForm3]");
      
      try{ 
         if(upDel=="up"){
            businessUpDelFormObj3.find("[name=upDel]").val( 'up' );
               
            //제목 유효성 검사
            var business_name = businessUpDelFormObj3.find("[name=business_name]").val( );  
   
            if ( business_name=="" ){
               alert("제목을 입력해주세요.");
               return;
            }
   
            //방문 목적 유효성 검사
            var business_field = businessUpDelFormObj3.find("[name=business_field]").val();
   
            if (business_field==""){
               alert("방문 목적을 입력해주세요.");
               return;
            }
   
              
            //영업내용 유효성 검사
            var business_content = businessUpDelFormObj3.find("[name=business_content]").val( ); 
              
            if (business_content==""){
               alert("영업내용을 입력해주세요.");
               return;
            }
              
            //영업성과 유효성 검사
            var business_result = businessUpDelFormObj3.find("[name=business_result]").val( ); 
              
            if (business_result==""){
               alert("영업성과를 입력해주세요.");
               return;
            }
            
            for ( var i=0 ; i<$(".xxx3").length ; i++ ){
     		   var person_name =  $("[name='personlist["+i+"].person_name']").val( );
     		   var business_jikup =  $("[name='personlist["+i+"].business_jikup']").val( );
     		   var person_phone =  $("[name='personlist["+i+"].person_phone']").val( );
     		   
         	   for ( var j=i+1 ; j<=$(".xxx3").length ; j++ ){
         		   var person_name2 =  $("[name='personlist["+j+"].person_name']").val( );
         		   var business_jikup2 =  $("[name='personlist["+j+"].business_jikup']").val( );
         		   var person_phone2 =  $("[name='personlist["+j+"].person_phone']").val( );
         		   
         		   if(person_name==person_name2 && business_jikup==business_jikup2 && person_phone==person_phone2){
         			   alert("동일한 만난 사람을 추가할 수 없습니다.");
         			   return;
         		   }
         	   }
            }
   
            //결재하기 체크박스 체크여부
            if($('input:checkbox[name="sign_check"]').is(":checked")){
               if (confirm("정말 수정하시겠습니까?")==false ){
                  return;
               }
            }
            else{
               alert('결재여부가 체크 되어있지 않습니다.');
               return;
            }
         }
         //**********************************************
         // 삭제 버튼을 클릭한 경우
         //**********************************************
         else{
            businessUpDelFormObj3.find("[name=upDel]").val( 'del' );
            if(confirm("정말 삭제할까요")==false ){ 
               return; 
            }
         }
         
         //---------------------------------------
         // 현재 화면에서 페이지 이동 없이 서버쪽 "/pro/expenseUpProc.do"  을 호출하여
         //       연락처 입력 후 입력 행의 개수를 받아 처리한다.
         //---------------------------------------
         $.ajax({
             // ------------------
             // 호출할 서버쪽 URL 주소 설정
             // ------------------
             url : "/pro/business_report_upDel_proc.do"
             // ------------------
             // 전송 방법 설정
             // ------------------
             ,type : "post"
             // ------------------
             // 서버에 보낼 파라미터명과 파라미터값을 설정
             // ------------------
             ,data :  $("form").filter("[name=businessContentForm3]").serialize()
             // ------------------
             // 서버의 응답을 성공적으로 받았을 경우 실행할 익명함수 설정.
             // 익명함수의 매개변수 contactRegCnt 에는 연락처 입력 적용행의 개수가 들어온다.
             // ------------------
             
             ,success : function( businessUpDelCnt ){
            	 if( businessUpDelCnt>0 ){
  	               // alert 상자 띄우고 재 등록할지 물어본다
  	               alert( "영업보고서 수정 또는 삭제 성공!" );
  	               location.href = document.referrer;
  	            }
  	            else if(businessUpDelCnt==-1){
  	               alert( "영업보고서 수정 또는 삭제 실패! 관리자에게 문의 바람!" );
  	               location.replace("/pro/businessList.do");
  	            }
  	            else if(businessUpDelCnt==-2){
  	            	if(confirm( "이미 수정된 내역이 존재합니다. 다시 불러오시겠습니까?" )==true) {
  	               	 	document.businessContentForm4.submit();
  	                 }
  	                else {
  	                	location.href = document.referrer;
  	                }
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
         alert( "checkBusinessUpDelForm3( ) 함수 예외 발생!" );
      }
   }
   
   function goDownload(){
 	  document.downLoad.submit();
   }
   
   </script>
           
              
            
<!----------------------------------------------------------------------------------------------------------------------------------------------->



   <BODY>
      

   <center>
   <form name="businessContentForm" method="post" enctype="multipart/form-data" action="/pro/business_report_upDel_proc.do">
   		<br><br><center><h3 align="top"><b>[영업 보고서 결재]</b></h3></center><br>
   		
   		<TABLE class="tbcss1" >
   		
		   		<TR>
			   		<Th align="left" class="real_table">1.제목</Th>
			       <TD align="left" class="real_td" name="business_name" >&emsp;${upDelBusinessList.report_name}</TD>
		      	</TR>
		      	
		      	<TR>
			   		<th align="left" class="real_table" >&nbsp;2. 방문 목적</Th>
			        <TD align="left" class="real_td" name="business_field">
			        		&nbsp;&nbsp;<c:if test="${upDelBusinessList.sales_type==1}">
		               		영업지관리
		            		</c:if>
				            <c:if test="${upDelBusinessList.sales_type==2}">
				               수금
				            </c:if>
				            <c:if test="${upDelBusinessList.sales_type==3}">
				               회의
				            </c:if>
				            <c:if test="${upDelBusinessList.sales_type==4}">
				               거래처확보
				            </c:if>
				            <c:if test="${upDelBusinessList.sales_type==5}">
				               기타
				            </c:if>
				      </TD>
		      	</TR>
		      	
		      	<TR>
		      			<th align="left" class="real_table" >3.만난 사람</th>
		         		<TD align="left" class="real_td">
		         				<table class="tbcss1">
		         				
		         						<TR>
			         						<th align="center" class="th_color" style="width:90px;">이름</th>
								            <th align="center" class="th_color" style="width:90px;">직급</th>
								            <th align="center" class="th_color" style="width:90px;">전화</th>
								        </TR>
								        
								        <c:forEach var="salesPersonList" items="${salesPersonList}" varStatus="Status">
								        <TR>		
								        	<TD align="center" class="td_color">${salesPersonList.p_name}</TD>
								        	<TD align="center"  class="td_color">
								        			  <c:if test="${salesPersonList.jikup==1}">
									                     사원
									                  </c:if>
									                  <c:if test="${salesPersonList.jikup==2}">
									                     주임
									                  </c:if>
									                  <c:if test="${salesPersonList.jikup==3}">
									                     대리
									                  </c:if>
									                  <c:if test="${salesPersonList.jikup==4}">
									                     과장
									                  </c:if>
									                  <c:if test="${salesPersonList.jikup==5}">
									                     팀장
									                  </c:if>
									                  <c:if test="${salesPersonList.jikup==6}">
									                     부장
									                  </c:if>
									                  <c:if test="${salesPersonList.jikup==7}">
									                     상무
									                  </c:if>
									                  <c:if test="${salesPersonList.jikup==8}">
									                     전무
									                  </c:if>
									                  <c:if test="${salesPersonList.jikup==9}">
									                     사장
									                  </c:if>
									         </TD>
									         <TD align="center" class="td_color">${salesPersonList.phone}</TD>
								        </TR>
								        </c:forEach>
								        
								 </table>
						</TD>
		      	</TR>
		      	
		      	<TR>
		      			<th align="center" class="real_table">4.방문 시간</th>
		      			 <TD align="left" class="real_td">&emsp;${upDelBusinessList.sales_start_date} ~ ${upDelBusinessList.sales_end_date}
		      	</TR>
		      	
		      	<TR>
				        <Th align="center" class="real_table">5.영업 내용</Th>
				        <TD align="left" class="real_td">&emsp;${upDelBusinessList.sales_content}</TD>
      			</TR>
      			
      			<TR>
			         	<Th align="center" class="real_table">6.영업 성과</Th>
			         	<TD align="left" class="real_td" name="business_result">&emsp;${upDelBusinessList.sales_result}</TD>
			    </TR>
			    
			    <TR>
			    		<Th align="center" class="real_table">7.결재</Th>
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
							                     				<TD class="td_color" align="center" name="sign_no">${list2.row_num}</TD>
							                     				<TD  class="td_color" align="center"  name="sign_emp_name">${list2.emp_name}</TD>
							                     				<TD  class="td_color" align="center">
							                     						<c:if test="${list2.sign_state=='결재하기'}">
												                              <input type ="radio" id="sign_check1" name="sign_check" value="confirm">결재하기
												                              <input type ="radio" id="sign_check2" name="sign_check" value="no_confirm">반려하기&nbsp;
												                              (반려사유 :
												                              <input type="text" name="no_confirm_reason" style="width:90px;">)
											                           </c:if>
											                           
											                           <c:if test="${list2.sign_state!='결재하기'}">
											                              	${list2.sign_state}
											                           </c:if>
							                     				</TD>
							                     		</TR>
							                     </c:forEach>
			    						</table><BR>
			    				</c:forEach>
			    		</TD>
			    </TR>
      	</TABLE><BR>
      	
      	<input type="hidden" name="upDel" >
      	<input type="hidden" name="report_no" value="${businessDTO.report_no}">
         <input type="hidden" name="revise_cnt" value="${upDelBusinessList.revise_cnt}">
      	
      	<TABLE>
      			<TR>
      					<TD>
      						<c:forEach var="list" items="${selectApprovallist}" varStatus="Status">
	      						<c:if test="${list.sign_state=='결재하기'}">
	      							<span style="width:100px;" onClick="checkBusinessUpDelForm( 'up' );" class="btn btn1">등록하기</span>&nbsp;&nbsp;
	      						</c:if>
      						</c:forEach>
      					</TD>
      					<TD>
      						<span style="width:100px;" onclick="location.replace('/pro/businessList.do')" class="btn btn1">화면닫기</span>&nbsp;&nbsp;
      						<span style="width:100px;" onclick="goDownload()" class="btn btn1">보고서 출력</span>&nbsp;&nbsp;
      					</TD>
      			</TR>
      	</TABLE>
   </form>
	</center>
<!----------------------------------------------------------------------------------------------------------------------------------------------->

   <center>
   <form name="businessContentForm2" action="/pro/business_report_upDel_proc.do">
   <center>
     <br><br><center><h3 align="top"><b>[영업 보고서 수정]</b></h3></center><br>
   
   
      <TABLE class="tbcss1" >
      <TR>
         <th align="left" class="real_table">1.제목</Th>
         <TD align="left" class="real_td">
            &emsp;<input type="text" name="business_name" size="50" value=""></TD>
      </TR>
      <TR>
         <th align="left" class="real_table" >2.방문 목적</th>
         <TD align="left" class="real_td">
            &emsp;<select name="business_field" style="width:130px;">
               <option value=""></option>
               <option value="1">영업지관리</option>
               <option value="2">수금</option>
               <option value="3">회의</option>
               <option value="4">거래처확보</option>
               <option value="5">기타</option>
            </select>
          </TD>
      </TR>  
      <TR>
      
         <th align="left" class="real_table" >3.만난 사람</th>
         <TD align="left" class="real_td">
            <table class="tbcss1">
                 <TR>
               <th align="center" class="th_color" style="width:100px;">이름</th>
               <th align="center" class="th_color" style="width:100px;">직급</th>
               <th align="center" class="th_color" style="width:100px;">전화
            </TR>
           <TR class=xxx1>
               <TD align="center" class="td_color">
                  <input type="text" name="personlist[0].person_name" style="width:100px;"></td>
               <TD align="center" class="td_color">
                  <select name="personlist[0].business_jikup" align="center">
                     <option value=""> -선택요망- </option>
                      <option value="1"> 사원 </option>
                      <option value="2"> 주임 </option>
                      <option value="3"> 대리 </option>
                      <option value="4"> 과장 </option>
                      <option value="5"> 팀장 </option>
                      <option value="6"> 부장 </option>
                      <option value="7"> 상무 </option>
                      <option value="8"> 전무 </option>
                      <option value="9"> 사장 </option>
                  </select>
               </TD>
               <TD align="center" class="td_color">
                  <input type="text" name="personlist[0].person_phone" style="width:100px;" size="70px" ></td>
            </TR>
            </table>
            	<div style="height:5px"></div>   
                  &emsp;<span style="cursor:pointer" onclick="addTR( 'xxx1' ,'1');" name="add_row">[행추가]</span>
                  <span style="cursor:pointer" onclick="delLastTR( 'xxx1' );" name="delete_row">[행삭제]</span>
      </TR>  
      <TR>
         <th align="left" class="real_table" >4.방문 시간</th>
         <TD align="left" class="real_td">
            &emsp;<select name="min_business_year" onChange="checkApprovalDay2()">
               <option value="">
                  <script>
                     for (var i=1989; i<=new Date().getFullYear()+1 ; i++ ){   
                        document.write("<option value="+i+">"+i);
                     }
                  </script> 
            </select>&nbsp;&nbsp;년&nbsp;
            <select name="min_business_month" onChange="checkApprovalDay2()">
               <option value="">
                  <script>
                          for (var i=1; i<=12 ; i++ ){   
                             var m = (i<10)?"0"+i:i;
                        document.write("<option value="+m+">"+m);
                          }
                        </script>
            </select>&nbsp;&nbsp;월&nbsp;
            <select name="min_business_day" onChange="checkApprovalDay2()">
               <option value="">
                  <script>
                     for (var i=1; i<=31 ; i++ ){   
                        var m = (i<10)?"0"+i:i;
                        document.write("<option value="+m+">"+m);
                     }
                  </script>
            </select>&nbsp;&nbsp;일&nbsp;
            <select name="min_business_hour" onChange="checkApprovalDay2()">
               <option value="">
                  <script>
                  for (var i=1; i<=24 ; i++ ){   
                     var m = (i<10)?"0"+i:i;
                     document.write("<option value="+m+">"+m);
                  }
                  </script>
            </select>&nbsp;&nbsp;시&nbsp;
            <select name="min_business_minute" onChange="checkApprovalDay2()">
               <option value="">
                  <script>
                     for (var i=0; i<=59 ; i++ ){   
                        var m = (i<10)?"0"+i:i;
                        document.write("<option value="+m+">"+m);
                     }
                  </script>
            </select>&nbsp;&nbsp;분&nbsp;
            <div style="height:5px"></div> 
            &emsp;<select name="max_business_year" onChange="checkApprovalDay22()">
               <option value="">
                  <script>
                     for (var i=1989; i<=new Date().getFullYear()+1 ; i++ ){   
                        document.write("<option value="+i+">"+i);
                     }
                  </script> 
            </select>&nbsp;&nbsp;년&nbsp;
            <select name="max_business_month" onChange="checkApprovalDay22()">
               <option value="">
                  <script>
                     for (var i=1; i<=12 ; i++ ){   
                        var m = (i<10)?"0"+i:i;
                        document.write("<option value="+m+">"+m);
                     }
                  </script>
            </select>&nbsp;&nbsp;월&nbsp;
            <select name="max_business_day" onChange="checkApprovalDay22()">
               <option value="">
                  <script>
                     for (var i=1; i<=31 ; i++ ){   
                        var m = (i<10)?"0"+i:i;
                        document.write("<option value="+m+">"+m);
                     }
                   </script>
            </select>&nbsp;&nbsp;일&nbsp;
            <select name="max_business_hour" onChange="checkApprovalDay22()">
               <option value="">
                  <script>
                     for (var i=1; i<=24 ; i++ ){   
                        var m = (i<10)?"0"+i:i;
                        document.write("<option value="+m+">"+m);
                     }
                  </script>
            </select>&nbsp;&nbsp;시&nbsp;
            <select name="max_business_minute" onChange="checkApprovalDay22()">
               <option value="">
                  <script>
                  for (var i=0; i<=59 ; i++ ){   
                     var m = (i<10)?"0"+i:i;
                     document.write("<option value="+m+">"+m);
                  }
                  </script>
            </select>&nbsp;&nbsp;분&nbsp;
      </TR>
      <TR>
         <th align="center" class="real_table">5.영업 내용</th>
         <TD align="left" class="real_td">
         &emsp;<textarea name="business_content" cols=55 rows=9></textarea>
      </TR>
      <TR>
         <th align="left" class="real_table">6.영업 성과</th>
         <TD align="left" class="real_td">
         &emsp;<textarea name="business_result" cols=55 rows=9></textarea>
      </TR>
      <TR>
         <Th align="left" class="real_table">7.결재</Th>
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
                         <TD align="center" class="td_color">${list2.row_num}</TD>
                         <TD align="center" class="td_color">${list2.emp_name}</TD>
                         <TD align="center" class="td_color">
                           <c:if test="${selectApprovallist[0].max_return_no == idx.count && loopTagStatus2.count==1 }">                              
                                 <input type ="checkbox" name="sign_check" value="confirm" checked="checked">결재하기                             
                           </c:if>
                           <c:if test="${!(selectApprovallist[0].max_return_no == idx.count && loopTagStatus2.count==1 )}">
                                 ${list2.sign_state}
                           </c:if>
                           </TD>
                     </TR>
                  </c:forEach> 
               </table>
            <br>
            </c:forEach>
            
      </TR>
      </TABLE>

      <div style="height:15px"></div>  
         
          <input type="hidden" name="upDel">
          <input type="hidden" name="report_no" value="${businessDTO.report_no}">
         <input type="hidden" name="revise_cnt" value="${upDelBusinessList.revise_cnt}">
          <span class="btn btn1" onClick="checkBusinessUpDelForm2( 'up' )">수정</span>&nbsp;&nbsp;
          <span class="btn btn1" onClick="checkBusinessUpDelForm2( 'del' )">삭제</span>&nbsp;&nbsp;
          <span class="btn btn1" style="width:80px;" onclick="location.replace('/pro/businessList.do')">화면닫기</span>&nbsp;&nbsp;
          <span class="btn btn1" style="width:80px;" onclick="goDownload()">보고서 출력</span>&nbsp;&nbsp;
          <span class="reset btn btn1">초기화</span>&nbsp;&nbsp;
      

         <c:if test="${!empty sessionScope.emp_no}">
            <input type="hidden" name="emp_no" value="${sessionScope.emp_no}">   
         </c:if>
   </center>
   </form>
   </center>   
   
   

<!-- ==================================================================================================================================================================== -->

  <center>
  <form name="businessContentForm3" action="/pro/business_report_upDel_proc.do">
   <br><br><center><h3 align="top"><b>[반려 보고서 결재]</b></h3></center><br>
   
   <TABLE class="tbcss1" >
   <TR><var="selectBusinesslist" items="${selectBusinesslist}" varStatus="loopTagStatus">
            <th align="left" class="real_table">1.지출 제목</Th>
            <TD align="left" class="real_td">
            	&emsp;<input type="text" name="business_name" size="50" value="${upDelBusinessList.report_name}"></TD>
   </TR>

   <TR>
      <th align="left" class="real_table" >2.방문 목적</th>
		<TD align="left" class="real_td">
            &emsp;<select name="business_field" style="width:130px;">
               <option value=""></option>
               <option value="1">영업지관리</option>
               <option value="2">수금</option>
               <option value="3">회의</option>
               <option value="4">거래처확보</option>
               <option value="5">기타</option>
            </select>
         </TD>
   </TR>  


   <TR><th align="left" class="real_table" >3.만난 사람</th>

      <TD align="left" class="real_td">
          <table class="tbcss1">
            <TR>
               <th align="center" class="th_color" style="width:90px;">이름</th>
               <th align="center" class="th_color" style="width:90px;">직급</th>
               <th align="center" class="th_color" style="width:90px;">전화
            </TR>
            <TR class=xxx3>
               <TD align="center" class="td_color">
                  <input type="text" name="personlist[0].person_name" style="width:100px;">
               <TD align="center" class="td_color">
                  <select name="personlist[0].business_jikup" id="business_jikup">
                     <option value="">선택요망</option>
                         <option value="1"> 사원 </option>
                         <option value="2"> 주임 </option>
                         <option value="3"> 대리 </option>
                         <option value="4"> 과장 </option>
                         <option value="5"> 팀장 </option>
                         <option value="6"> 부장 </option>
                         <option value="7"> 상무 </option>
                         <option value="8"> 전무 </option>
                         <option value="9"> 사장 </option>
                  </select>
               </TD>
               <TD align="center" class="td_color">
                  <input type="text" name="personlist[0].person_phone" style="width:100px;" value="${list.phone}" maxlength="11">
               </TD>
            </TR>
            </table>
            <div style="height:10px"></div>   
            	&emsp;<span style="cursor:pointer" onclick="addTR( 'xxx3' ,'1');" name="add_row">[행추가]</span>
                  <span style="cursor:pointer" onclick="delLastTR( 'xxx3' );" name="delete_row">[행삭제]</span>

      <TR>
         <th align="left" class="real_table">4.방문 시간</th>
           <TD align="left" class="real_td">
            &emsp;<select name="min_business_year" onChange="checkApprovalDay3()">
               <option value="">
                  <script>
                     for (var i=1989; i<=new Date().getFullYear()+1 ; i++ ){   
                        document.write("<option value="+i+">"+i);
                     }
                  </script> 
            </select>&nbsp;&nbsp;년&nbsp;
            <select name="min_business_month" onChange="checkApprovalDay3()">
               <option value="">
                  <script>
                          for (var i=1; i<=12 ; i++ ){   
                             var m = (i<10)?"0"+i:i;
                        document.write("<option value="+m+">"+m);
                          }
                        </script>
            </select>&nbsp;&nbsp;월&nbsp;
            <select name="min_business_day" onChange="checkApprovalDay3()">
               <option value="">
                  <script>
                     for (var i=1; i<=31 ; i++ ){   
                        var m = (i<10)?"0"+i:i;
                        document.write("<option value="+m+">"+m);
                     }
                  </script>
            </select>&nbsp;&nbsp;일&nbsp;
            <select name="min_business_hour" onChange="checkApprovalDay3()">
               <option value="">
                  <script>
                  for (var i=1; i<=24 ; i++ ){   
                     var m = (i<10)?"0"+i:i;
                     document.write("<option value="+m+">"+m);
                  }
                  </script>
            </select>&nbsp;&nbsp;시&nbsp;
            <select name="min_business_minute" onChange="checkApprovalDay3()">
               <option value="">
                  <script>
                     for (var i=0; i<=59 ; i++ ){   
                        var m = (i<10)?"0"+i:i;
                        document.write("<option value="+m+">"+m);
                     }
                  </script>
            </select>&nbsp;&nbsp;분&nbsp;
            <div style="height:5px"></div>
            &emsp;<select name="max_business_year" onChange="checkApprovalDay33()">
               <option value="">
                  <script>
                     for (var i=1989; i<=new Date().getFullYear()+1 ; i++ ){   
                        document.write("<option value="+i+">"+i);
                     }
                  </script> 
            </select>&nbsp;&nbsp;년&nbsp;
            <select name="max_business_month" onChange="checkApprovalDay33()">
               <option value="">
                  <script>
                     for (var i=1; i<=12 ; i++ ){   
                        var m = (i<10)?"0"+i:i;
                        document.write("<option value="+m+">"+m);
                     }
                  </script>
            </select>&nbsp;&nbsp;월&nbsp;
            <select name="max_business_day" onChange="checkApprovalDay33()">
               <option value="">
                  <script>
                     for (var i=1; i<=31 ; i++ ){   
                        var m = (i<10)?"0"+i:i;
                        document.write("<option value="+m+">"+m);
                     }
                   </script>
            </select>&nbsp;&nbsp;일&nbsp;
            <select name="max_business_hour" onChange="checkApprovalDay33()">
               <option value="">
                  <script>
                     for (var i=1; i<=24 ; i++ ){   
                        var m = (i<10)?"0"+i:i;
                        document.write("<option value="+m+">"+m);
                     }
                  </script>
            </select>&nbsp;&nbsp;시&nbsp;
            <select name="max_business_minute" onChange="checkApprovalDay33()">
               <option value="">
                  <script>
                  for (var i=0; i<=59 ; i++ ){   
                     var m = (i<10)?"0"+i:i;
                     document.write("<option value="+m+">"+m);
                  }
                  </script>
            </select>&nbsp;&nbsp;분&nbsp;
      </TR>
      
      <TR>
         <th align="left" class="real_table">5.영업 내용</th>
         <TD align="left" class="real_td">
         &emsp;<textarea name="business_content" cols=55 rows=9></textarea>
      </TR>
		<TR>
         <th align="left" class="real_table">6.영업 성과</th>
         <TD align="left" class="real_td">
         &emsp;<textarea name="business_result" cols=55 rows=9></textarea>
      </TR>
 
            
         <TR>
         <Th align="left" class="real_table">7.결재</Th>
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
                     <TD align="center" class="td_color"><center>${list2.row_num}</center>
                     <td align="center" class="td_color"><center>${list2.emp_name}</center>
                     <td align="center" class="td_color"><center>
                        
                           ${list2.sign_state}
                        </center>
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
                  <TD class="td_color" align="center" name="sign_no">${selectApprovallist.row_num}
                  <td class="td_color" align="center"  name="sign_emp_name">${selectApprovallist.emp_name}
             	  <td class="td_color" align="center">
	             		<c:if test="${loopTagStatus.count==1}">
		                        <input type ="checkbox" name="sign_check" value="confirm">결재하기
	                     </c:if>
	                     <c:if test="${loopTagStatus.count!=1}">
	                 	 	 결재예정
	                	 </c:if>
	              </TR>
	              
             </c:forEach>
            </table>
      </TR>
      </TABLE>
      
          <div style="height:15px"></div> 
   
      <center>

         <input type="hidden" name="upDel">
         <input type="hidden" name="report_no" value="${businessDTO.report_no}">
         <input type="hidden" name="revise_cnt" value="${upDelBusinessList.revise_cnt}">
         <span onClick="checkBusinessUpDelForm3( 'up' )" class="btn btn1">수정</span>&nbsp;&nbsp;
         <span onClick="checkBusinessUpDelForm3( 'del' )" class="btn btn1">삭제</span>&nbsp;&nbsp;
         <span style="width:80px;" onclick="location.replace('/pro/businessList.do')" class="btn btn1">화면닫기</span>&nbsp;&nbsp;
         <span style="width:80px;" onclick="goDownload()" class="btn btn1">보고서 출력</span>&nbsp;&nbsp;
         <span class="reset2 btn btn1">초기화</span>&nbsp;&nbsp;</center>

            <c:if test="${!empty sessionScope.emp_no}">
               <input type="hidden" name="emp_no" value="${sessionScope.emp_no}">   
            </c:if>
   </form>
   <br> <br> <br>
   <form name="businessContentForm4" method="post" action="/pro/business_report_upDel_form.do">
   		<input type="hidden" name="report_no" value="${businessDTO.report_no}">
   		<input type="hidden" name="writer" value="${businessDTO.writer}">   
   		<input type="hidden" name="sign_name" value="${businessDTO.sign_name}">   
   		<input type="hidden" name="max_return_no" value="${businessDTO.max_return_no}">   
   </form>
   
    <form name="downLoad" method="post" action="/pro/wordDown_business.do">
   		<input type="hidden" name="report_no" value="${businessDTO.report_no}">
   		<input type="hidden" name="max_return_no" value="${businessDTO.max_return_no}">  
   </form>
   
   </BODY>
</HTML>