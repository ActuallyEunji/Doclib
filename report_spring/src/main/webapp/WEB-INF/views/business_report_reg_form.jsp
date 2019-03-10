<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      
<%@include file="/WEB-INF/views/common2.jsp"%>

<HTML>
 <HEAD>
  <TITLE> New Document </TITLE>
  <META NAME="Generator" CONTENT="EditPlus">
  <META NAME="Author" CONTENT="">
  <META NAME="Keywords" CONTENT="">
  <META NAME="Description" CONTENT="">
 </HEAD>


   <script src="jquery-1.11.0.min.js" type="text/javascript"></script>

   <script>

      $(document).ready(function(){
    	  
    	  // 초기화 버튼 함수
			var business_report_FormObj=$("[name=business_report_registry]");	
			
			business_report_FormObj.find(".reset").click(function(){
				business_report_FormObj.find("[name=business_check]").prop("checked",false); 
				business_report_FormObj.find("[name=business_field]").val('');
				business_report_FormObj.find("[name=business_name]").val('');
				business_report_FormObj.find("[name^=personlist]").val('');
				business_report_FormObj.find("[name^=min_business]").val(""); 
				business_report_FormObj.find("[name^=max_business]").val(""); 
				business_report_FormObj.find("[name=business_content]").val(""); 
				business_report_FormObj.find("[name=business_result]").val(""); 

		     });
		
    	  
		
          var business_report_FormObj  = $("[name=business_report_registry]");

          business_report_FormObj.find(".to_today").click(function(){
             // 현재 날짜를 관리하는 Date 객체 생성해서 객체의 메위주를 today라는 변수에 저장.
             // 월을 세팅할 땐 1을 빼고, 월을 얻을 땐 1을 더하자. ex) 2월을 세팅할 땐, 1월로 집어넣기
             // n월의 마지막날을 얻고 싶으면 n월 0일을 세팅
             var today = new Date(  );
             // 현재 날짜의 년도 얻기
             var year = today.getFullYear();
             // 현재 날짜의 월 얻기. 주의> 월을 얻고 나서 1을 더할 것
             var month = today.getMonth()+1;
             var day = today.getDate();
             var hour = today.getHours();
             var minute = today.getMinutes();
             if(month<10){month="0"+month}
             if(day<10){day="0"+day}
             if(hour<10){hour="0"+hour}
             if(minute<10){minute="0"+minute}
             business_report_FormObj.find("[name=min_business_year]").val(year);
             business_report_FormObj.find("[name=min_business_month]").val(month);
             business_report_FormObj.find("[name=min_business_day]").val(day);
             business_report_FormObj.find("[name=min_business_hour]").val(hour);
             business_report_FormObj.find("[name=min_business_minute]").val(minute);
             business_report_FormObj.find("[name=max_business_year]").val(year);
             business_report_FormObj.find("[name=max_business_month]").val(month);
             business_report_FormObj.find("[name=max_business_day]").val(day);
             business_report_FormObj.find("[name=max_business_hour]").val(hour);
             business_report_FormObj.find("[name=max_business_minute]").val(minute);
          }); 
             
             //*************************************************
             // [비움] 글씨를 클릭하면 실행할 구문 설정
             //*************************************************
             
             // 영업 시간 비움 
              var business_report_FormObj = $("[name=business_report_registry]");
              
             business_report_FormObj.find(".empty_business_date").click(function(){
                business_report_FormObj.find("[name^=min_business_]").val('');
                business_report_FormObj.find("[name^=max_business_]").val('');
               });

             business_report_FormObj.find(".empty_business_name").click(function(){
                 business_report_FormObj.find("[name=business_name]").val('');
                })
      
       
      }); 

         //행추가
         function addTR( classN ){
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
                      if( val.split(" ").join("")!="" ){ dataCnt++; }
                    }
                  }
             })
             if( flag == false) { return; }
             //---------------
             // 매개변수로 들어온 선택자가 가르키는 태그 내부의 입력 양식에 입력된 데이터 개수가 0개면 함수중단하기
             //---------------
             if(dataCnt<=2 ) { alert("마지막 행에 테이터가 비어있어 행 추가 불가능!"); return; }
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
             //print_nameV( classN );
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
             //print_nameV( classN )
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

         
      //---
      function business_report_FormCheck( ){
      //---
         //1. 제목 유효성 검사
         var business_report_FormObj = $("[name=business_report_registry]");
         var business_name = business_report_FormObj.find("[name=business_name]").val( );  

             if (business_name ==""){
            	 alert("제목을 입력해주세요."); return;
             }
         
         //2.방문 목적 유효성 검사
         var business_field = business_report_FormObj.find("[name=business_field]").val();
            if (business_field==""){
               alert("방문목적을 입력해주세요."); return;
            }

         //3.만난 사람 유효성 검사
         //행 추가
           for ( var i=0 ; i<$(".xxx").length ; i++ ){
                  //만나는 사람 유효성 검사
                  var person_name =  $("[name='personlist["+i+"].person_name']").val( );
                    if (new RegExp(/^[가-힣a-zA-Z][가-힣a-zA-Z]{1,20}$/).test(person_name)==false  )
                     {
                          alert("이름을 입력해주세요(숫자를 제외한 최소 두 글자, 첫 글자 공백 불가!).");
                          $("[name='personlist["+i+"].person_name']").val("");
                          $("[name='personlist["+i+"].person_name']").focus();
                          return;
                     }
                    
                 //직급 유효성 검사
                 var business_jikup = $("[name='personlist["+i+"].business_jikup']").val( ); 
                    if (business_jikup==""){
                       alert("직급을 선택해주세요.");
                       return;
                    }

                 //전화번호 유효성검사
                 var person_phone = $("[name='personlist["+i+"].person_phone']").val( );
                  if (new RegExp(/^[0-9]{9,20}$/).test(person_phone)==false )
                  {
                    alert("전화번호를 입력해주세요. 숫자만 입력 가능하며 최소 10글자 이상 입력해야합니다.");
                    $("[name='personlist["+i+"].person_phone']").val("");
                    $("[name='personlist["+i+"].person_phone']").focus();
                    return;
                  }
                  
           }
         
           for ( var i=0 ; i<$(".xxx").length ; i++ ){
    		   var person_name =  $("[name='personlist["+i+"].person_name']").val( );
    		   var business_jikup =  $("[name='personlist["+i+"].business_jikup']").val( );
    		   var person_phone =  $("[name='personlist["+i+"].person_phone']").val( );
    		   
        	   for ( var j=i+1 ; j<=$(".xxx").length ; j++ ){
        		   var person_name2 =  $("[name='personlist["+j+"].person_name']").val( );
        		   var business_jikup2 =  $("[name='personlist["+j+"].business_jikup']").val( );
        		   var person_phone2 =  $("[name='personlist["+j+"].person_phone']").val( );
        		   
        		   if(person_name==person_name2 && business_jikup==business_jikup2 && person_phone==person_phone2){
        			   alert("동일한 만난 사람을 추가할 수 없습니다.");
        			   return;
        		   }
        	   }
           }
         
         //4.방문시간 유효성검사
         var business_report_FormObj = $("[name=business_report_registry]");
                 //----------------------------------
                 var min_business_year = business_report_FormObj.find("[name=min_business_year]").val( );
                 var min_business_month = business_report_FormObj.find("[name=min_business_month]").val( );
                 var min_business_day = business_report_FormObj.find("[name=min_business_day]").val( );
                 var min_business_hour = business_report_FormObj.find("[name=min_business_hour]").val( );
                 var min_business_minute = business_report_FormObj.find("[name=min_business_minute]").val( );
                 //----------------------------------
                 var max_business_year = business_report_FormObj.find("[name=max_business_year]").val( );
                 var max_business_month = business_report_FormObj.find("[name=max_business_month]").val( );
                 var max_business_day = business_report_FormObj.find("[name=max_business_day]").val( );
                 var max_business_hour = business_report_FormObj.find("[name=max_business_hour]").val( );
                 var max_business_minute = business_report_FormObj.find("[name=max_business_minute]").val( );

             if ( ( (min_business_year =="" || min_business_month =="" || min_business_day =="" || min_business_hour =="" || min_business_minute =="") 
            		 || (min_business_year ==null || min_business_month ==null || min_business_day ==null || min_business_hour ==null || min_business_minute ==null ) ) 
            		 ||
            	  ( (max_business_year =="" || max_business_month =="" || max_business_day =="" || max_business_hour =="" || max_business_minute =="") 
            	  	 || (max_business_year ==null || max_business_month ==null || max_business_day ==null ||max_business_hour ==null || max_business_minute ==null)  ) )
             {
               alert("방문 시간을 입력해주세요!");
               return;
             }
             
         //5.영업내용 유효성검사
             var business_content = business_report_FormObj.find("[name=business_content]").val();
             if ( new RegExp(/^[가-힣a-zA-Z0-9][가-힣a-zA-Z0-9.,! ]{1,1000}$/).test(business_content)==false  )
             {
               alert("영업내용을 입력해주세요(최소 두 글자 이상, 첫 글자 공백 불가!).");
               business_report_FormObj.find("[name=business_content]").val("");
               return;
             }
             
         //6.영업성과 유효성 검사
         var business_result = business_report_FormObj.find("[name=business_result]").val();
         if (  new RegExp(/^[가-힣a-zA-Z0-9][가-힣a-zA-Z0-9.,! ]{1,1000}$/).test(business_result)==false  )
          {
            alert("영업 성과를 입력해주세요(최소 두 글자 이상, 첫 글자 공백 불가!).");
                business_report_FormObj.find("[name=business_result]").val("");
                return;
          }
         
         //7.결재하기 체크박스 체크여부
         if($('input:checkbox[name="business_check"]').is(":checked")){
            if (confirm("정말 등록하시겠습니까?")==false ){
               return;
            }

         }else{
            alert('체크박스에 체크가 되어있지 않습니다.');
            return;
         }
         
         $.ajax({
             url : "/pro/business_report_reg_proc.do"
             , type : "post"
             , data : $("form").filter("[name=business_report_registry]").serialize()
             , dataType : "json"
             , success : function( businessRegCnt ){
                if(businessRegCnt>=4 ){
                   alert("영업보고서 등록 성공");
                   location.replace("/pro/businessList.do");
                }
                else{
                   alert("영업보고서 등록 실패! 관리자에게 문의 바람");
                    location.replace("/pro/businessList.do");
                }           
             }
             , error : function(){
                alert("서버 접속 실패!");
             }
          });
         
       //---
      }
      //---
      
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
    //방문시간  최소
      function checkApprovalDate(){
            
                 var business_report_FormObj = $("[name=business_report_registry]");
                 //----------------------------------
                 var min_business_year = business_report_FormObj.find("[name=min_business_year]").val( );
                 var min_business_month = business_report_FormObj.find("[name=min_business_month]").val( );
                 var min_business_day = business_report_FormObj.find("[name=min_business_day]").val( );
                 var min_business_hour = business_report_FormObj.find("[name=min_business_hour]").val( );
                 var min_business_minute = business_report_FormObj.find("[name=min_business_minute]").val( );
                 //----------------------------------
                 var max_business_year = business_report_FormObj.find("[name=max_business_year]").val( );
                 var max_business_month = business_report_FormObj.find("[name=max_business_month]").val( );
                 var max_business_day = business_report_FormObj.find("[name=max_business_day]").val( );
                 var max_business_hour = business_report_FormObj.find("[name=max_business_hour]").val( );
                 var max_business_minute = business_report_FormObj.find("[name=max_business_minute]").val( );

         //---------------------------------- 
         //년도 먼저 설정
         //----------------------------------
            if (min_business_year=="" && min_business_month !="")
            {   alert("왼쪽 년도를 먼저 선택해야 합니다.");
               business_report_FormObj.find("[name=min_business_month]").val( "" );
               business_report_FormObj.find("[name=min_business_day]").val( "" );
               business_report_FormObj.find("[name=min_business_hour]").val( "" );
               business_report_FormObj.find("[name=min_business_minute]").val( "" );
               return;
            }
         //----------------------------------
            if (min_business_year=="" && min_business_day !="")
            {   alert("왼쪽 년도를 먼저 선택해야 합니다.");
            business_report_FormObj.find("[name=min_business_month]").val( "" );
            business_report_FormObj.find("[name=min_business_day]").val( "" );
            business_report_FormObj.find("[name=min_business_hour]").val( "" );
            business_report_FormObj.find("[name=min_business_minute]").val( "" );
               return;
            }
         //----------------------------------
            if (min_business_year=="" && min_business_hour !="")
            {   alert("왼쪽 년도를 먼저 선택해야 합니다.");
            business_report_FormObj.find("[name=min_business_month]").val( "" );
            business_report_FormObj.find("[name=min_business_day]").val( "" );
            business_report_FormObj.find("[name=min_business_hour]").val( "" );
            business_report_FormObj.find("[name=min_business_minute]").val( "" );
               return;
            }
         //----------------------------------
            if (min_business_year=="" && min_business_minute !="")
            {   alert("왼쪽 년도를 먼저 선택해야 합니다.");
            business_report_FormObj.find("[name=min_business_month]").val( "" );
            business_report_FormObj.find("[name=min_business_day]").val( "" );
            business_report_FormObj.find("[name=min_business_hour]").val( "" );
            business_report_FormObj.find("[name=min_business_minute]").val( "" );
               return;
            }
         
         //----------------------------------
         //년도가 선택 된 후 월 먼저 설정
         //----------------------------------
            if (min_business_month==""&& min_business_day !="")
            {   alert("왼쪽 월을 먼저 선택해야 합니다.");
               business_report_FormObj.find("[name=min_business_day]").val( "" );
               business_report_FormObj.find("[name=min_business_hour]").val( "" );
               business_report_FormObj.find("[name=min_business_minute]").val( "" );
               business_report_FormObj.find("[name=min_business_hour]").val( "" );
               return;
            }
         //----------------------------------
            if (min_business_month=="" && min_business_hour !="")
            {   alert("왼쪽 월을 먼저 선택해야 합니다.");
            business_report_FormObj.find("[name=min_business_day]").val( "" );
            business_report_FormObj.find("[name=min_business_hour]").val( "" );
            business_report_FormObj.find("[name=min_business_minute]").val( "" );
            business_report_FormObj.find("[name=min_business_hour]").val( "" );
            }
         //----------------------------------
            if (min_business_month=="" && min_business_minute !="")
            {   alert("왼쪽 월을 먼저 선택해야 합니다.");
            business_report_FormObj.find("[name=min_business_day]").val( "" );
            business_report_FormObj.find("[name=min_business_hour]").val( "" );
            business_report_FormObj.find("[name=min_business_minute]").val( "" );
            business_report_FormObj.find("[name=min_business_hour]").val( "" );
               return;
            }

         //----------------------------------
         //년도, 월이 선택 된후 일 설정
         //----------------------------------
            if (min_business_day=="" && min_business_hour !="")
            {   alert("왼쪽 일을 먼저 선택해야 합니다.");
               business_report_FormObj.find("[name=min_business_hour]").val( "" );
               business_report_FormObj.find("[name=min_business_minute]").val( "" );
               return;
            }
         //----------------------------------
            if (min_business_day=="" && min_business_minute !="")
            {   alert("왼쪽 일을 먼저 선택해야 합니다.");
               business_report_FormObj.find("[name=min_business_minute]").val( "" );
               return;
            }
         //----------------------------------
         //시간 설정
         //----------------------------------
            if (min_business_hour=="" && min_business_minute !="")
            {   alert("왼쪽 시간을 먼저 선택해야 합니다.");
               business_report_FormObj.find("[name=min_business_minute]").val( "" );
               return;
            }

         

      //시작일의 년도가 종료일의 시간보다 클 때
      if (min_business_year !="" && max_business_year !="")
      {
            if (parseInt(max_business_year,10)< parseInt(min_business_year,10))
            {
               alert("시작년도가 종료년도보다 큽니다. 재선택바람!");
               business_report_FormObj.find("[name^=min_business]").val( "" );
               business_report_FormObj.find("[name^=max_business]").val( "" );
               return;
            }
      }


      //시작일의 월이 종료일의 월보다 클 때
      if (min_business_year !="" && min_business_month != "" && max_business_year !="" && max_business_month !="")
      {
           var end_date = business_report_FormObj.find("[name=max_business_year]").val(  )+business_report_FormObj.find("[name=max_business_month]").val(  );

              var start_date = business_report_FormObj.find("[name=min_business_year]").val(  )+business_report_FormObj.find("[name=min_business_month]").val(  );

            if (parseInt(end_date,10)< parseInt(start_date,10))
            {
               alert("시작월이 종료월보다 큽니다. 재선택바람!");
               business_report_FormObj.find("[name^=min_business]").val( "" );
               business_report_FormObj.find("[name^=max_business]").val( "" );
               return;
            }
      }
      
      //시작일의 일이 종료일의 일보다 클 때
      if (min_business_year !="" && min_business_month != "" && min_business_day != "" && max_business_year !="" && max_business_month !="" && max_business_day !="")
      {   
            var end_date = business_report_FormObj.find("[name=max_business_year]").val(  )+business_report_FormObj.find("[name=max_business_month]").val(  )+business_report_FormObj.find("[name=max_business_day]").val(  );

              var start_date = business_report_FormObj.find("[name=min_business_year]").val(  )+business_report_FormObj.find("[name=min_business_month]").val(  )+business_report_FormObj.find("[name=min_business_day]").val(  );

            if (parseInt(end_date,10)< parseInt(start_date,10))
            {
               alert("시작일이 종료일보다 큽니다. 재선택바람!");
               business_report_FormObj.find("[name^=min_business]").val( "" );
               business_report_FormObj.find("[name^=max_business]").val( "" );
               return;
            }
      }

      //시작일의 시간이 종료일의 시간보다 클 때
      if (min_business_year !="" && min_business_month != "" && min_business_day != "" && min_business_hour != "" && max_business_year !="" && max_business_month !="" && max_business_day !="" && max_business_hour !="")
      {
            var end_date = business_report_FormObj.find("[name=max_business_year]").val(  )+business_report_FormObj.find("[name=max_business_month]").val(  )+business_report_FormObj.find("[name=max_business_day]").val(  )+business_report_FormObj.find("[name=max_business_hour]").val(  );

              var start_date = business_report_FormObj.find("[name=min_business_year]").val(  )+business_report_FormObj.find("[name=min_business_month]").val(  )+business_report_FormObj.find("[name=min_business_day]").val(  )+business_report_FormObj.find("[name=min_business_hour]").val(  );

            if (parseInt(end_date,10)< parseInt(start_date,10))
            {
               alert("시작시간이 종료시간보다 큽니다. 재선택바람!");
               business_report_FormObj.find("[name^=min_business]").val( "" );
               business_report_FormObj.find("[name^=max_business]").val( "" );
               return;
            }
      }

      //시작일의 분이 종료일의 분보다 클 때
      if (min_business_year !="" && min_business_month != "" && min_business_day != "" && min_business_hour != "" && min_business_hour != "" && max_business_year !="" && max_business_month !="" && max_business_day !="" && max_business_hour !="" && max_business_minute !="")
      {
            var end_date = business_report_FormObj.find("[name=max_business_year]").val(  )+business_report_FormObj.find("[name=max_business_month]").val(  )+business_report_FormObj.find("[name=max_business_day]").val(  )+business_report_FormObj.find("[name=max_business_hour]").val(  )+business_report_FormObj.find("[name=max_business_minute]").val(  );

              var start_date = business_report_FormObj.find("[name=min_business_year]").val(  )+business_report_FormObj.find("[name=min_business_month]").val(  )+business_report_FormObj.find("[name=min_business_day]").val(  )+business_report_FormObj.find("[name=min_business_hour]").val(  )+business_report_FormObj.find("[name=min_business_hour]").val(  );

            if (parseInt(end_date,10)< parseInt(start_date,10))
            {
               alert("시작분이 종료분보다 큽니다. 재선택바람!");
               business_report_FormObj.find("[name^=min_business]").val( "" );
               business_report_FormObj.find("[name^=max_business]").val( "" );
               return;
            }
      }




         //---------------------------------------------
         //방문 시간 시작일 존재여부
         //---------------------------------------------
         if( min_business_year =="" || min_business_month =="" || min_business_day ==""){ return;}
       if (is_valid_date(min_business_year,min_business_month,min_business_day)==false)
            {
                  alert("존재하지 않는 날짜입니다.");
                  business_report_FormObj.find("[name^=min_business_]").val("");
                  //business_report_FormObj.find("[name^=max_business_]").val("");
                  return;
            }
         
         
            //---------------------------------------------
         /*   
         if( (min_business_year!="" && min_business_year.length>0) && (min_business_month !="" && min_business_month.length>0)
             && (max_business_year !="" && max_business_year.length>0) &&  (max_business_month !="" && max_business_month.length>0)
             //-------------------------------------------------------------------------------------------------------------------------
             && (min_business_day !="" && min_business_day.length>0)
             && (max_business_day !="" && max_business_day.length>0)
             //-------------------------------------------------------------------------------------------------------------------------
             && (min_business_hour !="" && min_business_hour.length>0)
             && (max_business_hour !="" && max_business_hour.length>0)
             //-------------------------------------------------------------------------------------------------------------------------
             && (min_business_minute !="" && min_business_minute.length>0)
             && (max_business_minute !="" && max_business_minute.length>0)){

                 var max_date = business_report_FormObj.find("[name=max_business_year]").val(  )+business_report_FormObj.find("[name=max_business_month]").val(  )
                  +business_report_FormObj.find("[name=max_business_day]").val(  )+business_report_FormObj.find("[name=max_business_hour]").val(  )
                  +business_report_FormObj.find("[name=max_business_minute]").val(  );
                 var min_date = business_report_FormObj.find("[name=min_business_year]").val(  )+business_report_FormObj.find("[name=min_business_month]").val(  )
                  +business_report_FormObj.find("[name=min_business_day]").val(  )+business_report_FormObj.find("[name=min_business_hour]").val(  )
                  +business_report_FormObj.find("[name=min_business_minute]").val(  );
                  if( parseInt(max_date,10) < parseInt(min_date,10) ) {
                    alert("[최소 날]이 [최대 날] 보다 큽니다. 재 선택 바람!");
                    business_report_FormObj.find("[name^=min_business_]").val("");
                    business_report_FormObj.find("[name^=max_business_]").val("");
                    return;
                  }
          }*/




        }
   

       //최대 방문시간
      function checkApprovalDate1(){ 

         var business_report_FormObj = $("[name=business_report_registry]");
         var min_business_year = business_report_FormObj.find("[name=min_business_year]").val( );
            var min_business_month = business_report_FormObj.find("[name=min_business_month]").val( );
            var min_business_day = business_report_FormObj.find("[name=min_business_day]").val( );
            var min_business_hour = business_report_FormObj.find("[name=min_business_hour]").val( );
            var min_business_minute = business_report_FormObj.find("[name=min_business_minute]").val( );
         //---
         var max_business_year = business_report_FormObj.find("[name=max_business_year]").val( );
            var max_business_month = business_report_FormObj.find("[name=max_business_month]").val( );
            var max_business_day = business_report_FormObj.find("[name=max_business_day]").val( );
            var max_business_hour = business_report_FormObj.find("[name=max_business_hour]").val( );
            var max_business_minute = business_report_FormObj.find("[name=max_business_minute]").val( );
         
         
         //년도먼저 누르기
         if (max_business_year=="" && max_business_month !="")
            {   alert("왼쪽 년도를 먼저 선택해야 합니다.");
               business_report_FormObj.find("[name=max_business_month]").val( "" );
               business_report_FormObj.find("[name=max_business_day]").val( "" );
               business_report_FormObj.find("[name=max_business_hour]").val( "" );
               business_report_FormObj.find("[name=max_business_minute]").val( "" );
               return;
            }
         //--
            if (max_business_year=="" && max_business_day !="")
            {   alert("왼쪽 년도를 먼저 선택해야 합니다.");
            business_report_FormObj.find("[name=max_business_month]").val( "" );
            business_report_FormObj.find("[name=max_business_day]").val( "" );
            business_report_FormObj.find("[name=max_business_hour]").val( "" );
            business_report_FormObj.find("[name=max_business_minute]").val( "" );
               return;
            }
         //--
            if (max_business_year=="" && max_business_hour !="")
            {   alert("왼쪽 년도를 먼저 선택해야 합니다.");
            business_report_FormObj.find("[name=max_business_month]").val( "" );
            business_report_FormObj.find("[name=max_business_day]").val( "" );
            business_report_FormObj.find("[name=max_business_hour]").val( "" );
            business_report_FormObj.find("[name=max_business_minute]").val( "" );
               return;
            }
         //--
            if (max_business_year=="" && max_business_minute !="")
            {   alert("왼쪽 년도를 먼저 선택해야 합니다.");
            business_report_FormObj.find("[name=max_business_month]").val( "" );
            business_report_FormObj.find("[name=max_business_day]").val( "" );
            business_report_FormObj.find("[name=max_business_hour]").val( "" );
            business_report_FormObj.find("[name=max_business_minute]").val( "" );
               return;
            }
         //년도 다음 월먼저 누르기
            if (max_business_month=="" && max_business_day !="")
            {   alert("왼쪽 월을 먼저 선택해야 합니다.");
               business_report_FormObj.find("[name=max_business_day]").val( "" );
               business_report_FormObj.find("[name=max_business_hour]").val( "" );
               business_report_FormObj.find("[name=max_business_minute]").val( "" );
               return;
            }
         //--
            if (max_business_month=="" && max_business_hour !="")
            {   alert("왼쪽 월을 먼저 선택해야 합니다.");
            business_report_FormObj.find("[name=max_business_day]").val( "" );
            business_report_FormObj.find("[name=max_business_hour]").val( "" );
            business_report_FormObj.find("[name=max_business_minute]").val( "" );
               return;
            }
         //--
            if (max_business_month=="" && max_business_minute !="")
            {   alert("왼쪽 월을 먼저 선택해야 합니다.");
            business_report_FormObj.find("[name=max_business_day]").val( "" );
            business_report_FormObj.find("[name=max_business_hour]").val( "" );
            business_report_FormObj.find("[name=max_business_minute]").val( "" );
               return;
            }
         //일 체크
            if (max_business_day=="" && max_business_hour !="")
            {   alert("왼쪽 일을 먼저 선택해야 합니다.");
               business_report_FormObj.find("[name=max_business_hour]").val( "" );
               business_report_FormObj.find("[name=max_business_minute]").val( "" );
               return;
            }
         //--
            if (max_business_day=="" && max_business_minute !="" )
            {   alert("왼쪽 일을 먼저 선택해야 합니다.");
               business_report_FormObj.find("[name=max_business_minute]").val( "" );
               return;
            }
         //시간 설정
            if (max_business_hour=="" && max_business_minute !="")
            {   alert("왼쪽 시간을 먼저 선택해야 합니다.");
               business_report_FormObj.find("[name=max_business_minute]").val( "" );
               return;
            }


      

   
      //시작일의 년도가 종료일의 년도보다 클 때
      if (min_business_year !="" && max_business_year !="")
      {
            if (parseInt(max_business_year,10)< parseInt(min_business_year,10))
            {
               alert("시작년도가 종료년도보다 큽니다. 재선택바람!");
               business_report_FormObj.find("[name^=min_business]").val( "" );
               business_report_FormObj.find("[name^=max_business]").val( "" );
               return;
            }
      }


      //시작일의 월이 종료일의 월보다 클 때
      if (min_business_year !="" && min_business_month != "" && max_business_year !="" && max_business_month !="")
      {
            var end_date = business_report_FormObj.find("[name=max_business_year]").val(  )+business_report_FormObj.find("[name=max_business_month]").val(  );

              var start_date = business_report_FormObj.find("[name=min_business_year]").val(  )+business_report_FormObj.find("[name=min_business_month]").val(  );

            if (parseInt(end_date,10)< parseInt(start_date,10))
            {
               alert("시작월이 종료월보다 큽니다. 재선택바람!");
               business_report_FormObj.find("[name^=min_business]").val( "" );
               business_report_FormObj.find("[name^=max_business]").val( "" );
               return;
            }
      }
      
      //시작일의 일이 종료일의 일보다 클 때
      if (min_business_year !="" && min_business_month != "" && min_business_day != "" && max_business_year !="" && max_business_month !="" && max_business_day !="")
      {   
            var end_date = business_report_FormObj.find("[name=max_business_year]").val(  )+business_report_FormObj.find("[name=max_business_month]").val(  )+business_report_FormObj.find("[name=max_business_day]").val(  );

              var start_date = business_report_FormObj.find("[name=min_business_year]").val(  )+business_report_FormObj.find("[name=min_business_month]").val(  )+business_report_FormObj.find("[name=min_business_day]").val(  );

            if (parseInt(end_date,10)< parseInt(start_date,10))
            {
               alert("시작일이 종료일보다 큽니다. 재선택바람!");
               business_report_FormObj.find("[name^=min_business]").val( "" );
               business_report_FormObj.find("[name^=max_business]").val( "" );
               return;
            }
      }

      //시작일의 시간이 종료일의 시간보다 클 때
      if (min_business_year !="" && min_business_month != "" && min_business_day != "" && min_business_hour != "" && max_business_year !="" && max_business_month !="" && max_business_day !="" && max_business_hour !="")
      {
            var end_date = business_report_FormObj.find("[name=max_business_year]").val(  )+business_report_FormObj.find("[name=max_business_month]").val(  )+business_report_FormObj.find("[name=max_business_day]").val(  )+business_report_FormObj.find("[name=max_business_hour]").val(  );

              var start_date = business_report_FormObj.find("[name=min_business_year]").val(  )+business_report_FormObj.find("[name=min_business_month]").val(  )+business_report_FormObj.find("[name=min_business_day]").val(  )+business_report_FormObj.find("[name=min_business_hour]").val(  );

            if (parseInt(end_date,10)< parseInt(start_date,10))
            {
               alert("시작시간이 종료시간보다 큽니다. 재선택바람!");
               business_report_FormObj.find("[name^=min_business]").val( "" );
               business_report_FormObj.find("[name^=max_business]").val( "" );
               return;
            }
      }

      //시작일의 분이 종료일의 분보다 클 때
      if (min_business_year !="" && min_business_month != "" && min_business_day != "" && min_business_hour != "" && min_business_hour != "" && max_business_year !="" && max_business_month !="" && max_business_day !="" && max_business_hour !="" && max_business_minute !="")
      {
            var end_date = business_report_FormObj.find("[name=max_business_year]").val(  )+business_report_FormObj.find("[name=max_business_month]").val(  )+business_report_FormObj.find("[name=max_business_day]").val(  )+business_report_FormObj.find("[name=max_business_hour]").val(  )+business_report_FormObj.find("[name=max_business_minute]").val(  );

              var start_date = business_report_FormObj.find("[name=min_business_year]").val(  )+business_report_FormObj.find("[name=min_business_month]").val(  )+business_report_FormObj.find("[name=min_business_day]").val(  )+business_report_FormObj.find("[name=min_business_hour]").val(  )+business_report_FormObj.find("[name=min_business_minute]").val(  );

            if (parseInt(end_date,10)< parseInt(start_date,10))
            {
               alert("시작분이 종료분보다 큽니다. 재선택바람!");
               business_report_FormObj.find("[name^=min_business]").val( "" );
               business_report_FormObj.find("[name^=max_business]").val( "" );
               return;
            }
      }

         //존재하는 년월일인지 체크
          if  ( max_business_year =="" || max_business_month =="" || max_business_day =="") 
            { return;}

            if(is_valid_date(max_business_year,max_business_month,max_business_day)==false)
            {
               alert("존재하지 않는 날짜입니다.");
               business_report_FormObj.find("[name^=max_business_]").val("");
               return;
            }



         /*      
         if( (min_business_year!="" && min_business_year.length>0) && (min_business_month !="" && min_business_month.length>0)
             && (max_business_year !="" && max_business_year.length>0) &&  (max_business_month !="" && max_business_month.length>0)
             //-------------------------------------------------------------------------------------------------------------------------
             && (min_business_day !="" && min_business_day.length>0)
             && (max_business_day !="" && max_business_day.length>0)
             //-------------------------------------------------------------------------------------------------------------------------
             && (min_business_hour !="" && min_business_hour.length>0)
             && (max_business_hour !="" && max_business_hour.length>0)
             //-------------------------------------------------------------------------------------------------------------------------
             && (min_business_minute !="" && min_business_minute.length>0)
             && (max_business_minute !="" && max_business_minute.length>0)){

                 var max_date = business_report_FormObj.find("[name=max_business_year]").val(  )+business_report_FormObj.find("[name=max_business_month]").val(  )
                  +business_report_FormObj.find("[name=max_business_day]").val(  )+business_report_FormObj.find("[name=max_business_hour]").val(  )
                  +business_report_FormObj.find("[name=max_business_minute]").val(  );
                 var min_date = business_report_FormObj.find("[name=min_business_year]").val(  )+business_report_FormObj.find("[name=min_business_month]").val(  )
                  +business_report_FormObj.find("[name=min_business_day]").val(  )+business_report_FormObj.find("[name=min_business_hour]").val(  )
                  +business_report_FormObj.find("[name=min_business_minute]").val(  );
                  if( parseInt(max_date,10) < parseInt(min_date,10) ) {
                    alert("[최소 날]이 [최대 날] 보다 큽니다. 재 선택 바람!");
                    business_report_FormObj.find("[name^=min_business_]").val("");
                    business_report_FormObj.find("[name^=max_business_]").val("");
                    return;
                  }
          }*/
         
}
          
          
          
   </script>



 <BODY>
  
   <br><br><center> <h3 align="top"><b>[영업 보고서 등록]</b></h3><br>
    <form name="business_report_registry" action="/pro/business_report_reg_proc.do">
   <TABLE class="tbcss1" >
   <TR>
      <th align="left" class="real_table">1.제목</th>
      <td align="left" class="real_td">   
      &emsp;<input type="text" name="business_name" style="width:550px;">
               &nbsp;<span style="cursor:pointer" class="empty_business_name">[비움]</span>
   </TR>
   <tr>
     <th align="left" class="real_table">&nbsp;2. 방문 목적</td>
     <td align="left" class="real_td">   
     &emsp;<select name="business_field" style="width:130px;">
        <option value=""></option>
        <option value="1">영업지관리</option>
        <option value="2">수금</option>
        <option value="3">회의</option>
        <option value="4">거래처확보</option>
        <option value="5">기타</option>
     </select>
   </td>
   </tr>  
   <TR>
      <th align="left" class="real_table">3.만난 사람</th>
      <td align="left" class="real_td">   
      <table class="tbcss1">
         <TR><th align="center" class="th_color" style="width:90px;">이름</th>
            <th align="center" class="th_color" style="width:90px;">직급</th>
            <th align="center" class="th_color" style="width:150px;">전화
          
         </TR>
         <TR class=xxx>
            <TD class="td_color" align="center">
            <input type="text" name="personlist[0].person_name" style="width:100px;" ></td>
            <TD class="td_color" align="center">
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
            <TD class="td_color" align="center">
            <input type="text" name="personlist[0].person_phone" style="width:100px;" size="70px" maxlength="11"></td>
            </TR>

        
       </table> 
         
