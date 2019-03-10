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
      
      if( parseInt(${sessionScope.form_choice},10) ==1  ){ //내가 수정할때
         $("[name=dailyContentForm3]").hide();
      }
      else if( parseInt(${sessionScope.form_choice},10) ==2 ){ // 상사가 수정할때 
         $("[name=dailyContentForm2]").hide();
      }
      
    //---------------------------------------------------------------------
    // (form 2) name=dailyContentForm 을 가진 form 태그를 관리하는 JQuery 객체 메위주 저장하기
    //---------------------------------------------------------------------
      
      var businessUpDelFormObj2 = $("[name=dailyContentForm2]");
    
      businessUpDelFormObj2.find("[name=daily_business_field]").val("${dailylist.daily_business_field}");
      
      businessUpDelFormObj2.find("[name=daily_business_content]").val("${dailylist.daily_business_content}");
      
      businessUpDelFormObj2.find("[name=begin_daily_business_year]").val("${dailylist.begin_daily_business_year}");
      
      businessUpDelFormObj2.find("[name=begin_daily_business_month]").val("${dailylist.begin_daily_business_month}");
      
      businessUpDelFormObj2.find("[name=begin_daily_business_date]").val("${dailylist.begin_daily_business_date}");
      
      businessUpDelFormObj2.find("[name=to_today_day]").val("${dailylist.begin_daily_business_day}");
      
      businessUpDelFormObj2.find("[name=begin_daily_business_hour]").val("${dailylist.begin_daily_business_hour}");
      
      businessUpDelFormObj2.find("[name=begin_daily_business_minute]").val("${dailylist.begin_daily_business_minute}");
      
      businessUpDelFormObj2.find("[name=end_daily_business_year]").val("${dailylist.end_daily_business_year}");
      
      businessUpDelFormObj2.find("[name=end_daily_business_month]").val("${dailylist.end_daily_business_month}");
      
      businessUpDelFormObj2.find("[name=end_daily_business_date]").val("${dailylist.end_daily_business_date}");
      
      businessUpDelFormObj2.find("[name=to_today_day1]").val("${dailylist.end_daily_business_day}");
      
      businessUpDelFormObj2.find("[name=end_daily_business_hour]").val("${dailylist.end_daily_business_hour}");
      
      businessUpDelFormObj2.find("[name=end_daily_business_minute]").val("${dailylist.end_daily_business_minute}");
      
      <c:if test="${dailylist.is_daily_business_finish!=0}">
            businessUpDelFormObj2.find("[name=is_daily_business_finish]").prop("checked",true);
      </c:if>     
      
      $("[name=dailyContentForm2]").find("[name=selectPageNo]").val( "${param.selectPageNo}");
   


   
   
   //mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
   //수정화면3 태그를 모두 실행한 후 실행할 자스 코드 설정 (수정화면용)
    //mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm

    //---------------------------------------------------------------------
    // name=dailyContentForm3 을 가진 form 태그를 관리하는 JQuery 객체 메위주 저장하기
    //---------------------------------------------------------------------


      var dailyUpDelFormObj3 = $("[name=dailyContentForm3]");
   
      
      <c:if test="${dailylist.is_daily_business_finish!=0}">
            dailyUpDelFormObj3.find("[name=is_daily_business_finish]").prop("checked",true);
      </c:if>

      $("[name=dailyContentForm3]").find("[name=selectPageNo]").val( "${param.selectPageNo}");
      
   //mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
    // [오늘로] 글씨를 클릭하면 실행할 구문 설정 (수정화면2용)
    //mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
       
       var dailyUpDelFormObj2 = $("[name=dailyContentForm2]");
   
          dailyUpDelFormObj2.find(".to_today").click(function(){
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
          var hour = today.getHours();
          var minute = today.getMinutes();
          if(month<10){month="0"+month};
          if(day<10){day="0"+day};
          if(hour<10){hour="0"+hour};
          if(minute<10){minute="0"+minute};
          // 현재 날짜의 월을 name=min_reg_year 을 가진 입력양식에 넣어주기
          dailyUpDelFormObj2.find("[name=begin_daily_business_year]").val(year);
          // 현재 날짜의 월을 name=min_reg_month 을 가진 입력양식에 넣어주기
          dailyUpDelFormObj2.find("[name=begin_daily_business_month]").val(month);
          dailyUpDelFormObj2.find("[name=begin_daily_business_date]").val(date);
          dailyUpDelFormObj2.find("[name=to_today_day]").val(day);
          dailyUpDelFormObj2.find("[name=begin_daily_business_hour]").val(hour);
          dailyUpDelFormObj2.find("[name=begin_daily_business_minute]").val(minute);
       });
   
   
          dailyUpDelFormObj2.find(".to_today1").click(function(){
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
          var hour = today.getHours();
          var minute = today.getMinutes();
          if(month<10){month="0"+month};
          if(day<10){day="0"+day};
          if(hour<10){hour="0"+hour};
          if(minute<10){minute="0"+minute};
          dailyUpDelFormObj2.find("[name=end_daily_business_year]").val(year);
          // 현재 날짜의 월을 name=min_reg_month 을 가진 입력양식에 넣어주기
          dailyUpDelFormObj2.find("[name=end_daily_business_month]").val(month);
          dailyUpDelFormObj2.find("[name=end_daily_business_date]").val(date);
          dailyUpDelFormObj2.find("[name=to_today_day1]").val(day);
          dailyUpDelFormObj2.find("[name=end_daily_business_hour]").val(hour);
          dailyUpDelFormObj2.find("[name=end_daily_business_minute]").val(minute);
       });
       
        //mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
        // 수정화면2 시작일 비움
        //mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
             dailyUpDelFormObj2.find(".empty3").click(function(){
                dailyUpDelFormObj2.find("[name^=begin_daily_business_],[name=to_today_day]").val('');
             });
        
           
        //mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
          // 수정화면2 종료일 비움
        //mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
           dailyUpDelFormObj2.find(".empty4").click(function(){
              dailyUpDelFormObj2.find("[name^=end_daily_business_],[name=to_today_day1]").val('');
             });
        

        //mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
          // 동적 셀렉트
        //mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
         $("[name^=begin_daily_business]").change(function(){
            var year =  $("[name=begin_daily_business_year]").val();
            var month =  $("[name=begin_daily_business_month]").val();
            var date =  $("[name=begin_daily_business_date]").val();
           if(year!="" && month!="" && date=="" ){
             var lastDay = (new Date( year, month,0)).getDate();
             var arr = [];
             arr.push(   "<option></option>"  );
             for(var i=1; i<=lastDay ; i++){
               arr.push( "<option value="+i+">"+i+"</option>" )
             }
             $("[name=begin_daily_business_date]").html(  arr.join("") );
           }

           });
           

         $("[name^=end_daily_business]").change(function(){
            var year =  $("[name=end_daily_business_year]").val();
            var month =  $("[name=end_daily_business_month]").val();
            var date =  $("[name=end_daily_business_date]").val();
           if(year!="" && month!="" && date=="" ){
             var lastDay = (new Date( year, month,0)).getDate();
             var arr = [];
             arr.push(   "<option></option>"  );
             for(var i=1; i<=lastDay ; i++){
               arr.push( "<option value="+i+">"+i+"</option>" )
             }
             $("[name=end_daily_business_date]").html(  arr.join("") );
           }
          });

 
     }); 
     //document
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

     

     //------------------------------------------------------------------------
      // 수정화면2 업무시작일 유효성 체크
      //------------------------------------------------------------------------
      function checkApprovalDate2(){

         var dailyUpDelFormObj2 = $("[name=dailyContentForm2]");
       
         //------------------------------------------------------------------------
         //선택한 생일의 년,월,일을 변수에 저장
         //------------------------------------------------------------------------
         var check_year = dailyUpDelFormObj2.find("[name=begin_daily_business_year]").val( ); 
         var check_month = dailyUpDelFormObj2.find("[name=begin_daily_business_month]").val( );
         var check_date = dailyUpDelFormObj2.find("[name=begin_daily_business_date]").val( );
         var check_hour = dailyUpDelFormObj2.find("[name=begin_daily_business_hour]").val( );
         var check_minute = dailyUpDelFormObj2.find("[name=begin_daily_business_minute]").val( );
       
         //------------------------------------------------------------------------
         var check_year1 = dailyUpDelFormObj2.find("[name=end_daily_business_year]").val( ); 
         var check_month1 = dailyUpDelFormObj2.find("[name=end_daily_business_month]").val( );
         var check_date1 = dailyUpDelFormObj2.find("[name=end_daily_business_date]").val( );
         var check_hour1 = dailyUpDelFormObj2.find("[name=end_daily_business_hour]").val( );
         var check_minute1 = dailyUpDelFormObj2.find("[name=end_daily_business_minute]").val( );
   
   
          //---------------------------------------------------------------------
          //년도 먼저 설정하도록 함
          //---------------------------------------------------------------------
               if (check_year==""&&check_month !="")
               {
                  alert("년도를 먼저 선택해주세요");
                  dailyUpDelFormObj2.find("[name=begin_daily_business_year]").val("");
                  dailyUpDelFormObj2.find("[name=begin_daily_business_month]").val("");
                  dailyUpDelFormObj2.find("[name=begin_daily_business_date]").val("");
                  dailyUpDelFormObj2.find("[name=to_today_day]").val("");
                  dailyUpDelFormObj2.find("[name=begin_daily_business_hour]").val("");
                  dailyUpDelFormObj2.find("[name=begin_daily_business_minute]").val("");
                  return;
               }
               if (check_year==""&&check_date !="")
               {
                  alert("년도를 먼저 선택해주세요");
                  dailyUpDelFormObj2.find("[name=begin_daily_business_year]").val("");
                  dailyUpDelFormObj2.find("[name=begin_daily_business_month]").val("");
                  dailyUpDelFormObj2.find("[name=begin_daily_business_date]").val("");
                  dailyUpDelFormObj2.find("[name=to_today_day]").val("");
                  dailyUpDelFormObj2.find("[name=begin_daily_business_hour]").val("");
                  dailyUpDelFormObj2.find("[name=begin_daily_business_minute]").val("");
                  return;
               }
               if (check_year==""&&check_hour !="")
               {
                  alert("년도를 먼저 선택해주세요");
                  dailyUpDelFormObj2.find("[name=begin_daily_business_year]").val("");
                  dailyUpDelFormObj2.find("[name=begin_daily_business_month]").val("");
                  dailyUpDelFormObj2.find("[name=begin_daily_business_date]").val("");
                  dailyUpDelFormObj2.find("[name=to_today_day]").val("");
                  dailyUpDelFormObj2.find("[name=begin_daily_business_hour]").val("");
                  dailyUpDelFormObj2.find("[name=begin_daily_business_minute]").val("");
              return;
               }
               if (check_year==""&&check_minute !="")
               {
                  alert("년도를 먼저 선택해주세요");
                  dailyUpDelFormObj2.find("[name=begin_daily_business_year]").val("");
                  dailyUpDelFormObj2.find("[name=begin_daily_business_month]").val("");
                  dailyUpDelFormObj2.find("[name=begin_daily_business_date]").val("");
                  dailyUpDelFormObj2.find("[name=to_today_day]").val("");
                  dailyUpDelFormObj2.find("[name=begin_daily_business_hour]").val("");
                  dailyUpDelFormObj2.find("[name=begin_daily_business_minute]").val("");
                  return;
               }
          //---------------------------------------------------------------------
          //월 먼저 설정하도록 함
          //---------------------------------------------------------------------
               if (check_month==""&&check_date !="")
               {
                  alert("월을 먼저 선택해주세요");
                  dailyUpDelFormObj2.find("[name=begin_daily_business_year]").val("");
                  dailyUpDelFormObj2.find("[name=begin_daily_business_month]").val("");
                  dailyUpDelFormObj2.find("[name=begin_daily_business_date]").val("");
                  dailyUpDelFormObj2.find("[name=to_today_day]").val("");
                  dailyUpDelFormObj2.find("[name=begin_daily_business_hour]").val("");
                  dailyUpDelFormObj2.find("[name=begin_daily_business_minute]").val("");
                  return;
               }
               if (check_month==""&&check_hour !="")
               {
                  alert("월을 먼저 선택해주세요");
                  dailyUpDelFormObj2.find("[name=begin_daily_business_year]").val("");
                  dailyUpDelFormObj2.find("[name=begin_daily_business_month]").val("");
                  dailyUpDelFormObj2.find("[name=begin_daily_business_date]").val("");
                  dailyUpDelFormObj2.find("[name=to_today_day]").val("");
                  dailyUpDelFormObj2.find("[name=begin_daily_business_hour]").val("");
                  dailyUpDelFormObj2.find("[name=begin_daily_business_minute]").val("");
                  return;
               }
               if (check_month==""&&check_minute !="")
               {
                  alert("월을 먼저 선택해주세요");
                  dailyUpDelFormObj2.find("[name=begin_daily_business_year]").val("");
                  dailyUpDelFormObj2.find("[name=begin_daily_business_month]").val("");
                  dailyUpDelFormObj2.find("[name=begin_daily_business_date]").val("");
                  dailyUpDelFormObj2.find("[name=to_today_day]").val("");
                  dailyUpDelFormObj2.find("[name=begin_daily_business_hour]").val("");
                  dailyUpDelFormObj2.find("[name=begin_daily_business_minute]").val("");
                  return;
               }
          //---------------------------------------------------------------------
          //일 먼저 설정하도록 함
          //---------------------------------------------------------------------
               if (check_date==""&&check_hour !="")
               {
                  alert("일을 일저 선택해주세요");
                  dailyUpDelFormObj2.find("[name=begin_daily_business_year]").val("");
                  dailyUpDelFormObj2.find("[name=begin_daily_business_month]").val("");
                  dailyUpDelFormObj2.find("[name=begin_daily_business_date]").val("");
                  dailyUpDelFormObj2.find("[name=to_today_day]").val("");
                  dailyUpDelFormObj2.find("[name=begin_daily_business_hour]").val("");
                  dailyUpDelFormObj2.find("[name=begin_daily_business_minute]").val("");
                  return;
               }
               if (check_date==""&&check_minute !="")
               {
                  alert("일을 먼저 선택해주세요");
                  dailyUpDelFormObj2.find("[name=begin_daily_business_year]").val("");
                  dailyUpDelFormObj2.find("[name=begin_daily_business_month]").val("");
                  dailyUpDelFormObj2.find("[name=begin_daily_business_date]").val("");
                  dailyUpDelFormObj2.find("[name=to_today_day]").val("");
                  dailyUpDelFormObj2.find("[name=begin_daily_business_hour]").val("");
                  dailyUpDelFormObj2.find("[name=begin_daily_business_minute]").val("");
                  return;
               }
          //---------------------------------------------------------------------
          //시 먼저 설정하도록 함
          //---------------------------------------------------------------------
               if (check_hour==""&&check_minute !="")
               {
                  alert("시간을 일저 선택해주세요");
                  dailyUpDelFormObj2.find("[name=begin_daily_business_year]").val("");
                  dailyUpDelFormObj2.find("[name=begin_daily_business_month]").val("");
                  dailyUpDelFormObj2.find("[name=begin_daily_business_date]").val("");
                  dailyUpDelFormObj2.find("[name=to_today_day]").val("");
                  dailyUpDelFormObj2.find("[name=begin_daily_business_hour]").val("");
                  dailyUpDelFormObj2.find("[name=begin_daily_business_minute]").val("");
                  return;
               }


            //-------------------------
      if( (check_year!=null && check_year.length>0) 
         && (check_month!=null && check_month.length>0)
         &&(check_date!=null && check_date.length>0) 
         && (check_year1!=null && check_year1.length>0) 
         && (check_month1!=null && check_month1.length>0)
         &&(check_date1!=null && check_date1.length>0) ){

         var max_date = dailyUpDelFormObj2.find("[name=end_daily_business_year]").val(  )
                  +dailyUpDelFormObj2.find("[name=end_daily_business_month]").val(  )
                  +dailyUpDelFormObj2.find("[name=end_daily_business_date]").val(  );
         var min_date = dailyUpDelFormObj2.find("[name=begin_daily_business_year]").val(  )      
                  +dailyUpDelFormObj2.find("[name=begin_daily_business_month]").val(  )
                  +dailyUpDelFormObj2.find("[name=begin_daily_business_date]").val(  );
         if( parseInt(max_date,10) < parseInt(min_date,10) ) {
            alert("[최소 년월]이 [최대 년월] 보다 큽니다. 재 선택 바람!");
            dailyUpDelFormObj2.find("[name^=begin_daily_business_]").val("");
            dailyUpDelFormObj2.find("[name^=end_daily_business_]").val("");
            dailyUpDelFormObj2.find("[name=to_today_day]").val("");
            dailyUpDelFormObj2.find("[name=to_today_day1]").val("");
            return;
         }
      }
      
          
      if(   (check_hour!=null && check_hour.length>0) 
         && (check_minute!=null && check_minute.length>0)
         &&(check_hour1!=null && check_hour1.length>0) 
         && (check_minute1!=null && check_minute1.length>0)   ){

         var max_date1 = dailyUpDelFormObj2.find("[name=end_daily_business_hour]").val(  )
                     +dailyUpDelFormObj2.find("[name=end_daily_business_minute]").val(  );
         var min_date1 = dailyUpDelFormObj2.find("[name=begin_daily_business_hour]").val(  )      
                     +dailyUpDelFormObj2.find("[name=begin_daily_business_minute]").val(  );
         if( parseInt(max_date1,10) < parseInt(min_date1,10) ) {
            alert("[최소 time]이 [최대 time] 보다 큽니다. 재 선택 바람!");
            dailyUpDelFormObj2.find("[name^=begin_daily_business_]").val("");
            dailyUpDelFormObj2.find("[name^=end_daily_business_]").val("");
            return;
          }

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
               dailyUpDelFormObj2.find("[name=begin_daily_business_year]").val("");
               dailyUpDelFormObj2.find("[name=begin_daily_business_month]").val("");
               dailyUpDelFormObj2.find("[name=begin_daily_business_date]").val("");
               dailyUpDelFormObj2.find("[name=to_today_day]").val("");
               return;
            }
            else{
               var select_day = new Date( check_year, check_month-1, check_date );
               var month = select_day.getMonth()+1;
               var date = select_day.getDate();
               var day = getWeek( select_day.getDay() );
               dailyUpDelFormObj2.find("[name=to_today_day]").val(day);
            }
         }
       //------------------------------------------------------------------------------------
    
      }
     
