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
   
      function getWeek (num) {

        var week = ["일","월","화","수","목","금","토"]
        return week[num];

      };

   </script>
  

   <script>
   $("document").ready(function(){
      
      if( parseInt(${sessionScope.form_choice},10) ==1  ){ //지시사항 없는 작성자 화면 //수정화면1
         $("[name=weekContentForm2]").hide();
         
         $("[name=weekContentForm]").find("[name=journal_year]").val("${weeklist[0].journal_year}");
         $("[name=weekContentForm]").find("[name=journal_month]").val("${weeklist[0].journal_month}");
         $("[name=weekContentForm]").find("[name=journal_date]").val("${weeklist[0].journal_date}");
         $("[name=weekContentForm]").find("[name=to_today_day]").val("${weeklist[0].to_today_day}");
         
         <c:forEach var="content" items="${contentlist}" varStatus="loopStatus">
          $("[name=weekContentForm]").find("[name='weekList[${loopStatus.index}].week_list']").val("${content.week_business_field}");
          $("[name=weekContentForm]").find("[name='weekList[${loopStatus.index}].week_content']").val("${content.week_business_content}");
          $("[name=weekContentForm]").find("[name='weekList[${loopStatus.index}].begin_journal_year']").val("${content.begin_journal_year}");
          $("[name=weekContentForm]").find("[name='weekList[${loopStatus.index}].begin_journal_month']").val("${content.begin_journal_month}");
          $("[name=weekContentForm]").find("[name='weekList[${loopStatus.index}].begin_journal_date']").val("${content.begin_journal_date}");
          $("[name=weekContentForm]").find("[name='weekList[${loopStatus.index}].begin_journal_hour']").val("${content.begin_journal_hour}");
          $("[name=weekContentForm]").find("[name='weekList[${loopStatus.index}].begin_journal_minute']").val("${content.begin_journal_minute}");
          $("[name=weekContentForm]").find("[name='weekList[${loopStatus.index}].end_journal_year']").val("${content.end_journal_year}");
          $("[name=weekContentForm]").find("[name='weekList[${loopStatus.index}].end_journal_month']").val("${content.end_journal_month}");
          $("[name=weekContentForm]").find("[name='weekList[${loopStatus.index}].end_journal_date']").val("${content.end_journal_date}");
          $("[name=weekContentForm]").find("[name='weekList[${loopStatus.index}].end_journal_hour']").val("${content.end_journal_hour}");
          $("[name=weekContentForm]").find("[name='weekList[${loopStatus.index}].end_journal_minute']").val("${content.end_journal_minute}");
          <c:if test="${content.completion==1}">
             $("[name=weekContentForm]").find("[name='weekList[${loopStatus.index}].completion']").prop("checked",true);
          </c:if>
          <c:if test="${loopStatus.count != contentlist.size()}">
             addTR('xxx','0');
          </c:if>
        </c:forEach>
        
      }
      else if( parseInt(${sessionScope.form_choice},10) ==2 ){ //지시사항 있는 작성자 화면 //수정화면2
          $("[name=weekContentForm]").hide();
          $("[name=weekContentForm2]").find("[name=journal_year]").val("${weeklist[0].journal_year}");
          $("[name=weekContentForm2]").find("[name=journal_month]").val("${weeklist[0].journal_month}");
          $("[name=weekContentForm2]").find("[name=journal_date]").val("${weeklist[0].journal_date}");
          $("[name=weekContentForm2]").find("[name=to_today_day]").val("${weeklist[0].to_today_day}");
          
          $("[name=weekContentForm2]").find("[name=week_business_remarks]").val("${weeklist[0].week_business_remarks}");
          
          <c:forEach var="content" items="${contentlist}" varStatus="loopStatus">
          <c:if test="${loopStatus.count != contentlist.size()}">
          addTR('xxx2','0');
        </c:if>
         </c:forEach>
        <c:forEach var="content" items="${contentlist}" varStatus="loopStatus" begin="1" end="${contentlist.size()}">
           delLastTR2('xxx2');
        </c:forEach>
       }
      
      var week_journal_FormObj = $("[name=weekContentForm]");
      
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
          week_journal_FormObj.find("[name=journal_date]").val(date);
          week_journal_FormObj.find("[name=to_today_day]").val(day);
       });
   
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

             if( week_journal_FormObj.find("[name='weekList["+i+"].begin_journal_year']").val("") || week_journal_FormObj.find("[name='weekList["+i+"].end_journal_year']").val("") ){
                  week_journal_FormObj.find("[name='weekList["+i+"].begin_journal_year']").val(year);
                    // 현재 날짜의 월을 name=min_reg_month 을 가진 입력양식에 넣어주기
                    week_journal_FormObj.find("[name='weekList["+i+"].begin_journal_month']").val(month);
                   week_journal_FormObj.find("[name='weekList["+i+"].end_journal_year']").val(year);
                   // 현재 날짜의 월을 name=min_reg_month 을 가진 입력양식에 넣어주기
                   week_journal_FormObj.find("[name='weekList["+i+"].end_journal_month']").val(month);
             }   
          }
          
       });     
      
   });
   

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
          if(dataCnt<12  && check_1=='1') { alert("마지막 행에 테이터가 비어있어 행 추가 불가능!"); return; }   
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
        //print_nameV( classN )
       }catch(e){
         alert("delLastTR(~) 함수 호출 시 에러 발생!");
       }
     }
     
     
     
     function delLastTR2( classN ){
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

//----------------------------------------------------------------------------------------------------

      //------------------------------------------------------------------------
      //업무보고일 유효성 체크 수정화면1
      //------------------------------------------------------------------------
         function checkApprovalDate2(){

            var weekUpDelFormObj = $("[name=weekContentForm]");
           
            //------------------------------------------------------------------------
            //선택한 보고일의 년,월,일을 변수에 저장
            //------------------------------------------------------------------------
            var check_year = weekUpDelFormObj.find("[name=journal_year]").val( ); 
            var check_month = weekUpDelFormObj.find("[name=journal_month]").val( );
            var check_date = weekUpDelFormObj.find("[name=journal_date]").val( );
            //---------------------------------------------------------------------
            //년도 먼저 설정하도록 함
            //---------------------------------------------------------------------
            if (check_year==""&&check_month !=""){
               alert("년도를 먼저 선택해주세요");
               weekUpDelFormObj.find("[name=journal_year]").val("");
               weekUpDelFormObj.find("[name=journal_month]").val("");
               weekUpDelFormObj.find("[name=journal_date]").val("");
               weekUpDelFormObj.find("[name=to_today_day]").val("");
               return;
            }
            if (check_year==""&&check_date !=""){
               alert("년도를 먼저 선택해주세요");
               weekUpDelFormObj.find("[name=journal_year]").val("");
               weekUpDelFormObj.find("[name=journal_month]").val("");
               weekUpDelFormObj.find("[name=journal_date]").val("");
               weekUpDelFormObj.find("[name=to_today_day]").val("");
               return;
            }
            //---------------------------------------------------------------------
            //월 먼저 설정하도록 함
            //---------------------------------------------------------------------
            if (check_month==""&&check_date !=""){
               alert("월을 먼저 선택해주세요");
               weekUpDelFormObj.find("[name=journal_year]").val("");
               weekUpDelFormObj.find("[name=journal_month]").val("");
               weekUpDelFormObj.find("[name=journal_date]").val("");
               weekUpDelFormObj.find("[name=to_today_day]").val("");
               return;
            }
            //------------------------------------------------------------------------
            //선택한 생일의 년,월,일 중에 하나라도 비어있으면 함수 중단
            //------------------------------------------------------------------------
            if( check_year=="" || check_month=="" || check_date=="" ){return;}

            //------------------------------------------------------------------------
            //is_valid_date 함수 호출하여 선택한 생일의 년,월,일의 실존 여부를 판단하여
            //존재하지 않는 생일이면 경고하기.
            //------------------------------------------------------------------------
            if (  check_year!= null && check_month!=null && check_date!=null  ){

               if( is_valid_date(check_year, check_month, check_date)==false){
                      alert("날짜가 존재하지 않습니다");
                  weekUpDelFormObj.find("[name=journal_year]").val("");
                  weekUpDelFormObj.find("[name=journal_month]").val("");
                  weekUpDelFormObj.find("[name=journal_date]").val("");
                  weekUpDelFormObj.find("[name=to_today_day]").val("");
                      return;
                   }
               else{
                  var select_day = new Date( check_year, check_month-1, check_date );
                      var month = select_day.getMonth()+1;
                      var date = select_day.getDate();
                      var day = getWeek( select_day.getDay() );
                      weekUpDelFormObj.find("[name=to_today_day]").val(day);
                   }
            }
         }


//=========================================================================================

   
  //------------------------------------------------------------------------
   //업무시작일 유효성 체크 수정화면1
   //------------------------------------------------------------------------
      function checkApprovalDate(){

         var weekUpDelFormObj = $("[name=weekContentForm]");
         
         for(var i=0; i<$(".xxx").length; i++){
        
	         //------------------------------------------------------------------------
	         //선택한 생일의 년,월,일을 변수에 저장
	         //------------------------------------------------------------------------
	         var check_year = weekUpDelFormObj.find("[name$='weekList["+i+"].begin_journal_year']").val( ); 
	         var check_month = weekUpDelFormObj.find("[name$='weekList["+i+"].begin_journal_month']").val( );
	         var check_date = weekUpDelFormObj.find("[name$='weekList["+i+"].begin_journal_date']").val( );
	         var check_hour = weekUpDelFormObj.find("[name$='weekList["+i+"].begin_journal_hour']").val( );
	         var check_minute = weekUpDelFormObj.find("[name$='weekList["+i+"].begin_journal_minute']").val( );
	         
	         //------------------------------------------------------------------------
	         var check_year1 = weekUpDelFormObj.find("[name$='weekList["+i+"].end_journal_year']").val( ); 
	         var check_month1 = weekUpDelFormObj.find("[name$='weekList["+i+"].end_journal_month']").val( );
	         var check_date1 = weekUpDelFormObj.find("[name$='weekList["+i+"].end_journal_date']").val( );
	         var check_hour1 = weekUpDelFormObj.find("[name$='weekList["+i+"].end_journal_hour']").val( );
	         var check_minute1 = weekUpDelFormObj.find("[name$='weekList["+i+"].end_journal_minute']").val( );
	    
    
	         //---------------------------------------------------------------------
	         //년도 먼저 설정하도록 함
	         //---------------------------------------------------------------------
	         if (check_year==""&&check_month !=""){
	            alert("년도를 먼저 선택해주세요");
	            weekUpDelFormObj.find("[name$='weekList["+i+"].begin_journal_year']").val("");
	            return;
	         }
	         if (check_year==""&&check_date !=""){
	            alert("년도를 먼저 선택해주세요");
	            weekUpDelFormObj.find("[name$='weekList["+i+"].begin_journal_date']").val("");
	            return;
	         }
	         if (check_year==""&&check_hour !=""){
	            alert("년도를 먼저 선택해주세요");
	            weekUpDelFormObj.find("[name$='weekList["+i+"].begin_journal_hour']").val("");
	            return;
	         }
	         if (check_year==""&&check_minute !=""){
	            alert("년도를 먼저 선택해주세요");
	            weekUpDelFormObj.find("[name$='weekList["+i+"].begin_journal_minute']").val("");
	            return;
	         }
	         //---------------------------------------------------------------------
	         //월 먼저 설정하도록 함
	         //---------------------------------------------------------------------
	         if (check_month==""&&check_date !=""){
	            alert("월을 먼저 선택해주세요");
	            weekUpDelFormObj.find("[name$='weekList["+i+"].begin_journal_date']").val("");
	            return;
	         }
	         if (check_month==""&&check_hour !=""){
	            alert("월을 먼저 선택해주세요");
	            weekUpDelFormObj.find("[name$='weekList["+i+"].begin_journal_hour']").val("");
	            return;
	         }
	         if (check_month==""&&check_minute !=""){
	            alert("월을 먼저 선택해주세요");
	            weekUpDelFormObj.find("[name$='weekList["+i+"].begin_journal_minute']").val("");
	            return;
	         }
	         //---------------------------------------------------------------------
	         //일 먼저 설정하도록 함
	         //---------------------------------------------------------------------
	         if (check_date==""&&check_hour !=""){
	            alert("일을 먼저 선택해주세요");
	            weekUpDelFormObj.find("[name$='weekList["+i+"].begin_journal_hour']").val("");
	            return;
	         }
	         if (check_date==""&&check_minute !=""){
	            alert("일을 먼저 선택해주세요");
	            weekUpDelFormObj.find("[name$='weekList["+i+"].begin_journal_minute']").val("");
	            return;
	         }
	         //---------------------------------------------------------------------
	         //시 먼저 설정하도록 함
	         //---------------------------------------------------------------------
	         if (check_hour==""&&check_minute !=""){
	            alert("시간을 먼저 선택해주세요");
	            weekUpDelFormObj.find("[name$='weekList["+i+"].begin_journal_minute']").val("");
	            return;
	         }
	         //---------------------------------------------------------------------
	         //업무시간 비교하기
	         //---------------------------------------------------------------------
	         
		      //시작일의 년도가 종료일의 년도보다 클 때
		      if (check_year !="" && check_year1 !="")
		      {
		         if (parseInt(check_year1,10)< parseInt(check_year,10))
		         {
		            alert("시작년도가 종료년도보다 큽니다. 재선택바람!");
		            weekUpDelFormObj.find("[name$='weekList["+i+"].begin_journal_year']").val( "" );
		            weekUpDelFormObj.find("[name$='weekList["+i+"].end_journal_year']").val( "" );
		            weekUpDelFormObj.find("[name$='weekList["+i+"].begin_journal_month']").val( "" );
		            weekUpDelFormObj.find("[name$='weekList["+i+"].end_journal_month']").val( "" );
		            weekUpDelFormObj.find("[name$='weekList["+i+"].begin_journal_date']").val( "" );
		            weekUpDelFormObj.find("[name$='weekList["+i+"].end_journal_date']").val( "" );
		            weekUpDelFormObj.find("[name$='weekList["+i+"].begin_journal_hour']").val( "" );
		            weekUpDelFormObj.find("[name$='weekList["+i+"].end_journal_hour']").val( "" );
		            weekUpDelFormObj.find("[name$='weekList["+i+"].begin_journal_minute']").val( "" );
		            weekUpDelFormObj.find("[name$='weekList["+i+"].end_journal_minute']").val( "" );
		            return;
		         }
		      }


		      //시작일의 월이 종료일의 월보다 클 때
		      if (check_year !="" && check_month != "" && check_year1 !="" && check_month1 !="")
		      {
		         var end_date = weekUpDelFormObj.find("[name$='weekList["+i+"].end_journal_year']").val(  )
		         				+weekUpDelFormObj.find("[name$='weekList["+i+"].end_journal_month']").val(  );
		
		         var start_date = weekUpDelFormObj.find("[name$='weekList["+i+"].begin_journal_year']").val(  )
		         				+weekUpDelFormObj.find("[name$='weekList["+i+"].begin_journal_month']").val(  );
		
		         if (parseInt(end_date,10)< parseInt(start_date,10))
		         {
		            alert("시작월이 종료월보다 큽니다. 재선택바람!");
		            weekUpDelFormObj.find("[name$='weekList["+i+"].begin_journal_year']").val( "" );
		            weekUpDelFormObj.find("[name$='weekList["+i+"].end_journal_year']").val( "" );
		            weekUpDelFormObj.find("[name$='weekList["+i+"].begin_journal_month']").val( "" );
		            weekUpDelFormObj.find("[name$='weekList["+i+"].end_journal_month']").val( "" );
		            weekUpDelFormObj.find("[name$='weekList["+i+"].begin_journal_date']").val( "" );
		            weekUpDelFormObj.find("[name$='weekList["+i+"].end_journal_date']").val( "" );
		            weekUpDelFormObj.find("[name$='weekList["+i+"].begin_journal_hour']").val( "" );
		            weekUpDelFormObj.find("[name$='weekList["+i+"].end_journal_hour']").val( "" );
		            weekUpDelFormObj.find("[name$='weekList["+i+"].begin_journal_minute']").val( "" );
		            weekUpDelFormObj.find("[name$='weekList["+i+"].end_journal_minute']").val( "" );
		            return;
		         }
		      }
		
		      //시작일의 일이 종료일의 일보다 클 때
		      if (check_year !="" && check_month != "" && check_date != "" 
		    		  && check_year1 !="" && check_month1 !="" && check_date1 !="")
		      {   
		         var end_date = weekUpDelFormObj.find("[name$='weekList["+i+"].end_journal_year']").val(  )
		         				+weekUpDelFormObj.find("[name$='weekList["+i+"].end_journal_month']").val(  )
		         				+weekUpDelFormObj.find("[name$='weekList["+i+"].end_journal_date']").val(  );
		
		         var start_date = weekUpDelFormObj.find("[name$='weekList["+i+"].begin_journal_year']").val(  )
		         					+weekUpDelFormObj.find("[name$='weekList["+i+"].begin_journal_month']").val(  )
		         					+weekUpDelFormObj.find("[name$='weekList["+i+"].begin_journal_date']").val(  );
		
		         if (parseInt(end_date,10)< parseInt(start_date,10))
		         {
		            alert("시작일이 종료일보다 큽니다. 재선택바람!");
		            weekUpDelFormObj.find("[name$='weekList["+i+"].begin_journal_year']").val( "" );
		            weekUpDelFormObj.find("[name$='weekList["+i+"].end_journal_year']").val( "" );
		            weekUpDelFormObj.find("[name$='weekList["+i+"].begin_journal_month']").val( "" );
		            weekUpDelFormObj.find("[name$='weekList["+i+"].end_journal_month']").val( "" );
		            weekUpDelFormObj.find("[name$='weekList["+i+"].begin_journal_date']").val( "" );
		            weekUpDelFormObj.find("[name$='weekList["+i+"].end_journal_date']").val( "" );
		            weekUpDelFormObj.find("[name$='weekList["+i+"].begin_journal_hour']").val( "" );
		            weekUpDelFormObj.find("[name$='weekList["+i+"].end_journal_hour']").val( "" );
		            weekUpDelFormObj.find("[name$='weekList["+i+"].begin_journal_minute']").val( "" );
		            weekUpDelFormObj.find("[name$='weekList["+i+"].end_journal_minute']").val( "" );
		            return;
		         }
		      }
		
		      //시작일의 시간이 종료일의 시간보다 클 때
		      if (check_year !="" && check_month != "" && check_date != "" && check_hour != "" 
		    		  && check_year1 !="" && check_month1 !="" && check_date1 !="" && check_hour1 !="")
		      {
		         var end_date = weekUpDelFormObj.find("[name$='weekList["+i+"].end_journal_year']").val(  )
		         				+weekUpDelFormObj.find("[name$='weekList["+i+"].end_journal_month']").val(  )
		         				+weekUpDelFormObj.find("[name$='weekList["+i+"].end_journal_date']").val(  )
		         				+weekUpDelFormObj.find("[name$='weekList["+i+"].end_journal_hour']").val(  );
		
		         var start_date = weekUpDelFormObj.find("[name$='weekList["+i+"].begin_journal_year']").val(  )
		         				+weekUpDelFormObj.find("[name$='weekList["+i+"].begin_journal_month']").val(  )
		         				+weekUpDelFormObj.find("[name$='weekList["+i+"].begin_journal_date']").val(  )
		         				+weekUpDelFormObj.find("[name$='weekList["+i+"].begin_journal_hour']").val(  );
		
		         if (parseInt(end_date,10)< parseInt(start_date,10))
		         {
		            alert("시작시간이 종료시간보다 큽니다. 재선택바람!");
		            weekUpDelFormObj.find("[name$='weekList["+i+"].begin_journal_year']").val( "" );
		            weekUpDelFormObj.find("[name$='weekList["+i+"].end_journal_year']").val( "" );
		            weekUpDelFormObj.find("[name$='weekList["+i+"].begin_journal_month']").val( "" );
		            weekUpDelFormObj.find("[name$='weekList["+i+"].end_journal_month']").val( "" );
		            weekUpDelFormObj.find("[name$='weekList["+i+"].begin_journal_date']").val( "" );
		            weekUpDelFormObj.find("[name$='weekList["+i+"].end_journal_date']").val( "" );
		            weekUpDelFormObj.find("[name$='weekList["+i+"].begin_journal_hour']").val( "" );
		            weekUpDelFormObj.find("[name$='weekList["+i+"].end_journal_hour']").val( "" );
		            weekUpDelFormObj.find("[name$='weekList["+i+"].begin_journal_minute']").val( "" );
		            weekUpDelFormObj.find("[name$='weekList["+i+"].end_journal_minute']").val( "" );
		            return;
		         }
		      }
		
		      //시작일의 분이 종료일의 분보다 클 때
		      if (check_year !="" && check_month != "" && check_date != "" && check_hour != "" && check_minute != "" 
		    		  && check_year1 !="" && check_month1  !="" && check_date1 !="" && check_hour1 !="" && check_minute1 !="")
		      {
		         var end_date = weekUpDelFormObj.find("[name$='weekList["+i+"].end_journal_year']").val(  )
		         				+weekUpDelFormObj.find("[name$='weekList["+i+"].end_journal_month']").val(  )
		         				+weekUpDelFormObj.find("[name$='weekList["+i+"].end_journal_date']").val(  )
		         				+weekUpDelFormObj.find("[name$='weekList["+i+"].end_journal_hour']").val(  )
		         				+weekUpDelFormObj.find("[name$='weekList["+i+"].end_journal_minute']").val(  );
		
		         var start_date = weekUpDelFormObj.find("[name$='weekList["+i+"].begin_journal_year']").val(  )
		         				+weekUpDelFormObj.find("[name$='weekList["+i+"].begin_journal_month']").val(  )
		         				+weekUpDelFormObj.find("[name$='weekList["+i+"].begin_journal_date']").val(  )
		         				+weekUpDelFormObj.find("[name$='weekList["+i+"].begin_journal_hour']").val(  )
		         				+weekUpDelFormObj.find("[name$='weekList["+i+"].begin_journal_minute']").val(  );
		
		         if (parseInt(end_date,10)< parseInt(start_date,10))
		         {
		            alert("시작분이 종료분보다 큽니다. 재선택바람!");
		            weekUpDelFormObj.find("[name$='weekList["+i+"].begin_journal_year']").val( "" );
		            weekUpDelFormObj.find("[name$='weekList["+i+"].end_journal_year']").val( "" );
		            weekUpDelFormObj.find("[name$='weekList["+i+"].begin_journal_month']").val( "" );
		            weekUpDelFormObj.find("[name$='weekList["+i+"].end_journal_month']").val( "" );
		            weekUpDelFormObj.find("[name$='weekList["+i+"].begin_journal_date']").val( "" );
		            weekUpDelFormObj.find("[name$='weekList["+i+"].end_journal_date']").val( "" );
		            weekUpDelFormObj.find("[name$='weekList["+i+"].begin_journal_hour']").val( "" );
		            weekUpDelFormObj.find("[name$='weekList["+i+"].end_journal_hour']").val( "" );
		            weekUpDelFormObj.find("[name$='weekList["+i+"].begin_journal_minute']").val( "" );
		            weekUpDelFormObj.find("[name$='weekList["+i+"].end_journal_minute']").val( "" );
		            return;
		         }
		      }
/* 
         if( (check_year!=null && check_year.length>0) 
            && (check_month!=null && check_month.length>0)
            &&(check_date!=null && check_date.length>0) 
            && (check_year1!=null && check_year1.length>0) 
            && (check_month1!=null && check_month1.length>0)
            &&(check_date1!=null && check_date1.length>0) ){

            var max_date = weekUpDelFormObj.find("[name*=end_journal_year]").val(  )
                        +weekUpDelFormObj.find("[name*=end_journal_month]").val(  )
                        +weekUpDelFormObj.find("[name*=end_journal_date]").val(  );
            var min_date = weekUpDelFormObj.find("[name*=begin_journal_year]").val(  )      
                        +weekUpDelFormObj.find("[name*=begin_journal_month]").val(  )
                        +weekUpDelFormObj.find("[name*=begin_journal_date]").val(  );
            if( parseInt(max_date,10) < parseInt(min_date,10) ) {
               alert("[최소 년월]이 [최대 년월] 보다 큽니다. 재 선택 바람!1");
               weekUpDelFormObj.find("[name*=begin_journal_]").val("");
               weekUpDelFormObj.find("[name*=end_journal_]").val("");
               return;
            }
         }
         if(   (check_hour!=null && check_hour.length>0) 
            && (check_minute!=null && check_minute.length>0)
             &&(check_hour1!=null && check_hour1.length>0) 
             && (check_minute1!=null && check_minute1.length>0)   ){

             var max_date1 = weekUpDelFormObj.find("[name*=end_journal_hour]").val(  )
                         +weekUpDelFormObj.find("[name*=end_journal_minute]").val(  );
             var min_date1 = weekUpDelFormObj.find("[name*=begin_journal_hour]").val(  )      
                         +weekUpDelFormObj.find("[name*=begin_journal_minute]").val(  );
             if( parseInt(max_date1,10) < parseInt(min_date1,10) ) {
                alert("[최소 time]이 [최대 time] 보다 큽니다. 재 선택 바람!2");
                weekUpDelFormObj.find("[name*=begin_journal_]").val("");
                weekUpDelFormObj.find("[name*=end_journal_]").val("");
                return;
              }

           } */
       /*     
         //------------------------------------------------------------------------
         //선택한 생일의 년,월,일 중에 하나라도 비어있으면 함수 중단
         //------------------------------------------------------------------------
         if( check_year=="" || check_month=="" || check_date=="" ){return;}

         //------------------------------------------------------------------------
         //is_valid_date 함수 호출하여 선택한 생일의 년,월,일의 실존 여부를 판단하여
         //존재하지 않는 생일이면 경고하기.
         //------------------------------------------------------------------------
         if (  check_year!= null && check_month!=null && check_date!=null  ){

            if( is_valid_date(check_year, check_month, check_date)==false){
                   alert("날짜가 존재하지 않습니다");
                   weekUpDelFormObj.find("[name*=begin_journal_year]").val("");
                   weekUpDelFormObj.find("[name*=begin_journal_month]").val("");
                   weekUpDelFormObj.find("[name*=begin_journal_date]").val("");
                   return;
                }
            else{
               var select_day = new Date( check_year, check_month-1, check_date );
                   var month = select_day.getMonth()+1;
                   var date = select_day.getDate();
                }
         }
      } */
		      if( check_year =="" || check_month =="" || check_date ==""){ return;}
		         if (is_valid_date(check_year,check_month,check_date)==false){
		            alert("존재하지 않는 날짜입니다.");
		            week_journal_FormObj.find("[name$='weekList["+i+"].begin_journal_year']").val("");
		            week_journal_FormObj.find("[name$='weekList["+i+"].begin_journal_month']").val("");
		            week_journal_FormObj.find("[name$='weekList["+i+"].begin_journal_date']").val("");
		            week_journal_FormObj.find("[name$='weekList["+i+"].begin_journal_hour']").val("");
		            week_journal_FormObj.find("[name$='weekList["+i+"].begin_journal_minute']").val("");
		            return;
		         }

		         }
		   
		     }

      //------------------------------------------------------------------------
      //최대 방문시간 수정화면1
      //------------------------------------------------------------------------
         function checkApprovalDate1(){

            var weekUpDelFormObj = $("[name=weekContentForm]");

            
            for(var i=0; i<$(".xxx").length; i++){
           
   	         //------------------------------------------------------------------------
   	         //선택한 생일의 년,월,일을 변수에 저장
   	         //------------------------------------------------------------------------
   	         var check_year = weekUpDelFormObj.find("[name$='weekList["+i+"].begin_journal_year']").val( ); 
   	         var check_month = weekUpDelFormObj.find("[name$='weekList["+i+"].begin_journal_month']").val( );
   	         var check_date = weekUpDelFormObj.find("[name$='weekList["+i+"].begin_journal_date']").val( );
   	         var check_hour = weekUpDelFormObj.find("[name$='weekList["+i+"].begin_journal_hour']").val( );
   	         var check_minute = weekUpDelFormObj.find("[name$='weekList["+i+"].begin_journal_minute']").val( );
   	         
   	         //------------------------------------------------------------------------
   	         var check_year1 = weekUpDelFormObj.find("[name$='weekList["+i+"].end_journal_year']").val( ); 
   	         var check_month1 = weekUpDelFormObj.find("[name$='weekList["+i+"].end_journal_month']").val( );
   	         var check_date1 = weekUpDelFormObj.find("[name$='weekList["+i+"].end_journal_date']").val( );
   	         var check_hour1 = weekUpDelFormObj.find("[name$='weekList["+i+"].end_journal_hour']").val( );
   	         var check_minute1 = weekUpDelFormObj.find("[name$='weekList["+i+"].end_journal_minute']").val( );
   	    
       
   	         //---------------------------------------------------------------------
   	         //년도 먼저 설정하도록 함
   	         //---------------------------------------------------------------------
   	         if (check_year1==""&&check_month1 !=""){
   	            alert("년도를 먼저 선택해주세요");
   	            weekUpDelFormObj.find("[name$='weekList["+i+"].end_journal_month']").val("");
   	            return;
   	         }
   	         if (check_year1==""&&check_date1 !=""){
   	            alert("년도를 먼저 선택해주세요");
   	            weekUpDelFormObj.find("[name$='weekList["+i+"].end_journal_date']").val("");
   	            return;
   	         }
   	         if (check_year1==""&&check_hour1 !=""){
   	            alert("년도를 먼저 선택해주세요");
   	            weekUpDelFormObj.find("[name$='weekList["+i+"].end_journal_hour']").val("");
   	            return;
   	         }
   	         if (check_year1==""&&check_minute1 !=""){
   	            alert("년도를 먼저 선택해주세요");
   	            weekUpDelFormObj.find("[name$='weekList["+i+"].end_journal_minute']").val("");
   	            return;
   	         }
   	         //---------------------------------------------------------------------
   	         //월 먼저 설정하도록 함
   	         //---------------------------------------------------------------------
   	         if (check_month1==""&&check_date1 !=""){
   	            alert("월을 먼저 선택해주세요");
   	            weekUpDelFormObj.find("[name$='weekList["+i+"].end_journal_date']").val("");
   	            return;
   	         }
   	         if (check_month1==""&&check_hour1 !=""){
   	            alert("월을 먼저 선택해주세요");
   	            weekUpDelFormObj.find("[name$='weekList["+i+"].end_journal_hour']").val("");
   	            return;
   	         }
   	         if (check_month1==""&&check_minute1 !=""){
   	            alert("월을 먼저 선택해주세요");
   	            weekUpDelFormObj.find("[name$='weekList["+i+"].end_journal_minute']").val("");
   	            return;
   	         }
   	         //---------------------------------------------------------------------
   	         //일 먼저 설정하도록 함
   	         //---------------------------------------------------------------------
   	         if (check_date1==""&&check_hour1 !=""){
   	            alert("일을 먼저 선택해주세요");
   	            weekUpDelFormObj.find("[name$='weekList["+i+"].end_journal_hour']").val("");
   	            return;
   	         }
   	         if (check_date1==""&&check_minute1 !=""){
   	            alert("일을 먼저 선택해주세요");
   	            weekUpDelFormObj.find("[name$='weekList["+i+"].end_journal_minute']").val("");
   	            return;
   	         }
   	         //---------------------------------------------------------------------
   	         //시 먼저 설정하도록 함
   	         //---------------------------------------------------------------------
   	         if (check_hour1==""&&check_minute1 !=""){
   	            alert("시간을 먼저 선택해주세요");
   	            weekUpDelFormObj.find("[name$='weekList["+i+"].end_journal_minute']").val("");
   	            return;
   	         }
   	         //---------------------------------------------------------------------
   	         //업무시간 비교하기
   	         //---------------------------------------------------------------------
   	         
   		      //시작일의 년도가 종료일의 년도보다 클 때
   		      if (check_year !="" && check_year1 !="")
   		      {
   		         if (parseInt(check_year1,10)< parseInt(check_year,10))
   		         {
   		            alert("시작년도가 종료년도보다 큽니다. 재선택바람!");
   		            weekUpDelFormObj.find("[name$='weekList["+i+"].begin_journal_year']").val( "" );
   		            weekUpDelFormObj.find("[name$='weekList["+i+"].end_journal_year']").val( "" );
   		            weekUpDelFormObj.find("[name$='weekList["+i+"].begin_journal_month']").val( "" );
   		            weekUpDelFormObj.find("[name$='weekList["+i+"].end_journal_month']").val( "" );
   		            weekUpDelFormObj.find("[name$='weekList["+i+"].begin_journal_date']").val( "" );
   		            weekUpDelFormObj.find("[name$='weekList["+i+"].end_journal_date']").val( "" );
   		            weekUpDelFormObj.find("[name$='weekList["+i+"].begin_journal_hour']").val( "" );
   		            weekUpDelFormObj.find("[name$='weekList["+i+"].end_journal_hour']").val( "" );
   		            weekUpDelFormObj.find("[name$='weekList["+i+"].begin_journal_minute']").val( "" );
   		            weekUpDelFormObj.find("[name$='weekList["+i+"].end_journal_minute']").val( "" );
   		            return;
   		         }
   		      }


   		      //시작일의 월이 종료일의 월보다 클 때
   		      if (check_year !="" && check_month != "" && check_year1 !="" && check_month1 !="")
   		      {
   		         var end_date = weekUpDelFormObj.find("[name$='weekList["+i+"].end_journal_year']").val(  )
   		         				+weekUpDelFormObj.find("[name$='weekList["+i+"].end_journal_month']").val(  );
   		
   		         var start_date = weekUpDelFormObj.find("[name$='weekList["+i+"].begin_journal_year']").val(  )
   		         				+weekUpDelFormObj.find("[name$='weekList["+i+"].begin_journal_month']").val(  );
   		
   		         if (parseInt(end_date,10)< parseInt(start_date,10))
   		         {
   		            alert("시작월이 종료월보다 큽니다. 재선택바람!");
   		            weekUpDelFormObj.find("[name$='weekList["+i+"].begin_journal_year']").val( "" );
   		            weekUpDelFormObj.find("[name$='weekList["+i+"].end_journal_year']").val( "" );
   		            weekUpDelFormObj.find("[name$='weekList["+i+"].begin_journal_month']").val( "" );
   		            weekUpDelFormObj.find("[name$='weekList["+i+"].end_journal_month']").val( "" );
   		            weekUpDelFormObj.find("[name$='weekList["+i+"].begin_journal_date']").val( "" );
   		            weekUpDelFormObj.find("[name$='weekList["+i+"].end_journal_date']").val( "" );
   		            weekUpDelFormObj.find("[name$='weekList["+i+"].begin_journal_hour']").val( "" );
   		            weekUpDelFormObj.find("[name$='weekList["+i+"].end_journal_hour']").val( "" );
   		            weekUpDelFormObj.find("[name$='weekList["+i+"].begin_journal_minute']").val( "" );
   		            weekUpDelFormObj.find("[name$='weekList["+i+"].end_journal_minute']").val( "" );
   		            return;
   		         }
   		      }
   		
   		      //시작일의 일이 종료일의 일보다 클 때
   		      if (check_year !="" && check_month != "" && check_date != "" 
   		    		  && check_year1 !="" && check_month1 !="" && check_date1 !="")
   		      {   
   		         var end_date = weekUpDelFormObj.find("[name$='weekList["+i+"].end_journal_year']").val(  )
   		         				+weekUpDelFormObj.find("[name$='weekList["+i+"].end_journal_month']").val(  )
   		         				+weekUpDelFormObj.find("[name$='weekList["+i+"].end_journal_date']").val(  );
   		
   		         var start_date = weekUpDelFormObj.find("[name$='weekList["+i+"].begin_journal_year']").val(  )
   		         					+weekUpDelFormObj.find("[name$='weekList["+i+"].begin_journal_month']").val(  )
   		         					+weekUpDelFormObj.find("[name$='weekList["+i+"].begin_journal_date']").val(  );
   		
   		         if (parseInt(end_date,10)< parseInt(start_date,10))
   		         {
   		            alert("시작일이 종료일보다 큽니다. 재선택바람!");
   		            weekUpDelFormObj.find("[name$='weekList["+i+"].begin_journal_year']").val( "" );
   		            weekUpDelFormObj.find("[name$='weekList["+i+"].end_journal_year']").val( "" );
   		            weekUpDelFormObj.find("[name$='weekList["+i+"].begin_journal_month']").val( "" );
   		            weekUpDelFormObj.find("[name$='weekList["+i+"].end_journal_month']").val( "" );
   		            weekUpDelFormObj.find("[name$='weekList["+i+"].begin_journal_date']").val( "" );
   		            weekUpDelFormObj.find("[name$='weekList["+i+"].end_journal_date']").val( "" );
   		            weekUpDelFormObj.find("[name$='weekList["+i+"].begin_journal_hour']").val( "" );
   		            weekUpDelFormObj.find("[name$='weekList["+i+"].end_journal_hour']").val( "" );
   		            weekUpDelFormObj.find("[name$='weekList["+i+"].begin_journal_minute']").val( "" );
   		            weekUpDelFormObj.find("[name$='weekList["+i+"].end_journal_minute']").val( "" );
   		            return;
   		         }
   		      }
   		
   		      //시작일의 시간이 종료일의 시간보다 클 때
   		      if (check_year !="" && check_month != "" && check_date != "" && check_hour != "" 
   		    		  && check_year1 !="" && check_month1 !="" && check_date1 !="" && check_hour1 !="")
   		      {
   		         var end_date = weekUpDelFormObj.find("[name$='weekList["+i+"].end_journal_year']").val(  )
   		         				+weekUpDelFormObj.find("[name$='weekList["+i+"].end_journal_month']").val(  )
   		         				+weekUpDelFormObj.find("[name$='weekList["+i+"].end_journal_date']").val(  )
   		         				+weekUpDelFormObj.find("[name$='weekList["+i+"].end_journal_hour']").val(  );
   		
   		         var start_date = weekUpDelFormObj.find("[name$='weekList["+i+"].begin_journal_year']").val(  )
   		         				+weekUpDelFormObj.find("[name$='weekList["+i+"].begin_journal_month']").val(  )
   		         				+weekUpDelFormObj.find("[name$='weekList["+i+"].begin_journal_date']").val(  )
   		         				+weekUpDelFormObj.find("[name$='weekList["+i+"].begin_journal_hour']").val(  );
   		
   		         if (parseInt(end_date,10)< parseInt(start_date,10))
   		         {
   		            alert("시작시간이 종료시간보다 큽니다. 재선택바람!");
   		            weekUpDelFormObj.find("[name$='weekList["+i+"].begin_journal_year']").val( "" );
   		            weekUpDelFormObj.find("[name$='weekList["+i+"].end_journal_year']").val( "" );
   		            weekUpDelFormObj.find("[name$='weekList["+i+"].begin_journal_month']").val( "" );
   		            weekUpDelFormObj.find("[name$='weekList["+i+"].end_journal_month']").val( "" );
   		            weekUpDelFormObj.find("[name$='weekList["+i+"].begin_journal_date']").val( "" );
   		            weekUpDelFormObj.find("[name$='weekList["+i+"].end_journal_date']").val( "" );
   		            weekUpDelFormObj.find("[name$='weekList["+i+"].begin_journal_hour']").val( "" );
   		            weekUpDelFormObj.find("[name$='weekList["+i+"].end_journal_hour']").val( "" );
   		            weekUpDelFormObj.find("[name$='weekList["+i+"].begin_journal_minute']").val( "" );
   		            weekUpDelFormObj.find("[name$='weekList["+i+"].end_journal_minute']").val( "" );
   		            return;
   		         }
   		      }
   		
   		      //시작일의 분이 종료일의 분보다 클 때
   		      if (check_year !="" && check_month != "" && check_date != "" && check_hour != "" && check_minute != "" 
   		    		  && check_year1 !="" && check_month1  !="" && check_date1 !="" && check_hour1 !="" && check_minute1 !="")
   		      {
   		         var end_date = weekUpDelFormObj.find("[name$='weekList["+i+"].end_journal_year']").val(  )
   		         				+weekUpDelFormObj.find("[name$='weekList["+i+"].end_journal_month']").val(  )
   		         				+weekUpDelFormObj.find("[name$='weekList["+i+"].end_journal_date']").val(  )
   		         				+weekUpDelFormObj.find("[name$='weekList["+i+"].end_journal_hour']").val(  )
   		         				+weekUpDelFormObj.find("[name$='weekList["+i+"].end_journal_minute']").val(  );
   		
   		         var start_date = weekUpDelFormObj.find("[name$='weekList["+i+"].begin_journal_year']").val(  )
   		         				+weekUpDelFormObj.find("[name$='weekList["+i+"].begin_journal_month']").val(  )
   		         				+weekUpDelFormObj.find("[name$='weekList["+i+"].begin_journal_date']").val(  )
   		         				+weekUpDelFormObj.find("[name$='weekList["+i+"].begin_journal_hour']").val(  )
   		         				+weekUpDelFormObj.find("[name$='weekList["+i+"].begin_journal_minute']").val(  );
   		
   		         if (parseInt(end_date,10)< parseInt(start_date,10))
   		         {
   		            alert("시작분이 종료분보다 큽니다. 재선택바람!");
   		            weekUpDelFormObj.find("[name$='weekList["+i+"].begin_journal_year']").val( "" );
   		            weekUpDelFormObj.find("[name$='weekList["+i+"].end_journal_year']").val( "" );
   		            weekUpDelFormObj.find("[name$='weekList["+i+"].begin_journal_month']").val( "" );
   		            weekUpDelFormObj.find("[name$='weekList["+i+"].end_journal_month']").val( "" );
   		            weekUpDelFormObj.find("[name$='weekList["+i+"].begin_journal_date']").val( "" );
   		            weekUpDelFormObj.find("[name$='weekList["+i+"].end_journal_date']").val( "" );
   		            weekUpDelFormObj.find("[name$='weekList["+i+"].begin_journal_hour']").val( "" );
   		            weekUpDelFormObj.find("[name$='weekList["+i+"].end_journal_hour']").val( "" );
   		            weekUpDelFormObj.find("[name$='weekList["+i+"].begin_journal_minute']").val( "" );
   		            weekUpDelFormObj.find("[name$='weekList["+i+"].end_journal_minute']").val( "" );
   		            return;
   		         }
   		      }
   /* 
            //------------------------------------------------------------------------
            //선택한 생일의 년,월,일을 변수에 저장
            //------------------------------------------------------------------------
            var check_year = weekUpDelFormObj.find("[name*=begin_journal_year]").val( ); 
            var check_month = weekUpDelFormObj.find("[name*=begin_journal_month]").val( );
            var check_date = weekUpDelFormObj.find("[name*=begin_journal_date]").val( );
            var check_hour = weekUpDelFormObj.find("[name*=begin_journal_hour]").val( );
            var check_minute = weekUpDelFormObj.find("[name*=begin_journal_minute]").val( );
            
            //------------------------------------------------------------------------
            var check_year1 = weekUpDelFormObj.find("[name*=end_journal_year]").val( ); 
            var check_month1 = weekUpDelFormObj.find("[name*=end_journal_month]").val( );
            var check_date1 = weekUpDelFormObj.find("[name*=end_journal_date]").val( );
            var check_hour1 = weekUpDelFormObj.find("[name*=end_journal_hour]").val( );
            var check_minute1 = weekUpDelFormObj.find("[name*=end_journal_minute]").val( );
       
       
            
            //---------------------------------------------------------------------
            //년도 먼저 설정하도록 함
            //---------------------------------------------------------------------
            if (check_year1==""&&check_month1 !=""){
               alert("년도를 먼저 선택해주세요11");
               weekUpDelFormObj.find("[name*=end_journal_year]").val("");
               weekUpDelFormObj.find("[name*=end_journal_month]").val("");
               weekUpDelFormObj.find("[name*=end_journal_date]").val("");
               weekUpDelFormObj.find("[name*=end_journal_hour]").val("");
               weekUpDelFormObj.find("[name*=end_journal_minute]").val("");
               return;
            }
            if (check_year1==""&&check_date1 !=""){
               alert("년도를 먼저 선택해주세요22");
               weekUpDelFormObj.find("[name*=end_journal_year]").val("");
               weekUpDelFormObj.find("[name*=end_journal_month]").val("");
               weekUpDelFormObj.find("[name*=end_journal_date]").val("");
               weekUpDelFormObj.find("[name*=end_journal_hour]").val("");
               weekUpDelFormObj.find("[name*=end_journal_minute]").val("");
               return;
            }
            if (check_year1==""&&check_hour1 !=""){
               alert("년도를 먼저 선택해주세요33");
               weekUpDelFormObj.find("[name*=end_journal_year]").val("");
               weekUpDelFormObj.find("[name*=end_journal_month]").val("");
               weekUpDelFormObj.find("[name*=end_journal_date]").val("");
               weekUpDelFormObj.find("[name*=end_journal_hour]").val("");
               weekUpDelFormObj.find("[name*=end_journal_minute]").val("");
               return;
            }
            if (check_year1==""&&check_minute1 !=""){
               alert("년도를 먼저 선택해주세요44");
               weekUpDelFormObj.find("[name*=end_journal_year]").val("");
               weekUpDelFormObj.find("[name*=end_journal_month]").val("");
               weekUpDelFormObj.find("[name*=end_journal_date]").val("");
               weekUpDelFormObj.find("[name*=end_journal_hour]").val("");
               weekUpDelFormObj.find("[name*=end_journal_minute]").val("");
               return;
            }
            //---------------------------------------------------------------------
            //월 먼저 설정하도록 함
            //---------------------------------------------------------------------
            if (check_month1==""&&check_date1 !=""){
               alert("월을 먼저 선택해주세요11");
               weekUpDelFormObj.find("[name*=end_journal_year]").val("");
               weekUpDelFormObj.find("[name*=end_journal_month]").val("");
               weekUpDelFormObj.find("[name*=end_journal_date]").val("");
               weekUpDelFormObj.find("[name*=end_journal_hour]").val("");
               weekUpDelFormObj.find("[name*=end_journal_minute]").val("");
               return;
            }
            if (check_month1==""&&check_hour1 !=""){
               alert("월을 먼저 선택해주세요22");
               weekUpDelFormObj.find("[name*=end_journal_year]").val("");
               weekUpDelFormObj.find("[name*=end_journal_month]").val("");
               weekUpDelFormObj.find("[name*=end_journal_date]").val("");
               weekUpDelFormObj.find("[name*=end_journal_hour]").val("");
               weekUpDelFormObj.find("[name*=end_journal_minute]").val("");
               return;
            }
            if (check_month1==""&&check_minute1 !=""){
               alert("월을 먼저 선택해주세요33");
               weekUpDelFormObj.find("[name*=end_journal_year]").val("");
               weekUpDelFormObj.find("[name*=end_journal_month]").val("");
               weekUpDelFormObj.find("[name*=end_journal_date]").val("");
               weekUpDelFormObj.find("[name*=end_journal_hour]").val("");
               weekUpDelFormObj.find("[name*=end_journal_minute]").val("");
               return;
            }
            //---------------------------------------------------------------------
            //일을 먼저 설정하도록 함
            //---------------------------------------------------------------------
            if (check_date1==""&&check_hour1 !=""){
               alert("일을 먼저 선택해주세요11");
               weekUpDelFormObj.find("[name*=end_journal_year]").val("");
               weekUpDelFormObj.find("[name*=end_journal_month]").val("");
               weekUpDelFormObj.find("[name*=end_journal_date]").val("");
               weekUpDelFormObj.find("[name*=end_journal_hour]").val("");
               weekUpDelFormObj.find("[name*=end_journal_minute]").val("");
               return;
            }
            if (check_date1==""&&check_minute1 !=""){
               alert("일을 먼저 선택해주세요22");
               weekUpDelFormObj.find("[name*=end_journal_year]").val("");
               weekUpDelFormObj.find("[name*=end_journal_month]").val("");
               weekUpDelFormObj.find("[name*=end_journal_date]").val("");
               weekUpDelFormObj.find("[name*=end_journal_hour]").val("");
               weekUpDelFormObj.find("[name*=end_journal_minute]").val("");
               return;
            }
            //---------------------------------------------------------------------
            //시간을 먼저 설정하도록 함
            //---------------------------------------------------------------------
            if (check_hour1==""&&check_minute1 !=""){
               alert("시간을 먼저 선택해주세요11");
               weekUpDelFormObj.find("[name*=end_journal_year]").val("");
               weekUpDelFormObj.find("[name*=end_journal_month]").val("");
               weekUpDelFormObj.find("[name*=end_journal_date]").val("");
               weekUpDelFormObj.find("[name*=end_journal_hour]").val("");
               weekUpDelFormObj.find("[name*=end_journal_minute]").val("");
               return;
            }
            //---------------------------------------------------------------------
            //업무시간 비교하기
            //---------------------------------------------------------------------
            if( (check_year!=null && check_year.length>0) 
                  && (check_month!=null && check_month.length>0)
                  &&(check_date!=null && check_date.length>0) 
                  && (check_year1!=null && check_year1.length>0) 
                  && (check_month1!=null && check_month1.length>0)
                  &&(check_date1!=null && check_date1.length>0) ){

               var max_date = weekUpDelFormObj.find("[name*=end_journal_year]").val(  )
                           +weekUpDelFormObj.find("[name*=end_journal_month]").val(  )
                           +weekUpDelFormObj.find("[name*=end_journal_date]").val(  );
               var min_date = weekUpDelFormObj.find("[name*=begin_journal_year]").val(  )      
                           +weekUpDelFormObj.find("[name*=begin_journal_month]").val(  )
                           +weekUpDelFormObj.find("[name*=begin_journal_date]").val(  );
               if( parseInt(max_date,10) < parseInt(min_date,10) ) {
                  alert("[최소 년월]이 [최대 년월] 보다 큽니다. 재 선택 바람!11");
                  weekUpDelFormObj.find("[name*=begin_journal_]").val("");
                  weekUpDelFormObj.find("[name*=end_journal_]").val("");
                  return;
               }
            }
            if(   (check_hour!=null && check_hour.length>0) 
               && (check_minute!=null && check_minute.length>0)
                &&(check_hour1!=null && check_hour1.length>0) 
                && (check_minute1!=null && check_minute1.length>0)   ){

                var max_date1 = weekUpDelFormObj.find("[name*=end_journal_hour]").val(  )
                            +weekUpDelFormObj.find("[name*=end_journal_minute]").val(  );
                var min_date1 = weekUpDelFormObj.find("[name*=begin_journal_hour]").val(  )      
                            +weekUpDelFormObj.find("[name*=begin_journal_minute]").val(  );
                if( parseInt(max_date1,10) < parseInt(min_date1,10) ) {
                   alert("[최소 time]이 [최대 time] 보다 큽니다. 재 선택 바람!22");
                   weekUpDelFormObj.find("[name*=begin_journal_]").val("");
                   weekUpDelFormObj.find("[name*=end_journal_]").val("");
                   return;
                 }

            } */
           /* //------------------------------------------------------------------------
            //선택한 생일의 년,월,일 중에 하나라도 비어있으면 함수 중단
            //------------------------------------------------------------------------
            if( check_year1=="" || check_month1=="" || check_date1=="" ){return;}

            //------------------------------------------------------------------------
            //is_valid_date 함수 호출하여 선택한 생일의 년,월,일의 실존 여부를 판단하여
            //존재하지 않는 생일이면 경고하기.
            //------------------------------------------------------------------------
            if (  check_year1!= null && check_month1!=null && check_date1!=null  ){

               if( is_valid_date(check_year1, check_month1, check_date1)==false){
                      alert("날짜가 존재하지 않습니다");
                      weekUpDelFormObj.find("[name*=end_journal_year]").val("");
                      weekUpDelFormObj.find("[name*=end_journal_month]").val("");
                      weekUpDelFormObj.find("[name*=end_journal_date]").val("");
                      return;
                   }
               else{
                  var select_day = new Date( check_year1, check_month1-1, check_date1 );
                      var month = select_day.getMonth()+1;
                      var date = select_day.getDate();
                   }
            }
         }*/

   		      //---------------------------------------------
   		      //종료시간 존재여부
   		      //---------------------------------------------
   		      if( check_year1 =="" || check_month1 =="" || check_date1 ==""){ return;}
   		         if (is_valid_date(check_year1,check_month1,check_date1)==false){
   		            alert("존재하지 않는 날짜입니다.");
		            week_journal_FormObj.find("[name$='weekList["+i+"].end_journal_year']").val("");
		            week_journal_FormObj.find("[name$='weekList["+i+"].end_journal_month']").val("");
		            week_journal_FormObj.find("[name$='weekList["+i+"].end_journal_date']").val("");
		            week_journal_FormObj.find("[name$='weekList["+i+"].end_journal_hour']").val("");
		            week_journal_FormObj.find("[name$='weekList["+i+"].end_journal_minute']").val("");
   		            return;
   		         }

   		         }
   		   }
   		   
   //----------------------------------------------------------------------------------------------
    //수정화면1
     function checkweekUpDelForm( upDel ){
        var weekUpDelFormObj = $("[name=weekContentForm]");
     
        try{
           //**********************************************
           // 수정 버튼을 클릭한 경우
           //**********************************************
           if(upDel=="up"){
            weekUpDelFormObj.find("[name=upDel]").val( 'up' );

            for ( var i=0 ; i<$(".xxx").length ; i++ ){
              //업무분야 유효성 검사
              var week_business_field = weekUpDelFormObj.find("[name=week_business_field]").val();
     
              if (week_business_field==""){
                 alert("업무분야를 입력해주세요.");
                 return;
              }
              
              //업무 내용 유효성 검사
              var week_business_content = weekUpDelFormObj.find("[name=week_business_content]").val( ); 
              
              if (week_business_content==""){
                 alert("영업내용을 입력해주세요.");
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

              if (confirm("정말 수정하시겠습니까?")==false ){
                 return;
              }
             
           }

           //**********************************************
           // 삭제 버튼을 클릭한 경우
           //**********************************************
           else{
              weekUpDelFormObj.find("[name=upDel]").val( 'del' );
              if(confirm("정말 삭제할까요")==false ){ 
                 return; 
              }
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
           // 현재 화면에서 페이지 이동 없이 서버쪽 "/pro/businessUpProc.do"  을 호출하여
           //       연락처 입력 후 입력 행의 개수를 받아 처리한다.
           //---------------------------------------
           $.ajax({
              // ------------------
              // 호출할 서버쪽 URL 주소 설정
              // ------------------
              url : "/pro/week_business_log_upDel_proc.do"
              // ------------------
              // 전송 방법 설정
              // ------------------
              ,type : "post"
              // ------------------
              // 서버에 보낼 파라미터명과 파라미터값을 설정
              // ------------------
              ,data :  $("form").filter("[name=weekContentForm]").serialize()
              // ------------------
              // 서버의 응답을 성공적으로 받았을 경우 실행할 익명함수 설정.
              // 익명함수의 매개변수 contactRegCnt 에는 연락처 입력 적용행의 개수가 들어온다.
              // ------------------
              
              ,success : function( weekUpDelCnt ){
                 // 연락처 수정 적용 행의 개수가 1개 이상이면
                 // 즉 수정이 성공했으면
                 if( weekUpDelCnt>0 ){
                      // alert 상자 띄우고 재 등록할지 물어본다
                      alert( "주간 업무 보고서 수정 또는 삭제 성공!" );
                      location.replace("/pro/weekList.do");
                   }
                   else if(weekUpDelCnt==-1){
                      alert( "주간 업무 보고서 수정 또는 삭제 실패! 관리자에게 문의 바람!" );
                      location.replace("/pro/weekList.do");
                   }
                   else if(weekUpDelCnt==-2){
                      if(confirm( "이미 수정된 내역이 존재합니다. 다시 불러오시겠습니까?" )==true) {
                             document.weekContentForm3.submit();
                        }
                       else {
                             location.replace("/pro/weekList.do");
                       }
                   }
              }
              //---------------------------------
              // 서버의 응답을 못 받았을 경우 실행할 익명함수 설정.
              //---------------------------------
              
           });
           
        }catch(e){
           alert( "checkweekUpDelForm( ) 함수 예외 발생!" );
        }
     }


    //수정화면2
     function checkweekUpDelForm2( upDel ){
        var weekUpDelFormObj2 = $("[name=weekContentForm2]");
     
        try{
           //**********************************************
           // 수정 버튼을 클릭한 경우
           //**********************************************
           if(upDel=="up"){
            weekUpDelFormObj2.find("[name=upDel]").val( 'up' );

          //지시사항 유효성 체크
           var instruction = $("[name=instruction]").val();
           if (new RegExp(/^[가-힣a-zA-Z0-9][가-힣a-zA-Z0-9 ]{0,50}$/).test(instruction)==false){
              alert("첫 글자 공백 불가,다시 작성해주세요");
              weekUpDelFormObj2.$("[name=instruction]").val("");
              return;
           }
           
            if (confirm("정말 수정하시겠습니까?")==false ){
                   return;
              }
            
           }

           //**********************************************
           // 삭제 버튼을 클릭한 경우
           //**********************************************
           else{
              weekUpDelFormObj2.find("[name=upDel]").val( 'del' );
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
              url : "/pro/week_business_log_upDel_proc.do"
              // ------------------
              // 전송 방법 설정
              // ------------------
              ,type : "post"
              // ------------------
              // 서버에 보낼 파라미터명과 파라미터값을 설정
              // ------------------
              ,data :  $("form").filter("[name=weekContentForm2]").serialize()
              // ------------------
              // 서버의 응답을 성공적으로 받았을 경우 실행할 익명함수 설정.
              // 익명함수의 매개변수 contactRegCnt 에는 연락처 입력 적용행의 개수가 들어온다.
              // ------------------
              
              ,success : function( weekUpDelCnt ){
                 // 연락처 수정 적용 행의 개수가 1개 이상이면
                 // 즉 수정이 성공했으면
                 if( weekUpDelCnt>0 ){
                    // alert 상자 띄우고 재 등록할지 물어본다
                    alert( "주간 업무 보고서 수정 또는 삭제 성공!" );
                    location.replace("/pro/weekList.do");
                 }
                 else if(weekUpDelCnt==-1){
                    alert( "주간 업무 보고서 수정 또는 삭제 실패! 관리자에게 문의 바람!" );
                    location.replace("/pro/weekList.do");
                 }
                 else if(weekUpDelCnt==-2){
                    if(confirm( "이미 수정된 내역이 존재합니다. 다시 불러오시겠습니까?" )==true) {
                           document.weekContentForm3.submit();
                      }
                     else {
                           location.replace("/pro/weekList.do");
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
           alert( "checkweekUpDelForm2( ) 함수 예외 발생!" );
        }
     }

   </script>
           
              
            
<!----------------------------------------------------------------------------------------------------------------------------------------------->



   <BODY>
      

   
  
   <form name="weekContentForm" method="post" enctype="multipart/form-data" action="/pro/week_business_log_upDel_proc.do">
      
      <br><br><center> <h3 align="top"><b>[주간 업무일지 수정화면]</b></h3><BR>
         <TABLE class="tbcss1" >
      <TR>
         <th align="left" class="real_table">1. 주간 업무일지 보고일</TH>
         <TD align="left" class="real_td">
            &emsp;<select name="journal_year"  onChange="checkApprovalDate2()"> 
                 <option value=""></option>
                 <script>
                     for (var i=1990; i<=new Date().getFullYear()+1 ; i++ ){   
                        document.write("<option value="+i+">"+i);
                     }
                 </script>
               </select>&nbsp;&nbsp;년
               <select name="journal_month" onChange="checkApprovalDate2()">
               <option value=""></option>
                 <script>
                     for (var i=1; i<=12 ; i++ ){   
                        var m = (i<10)?"0"+i:i;
                        document.write("<option value="+m+">"+m);
                     }
                 </script>
               </select>&nbsp;&nbsp;월
               <select name="journal_date" onChange="checkApprovalDate2()">
               <option value=""></option>
                 <script>
                     for (var i=1; i<=31 ; i++ ){   
                        var m = (i<10)?"0"+i:i;
                        document.write("<option value="+m+">"+m);
                     }
                   </script>
               </select>&nbsp;&nbsp;일
               <input type="text"  name="to_today_day" style="width:25px;" readonly> 
               &nbsp;&nbsp;<span style="cursor:pointer" class="to_today">[오늘로]</span>&nbsp;
         </TD>
      </TR>
      <TR>
         <th align="left" class="real_table">2. 주간 업무일지 내용</TH>
         <TD align="left" class="real_td">
            <TABLE class="tbcss1" >
            <TR>
            <th align="center" class="th_color" width=50>작성자</th>
               <th align="center" class="th_color" width=80>업무분야</th>
               <th align="center" class="th_color" width=160>업무내용</th>
               <th align="center" class="th_color" width=400>시간</th>
               <th align="center" class="th_color" width=60>완료여부</th>
            </TR>
            <TR class=xxx>
      <TD class="td_color" align="center">${sessionScope.emp_name}</TD>
               <TD class="td_color" align="center">
                   <select name="weekList[0].week_list" id="week_business_field">
                     <option value=""></option>
                     <option value="1"> 행정</option>
                     <option value="2"> 사무</option>
                     <option value="3"> 구매</option>
                     <option value="4"> 접대</option>
                     <option value="5"> 회계</option>
                     <option value="6"> 기타</option>
                   </select>
                </TD>
               <TD class="td_color" align="center">
                  <input type="text" name="weekList[0].week_content" size="15" value="">
               </TD>
                 <TD class="td_color" align="left">시작일:
                  <select name="weekList[0].begin_journal_year" onChange="checkApprovalDate()">
                     <option value=""></option>
                        <script>
                           for (var i=1990; i<=new Date().getFullYear()+2 ; i++ ){   
                              document.write("<option value="+i+">"+i);
                           }
                        </script> 
                  </select>&nbsp;&nbsp;년&nbsp;
                  <select name="weekList[0].begin_journal_month" onChange="checkApprovalDate()">
                     <option value=""></option>
                        <script>
                           for (var i=1; i<=12 ; i++ ){   
                              var m = (i<10)?"0"+i:i;
                              document.write("<option value="+m+">"+m);
                           }
                        </script>
                  </select>&nbsp;&nbsp;월&nbsp;
                  <select name="weekList[0].begin_journal_date" onChange="checkApprovalDate()">
                     <option value=""></option>
                        <script>
                           for (var i=1; i<=31 ; i++ ){   
                              var m = (i<10)?"0"+i:i;
                              document.write("<option value="+m+">"+m);
                           }
                        </script>
                  </select>&nbsp;&nbsp;일&nbsp;
                  <select name="weekList[0].begin_journal_hour" onChange="checkApprovalDate()">
                     <option value=""></option>
                        <script>
                        for (var i=1; i<24 ; i++ ){   
                           var m = (i<10)?"0"+i:i;
                           document.write("<option value="+m+">"+m);
                        }
                        </script>
                  </select>&nbsp;&nbsp;시&nbsp;
                  <select name="weekList[0].begin_journal_minute" onChange="checkApprovalDate()">
                     <option value=""></option>
                        <script>
                           for (var i=0; i<=59 ; i++ ){   
                              var m = (i<10)?"0"+i:i;
                              document.write("<option value="+m+">"+m);
                           }
                        </script>
                  </select>&nbsp;&nbsp;분&nbsp;&nbsp;
                     <div style="height:5px"></div>
                  종료일:
                  <select name="weekList[0].end_journal_year" onChange="checkApprovalDate1()">
                     <option value=""></option>
                        <script>
                           for (var i=1990; i<=new Date().getFullYear()+1 ; i++ ){   
                              document.write("<option value="+i+">"+i);
                           }
                        </script> 
                  </select>&nbsp;&nbsp;년&nbsp;
                  <select name="weekList[0].end_journal_month" onChange="checkApprovalDate1()">
                     <option value=""></option>
                        <script>
                           for (var i=1; i<=12 ; i++ ){   
                              var m = (i<10)?"0"+i:i;
                              document.write("<option value="+m+">"+m);
                           }
                        </script>
                  </select>&nbsp;&nbsp;월&nbsp;
                  <select name="weekList[0].end_journal_date" onChange="checkApprovalDate1()">
                     <option value=""></option>
                        <script>
                           for (var i=1; i<=31 ; i++ ){   
                              var m = (i<10)?"0"+i:i;
                              document.write("<option value="+m+">"+m);
                           }
                         </script>
                  </select>&nbsp;&nbsp;일&nbsp;
                  <select name="weekList[0].end_journal_hour" onChange="checkApprovalDate1()">
                     <option value=""></option>
                        <script>
                           for (var i=1; i<24 ; i++ ){   
                              var m = (i<10)?"0"+i:i;
                              document.write("<option value="+m+">"+m);
                           }
                        </script>
                  </select>&nbsp;&nbsp;시&nbsp;
                  <select name="weekList[0].end_journal_minute" onChange="checkApprovalDate1()">
                     <option value="" ></option>
                        <script>
                        for (var i=0; i<=59 ; i++ ){   
                           var m = (i<10)?"0"+i:i;
                           document.write("<option value="+m+">"+m);
                        }
                        </script>
                  </select>&nbsp;&nbsp;분&nbsp;&nbsp;
               </TD>
             <TD class="td_color" align="center">
                   <input type ="checkbox" name="weekList[0].completion" value="1">완료
               </TD>
            </TR>
            </TABLE>
                  <div style="height:10px"></div> 
                     &emsp;  
                  <span style="cursor:pointer" id="add" onclick="addTR( 'xxx' ,'1' );">[행추가]</span>
                  <span style="cursor:pointer" onclick="delLastTR( 'xxx' );" >[행삭제]</span>&emsp;
                  <span name="" style="cursor:pointer" class="to_today2" >[이번달로]</span>
                   <br>
                  <input type="hidden" name="upDel" >
                  <input type="hidden" name="report_no" value="${weekDTO.report_no}">
                  <input type="hidden" name="revise_cnt" value="${weeklist[0].revise_cnt}">
         </TD>
      </TR>
      <TR>
         <th align="left" class="real_table">3.지시자</TH>
         <Td align="left" class="real_td">&emsp;${weeklist[0].orderer}</Td>
         </TD>
      </TR>
      <TR>
         <th align="left" class="real_table">4.지시사항</TH>
        <TD align="left" class="real_td"> &emsp;${weeklist[0].week_business_remarks}</TD>
      </TR>
      </TABLE>
      
      <div style="height:5px"></div>
      <br>
      <TABLE>
      <TR>
         <TD>
            <span style="width:100px;" onClick="checkweekUpDelForm( 'up' );" class="btn btn1">수정하기</span>&nbsp;&nbsp;
         </TD>
         <TD>
            <span  style="width:100px;" onClick="checkweekUpDelForm( 'del' );" class="btn btn1">삭제하기</span>&nbsp;&nbsp;
         </TD>
         <TD>
               <span style="width:100px;"onclick="location.replace('/pro/weekList.do')" class="btn btn1">닫기</span>&nbsp;&nbsp;
          </TD>
      </TR>
      </TABLE>
   </center>
   </form>

   <!-------------------------------------------------------------------------------------------------------------------------->
   <!-- 수정화면2  -->
   <!-------------------------------------------------------------------------------------------------------------------------->
    <form name="weekContentForm2" method="post" enctype="multipart/form-data" action="/pro/week_business_log_upDel_proc.do">
      
      <br><br><center> <h3 align="top"><b>[주간 업무일지 수정화면]</b></h3><BR>
<TABLE class="tbcss1" >
<TR>
   <th align="left" class="real_table">1. 주간 업무일지 보고일</th>
   <TD align="left" class="real_td">
      &emsp;<select name="journal_year"  onChange="checkApprovalDate2()"> 
                  <option value=""></option>
                  <script>
                        for (var i=1990; i<=new Date().getFullYear()+1 ; i++ ){   
                           document.write("<option value="+i+">"+i);
                        }
                  </script>
               </select>&nbsp;&nbsp;년
               <select name="journal_month" onChange="checkApprovalDate2()">
               <option value=""></option>
                  <script>
                        for (var i=1; i<=12 ; i++ ){   
                           var m = (i<10)?"0"+i:i;
                            document.write("<option value="+m+">"+m);
                        }
                  </script>
               </select>&nbsp;&nbsp;월
               <select name="journal_date" onChange="checkApprovalDate2()">
               <option value=""></option>
                  <script>
                        for (var i=1; i<=31 ; i++ ){   
                           var m = (i<10)?"0"+i:i;
                            document.write("<option value="+m+">"+m);
                        }
                     </script>
               </select>&nbsp;&nbsp;일
               <input type="text"  name="to_today_day" style="width:25px;" readonly> 
               &nbsp;&nbsp;<span style="cursor:pointer" class="to_today3">[오늘로]</span>&nbsp;
   </TD>
</TR>
<TR>
   <th align="left" class="real_table">2. 주간 업무일지 내용</th>
   <TD align="left" class="real_td">
   
      <table class="tbcss1">
      <TR>
        <th align="center" class="th_color" width=50>작성자</th>
          <th align="center" class="th_color" width=80>업무분야</th>
          <th align="center" class="th_color" width=160>업무내용</th>
          <th align="center" class="th_color"  width=400>시간</th>
          <th align="center" class="th_color" width=60>완료여부</th>
      </TR>
      <c:forEach var="list" items="${contentlist}" varStatus="Status">
      <TR class=xxx2>
         <TD class="td_color" align="center">${list.writer_name}</TD>
         <TD class="td_color"align="center"  id="week_business_field">
            <c:if test="${contentlist[Status.index].week_business_field ==1}"> 
            행정
         </c:if>
         <c:if test="${contentlist[Status.index].week_business_field ==2}"> 
             사무
         </c:if>
         <c:if test="${contentlist[Status.index].week_business_field ==3}"> 
            구매
         </c:if>
         <c:if test="${contentlist[Status.index].week_business_field ==4}"> 
            접대
         </c:if>
         <c:if test="${contentlist[Status.index].week_business_field ==5}"> 
            회계
         </c:if>
         <c:if test="${contentlist[Status.index].week_business_field ==6}">
            기타
         </c:if>
         </TD>

      <TD align="center" class="td_color">${contentlist[Status.index].week_business_content}</TD>
      <td align="center" class="td_color"> ${contentlist[Status.index].begin_journal_year}.&nbsp;${contentlist[Status.index].begin_journal_month}.&nbsp;${contentlist[Status.index].begin_journal_date}.
             ${contentlist[Status.index].begin_journal_hour}:&nbsp;${contentlist[Status.index].begin_journal_minute} ~
             ${contentlist[Status.index].end_journal_year}.&nbsp;${contentlist[Status.index].end_journal_month}.&nbsp;${contentlist[Status.index].end_journal_date}.
             ${contentlist[Status.index].end_journal_hour}:&nbsp;${contentlist[Status.index].end_journal_minute}</td>
         <TD align="center" class="td_color">
            <c:if test="${list.completion==1}">
                <input type ="checkbox" name="weekList[0].completion" value="1" checked="checked">완료
            </c:if>
            <c:if test="${list.completion!=1}">
                <input type ="checkbox" name="weekList[0].completion" value="1">완료
            </c:if>
                <input type ="hidden" name="weekList[0].c_no" value="${list.c_no}">
         </TD>
      </TR>
      </c:forEach>
   </TD>
</TR>
</TABLE>
   <TR>
      <th align="left" class="real_table">3.지시사항</th>
      <Td colspan=4 align="left" class="real_td">&emsp;<textarea name="week_business_remarks" cols=100 rows=3  value=""></textarea></Td>
   </TR>
   <div style="height:5px"></div>
   <br>
   </TABLE> <br>
    <br> <br> <br>