<div style="height:10px"></div>   
&emsp;<span style="cursor:pointer" onclick="addTR( 'xxx' );">[행추가]</span>
      <span style="cursor:pointer"  onclick="delLastTR( 'xxx' );">[행삭제]</span>
               


        
   <TR>
      <th align="left" class="real_table">4.방문 시간</th>
        <td align="left" class="real_td">   
        	&emsp;<select name="min_business_year" onChange="checkApprovalDate()">
              <option value="">
                 <script>
                    for (var i=1990; i<=new Date().getFullYear()+1 ; i++ )
                    {   document.write("<option value="+i+">"+i);
                    }
                 </script> 
           </select>&nbsp;&nbsp;년&nbsp;
           <select name="min_business_month" onChange="checkApprovalDate()">
              <option value="">
                <script>
                    for (var i=1; i<=12 ; i++ )
                    {   var m = (i<10)?"0"+i:i;
                     document.write("<option value="+m+">"+m);
                    }
                  </script>
            </select>&nbsp;&nbsp;월&nbsp;
            <select name="min_business_day" onChange="checkApprovalDate()">
              <option value="">
                <script>
                    for (var i=1; i<=31 ; i++ )
                    {   var m = (i<10)?"0"+i:i;
                     document.write("<option value="+m+">"+m);
                    }
                </script>
            </select>&nbsp;&nbsp;일&nbsp;
            <select name="min_business_hour" onChange="checkApprovalDate()">
              <option value="">
                <script>
                   for (var i=1; i<=24 ; i++ )
                   {   var m = (i<10)?"0"+i:i;
                    document.write("<option value="+m+">"+m);
                   }
                </script>
            </select>&nbsp;&nbsp;시&nbsp;
            <select name="min_business_minute" onChange="checkApprovalDate()">
              <option value="">
                <script>
                   for (var i=0; i<=59 ; i++ )
                   {   var m = (i<10)?"0"+i:i;
                    document.write("<option value="+m+">"+m);
                   }
                </script>
             </select>&nbsp;&nbsp;분&nbsp;
             <div style="height:5px"></div>   
           &emsp;<select name="max_business_year" onChange="checkApprovalDate1()">
              <option value="">
                 <script>
                    for (var i=1990; i<=new Date().getFullYear()+1 ; i++ )
                    {   document.write("<option value="+i+">"+i);
                    }
                 </script> 
           </select>&nbsp;&nbsp;년&nbsp;
           <select name="max_business_month" onChange="checkApprovalDate1()">
              <option value="">
                <script>
                    for (var i=1; i<=12 ; i++ )
                    {   var m = (i<10)?"0"+i:i;
                     document.write("<option value="+m+">"+m);
                    }
                  </script>
            </select>&nbsp;&nbsp;월&nbsp;
            <select name="max_business_day" onChange="checkApprovalDate1()">
              <option value="">
                <script>
                    for (var i=1; i<=31 ; i++ )
                    {   var m = (i<10)?"0"+i:i;
                     document.write("<option value="+m+">"+m);
                    }
                </script>
            </select>&nbsp;&nbsp;일&nbsp;
            <select name="max_business_hour" onChange="checkApprovalDate1()">
              <option value="">
                <script>
                   for (var i=1; i<=24 ; i++ )
                   {   var m = (i<10)?"0"+i:i;
                    document.write("<option value="+m+">"+m);
                   }
                </script>
            </select>&nbsp;&nbsp;시&nbsp;
            <select name="max_business_minute" onChange="checkApprovalDate1()">
              <option value="">
                <script>
                   for (var i=0; i<=59 ; i++ )
                   {   var m = (i<10)?"0"+i:i;
                    document.write("<option value="+m+">"+m);
                   }
                </script>
             </select>&nbsp;&nbsp;분&nbsp;
             <span style="cursor:pointer" class="to_today">[오늘로]</span>
             <span style="cursor:pointer" class="empty_business_date">[비움]</span>
         </tr>
       <TR>
         <th align="left" class="real_table">5.영업 내용</th>
         <td align="left" class="real_td">   
         &emsp;<textarea name="business_content" cols=55 rows=9></textarea>
      </TR>
      <TR>
         <th align="left" class="real_table">6.영업 성과</th>
         <td align="left" class="real_td">   
         &emsp;<textarea name="business_result" cols=55 rows=9></textarea>
      </TR>
      <TR>
         <th align="left" class="real_table">7.결재</th>
         <td align="left" class="real_td">   
         <table class="tbcss1">
            <TR><th align="center" class="th_color" style="width:90px;">결재 차수</th>
               <th align="center" class="th_color" style="width:150px;">결재자명</th>
               <th align="center" class="th_color" style="width:150px;">결재 여부</th>
            </TR>
            </TR>
            <c:forEach var="tableList" items="${tableList}" varStatus="loopTagStatus"> 
               <tr align=center style="cursor:pointer" onClick="">
                  <td class="td_color">${tableList.row_num}
                  <td class="td_color" align=center>
                     ${tableList.emp_name}
                  <td class="td_color"><c:if test="${tableList.emp_no==sessionScope.emp_no}">
                           <input type="checkbox" name="business_check" class="arrange">결재하기
                        </c:if>
                        <c:if test="${tableList.emp_no!=sessionScope.emp_no}">
                           결재예정
                        </c:if>
               </tr>
              </c:forEach>
            
            </table>
            </TR>
      </TABLE>
  <div style="height:5px"></div>
   
   
   <div style="height:15px"></div>  
   <center>
   <span style="cursor:pointer; width:70px" onclick="business_report_FormCheck( )" class="btn btn1">등록</span>&nbsp;&nbsp;
   <span style="cursor:pointer; width:70px" onclick="location.replace('/pro/businessList.do')" class="btn btn1">화면닫기</span>&nbsp;&nbsp;
   <span style="cursor:pointer; width:70px" class="reset btn btn1">초기화</span>&nbsp;&nbsp;</center>
   <input type="hidden" name="report_field" value="1">
   <c:if test="${!empty sessionScope.emp_no}">
     <input type="hidden" name="emp_no" value="${sessionScope.emp_no}">   
   </c:if>
   </form>



 </BODY><br><br>
<!-- 
   <script>
            var business_report_FormObj = $("[name=business_report_insert]");
            function sa() { 
               if ( business_report_FormObj.find("[name=expense_name]").val() != ""){ 
                  business_report_FormObj.find("[name=expense_name]").val(""); 
                  return;
            }
         }
  -->
   </script>         

   </HTML>


 