//=====================================================================
      //최대 방문시간
      function checkApprovalDate22(){

         var dailyUpDelFormObj2 = $("[name=dailyContentForm2]");
       
         //------------------------------------------------------------------------
         //선택한 생일의 년,월,일을 변수에 저장
         //------------------------------------------------------------------------
         var check_year = dailyUpDelFormObj2.find("[name=begin_daily_business_year]").val( ); 
         var check_month = dailyUpDelFormObj2.find("[name=begin_daily_business_month]").val( );
         var check_date = dailyUpDelFormObj2.find("[name=begin_daily_business_date]").val( );
         var check_hour = dailyUpDelFormObj2.find("[name=begin_daily_business_hour]").val( );
         var check_minute = dailyUpDelFormObj2.find("[name=begin_daily_business_minute]").val( );
       
         //------------------------------------------------------------------------
         var check_year1 = dailyUpDelFormObj2.find("[name=end_daily_business_year]").val( ); 
         var check_month1 = dailyUpDelFormObj2.find("[name=end_daily_business_month]").val( );
         var check_date1 = dailyUpDelFormObj2.find("[name=end_daily_business_date]").val( );
         var check_hour1 = dailyUpDelFormObj2.find("[name=end_daily_business_hour]").val( );
         var check_minute1 = dailyUpDelFormObj2.find("[name=end_daily_business_minute]").val( );
   
   
          //---------------------------------------------------------------------
          //년도 먼저 설정하도록 함
          //---------------------------------------------------------------------
               if (check_year1==""&&check_month1 !="")
               {
                  alert("년도를 먼저 선택해주세요");
                  dailyUpDelFormObj2.find("[name=end_daily_business_year]").val("");
                  dailyUpDelFormObj2.find("[name=end_daily_business_month]").val("");
                  dailyUpDelFormObj2.find("[name=end_daily_business_date]").val("");
                  dailyUpDelFormObj2.find("[name=to_today_day1]").val("");
                  dailyUpDelFormObj2.find("[name=end_daily_business_hour]").val("");
                  dailyUpDelFormObj2.find("[name=end_daily_business_minute]").val("");
                  return;
               }
               if (check_year1==""&&check_date1 !="")
               {
                  alert("년도를 먼저 선택해주세요");
                  dailyUpDelFormObj2.find("[name=end_daily_business_year]").val("");
                  dailyUpDelFormObj2.find("[name=end_daily_business_month]").val("");
                  dailyUpDelFormObj2.find("[name=end_daily_business_date]").val("");
                  dailyUpDelFormObj2.find("[name=to_today_day1]").val("");
                  dailyUpDelFormObj2.find("[name=end_daily_business_hour]").val("");
                  dailyUpDelFormObj2.find("[name=end_daily_business_minute]").val("")
                  return;
               }
               if (check_year1==""&&check_hour1 !="")
               {
                  alert("년도를 먼저 선택해주세요");
                  dailyUpDelFormObj2.find("[name=end_daily_business_year]").val("");
                  dailyUpDelFormObj2.find("[name=end_daily_business_month]").val("");
                  dailyUpDelFormObj2.find("[name=end_daily_business_date]").val("");
                  dailyUpDelFormObj2.find("[name=to_today_day1]").val("");
                  dailyUpDelFormObj2.find("[name=end_daily_business_hour]").val("");
                  dailyUpDelFormObj2.find("[name=end_daily_business_minute]").val("")
                  return;
               }
               if (check_year1==""&&check_minute1 !="")
               {
                  alert("년도를 먼저 선택해주세요");
                  dailyUpDelFormObj2.find("[name=end_daily_business_year]").val("");
                  dailyUpDelFormObj2.find("[name=end_daily_business_month]").val("");
                  dailyUpDelFormObj2.find("[name=end_daily_business_date]").val("");
                  dailyUpDelFormObj2.find("[name=to_today_day1]").val("");
                  dailyUpDelFormObj2.find("[name=end_daily_business_hour]").val("");
                  dailyUpDelFormObj2.find("[name=end_daily_business_minute]").val("")
                  return;
               }
          //---------------------------------------------------------------------
          //월 먼저 설정하도록 함
          //---------------------------------------------------------------------
               if (check_month1==""&&check_date1 !="")
               {
                  alert("월을 먼저 선택해주세요");
                  dailyUpDelFormObj2.find("[name=end_daily_business_year]").val("");
                  dailyUpDelFormObj2.find("[name=end_daily_business_month]").val("");
                  dailyUpDelFormObj2.find("[name=end_daily_business_date]").val("");
                  dailyUpDelFormObj2.find("[name=to_today_day1]").val("");
                  dailyUpDelFormObj2.find("[name=end_daily_business_hour]").val("");
                  dailyUpDelFormObj2.find("[name=end_daily_business_minute]").val("")
                  return;
               }
               if (check_month1==""&&check_hour1 !="")
               {
                  alert("월을 먼저 선택해주세요");
                  dailyUpDelFormObj2.find("[name=end_daily_business_year]").val("");
                  dailyUpDelFormObj2.find("[name=end_daily_business_month]").val("");
                  dailyUpDelFormObj2.find("[name=end_daily_business_date]").val("");
                  dailyUpDelFormObj2.find("[name=to_today_day1]").val("");
                  dailyUpDelFormObj2.find("[name=end_daily_business_hour]").val("");
                  dailyUpDelFormObj2.find("[name=end_daily_business_minute]").val("")
                  return;
               }
               if (check_month1==""&&check_minute1 !="")
               {
                  alert("월을 먼저 선택해주세요");
                  dailyUpDelFormObj2.find("[name=end_daily_business_year]").val("");
                  dailyUpDelFormObj2.find("[name=end_daily_business_month]").val("");
                  dailyUpDelFormObj2.find("[name=end_daily_business_date]").val("");
                  dailyUpDelFormObj2.find("[name=to_today_day1]").val("");
                  dailyUpDelFormObj2.find("[name=end_daily_business_hour]").val("");
                  dailyUpDelFormObj2.find("[name=end_daily_business_minute]").val("")
                  return;
               }
          //---------------------------------------------------------------------
          //일을 먼저 설정하도록 함
          //---------------------------------------------------------------------
               if (check_date1==""&&check_hour1 !="")
               {
                  alert("일을 먼저 선택해주세요");
                  dailyUpDelFormObj2.find("[name=end_daily_business_year]").val("");
                  dailyUpDelFormObj2.find("[name=end_daily_business_month]").val("");
                  dailyUpDelFormObj2.find("[name=end_daily_business_date]").val("");
                  dailyUpDelFormObj2.find("[name=to_today_day1]").val("");
                  dailyUpDelFormObj2.find("[name=end_daily_business_hour]").val("");
                  dailyUpDelFormObj2.find("[name=end_daily_business_minute]").val("")
                  return;
               }
               if (check_date1==""&&check_minute1 !="")
               {
                  alert("일을 먼저 선택해주세요");
                  dailyUpDelFormObj2.find("[name=end_daily_business_year]").val("");
                  dailyUpDelFormObj2.find("[name=end_daily_business_month]").val("");
                  dailyUpDelFormObj2.find("[name=end_daily_business_date]").val("");
                  dailyUpDelFormObj2.find("[name=to_today_day1]").val("");
                  dailyUpDelFormObj2.find("[name=end_daily_business_hour]").val("");
                  dailyUpDelFormObj2.find("[name=end_daily_business_minute]").val("")
                  return;
               }
          //---------------------------------------------------------------------
          //시간을 먼저 설정하도록 함
          //---------------------------------------------------------------------
               if (check_hour1==""&&check_minute1 !="")
               {
                  alert("시간을 먼저 선택해주세요");
                  dailyUpDelFormObj2.find("[name=end_daily_business_year]").val("");
                  dailyUpDelFormObj2.find("[name=end_daily_business_month]").val("");
                  dailyUpDelFormObj2.find("[name=end_daily_business_date]").val("");
                  dailyUpDelFormObj2.find("[name=to_today_day1]").val("");
                  dailyUpDelFormObj2.find("[name=end_daily_business_hour]").val("");
                  dailyUpDelFormObj2.find("[name=end_daily_business_minute]").val("")
                  return;
               }

      if( (check_year!=null && check_year.length>0) 
         && (check_month!=null && check_month.length>0)
         &&(check_date!=null && check_date.length>0) 
         && (check_year1!=null && check_year1.length>0) 
         && (check_month1!=null && check_month1.length>0)
         &&(check_date1!=null && check_date1.length>0)   ){

         var max_date = dailyUpDelFormObj2.find("[name=end_daily_business_year]").val(  )
                     +dailyUpDelFormObj2.find("[name=end_daily_business_month]").val(  )+dailyUpDelFormObj2.find("[name=end_daily_business_date]").val(  );
         var min_date = dailyUpDelFormObj2.find("[name=begin_daily_business_year]").val(  )      
                     +dailyUpDelFormObj2.find("[name=begin_daily_business_month]").val(  )
                     +dailyUpDelFormObj2.find("[name=begin_daily_business_date]").val(  );

         if( parseInt(max_date,10) < parseInt(min_date,10) ) {
         
          
            alert("[최소 년월]이 [최대 년월] 보다 큽니다. 재 선택 바람!");
            dailyUpDelFormObj2.find("[name^=begin_daily_business_]").val("");
            dailyUpDelFormObj2.find("[name^=end_daily_business_]").val("");
                dailyUpDelFormObj2.find("[name=to_today_day]").val("");
                dailyUpDelFormObj2.find("[name=to_today_day1]").val("");
            return;
          }

      }
	 
      
      
      if(   (check_hour!=null && check_hour.length>0) 
         && (check_minute!=null && check_minute.length>0)
         &&(check_hour1!=null && check_hour1.length>0) 
         && (check_minute1!=null && check_minute1.length>0)   ){

         var max_date1 = dailyUpDelFormObj2.find("[name=end_daily_business_hour]").val(  )
                     +dailyUpDelFormObj2.find("[name=end_daily_business_minute]").val(  );
         var min_date1 = dailyUpDelFormObj2.find("[name=begin_daily_business_hour]").val(  )      
                     +dailyUpDelFormObj2.find("[name=begin_daily_business_minute]").val(  );
         if( parseInt(max_date1,10) < parseInt(min_date1,10) ) {
            alert("[최소 time]이 [최대 time] 보다 큽니다. 재 선택 바람!");
            dailyUpDelFormObj2.find("[name^=end_daily_business_]").val("");
            dailyUpDelFormObj2.find("[name^=begin_daily_business_]").val("");
            dailyUpDelFormObj2.find("[name=to_today_day]").val("");
                dailyUpDelFormObj2.find("[name=to_today_day1]").val("");
            return;
          }

       }


   
         //------------------------------------------------------------------------
         //선택한 생일의 년,월,일 중에 하나라도 비어있으면 함수 중단
         //------------------------------------------------------------------------
         if( check_year1=="" || check_month1=="" || check_date1=="" ){return;}
      

         //------------------------------------------------------------------------
         //is_valid_date 함수 호출하여 선택한 생일의 년,월,일의 실존 여부를 판단하여
         //존재하지 않는 생일이면 경고하고
         //------------------------------------------------------------------------
         if (  check_year1!= null && check_month1!=null && check_date1!=null  ){

            if( is_valid_date(check_year1, check_month1, check_date1)==false){
               alert("날짜가 존재하지 않습니다");
               dailyUpDelFormObj2.find("[name=end_daily_business_year]").val("");
               dailyUpDelFormObj2.find("[name=end_daily_business_month]").val("");
               dailyUpDelFormObj2.find("[name=end_daily_business_date]").val("");
               dailyUpDelFormObj2.find("[name=to_today_day1]").val("");
               return;
            }
            else{
               var select_day = new Date( check_year1, check_month1-1, check_date1 );
               var month = select_day.getMonth()+1;
               var date = select_day.getDate();
               var day = getWeek( select_day.getDay() );
               dailyUpDelFormObj2.find("[name=to_today_day1]").val(day);
            }
         }
      }

  

 



