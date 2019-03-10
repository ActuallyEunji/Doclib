<!--mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm-->
<!--JSP 페이지 처리 방식 선언-->
<!--mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm-->
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!--mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm-->
<!--현재 페이지에 common.jsp 파일 내의 소스 삽입-->
<!--mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm-->
<%@include file="common2.jsp"%>

<html>
   <head>
      <meta charset="utf-8">
   </head>

   <script src="jquery-1.11.0.min.js" type="text/javascript"></script>
   <script>

      function getWeek (num) {
         var week = ["일","월","화","수","목","금","토"]
         return week[num];
      };

   </script>
   <script>

      $(document).ready(function(){


         var week_journal_FormObj=$("[name=week_journal]");

         // 한 페이지에서 보여줄 게시판 목록 행의 개수를 조절하는
         // select 입력양식에 change 이벤트 발생시 실행할 코드 설정
         $("[name=rowCntPerPage]").change(function(){
            // name=rowCntPerPage 을 가진 폼태그의 action값의 URL주소로 이동
            document.week_journal.submit();
         });


         week_journal_FormObj.find("[name=journal_year],[name=journal_month],[name=journal_date]").change(function(){
         // 날짜 검색 조건 입력 양식의 유효성 체크함수 호출
            checkJournalDay();
         });

         // [이번달로] 글씨를 클릭하면 실행할 구문 설정

         week_journal_FormObj.find(".to_today").click(function(){

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
            // 현재 날짜의 월을 name=min_reg_year 을 가진 입력양식에 넣어주기
            week_journal_FormObj.find("[name=journal_year]").val(year);
            // 현재 날짜의 월을 name=min_reg_month 을 가진 입력양식에 넣어주기
            week_journal_FormObj.find("[name=journal_month]").val(month);
         });

         // [이번달로] 글씨를 클릭하면 실행할 구문 설정
   
            week_journal_FormObj.find(".to_today1").click(function(){
   
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
               
            });
   
         // [이번달로] 글씨를 클릭하면 실행할 구문 설정
   
            week_journal_FormObj.find(".to_today2").click(function(){
   
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
               // 현재 날짜의 월을 name=min_reg_year 을 가진 입력양식에 넣어주기
               for(var i=0; i<$(".xxx").length; i++){
                  week_journal_FormObj.find("[name='weekList["+i+"].begin_journal_year']").val(year);
                   // 현재 날짜의 월을 name=min_reg_month 을 가진 입력양식에 넣어주기
                   week_journal_FormObj.find("[name='weekList["+i+"].begin_journal_month']").val(month);
                  week_journal_FormObj.find("[name='weekList["+i+"].end_journal_year']").val(year);
                  // 현재 날짜의 월을 name=min_reg_month 을 가진 입력양식에 넣어주기
                  week_journal_FormObj.find("[name='weekList["+i+"].end_journal_month']").val(month);
               }
            })
            
            
           


      });
      
      
      function checkfinish(){
           
              for(var i=0; i<$(".xxx").length; i++){
           
              var end_journal_year =  $("[name='weekList["+i+"].end_journal_year']").val( );
              var end_journal_month =  $("[name='weekList["+i+"].end_journal_month']").val( );
              var end_journal_day =  $("[name='weekList["+i+"].end_journal_date']").val( );
              var end_journal_hour =  $("[name='weekList["+i+"].end_journal_hour']").val( );
              var end_journal_minute =  $("[name='weekList["+i+"].end_journal_minute']").val( );
          
          
                var today = new Date(  );
                // 현재 날짜의 년도 얻기
                var year = today.getFullYear();
                // 현재 날짜의 월 얻기. 주의> 월을 얻고 나서 1을 더할 것
                var month = today.getMonth()+1;
                var date = today.getDate();
                var hours = today.getHours();
                var minute = today.getMinutes();
                if(month<10){month="0"+month};
                if(date<10){date="0"+date};
                if(hours<10){hours="0"+hours};
                if(minute<10){minute="0"+minute};
          
                var end_sum = end_journal_year + end_journal_month+ end_journal_day + end_journal_hour + end_journal_minute;
                var sys_sum =year + month + date + hours + minute;
          
              
                if( parseInt(end_sum,10) > parseInt(sys_sum,10)){
                   alert("업무 예정인 내용은 완료여부를 체크할 수 없습니다");
                   $("[name='weekList["+i+"].completion']:checkbox:checked").attr("checked",false);
                   return;
                }
          
               }
             
            }
          
          
         
      


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
      if(dataCnt<=11 ) { alert("마지막 행에 테이터가 비어있어 행 추가 불가능!"); return; }
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
      }
         catch(e){
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

   function week_journal_FormCheck(){

      var week_journal_FormObj=$("[name=week_journal]");

      //보고일 유효성 검사
      var check_year = week_journal_FormObj.find("[name=journal_year]").val( ); 
      var check_month = week_journal_FormObj.find("[name=journal_month]").val( );
      var check_date = week_journal_FormObj.find("[name=journal_date]").val( );

      if( check_year=="" || check_month=="" || check_date=="" ){
         alert("보고일을 입력해주세요");
         return;
      }

      for ( var i=0 ; i<$(".xxx").length ; i++ ){
         //업무분야 유효성 검사
         var week_list =  $("[name='weekList["+i+"].week_list']").val( ); 
            if (week_list == "")
            {
               alert("업무분야를 선택해주세요.");
               return;
            }
         //업무내용 유효성 검사 
         var week_content =  $("[name='weekList["+i+"].week_content']").val( );
                if ( week_content ==""  )
                {
                    alert("업무내용을 입력해주세요(최소 두 글자, 첫 글자 공백 불가!).");
                    return;
                }
         //--------------------------------------------------------
         var start_journal_year =  $("[name='weekList["+i+"].begin_journal_year']").val( );
         var start_journal_month =  $("[name='weekList["+i+"].begin_journal_month']").val( );
         var start_journal_day =  $("[name='weekList["+i+"].begin_journal_date']").val( );
         var start_journal_hour =  $("[name='weekList["+i+"].begin_journal_hour']").val( );
         var start_journal_minute =  $("[name='weekList["+i+"].begin_journal_minute']").val( );
            if (start_journal_year == "" || start_journal_month == "" || start_journal_day == "" || start_journal_hour == "" || start_journal_minute == "")
            {
               alert("시작일을 모두입력해주세요.");
               return;
            }
         //--------------------------------------------------------

         var end_journal_year =  $("[name='weekList["+i+"].end_journal_year']").val( );
         var end_journal_month =  $("[name='weekList["+i+"].end_journal_month']").val( );
         var end_journal_day =  $("[name='weekList["+i+"].end_journal_date']").val( );
         var end_journal_hour =  $("[name='weekList["+i+"].end_journal_hour']").val( );
         var end_journal_minute =  $("[name='weekList["+i+"].end_journal_minute']").val( );
            if (end_journal_year == "" || end_journal_month == "" || end_journal_day == "" || end_journal_hour == "" || end_journal_minute == "")
            {
               alert("종료일을 모두입력해주세요.");
               return;
            }
      }
      if (confirm("등록하시겠습니까?")==false){
         return;
      }

      
      $.ajax({
               url : "/pro/week_business_log_reg_proc.do"
               , type : "post"
               , data : $("form").filter("[name=week_journal]").serialize()
               , dataType : "json"
               , success : function( dailyRegCnt ){
                  if( dailyRegCnt >0 ){
                         alert("주간 업무일지 등록 성공");
                  }
                  else{
                     alert("주간 업무일지 등록 실패! 관리자에게 문의 바람");
                  }
                   location.replace("/pro/weekList.do");           
               }
               , error : function(){
                  alert("서버 접속 실패!");
               }
         });


   }//week_journal_FormCheck()


   //---------------------------------------------------------------------
   // 존재하는 년,월,일 인지의 여부를 리턴하는 함수
   // 존재하는 년,월,일이면 true를 리턴
   //---------------------------------------------------------------------
   function is_valid_date(year, month, date){

      //----------------------------------------------
      // 매개변수로 들어온 년,월,일을 진짜 숫자로 변환
      //----------------------------------------------
      year = parseInt(year,10);
      month = parseInt(month,10);
      date = parseInt(date,10);

      //----------------------------------------------
      // 매개변수로 들어온 년,월,일을 Date객체가 관리하는 년,월,일이 동일하면
      //flag 변수에 true 저장
      //----------------------------------------------
      var xxx = new Date(year, month-1, date);//month는 0~11로 기억하기 때문에 -1해서 전달
      flag = false;
      if (year==xxx.getFullYear() && month==xxx.getMonth()+1 && date==xxx.getDate()){//month를 1증가시켜야 1~12월로 보인다.
         flag = true;
      }
      //----------------------------------------------
      //존재하는 년,월,일 인지의여부를 리턴
      //----------------------------------------------
      return flag;
   }


   //--------------------------------------------------------------------------------------------------------------------

   //************************************************************************
   //주간업무일지 보고일의 년,월,일 선택하면 호출되는 함수 
   //선택한 주간업무일지 날짜가 존재여부를 판단하여 존재하지 않는 날짜면 경고하기
   //************************************************************************
   function checkJournalDay(){

      var week_journal_FormObj=$("[name=week_journal]");

      //------------------------------------------------------------------------
      //선택한 보고일의 년,월,일을 변수에 저장
      //------------------------------------------------------------------------
      var Journal_year = week_journal_FormObj.find("[name=journal_year]").val( ); 
      var Journal_month = week_journal_FormObj.find("[name=journal_month]").val( );
      var Journal_date = week_journal_FormObj.find("[name=journal_date]").val( );


      //---------------------------------------------------------------------
      //보고일의 년도 먼저 설정하도록 함
      //---------------------------------------------------------------------
      if (Journal_year==""&&Journal_month !=""){
         alert("년도를 먼저 선택해주세요");
         week_journal_FormObj.find("[name=journal_month]").val("");
         week_journal_FormObj.find("[name=journal_date]").val("");
         return;
      }
      if (Journal_year==""&&Journal_date !=""){
         alert("년도를 먼저 선택해주세요");
         week_journal_FormObj.find("[name=journal_date]").val("");
         return;
      }
      //---------------------------------------------------------------------
      //보고일의 월 먼저 설정하도록 함
      //---------------------------------------------------------------------
      if ( Journal_month=="" && Journal_date !="" ){
         alert("월을 먼저 선택해주세요");
         week_journal_FormObj.find("[name=journal_date]").val("");
         return;
      }


   //------------------------------------------------------------------------
   //선택한 보고일의 년,월,일 중에 하나라도 비어있으면 함수 중단
   //------------------------------------------------------------------------
   if( Journal_year=="" || Journal_month=="" || Journal_date=="" ){return;}


   //------------------------------------------------------------------------
   //is_valid_date 함수 호출하여 선택한 보고일의 년,월,일의 실존 여부를 판단하여
   //존재하지 않는다면 경고하고
   //------------------------------------------------------------------------
      if( is_valid_date(Journal_year, Journal_month, Journal_date)==false){
         alert("날짜가 존재하지 않습니다");
         week_journal_FormObj.find("[name=journal_year]").val("");
         week_journal_FormObj.find("[name=journal_month]").val("");
         week_journal_FormObj.find("[name=journal_date]").val("");
         week_journal_FormObj.find("[name=to_today_day]").val("");
         return;
      }
      else {
         var select_day = new Date( Journal_year, Journal_month-1, Journal_date );
         var month = select_day.getMonth()+1;
         var date = select_day.getDate();
         var day = getWeek( select_day.getDay() );
         week_journal_FormObj.find("[name=to_today_day]").val(day);
      }



   }

   //주간업무 시작 시간
   function checkWeekTime(){
      
     
      
      var week_journal_FormObj=$("[name=week_journal]");
      //---------------------------------------------------
      
      for ( var i=0 ; i<$(".xxx").length ; i++ ){ 
      
                                                          
      var start_journal_year = week_journal_FormObj.find("[name$='weekList["+i+"].begin_journal_year']").val();
      var start_journal_month = week_journal_FormObj.find("[name$='weekList["+i+"].begin_journal_month']").val();
      var start_journal_day = week_journal_FormObj.find("[name$='weekList["+i+"].begin_journal_date']").val();
      var start_journal_hour = week_journal_FormObj.find("[name$='weekList["+i+"].begin_journal_hour']").val();
      var start_journal_minute = week_journal_FormObj.find("[name$='weekList["+i+"].begin_journal_minute']").val();
      //---------------------------------------------------
      var end_journal_year = week_journal_FormObj.find("[name$='weekList["+i+"].end_journal_year']").val();
      var end_journal_month = week_journal_FormObj.find("[name$='weekList["+i+"].end_journal_month']").val();
      var end_journal_day = week_journal_FormObj.find("[name$='weekList["+i+"].end_journal_date']").val();
      var end_journal_hour = week_journal_FormObj.find("[name$='weekList["+i+"].end_journal_hour']").val();
      var end_journal_minute = week_journal_FormObj.find("[name$='weekList["+i+"].end_journal_minute']").val();

      //---------------------------------------------------
      //시작년도부터 설정
      //---------------------------------------------------
      if (start_journal_year == "" && start_journal_month != "")
      {
         alert("년도부터 선택해주세요.");
         week_journal_FormObj.find("[name$='weekList["+i+"].begin_journal_month']").val("");
         week_journal_FormObj.find("[name$='weekList["+i+"].begin_journal_date']").val("");
         week_journal_FormObj.find("[name$='weekList["+i+"].begin_journal_hour']").val("");
         week_journal_FormObj.find("[name$='weekList["+i+"].begin_journal_minute']").val("");
         return;
      }
      if (start_journal_year == "" && start_journal_day != "")
      {
         alert("년도부터 선택해주세요.");
         week_journal_FormObj.find("[name$='weekList["+i+"].begin_journal_month']").val("");
         week_journal_FormObj.find("[name$='weekList["+i+"].begin_journal_date']").val("");
         week_journal_FormObj.find("[name$='weekList["+i+"].begin_journal_hour']").val("");
         week_journal_FormObj.find("[name$='weekList["+i+"].begin_journal_minute']").val("");
         return;
      }
      if (start_journal_year == "" && start_journal_hour != "")
      {
         alert("년도부터 선택해주세요.");
         week_journal_FormObj.find("[name$='weekList["+i+"].begin_journal_month']").val("");
         week_journal_FormObj.find("[name$='weekList["+i+"].begin_journal_date']").val("");
         week_journal_FormObj.find("[name$='weekList["+i+"].begin_journal_hour']").val("");
         week_journal_FormObj.find("[name$='weekList["+i+"].begin_journal_minute']").val("");
         return;
      }
      if (start_journal_year == "" && start_journal_minute != "")
      {
         alert("년도부터 선택해주세요.");
         week_journal_FormObj.find("[name$='weekList["+i+"].begin_journal_month']").val("");
         week_journal_FormObj.find("[name$='weekList["+i+"].begin_journal_date']").val("");
         week_journal_FormObj.find("[name$='weekList["+i+"].begin_journal_hour']").val("");
         week_journal_FormObj.find("[name$='weekList["+i+"].begin_journal_minute']").val("");
         return;
      }

      //---------------------------------------------------
      //시작년도 체크 후 월부터 설정
      //---------------------------------------------------
      if (start_journal_month == "" && start_journal_day != "")
      {
         alert("월부터 선택해주세요.");
         week_journal_FormObj.find("[name$='weekList["+i+"].begin_journal_date']").val("");
         week_journal_FormObj.find("[name$='weekList["+i+"].begin_journal_hour']").val("");
         week_journal_FormObj.find("[name$='weekList["+i+"].begin_journal_minute']").val("");
         return;
      }
      if (start_journal_month == "" && start_journal_hour != "")
      {
         alert("월부터 선택해주세요.");
         week_journal_FormObj.find("[name$='weekList["+i+"].begin_journal_date']").val("");
         week_journal_FormObj.find("[name$='weekList["+i+"].begin_journal_hour']").val("");
         week_journal_FormObj.find("[name$='weekList["+i+"].begin_journal_minute']").val("");
         return;
      }
      if (start_journal_month == "" && start_journal_minute != "")
      {
         alert("월부터 선택해주세요.");
         week_journal_FormObj.find("[name$='weekList["+i+"].begin_journal_date']").val("");
         week_journal_FormObj.find("[name$='weekList["+i+"].begin_journal_hour']").val("");
         week_journal_FormObj.find("[name$='weekList["+i+"].begin_journal_minute']").val("");
         return;
      }

      //---------------------------------------------------
      //시작년도,월 체크 후 일 설정
      //---------------------------------------------------
      if (start_journal_day == "" && start_journal_hour != "")
      {
         alert("일부터 선택해주세요.");
         week_journal_FormObj.find("[name$='weekList["+i+"].begin_journal_hour']").val("");
         week_journal_FormObj.find("[name$='weekList["+i+"].begin_journal_minute']").val("");
         return;
      }
      if (start_journal_day == "" && start_journal_minute != "")
      {
         alert("일부터 선택해주세요.");
         week_journal_FormObj.find("[name$='weekList["+i+"].begin_journal_hour']").val("");
         week_journal_FormObj.find("[name$='weekList["+i+"].begin_journal_minute']").val("");
         return;
      }
      //---------------------------------------------------
      //시작년도,월,일 체크 후 시간 설정
      //---------------------------------------------------
      if (start_journal_hour == "" && start_journal_minute != "")
      {
         alert("시간부터 선택해주세요.");
         week_journal_FormObj.find("[name$='weekList["+i+"].begin_journal_minute']").val("");
         return;
      } 


      //=====================================================================

      //시작일의 년도가 종료일의 년도보다 클 때
      if (start_journal_year !="" && end_journal_year !="")
      {
         if (parseInt(end_journal_year,10)< parseInt(start_journal_year,10))
         {
            alert("시작년도가 종료년도보다 큽니다. 재선택바람!");
            week_journal_FormObj.find("[name$='weekList["+i+"].begin_journal_year']").val( "" );
            week_journal_FormObj.find("[name$='weekList["+i+"].end_journal_year']").val( "" );
            week_journal_FormObj.find("[name$='weekList["+i+"].begin_journal_month']").val( "" );
            week_journal_FormObj.find("[name$='weekList["+i+"].end_journal_month']").val( "" );
            week_journal_FormObj.find("[name$='weekList["+i+"].begin_journal_date']").val( "" );
            week_journal_FormObj.find("[name$='weekList["+i+"].end_journal_date']").val( "" );
            week_journal_FormObj.find("[name$='weekList["+i+"].begin_journal_hour']").val( "" );
            week_journal_FormObj.find("[name$='weekList["+i+"].end_journal_hour']").val( "" );
            week_journal_FormObj.find("[name$='weekList["+i+"].begin_journal_minute']").val( "" );
            week_journal_FormObj.find("[name$='weekList["+i+"].end_journal_minute']").val( "" );
            return;
         }
      }


      //시작일의 월이 종료일의 월보다 클 때
      if (start_journal_year !="" && start_journal_month != "" && end_journal_year !="" && end_journal_month !="")
      {
         var end_date = week_journal_FormObj.find("[name$='weekList["+i+"].end_journal_year']").val(  )+week_journal_FormObj.find("[name$='weekList["+i+"].end_journal_month']").val(  );

         var start_date = week_journal_FormObj.find("[name$='weekList["+i+"].begin_journal_year']").val(  )+week_journal_FormObj.find("[name$='weekList["+i+"].begin_journal_month']").val(  );

         if (parseInt(end_date,10)< parseInt(start_date,10))
         {
            alert("시작월이 종료월보다 큽니다. 재선택바람!");
            week_journal_FormObj.find("[name$='weekList["+i+"].begin_journal_year']").val( "" );
            week_journal_FormObj.find("[name$='weekList["+i+"].end_journal_year']").val( "" );
            week_journal_FormObj.find("[name$='weekList["+i+"].begin_journal_month']").val( "" );
            week_journal_FormObj.find("[name$='weekList["+i+"].end_journal_month']").val( "" );
            week_journal_FormObj.find("[name$='weekList["+i+"].begin_journal_date']").val( "" );
            week_journal_FormObj.find("[name$='weekList["+i+"].end_journal_date']").val( "" );
            week_journal_FormObj.find("[name$='weekList["+i+"].begin_journal_hour']").val( "" );
            week_journal_FormObj.find("[name$='weekList["+i+"].end_journal_hour']").val( "" );
            week_journal_FormObj.find("[name$='weekList["+i+"].begin_journal_minute']").val( "" );
            week_journal_FormObj.find("[name$='weekList["+i+"].end_journal_minute']").val( "" );
            return;
         }
      }

      //시작일의 일이 종료일의 일보다 클 때
      if (start_journal_year !="" && start_journal_month != "" && start_journal_day != "" && end_journal_year !="" && end_journal_month !="" && end_journal_day !="")
      {   
         var end_date = week_journal_FormObj.find("[name$='weekList["+i+"].end_journal_year']").val(  )+week_journal_FormObj.find("[name$='weekList["+i+"].end_journal_month']").val(  )+week_journal_FormObj.find("[name$='weekList["+i+"].end_journal_date']").val(  );

         var start_date = week_journal_FormObj.find("[name$='weekList["+i+"].begin_journal_year']").val(  )+week_journal_FormObj.find("[name$='weekList["+i+"].begin_journal_month']").val(  )+week_journal_FormObj.find("[name$='weekList["+i+"].begin_journal_date']").val(  );

         if (parseInt(end_date,10)< parseInt(start_date,10))
         {
            alert("시작일이 종료일보다 큽니다. 재선택바람!");
            week_journal_FormObj.find("[name$='weekList["+i+"].begin_journal_year']").val( "" );
            week_journal_FormObj.find("[name$='weekList["+i+"].end_journal_year']").val( "" );
            week_journal_FormObj.find("[name$='weekList["+i+"].begin_journal_month']").val( "" );
            week_journal_FormObj.find("[name$='weekList["+i+"].end_journal_month']").val( "" );
            week_journal_FormObj.find("[name$='weekList["+i+"].begin_journal_date']").val( "" );
            week_journal_FormObj.find("[name$='weekList["+i+"].end_journal_date']").val( "" );
            week_journal_FormObj.find("[name$='weekList["+i+"].begin_journal_hour']").val( "" );
            week_journal_FormObj.find("[name$='weekList["+i+"].end_journal_hour']").val( "" );
            week_journal_FormObj.find("[name$='weekList["+i+"].begin_journal_minute']").val( "" );
            week_journal_FormObj.find("[name$='weekList["+i+"].end_journal_minute']").val( "" );
            return;
         }
      }

      //시작일의 시간이 종료일의 시간보다 클 때
      if (start_journal_year !="" && start_journal_month != "" && start_journal_day != "" && start_journal_hour != "" && end_journal_year !="" && end_journal_month !="" && end_journal_day !="" && end_journal_hour !="")
      {
         var end_date = week_journal_FormObj.find("[name$='weekList["+i+"].end_journal_year']").val(  )+week_journal_FormObj.find("[name$='weekList["+i+"].end_journal_month']").val(  )+week_journal_FormObj.find("[name$='weekList["+i+"].end_journal_day']").val(  )+week_journal_FormObj.find("[name$='weekList["+i+"].end_journal_hour']").val(  );

         var start_date = week_journal_FormObj.find("[name$='weekList["+i+"].begin_journal_year']").val(  )+week_journal_FormObj.find("[name$='weekList["+i+"].begin_journal_month']").val(  )+week_journal_FormObj.find("[name$='weekList["+i+"].begin_journal_day']").val(  )+week_journal_FormObj.find("[name$='weekList["+i+"].begin_journal_hour']").val(  );

         if (parseInt(end_date,10)< parseInt(start_date,10))
         {
            alert("시작시간이 종료시간보다 큽니다. 재선택바람!");
            week_journal_FormObj.find("[name$='weekList["+i+"].begin_journal_year']").val( "" );
            week_journal_FormObj.find("[name$='weekList["+i+"].end_journal_year']").val( "" );
            week_journal_FormObj.find("[name$='weekList["+i+"].begin_journal_month']").val( "" );
            week_journal_FormObj.find("[name$='weekList["+i+"].end_journal_month']").val( "" );
            week_journal_FormObj.find("[name$='weekList["+i+"].begin_journal_date']").val( "" );
            week_journal_FormObj.find("[name$='weekList["+i+"].end_journal_date']").val( "" );
            week_journal_FormObj.find("[name$='weekList["+i+"].begin_journal_hour']").val( "" );
            week_journal_FormObj.find("[name$='weekList["+i+"].end_journal_hour']").val( "" );
            week_journal_FormObj.find("[name$='weekList["+i+"].begin_journal_minute']").val( "" );
            week_journal_FormObj.find("[name$='weekList["+i+"].end_journal_minute']").val( "" );
            return;
         }
      }

      //시작일의 분이 종료일의 분보다 클 때
      if (start_journal_year !="" && start_journal_month != "" && start_journal_day != "" && start_journal_hour != "" && start_journal_minute != "" && end_journal_year !="" && end_journal_month  !="" && end_journal_day !="" && end_journal_hour !="" && end_journal_minute !="")
      {
         var end_date = week_journal_FormObj.find("[name$='weekList["+i+"].end_journal_year']").val(  )+week_journal_FormObj.find("[name$='weekList["+i+"].end_journal_month']").val(  )+week_journal_FormObj.find("[name$='weekList["+i+"].end_journal_date']").val(  )+week_journal_FormObj.find("[name$='weekList["+i+"].end_journal_hour']").val(  )+week_journal_FormObj.find("[name$='weekList["+i+"].end_journal_minute']").val(  );

         var start_date = week_journal_FormObj.find("[name$='weekList["+i+"].begin_journal_year']").val(  )+week_journal_FormObj.find("[name$='weekList["+i+"].begin_journal_month']").val(  )+week_journal_FormObj.find("[name$='weekList["+i+"].begin_journal_date']").val(  )+week_journal_FormObj.find("[name$='weekList["+i+"].begin_journal_hour']").val(  )+week_journal_FormObj.find("[name$='weekList["+i+"].begin_journal_minute']").val(  );

         if (parseInt(end_date,10)< parseInt(start_date,10))
         {
            alert("시작분이 종료분보다 큽니다. 재선택바람!");
            week_journal_FormObj.find("[name$='weekList["+i+"].begin_journal_year']").val( "" );
            week_journal_FormObj.find("[name$='weekList["+i+"].end_journal_year']").val( "" );
            week_journal_FormObj.find("[name$='weekList["+i+"].begin_journal_month']").val( "" );
            week_journal_FormObj.find("[name$='weekList["+i+"].end_journal_month']").val( "" );
            week_journal_FormObj.find("[name$='weekList["+i+"].begin_journal_date']").val( "" );
            week_journal_FormObj.find("[name$='weekList["+i+"].end_journal_date']").val( "" );
            week_journal_FormObj.find("[name$='weekList["+i+"].begin_journal_hour']").val( "" );
            week_journal_FormObj.find("[name$='weekList["+i+"].end_journal_hour']").val( "" );
            week_journal_FormObj.find("[name$='weekList["+i+"].begin_journal_minute']").val( "" );
            week_journal_FormObj.find("[name$='weekList["+i+"].end_journal_minute']").val( "" );
            return;
         }
      }
      //---------------------------------------------
      //시작시간 존재여부
      //---------------------------------------------
      if( start_journal_year =="" || start_journal_month =="" || start_journal_day ==""){ return;}
         if (is_valid_date(start_journal_year,start_journal_month,start_journal_day)==false){
            alert("존재하지 않는 날짜입니다.");
            week_journal_FormObj.find("[name$='weekList["+i+"].begin_journal_year']").val("");
            week_journal_FormObj.find("[name$='weekList["+i+"].begin_journal_month']").val("");
            week_journal_FormObj.find("[name$='weekList["+i+"].begin_journal_date']").val("");
            week_journal_FormObj.find("[name$='weekList["+i+"].begin_journal_hour']").val("");
            week_journal_FormObj.find("[name$='weekList["+i+"].begin_journal_minute']").val("");
            return;
         }

         }//checkWeekTime()
   
     }

   //주간업무 종료시간
      function checkWeekTime1(){
         var week_journal_FormObj=$("[name=week_journal]");
         //---------------------------------------------------
         
         for ( var i=0 ; i<$(".xxx").length ; i++ ){ 
         
         var start_journal_year = week_journal_FormObj.find("[name$='weekList["+i+"].begin_journal_year']").val();
         var start_journal_month = week_journal_FormObj.find("[name$='weekList["+i+"].begin_journal_month']").val();
         var start_journal_day = week_journal_FormObj.find("[name$='weekList["+i+"].begin_journal_date']").val();
         var start_journal_hour = week_journal_FormObj.find("[name$='weekList["+i+"].begin_journal_hour']").val();
         var start_journal_minute = week_journal_FormObj.find("[name$='weekList["+i+"].begin_journal_minute']").val();
         //---------------------------------------------------
         var end_journal_year = week_journal_FormObj.find("[name$='weekList["+i+"].end_journal_year']").val();
         var end_journal_month = week_journal_FormObj.find("[name$='weekList["+i+"].end_journal_month']").val();
         var end_journal_day = week_journal_FormObj.find("[name$='weekList["+i+"].end_journal_date']").val();
         var end_journal_hour = week_journal_FormObj.find("[name$='weekList["+i+"].end_journal_hour']").val();
         var end_journal_minute = week_journal_FormObj.find("[name$='weekList["+i+"].end_journal_minute']").val();

         //---------------------------------------------------
         //종료년도부터 설정
         //---------------------------------------------------
         if (end_journal_year == "" && end_journal_month != "")
         {
            alert("년도부터 선택해주세요.");
            week_journal_FormObj.find("[name$='weekList["+i+"].end_journal_month']").val("");
            week_journal_FormObj.find("[name$='weekList["+i+"].end_journal_date']").val("");
            week_journal_FormObj.find("[name$='weekList["+i+"].end_journal_hour']").val("");
            week_journal_FormObj.find("[name$='weekList["+i+"].end_journal_minute']").val("");
            return;
         }
         if (end_journal_year == "" && end_journal_day != "")
         {
            alert("년도부터 선택해주세요.");
            week_journal_FormObj.find("[name$='weekList["+i+"].end_journal_month']").val("");
            week_journal_FormObj.find("[name$='weekList["+i+"].end_journal_date']").val("");
            week_journal_FormObj.find("[name$='weekList["+i+"].end_journal_hour']").val("");
            week_journal_FormObj.find("[name$='weekList["+i+"].end_journal_minute']").val("");
            return;
         }
         if (end_journal_year == "" && end_journal_hour != "")
         {
            alert("년도부터 선택해주세요.");
            week_journal_FormObj.find("[name$='weekList["+i+"].end_journal_month']").val("");
            week_journal_FormObj.find("[name$='weekList["+i+"].end_journal_date']").val("");
            week_journal_FormObj.find("[name$='weekList["+i+"].end_journal_hour']").val("");
            week_journal_FormObj.find("[name$='weekList["+i+"].end_journal_minute']").val("");
            return;
         }
         if (end_journal_year == "" && end_journal_minute != "")
         {
            alert("년도부터 선택해주세요.");
            week_journal_FormObj.find("[name$='weekList["+i+"].end_journal_month']").val("");
            week_journal_FormObj.find("[name$='weekList["+i+"].end_journal_date']").val("");
            week_journal_FormObj.find("[name$='weekList["+i+"].end_journal_hour']").val("");
            week_journal_FormObj.find("[name$='weekList["+i+"].end_journal_minute']").val("");
            return;
         }

         //---------------------------------------------------
         //종료년도 체크 후 월부터 설정
         //---------------------------------------------------
         if (end_journal_month == "" && end_journal_day != "")
         {
            alert("월부터 선택해주세요.");
            week_journal_FormObj.find("[name$='weekList["+i+"].end_journal_date']").val("");
            week_journal_FormObj.find("[name$='weekList["+i+"].end_journal_hour']").val("");
            week_journal_FormObj.find("[name$='weekList["+i+"].end_journal_minute']").val("");
            return;
         }
         if (end_journal_month == "" && end_journal_hour != "")
         {
            alert("월부터 선택해주세요.");
            week_journal_FormObj.find("[name$='weekList["+i+"].end_journal_date']").val("");
            week_journal_FormObj.find("[name$='weekList["+i+"].end_journal_hour']").val("");
            week_journal_FormObj.find("[name$='weekList["+i+"].end_journal_minute']").val("");
            return;
         }
         if (end_journal_month == "" && end_journal_minute != "")
         {
            alert("월부터 선택해주세요.");
            week_journal_FormObj.find("[name$='weekList["+i+"].end_journal_date']").val("");
            week_journal_FormObj.find("[name$='weekList["+i+"].end_journal_hour']").val("");
            week_journal_FormObj.find("[name$='weekList["+i+"].end_journal_minute']").val("");
            return;
         }

         //---------------------------------------------------
         //종료년도,월 체크 후 일 설정
         //---------------------------------------------------
         if (end_journal_day == "" && end_journal_hour != "")
         {
            alert("월부터 선택해주세요.");
            week_journal_FormObj.find("[name$='weekList["+i+"].end_journal_hour']").val("");
            week_journal_FormObj.find("[name$='weekList["+i+"].end_journal_minute']").val("");
            return;
         }
         if (end_journal_day == "" && end_journal_minute != "")
         {
            alert("월부터 선택해주세요.");
            week_journal_FormObj.find("[name$='weekList["+i+"].end_journal_hour']").val("");
            week_journal_FormObj.find("[name$='weekList["+i+"].end_journal_minute']").val("");
            return;
         }
         //---------------------------------------------------
         //종료년도,월,일 체크 후 시간 설정
         //---------------------------------------------------
         if (end_journal_hour == "" && end_journal_minute != "")
         {
            alert("시간부터 선택해주세요.");
            week_journal_FormObj.find("[name$='weekList["+i+"].end_journal_minute']").val("");
            return;
         }

         //시작일의 년도가 종료일의 년도보다 클 때
         if (start_journal_year !="" && end_journal_year !="")
         {
            if (parseInt(end_journal_year,10)< parseInt(start_journal_year,10))
            {
               alert("시작년도가 종료년도보다 큽니다. 재선택바람!");
               week_journal_FormObj.find("[name$='weekList["+i+"].begin_journal_year']").val( "" );
               week_journal_FormObj.find("[name$='weekList["+i+"].end_journal_year']").val( "" );
               week_journal_FormObj.find("[name$='weekList["+i+"].begin_journal_month']").val( "" );
               week_journal_FormObj.find("[name$='weekList["+i+"].end_journal_month']").val( "" );
               week_journal_FormObj.find("[name$='weekList["+i+"].begin_journal_date']").val( "" );
               week_journal_FormObj.find("[name$='weekList["+i+"].end_journal_date']").val( "" );
               week_journal_FormObj.find("[name$='weekList["+i+"].begin_journal_hour']").val( "" );
               week_journal_FormObj.find("[name$='weekList["+i+"].end_journal_hour']").val( "" );
               week_journal_FormObj.find("[name$='weekList["+i+"].begin_journal_minute']").val( "" );
               week_journal_FormObj.find("[name$='weekList["+i+"].end_journal_minute']").val( "" );
               return;
               }
         }


         //시작일의 월이 종료일의 월보다 클 때
         if (start_journal_year !="" && start_journal_month != "" && end_journal_year !="" && end_journal_month !="")
         {
            var end_date = week_journal_FormObj.find("[name$='weekList["+i+"].end_journal_year']").val(  )+week_journal_FormObj.find("[name$='weekList["+i+"].end_journal_month']").val(  );

            var start_date = week_journal_FormObj.find("[name$='weekList["+i+"].begin_journal_year']").val(  )+week_journal_FormObj.find("[name$='weekList["+i+"].begin_journal_month']").val(  );

               if (parseInt(end_date,10)< parseInt(start_date,10))
               {
                  alert("시작월이 종료월보다 큽니다. 재선택바람!");
                  week_journal_FormObj.find("[name$='weekList["+i+"].begin_journal_year']").val( "" );
                  week_journal_FormObj.find("[name$='weekList["+i+"].end_journal_year']").val( "" );
                  week_journal_FormObj.find("[name$='weekList["+i+"].begin_journal_month']").val( "" );
                  week_journal_FormObj.find("[name$='weekList["+i+"].end_journal_month']").val( "" );
                  week_journal_FormObj.find("[name$='weekList["+i+"].begin_journal_date']").val( "" );
                  week_journal_FormObj.find("[name$='weekList["+i+"].end_journal_date']").val( "" );
                  week_journal_FormObj.find("[name$='weekList["+i+"].begin_journal_hour']").val( "" );
                  week_journal_FormObj.find("[name$='weekList["+i+"].end_journal_hour']").val( "" );
                  week_journal_FormObj.find("[name$='weekList["+i+"].begin_journal_minute']").val( "" );
                  week_journal_FormObj.find("[name$='weekList["+i+"].end_journal_minute']").val( "" );
                  return;
            }
         }

         //시작일의 일이 종료일의 일보다 클 때
         if (start_journal_year !="" && start_journal_month != "" && start_journal_day != "" && end_journal_year !="" && end_journal_month !="" && end_journal_day !="")
         {   
            var end_date = week_journal_FormObj.find("[name$='weekList["+i+"].end_journal_year']").val(  )+week_journal_FormObj.find("[name$='weekList["+i+"].end_journal_month']").val(  )+week_journal_FormObj.find("[name$='weekList["+i+"].end_journal_date']").val(  );

            var start_date = week_journal_FormObj.find("[name$='weekList["+i+"].begin_journal_year']").val(  )+week_journal_FormObj.find("[name$='weekList["+i+"].begin_journal_month']").val(  )+week_journal_FormObj.find("[name$='weekList["+i+"].begin_journal_date']").val(  );

            if (parseInt(end_date,10)< parseInt(start_date,10))
            {
               alert("시작일이 종료일보다 큽니다. 재선택바람!");
               week_journal_FormObj.find("[name$='weekList["+i+"].begin_journal_year']").val( "" );
               week_journal_FormObj.find("[name$='weekList["+i+"].end_journal_year']").val( "" );
               week_journal_FormObj.find("[name$='weekList["+i+"].begin_journal_month']").val( "" );
               week_journal_FormObj.find("[name$='weekList["+i+"].end_journal_month']").val( "" );
               week_journal_FormObj.find("[name$='weekList["+i+"].begin_journal_date']").val( "" );
               week_journal_FormObj.find("[name$='weekList["+i+"].end_journal_date']").val( "" );
               week_journal_FormObj.find("[name$='weekList["+i+"].begin_journal_hour']").val( "" );
               week_journal_FormObj.find("[name$='weekList["+i+"].end_journal_hour']").val( "" );
               week_journal_FormObj.find("[name$='weekList["+i+"].begin_journal_minute']").val( "" );
               week_journal_FormObj.find("[name$='weekList["+i+"].end_journal_minute']").val( "" );
               return;
            }
         }

         //시작일의 시간이 종료일의 시간보다 클 때
         if (start_journal_year !="" && start_journal_month != "" && start_journal_day != "" && start_journal_hour != "" && end_journal_year !="" && end_journal_month !="" && end_journal_day !="" && end_journal_hour !="")
         {
            var end_date = week_journal_FormObj.find("[name$='weekList["+i+"].end_journal_year']").val(  )+week_journal_FormObj.find("[name$='weekList["+i+"].end_journal_month']").val(  )+week_journal_FormObj.find("[name$='weekList["+i+"].end_journal_date']").val(  )+week_journal_FormObj.find("[name$='weekList["+i+"].end_journal_hour']").val(  );

            var start_date = week_journal_FormObj.find("[name$='weekList["+i+"].begin_journal_year']").val(  )+week_journal_FormObj.find("[name$='weekList["+i+"].begin_journal_month']").val(  )+week_journal_FormObj.find("[name$='weekList["+i+"].begin_journal_date']").val(  )+week_journal_FormObj.find("[name$='weekList["+i+"].begin_journal_hour']").val(  );

            if (parseInt(end_date,10)< parseInt(start_date,10))
            {
               alert("시작시간이 종료시간보다 큽니다. 재선택바람!");
               week_journal_FormObj.find("[name$='weekList["+i+"].begin_journal_year']").val( "" );
               week_journal_FormObj.find("[name$='weekList["+i+"].end_journal_year']").val( "" );
               week_journal_FormObj.find("[name$='weekList["+i+"].begin_journal_month']").val( "" );
               week_journal_FormObj.find("[name$='weekList["+i+"].end_journal_month']").val( "" );
               week_journal_FormObj.find("[name$='weekList["+i+"].begin_journal_date']").val( "" );
               week_journal_FormObj.find("[name$='weekList["+i+"].end_journal_date']").val( "" );
               week_journal_FormObj.find("[name$='weekList["+i+"].begin_journal_hour']").val( "" );
               week_journal_FormObj.find("[name$='weekList["+i+"].end_journal_hour']").val( "" );
               week_journal_FormObj.find("[name$='weekList["+i+"].begin_journal_minute']").val( "" );
               week_journal_FormObj.find("[name$='weekList["+i+"].end_journal_minute']").val( "" );
               return;
            }
         }

      //시작일의 분이 종료일의 분보다 클 때
      if (start_journal_year !="" && start_journal_month != "" && start_journal_day != "" && start_journal_hour != "" && start_journal_minute != "" && end_journal_year !="" && end_journal_month  !="" && end_journal_day !="" && end_journal_hour !="" && end_journal_minute !="")
      {
         var end_date = week_journal_FormObj.find("[name$='weekList["+i+"].end_journal_year']").val(  )+week_journal_FormObj.find("[name$='weekList["+i+"].end_journal_month']").val(  )+week_journal_FormObj.find("[name$='weekList["+i+"].end_journal_date']").val(  )+week_journal_FormObj.find("[name$='weekList["+i+"].end_journal_hour']").val(  )+week_journal_FormObj.find("[name$='weekList["+i+"].end_journal_minute']").val(  );

         var start_date = week_journal_FormObj.find("[name$='weekList["+i+"].begin_journal_year']").val(  )+week_journal_FormObj.find("[name$='weekList["+i+"].begin_journal_month']").val(  )+week_journal_FormObj.find("[name$='weekList["+i+"].begin_journal_date']").val(  )+week_journal_FormObj.find("[name$='weekList["+i+"].begin_journal_hour']").val(  )+week_journal_FormObj.find("[name$='weekList["+i+"].begin_journal_minute']").val(  );

         if (parseInt(end_date,10)< parseInt(start_date,10))
         {
            alert("시작분이 종료분보다 큽니다. 재선택바람!");
            week_journal_FormObj.find("[name$='weekList["+i+"].begin_journal_year']").val( "" );
            week_journal_FormObj.find("[name$='weekList["+i+"].end_journal_year']").val( "" );
            week_journal_FormObj.find("[name$='weekList["+i+"].begin_journal_month']").val( "" );
            week_journal_FormObj.find("[name$='weekList["+i+"].end_journal_month']").val( "" );
            week_journal_FormObj.find("[name$='weekList["+i+"].begin_journal_date']").val( "" );
            week_journal_FormObj.find("[name$='weekList["+i+"].end_journal_date']").val( "" );
            week_journal_FormObj.find("[name$='weekList["+i+"].begin_journal_hour']").val( "" );
            week_journal_FormObj.find("[name$='weekList["+i+"].end_journal_hour']").val( "" );
            week_journal_FormObj.find("[name$='weekList["+i+"].begin_journal_minute']").val( "" );
            week_journal_FormObj.find("[name$='weekList["+i+"].end_journal_minute']").val( "" );
            return;
         }
      }
      //---------------------------------------------
      //종료시간 존재여부
      //---------------------------------------------
      if( end_journal_year =="" || end_journal_month =="" || end_journal_day ==""){ return;}
         if (is_valid_date(end_journal_year,end_journal_month,end_journal_day)==false){
            alert("존재하지 않는 날짜입니다.");
            week_journal_FormObj.find("[name$='weekList["+i+"].end_journal_year']").val("");
            week_journal_FormObj.find("[name$='weekList["+i+"].end_journal_month']").val("");
            week_journal_FormObj.find("[name$='weekList["+i+"].end_journal_date']").val("");
            return;
         }

         }
   }
   
   
   function goReset(){
      var week_journal_FormObj=$("[name=week_journal]");
      
      week_journal_FormObj.find("[name=journal_year]").val("");
      week_journal_FormObj.find("[name=journal_month]").val("");
      week_journal_FormObj.find("[name=journal_date]").val("");
      week_journal_FormObj.find("[name=to_today_day]").val("");
      week_journal_FormObj.find("[name^=weekList]").val("");
      week_journal_FormObj.find("[name$=completion]").prop("checked",false);
   }

   //--------------------------------------------------------------------------------------------------------------------
   </script>
   <body>
     <br><br><center> <h3 align="top"><b>[주간 업무일지 등록]</b></h3><br>
      <form name="week_journal" method="post" action="/pro/week_business_log_reg_proc.do">
<center>  <TABLE class="tbcss1" >
<TR>
    <th align="center" class="real_table">1.주간 업무일지 보고일</th>
      <td align=left class="real_td">
            &emsp;<select name="journal_year">
               <option value=""></option>
               <script>
                  for (var i=1990; i<=new Date().getFullYear()+1 ; i++ ){   
                     document.write("<option value="+i+">"+i);
                  }
               </script>
            </select>&nbsp;&nbsp;년
            <select name="journal_month">
               <option value=""></option>
                  <script>
                     for (var i=1; i<=12 ; i++ ){   
                        var m = (i<10)?"0"+i:i;
                     document.write("<option value="+m+">"+m);
                     }
                  </script>
            </select>&nbsp;&nbsp;월
            <select name="journal_date">
               <option value=""></option>
                  <script>
                     for (var i=1; i<=31 ; i++ ){   
                        var m = (i<10)?"0"+i:i;
                        document.write("<option value="+m+">"+m);
                     }
                  </script>
            </select>&nbsp;&nbsp;일
         <input type="text"  name="to_today_day" style="width:25px;" readonly>
         <span style="cursor:pointer" class="to_today">&nbsp;&nbsp;[이번달로]</span></TD>
</TR>
<TR>
   <th align="left" class="real_table" >2.주간 업무일지 내용</th>
   <TD class="real_td">
   
   <table class="tbcss1">
   <TR>
      <th align="center" class="th_color" style="width:90px;">작성자</th>
      <th align="center" class="th_color" style="width:90px;">업무분야</th>
      <th align="center" class="th_color" style="width:160px;">업무내용</th>
      <th align="center" class="th_color" style="width:400px;">시간</th>
      <th align="center" class="th_color" style="width:60px;">완료여부</th>
   </TR>
   <tr class=xxx>
      <td align="center" class="td_color">${sessionScope.emp_name}</td>
      <td align="center" class="td_color">
               <select name="weekList[0].week_list" style="width:60px;">
                  <option value=""></option>
                  <option value="1">행정</option>
                  <option value="2">사무</option>
                  <option value="3">구매</option>
                  <option value="4">접대</option>
                  <option value="5">회계</option>
                  <option value="6">기타</option>
               </select>
            </td>
      <td align="center" class="td_color">
            <input type="text" name="weekList[0].week_content" style="width:130px;">
         </td>
      <td class="td_color">시작일:
         <select name="weekList[0].begin_journal_year" onChange="checkWeekTime()">
            <option value=""></option>
            <script>
               for (var i=1990; i<=new Date().getFullYear()+1 ; i++ ){   
                  document.write("<option value="+i+">"+i);
               }
            </script>
         </select>&nbsp;&nbsp;년
         <select name="weekList[0].begin_journal_month" onChange="checkWeekTime()">
            <option value=""></option>
               <script>
                  for (var i=1; i<=12 ; i++ ){   
                     var m = (i<10)?"0"+i:i;
                     document.write("<option value="+m+">"+m);
                  }
               </script>
         </select>
         </select>&nbsp;&nbsp;월
         <select name="weekList[0].begin_journal_date" onChange="checkWeekTime()">
            <option value=""></option>
         <script>
            for (var i=1; i<=31 ; i++ ){   
               var m = (i<10)?"0"+i:i;
               document.write("<option value="+m+">"+m);
            }
         </script>
         </select>&nbsp;&nbsp;일
         <select name="weekList[0].begin_journal_hour" onChange="checkWeekTime()">
            <option value=""></option>
            <script>
            for (var i=1; i<=24 ; i++ ){   
               var m = (i<10)?"0"+i:i;
               document.write("<option value="+m+">"+m);
            }
            </script>
         </select>&nbsp;&nbsp;시
         <select name="weekList[0].begin_journal_minute" onChange="checkWeekTime()">
            <option value=""></option>
            <script>
               for (var i=0; i<=59 ; i++ ){   
                  var m = (i<10)?"0"+i:i;
                  document.write("<option value="+m+">"+m);
               }
            </script>
         </select>&nbsp;&nbsp;분
      <div style="height:5px"></div>
         종료일:
         <select name="weekList[0].end_journal_year" onChange="checkWeekTime1()">
            <option value=""></option>
            <script>
               for (var i=1990; i<=new Date().getFullYear()+1 ; i++ ){   
               document.write("<option value="+i+">"+i);
               }
            </script>
         </select>&nbsp;&nbsp;년
         <select name="weekList[0].end_journal_month" onChange="checkWeekTime1()">
            <option value=""></option>
            <script>
               for (var i=1; i<=12 ; i++ ){   
               var m = (i<10)?"0"+i:i;
               document.write("<option value="+m+">"+m);
               }
            </script>
         </select>&nbsp;&nbsp;&nbsp;월
         <select name="weekList[0].end_journal_date" onChange="checkWeekTime1()">
            <option value=""></option>
            <script>
               for (var i=1; i<=31 ; i++ ){   
                  var m = (i<10)?"0"+i:i;
                  document.write("<option value="+m+">"+m);
               }
            </script>
         </select>&nbsp;&nbsp;일
         <select name="weekList[0].end_journal_hour" onChange="checkWeekTime1()">
            <option value=""></option>
               <script>
                  for (var i=1; i<=24 ; i++ ){   
                     var m = (i<10)?"0"+i:i;
                     document.write("<option value="+m+">"+m);
                  }
               </script>
         </select>&nbsp;&nbsp;시
         <select name="weekList[0].end_journal_minute" onChange="checkWeekTime1()">
            <option value=""></option>
               <script>
                  for (var i=0; i<=59 ; i++ ){   
                     var m = (i<10)?"0"+i:i;
                     document.write("<option value="+m+">"+m);
                  }
               </script>
         </select>&nbsp;&nbsp;분
         </td>
      <td align="center" class="td_color">
            <input type="checkbox" name="weekList[0].completion" value="1" onclick="checkfinish()">완료
         </td>
   </TR>
   </TABLE>

   <div style="height:10px"></div> 
            &emsp;  
            <span style="cursor:pointer" id="add" onclick="addTR( 'xxx' );">[행추가]</span>
            <span style="cursor:pointer" onclick="delLastTR( 'xxx' );">[행삭제]</span>
            &nbsp; <span name="" style="cursor:pointer" class="to_today2">[이번달로]</span>   

   </TD>
</TR>
</TABLE></center>
      <center><BR>
         <span style="width:80px;" onClick="week_journal_FormCheck();" class="btn btn1">등록하기</span>&nbsp;&nbsp;&nbsp;
        <span style="width:80px;" onClick="location.replace('/pro/weekList.do')" class="btn btn1">화면닫기</span>&nbsp;&nbsp;&nbsp;
         <span style="cursor:pointer; width:60px;" onclick="goReset()" class="btn btn1">초기화</span>
      <br></center>

      </form>
   </BODY>
</HTML>