//----------------------------------------------------------------------------------------------


   //=====================================================================
    // 수정화면 2
   //=====================================================================
    function checkDailyUpDelForm2( upDel ){
        var dailyUpDelFormObj2 = $("[name=dailyContentForm2]");
     
        try{
           //**********************************************
           // 수정 버튼을 클릭한 경우
           //**********************************************
           if(upDel=="up"){
              dailyUpDelFormObj2.find("[name=upDel]").val( 'up' );

     
              // 업무 분야 유효성 검사
              var daily_business_field = dailyUpDelFormObj2.find("[name=daily_business_field]").val();
     
              if (daily_business_field==""){
                 alert("업무분야를 입력해주세요.");
                 return;
              }
              
              // 업무 내용 유효성 검사
              var daily_business_content = dailyUpDelFormObj2.find("[name=daily_business_content]").val( ); 
              
              if (daily_business_content==""){
                 alert("업무내용을 입력해주세요.");
                 return;
              }
              
              var begin_daily_business_hour = dailyUpDelFormObj2.find("[name=begin_daily_business_hour]").val( ); 
              var begin_daily_business_minute = dailyUpDelFormObj2.find("[name=begin_daily_business_minute]").val( ); 
              var end_daily_business_hour = dailyUpDelFormObj2.find("[name=end_daily_business_hour]").val( ); 
              var end_daily_business_minute = dailyUpDelFormObj2.find("[name=end_daily_business_minute]").val( ); 
              
              if( begin_daily_business_hour=="" || begin_daily_business_minute=="" || end_daily_business_hour=="" ||  end_daily_business_minute=="" ){
            	  alert("시간을 입력해주세요.");
            	  return;
              }
              
              if(confirm("정말 수정하시겠습니까?")==false ){ 
                  return; 
               }
              
           }

           //**********************************************
           // 삭제 버튼을 클릭한 경우
           //**********************************************
           else{
              dailyUpDelFormObj2.find("[name=upDel]").val( 'del' );
              if(confirm("정말 삭제하시겠습니까?")==false ){ 
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
              url : "/pro/daily_business_log_upDel_proc.do"
              // ------------------
              // 전송 방법 설정
              // ------------------
              ,type : "post"
              // ------------------
              // 서버에 보낼 파라미터명과 파라미터값을 설정
              // ------------------
              ,data :  $("form").filter("[name=dailyContentForm2]").serialize()
              // ------------------
              // 서버의 응답을 성공적으로 받았을 경우 실행할 익명함수 설정.
              // 익명함수의 매개변수 contactRegCnt 에는 연락처 입력 적용행의 개수가 들어온다.
              // ------------------
              
              ,success : function( dailyUpDelCnt ){
                 // 연락처 수정 적용 행의 개수가 1개 이상이면
                 // 즉 수정이 성공했으면
                 if( dailyUpDelCnt>0 ){
                    // alert 상자 띄우고 재 등록할지 물어본다
                    alert( "일일업무일지 수정 또는 삭제 성공!" );
                    location.replace("/pro/dailyList.do");
                 }
                 else if(dailyUpDelCnt==-1){
                    alert( "일일업무일지 수정 또는 삭제 실패! 관리자에게 문의 바람!" );
                    location.replace("/pro/dailyList.do");
                 }
                 else if(dailyUpDelCnt==-2) {
                    if(confirm( "이미 수정된 내역이 존재합니다. 다시 불러오시겠습니까?" )==true) {
                           document.dailyContentForm4.submit();
                      }
                     else {
                           location.replace("/pro/dailyList.do");
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
        }catch(e){
           alert( "checkDailyUpDelForm2(~) 함수 예외 발생!" );
        }
     }
     



   //=====================================================================
    //수정화면 3 
   //=====================================================================
     function checkDailyUpDelForm3( up ){
      var dailyUpDelFormObj3 = $("[name=dailyContentForm3]");
   
         try{
               //**********************************************
               // 수정 버튼을 클릭한 경우
               //**********************************************
               if(up=="up"){
               dailyUpDelFormObj3.find("[name=upDel]").val( 'up' );

                  //지시사항 유효성 검사
               var daily_business_remarks = dailyUpDelFormObj3.find("[name=dailyUpDelFormObj3]").val();
               if (new RegExp(/^[가-힣a-zA-Z0-9][가-힣a-zA-Z0-9 ]{1,500}$/).test(daily_business_remarks)==false)
               {
                  alert("지시사항을 입력해주세요.(첫 글자 공백 불가, 두 글자 이상");
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
               url : "/pro/daily_business_log_upDel_proc.do"
               // ------------------
               // 전송 방법 설정
               // ------------------
               ,type : "post"
               // ------------------
               // 서버에 보낼 파라미터명과 파라미터값을 설정
               // ------------------
               ,data :  $("form").filter("[name=dailyContentForm3]").serialize()
               // ------------------
               // 서버의 응답을 성공적으로 받았을 경우 실행할 익명함수 설정.
               // 익명함수의 매개변수 contactRegCnt 에는 연락처 입력 적용행의 개수가 들어온다.
               // ------------------
               ,success : function( dailyUpDelCnt ){
                  // 연락처 수정 적용 행의 개수가 1개 이상이면
                  // 즉 수정이 성공했으면
                  if( dailyUpDelCnt>0 ){
                       // alert 상자 띄우고 재 등록할지 물어본다
                       alert( "일일업무일지 수정 또는 삭제 성공!" );
                       location.replace("/pro/dailyList.do");
                    }
                    else if(dailyUpDelCnt==-1){
                       alert( "일일업무일지 수정 또는 삭제 실패! 관리자에게 문의 바람!" );
                       location.replace("/pro/dailyList.do");
                    }
                    else if(dailyUpDelCnt==-2) {
                       if(confirm( "이미 수정된 내역이 존재합니다. 다시 불러오시겠습니까?" )==true) {
                              document.dailyContentForm4.submit();
                         }
                        else {
                              location.replace("/pro/dailyList.do");
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
            alert( "checkDailyUpDelForm3( ) 함수 예외 발생!" );
         }
   }

  

   </script>
           
              
            
<!----------------------------------------------------------------------------------------------------------------------------------------------->



   <BODY>
   
 <center>
   <form name="dailyContentForm2" enctype="multipart/form-data" action="/pro/daily_report_upDel_proc.do">

      <br><br><h3 align="top"><b>[일일 보고서 수정화면]</b></h3><br>

      <TABLE class="tbcss1" >
      <TR>
         <Th align="left" class="real_table">업무작성자</Th>
         <TD align="left" class="real_td" name="writer_name" >${dailylist.writer_name}</TD>
      </TR>
      <TR>
         <Th align="center" class="real_table" >업무분야</TD>
         <TD align="left" class="real_td">
          <select name="daily_business_field" id="daily_business_field">
            <option value="">-선택요망-</option>
            <option value=1> 행정</option>
            <option value=2> 사무</option>
            <option value=3> 구매</option>
            <option value=4> 접대</option>
            <option value=5> 회계</option>
            <option value=6> 기타</option>
          </select>
      </TR>
      <TR>
         <Th align="left" class="real_table">업무내용</Th>
         <TD align="left" class="real_td">
            <input type="text" name="daily_business_content" size="50" value="">
         </TD>
      </TR> 
      <TR>
         <th align="left" class="real_table" >시간</th>
           <TD align="left" class="real_td">시작일:
            <select name="begin_daily_business_year" onChange="checkApprovalDate2()">
               <option value="">
                  <script>
                     for (var i=1990; i<=new Date().getFullYear()+1 ; i++ ){   
                        document.write("<option value="+i+">"+i);
                     }
                  </script> 
            </select>&nbsp;&nbsp;년&nbsp;
            <select name="begin_daily_business_month" onChange="checkApprovalDate2()">
               <option value="">
                  <script>
                          for (var i=1; i<=12 ; i++ ){   
                             var m = (i<10)?"0"+i:i;
                        document.write("<option value="+m+">"+m);
                          }
                        </script>
            </select>&nbsp;&nbsp;월&nbsp;
            <select name="begin_daily_business_date" onChange="checkApprovalDate2()">
               <option value="">
                  <script>
                     for (var i=1; i<=31 ; i++ ){   
                        var m = (i<10)?"0"+i:i;
                        document.write("<option value="+m+">"+m);
                     }
                  </script>
            </select>&nbsp;&nbsp;일&nbsp;
            
               <input type="text"  name="to_today_day" style="width:25px;" readonly>요일&nbsp;&nbsp;
               
            <select name="begin_daily_business_hour" onChange="checkApprovalDate2()">
               <option value="">
                  <script>
                  for (var i=1; i<=24 ; i++ ){   
                     var m = (i<10)?"0"+i:i;
                     document.write("<option value="+m+">"+m);
                  }
                  </script>
            </select>&nbsp;&nbsp;시&nbsp;
            <select name="begin_daily_business_minute" onChange="checkApprovalDate2()">
               <option value="">
                  <script>
                     for (var i=0; i<=59 ; i++ ){   
                        var m = (i<10)?"0"+i:i;
                        document.write("<option value="+m+">"+m);
                     }
                  </script>
            </select>&nbsp;&nbsp;분&nbsp;&nbsp;
            
               <span style="cursor:pointer" class="to_today">[오늘로]</span>&nbsp;
               <span style="cursor:pointer" class="empty3">[비움]</span>
               <br>
            종료일:
            <select name="end_daily_business_year" onChange="checkApprovalDate22()">
               <option value="">
                  <script>
                     for (var i=1990; i<=new Date().getFullYear()+1 ; i++ ){   
                        document.write("<option value="+i+">"+i);
                     }
                  </script> 
            </select>&nbsp;&nbsp;년&nbsp;
            <select name="end_daily_business_month" onChange="checkApprovalDate22()">
               <option value="">
                  <script>
                     for (var i=1; i<=12 ; i++ ){   
                        var m = (i<10)?"0"+i:i;
                        document.write("<option value="+m+">"+m);
                     }
                  </script>
            </select>&nbsp;&nbsp;월&nbsp;
            <select name="end_daily_business_date" onChange="checkApprovalDate22()">
               <option value="">
                  <script>
                     for (var i=1; i<=31 ; i++ ){   
                        var m = (i<10)?"0"+i:i;
                        document.write("<option value="+m+">"+m);
                     }
                   </script>
            </select>&nbsp;&nbsp;일&nbsp;
            
               <input type="text"  name="to_today_day1" style="width:25px;" readonly>요일&nbsp;&nbsp;
               
            <select name="end_daily_business_hour" onChange="checkApprovalDate22()">
               <option value="">
                  <script>
                     for (var i=1; i<=24 ; i++ ){   
                        var m = (i<10)?"0"+i:i;
                        document.write("<option value="+m+">"+m);
                     }
                  </script>
            </select>&nbsp;&nbsp;시&nbsp;
            <select name="end_daily_business_minute" onChange="checkApprovalDate22()">
               <option value="" >
                  <script>
                  for (var i=0; i<=59 ; i++ ){   
                     var m = (i<10)?"0"+i:i;
                     document.write("<option value="+m+">"+m);
                  }
                  </script>
            </select>&nbsp;&nbsp;분&nbsp;&nbsp;
            
               <span style="cursor:pointer" class="to_today1">[오늘로]</span>&nbsp;
               <span style="cursor:pointer" class="empty4">[비움]</span>
            
      </TR>
      <TR>
         <th align="left" class="real_table" >완료</th>
         <TD align="left" class="real_td">
               <div id="confirm_button">
             <input type ="checkbox" name="is_daily_business_finish" value="confirm">완료
            </div>
   
      </TR>
      <TR>
         <Th align="left" class="real_table">지시사항</Th>
         <TD align="left" class="real_td" name="daily_business_remarks" >${dailylist.daily_business_remarks} <br> ${dailylist.orderer}</TD>
      </TR>
      
      <input type="hidden" name="upDel" >
      <input type="hidden" name="report_no" value="${dailyDTO.report_no}">
      <input type="hidden" name="revise_cnt" value="${dailylist.revise_cnt}">
      
         </TABLE>
   
      <div style="height:5px"></div>
   
      <TABLE>
      <TR>
         <TD>
            <div id="approval_button"><span class="btn btn1" style="width:80px;" onClick="checkDailyUpDelForm2( 'up' );">수정하기</span>&nbsp;&nbsp;
            </div>
         </TD>
         <TD>
            <div>
            <span class="btn btn1" style="width:80px;" onClick="checkDailyUpDelForm2( 'del' );">삭제하기</span>&nbsp;&nbsp;
            </div>
         </TD>
         <TD>
            <div>
               <span class="btn btn1" style="width:80px;"onclick="location.replace('/pro/dailyList.do')">닫기</span>&nbsp;&nbsp;
               </div>
      </TR>
      </TABLE>
   
   </form>



   
<!----------------------------------------------------------------------------------------------------------------------------------------------->
    <form name="dailyContentForm3" enctype="multipart/form-data" action="/pro/daily_report_upDel_proc.do">

        
      <br>
      <br><br><h3 align="top"><b>[일일 보고서 수정화면]</b></h3><br>


      <TABLE class="tbcss1" >
      <TR>
         <Th align="center" class="real_table">업무작성자</Th>
         <TD align="left" class="real_td">${dailylist.writer_name}</TD>
      </TR>
      <TR>
         <Th align="center" class="real_table">업무분야</TD>
         <TD align="left" class="real_td">
               <c:if test="${dailylist.daily_business_field==1}">
                  행정
               </c:if>
               <c:if test="${dailylist.daily_business_field==2}">
                  사무
               </c:if>
               <c:if test="${dailylist.daily_business_field==3}">
                  구매
               </c:if>
               <c:if test="${dailylist.daily_business_field==4}">
                  접대
               </c:if>
               <c:if test="${dailylist.daily_business_field==5}">
                  회계
               </c:if>
               <c:if test="${dailylist.daily_business_field==6}">
                  기타
               </c:if>
      </TR>
      <TR>
         <Th align="center" class="real_table">업무내용</Th>
         <TD align="left" class="real_td">${dailylist.daily_business_content}
      </TR> 
      <TR>
         <th align="center" class="real_table" >시간</th>
           <TD align="left" class="real_td">${dailylist.begin_daily_business_year}.&nbsp;${dailylist.begin_daily_business_month}.&nbsp;${dailylist.begin_daily_business_date}.&nbsp;${dailylist.begin_daily_business_hour}
                    :${dailylist.begin_daily_business_minute}&nbsp;&nbsp;~&nbsp;&nbsp;${dailylist.end_daily_business_year}.&nbsp;${dailylist.end_daily_business_month}.&nbsp;${dailylist.end_daily_business_date}.&nbsp;${dailylist.end_daily_business_hour}
                    :${dailylist.end_daily_business_minute}
      </TR>
      <TR>
         <th align="center" class="real_table" >완료</th>
         <TD align="left" class="real_td">
               <div id="confirm_button">
             <input type ="checkbox" name="is_daily_business_finish" value="1">완료
            </div>
    
      </TR>
      <TR>
         <Th align="center" class="real_table">지시사항</Th>
      <TD align="left" class="real_td">
      <textarea name="daily_business_remarks" cols="100" rows="10">${dailylist.daily_business_remarks}</textarea>
      </TR>
      
      <input type="hidden" name="upDel" >
      <input type="hidden" name="report_no" value="${dailyDTO.report_no}">
      <input type="hidden" name="revise_cnt" value="${dailylist.revise_cnt}">
         </TABLE>
   
      <div style="height:5px"></div>
   
      <TABLE>
      <TR>
         <TD>
            <div id="approval_button"><span class="btn btn1" style="width:80px;" onClick="checkDailyUpDelForm3( 'up' );">수정하기</span>&nbsp;&nbsp;
            </div>
         </TD>
         <TD>
            <div id="approval_button"><span class="btn btn1" style="width:80px;" onClick="location.replace('/pro/dailyList.do')">닫기</span>&nbsp;&nbsp;
            </div>
         </TD>
      </TR>
      </TABLE>
   
   </form>
   
   <form name="dailyContentForm4" method="post" action="/pro/daily_business_log_upDel_form.do">
      <input type="hidden" name="report_no" value="${dailyDTO.report_no}">
      <input type="hidden" name="writer" value="${dailyDTO.writer}">   
   </form>
   
   </BODY>
</HTML>