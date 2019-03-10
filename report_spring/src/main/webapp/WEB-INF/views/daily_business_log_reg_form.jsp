<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!--mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm-->
<!--현재 페이지에 common.jsp 파일 내의 소스 삽입-->
<!--mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm-->
<%@include file="common2.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
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
    	  var daily_report_regi_formObj=$("[name=daily_report_regi]");	
			
    	  		daily_report_regi_formObj.find(".reset").click(function(){
    		 	 daily_report_regi_formObj.find("[name=is_daily_business_finish]").prop("checked",false); 
				daily_report_regi_formObj.find("[name=daily_business_field]").val('');
				daily_report_regi_formObj.find("[name=daily_business_content]").val('');
				daily_report_regi_formObj.find("[name^=begin_daily_business]").val("");
				daily_report_regi_formObj.find("[name^=end_daily_business]").val(""); 
		     });
    	  
    	  
         // [오늘로] 글씨를 클릭하면 실행할 구문 설정
         var daily_report_regi_formObj = $("[name=daily_report_regi]");

         daily_report_regi_formObj.find("[name=to_today1]").click(function(){

            // 현재 날짜를 관리하는 Date 객체 생성해서 객체의 메위주를 today라는 변수에 저장.
            // 월을 세팅할 땐 1을 빼고, 월을 얻을 땐 1을 더하자. ex) 2월을 세팅할 땐, 1월로 집어넣기
            // n월의 마지막날을 얻고 싶으면 n월 0일을 세팅
            var today = new Date(  );
            // 현재 날짜의 년도 얻기
            var year = today.getFullYear();
            // 현재 날짜의 월 얻기. 주의> 월을 얻고 나서 1을 더할 것
            var month = today.getMonth()+1;
            var date = today.getDate();
            //현재 시간 얻기
            var hours = today.getHours();
            var minute = today.getMinutes();
         //1~9월일 때 0붙여주기
          if(month<10){month="0"+month}
         //1~9일일 때 0붙여주기
          if(date<10){date="0"+date}
         //1~9시일 때 0붙여주기
          if(hours<10){hours="0"+hours}
         //1~9분일 때 0붙여주기
          if(minute<10){minute="0"+minute}
            //if(month<10){month="0"+month}
            // 현재 날짜의 월을 name=begin_daily_business_year 을 가진 입력양식에 넣어주기
            daily_report_regi_formObj.find("[name=begin_daily_business_year]").val(year);
            // 현재 날짜의 월을 name=begin_daily_business_month 을 가진 입력양식에 넣어주기
            daily_report_regi_formObj.find("[name=begin_daily_business_month]").val(month);
            daily_report_regi_formObj.find("[name=begin_daily_business_date]").val(date);
            daily_report_regi_formObj.find("[name=begin_daily_business_hour]").val(hours);
            daily_report_regi_formObj.find("[name=begin_daily_business_minute]").val(minute);
         });


            daily_report_regi_formObj.find("[name=to_today2]").click(function(){

            // 현재 날짜를 관리하는 Date 객체 생성해서 객체의 메위주를 today라는 변수에 저장.
            // 월을 세팅할 땐 1을 빼고, 월을 얻을 땐 1을 더하자. ex) 2월을 세팅할 땐, 1월로 집어넣기
            // n월의 마지막날을 얻고 싶으면 n월 0일을 세팅
            var today = new Date(  );
            // 현재 날짜의 년도 얻기
            var year = today.getFullYear();
            // 현재 날짜의 월 얻기. 주의> 월을 얻고 나서 1을 더할 것
            var month = today.getMonth()+1;
            var date = today.getDate();
            //현재 시간 얻기
            var hours = today.getHours();
            var minute = today.getMinutes();
         //1~9월일 때 0붙여주기
          if(month<10){month="0"+month}
         //1~9일일 때 0붙여주기
          if(date<10){date="0"+date}
         //1~9시일 때 0붙여주기
          if(hours<10){hours="0"+hours}
         //1~9분일 때 0붙여주기
          if(minute<10){minute="0"+minute}
            //if(month<10){month="0"+month}
            // 현재 날짜의 월을 name=begin_daily_business_year 을 가진 입력양식에 넣어주기
            daily_report_regi_formObj.find("[name=end_daily_business_year]").val(year);
            // 현재 날짜의 월을 name=begin_daily_business_month 을 가진 입력양식에 넣어주기
            daily_report_regi_formObj.find("[name=end_daily_business_month]").val(month);
            daily_report_regi_formObj.find("[name=end_daily_business_date]").val(date);
            daily_report_regi_formObj.find("[name=end_daily_business_hour]").val(hours);
            daily_report_regi_formObj.find("[name=end_daily_business_minute]").val(minute);
         });





         //시작 비움버튼
         daily_report_regi_formObj.find("[name=start_empty]").click(function(){
            //start_work로 시작하는 내용을 지우기
            daily_report_regi_formObj.find("[name^=begin_daily]").val('');
         });
         //끝 비움버튼
         daily_report_regi_formObj.find("[name=end_empty]").click(function(){
            daily_report_regi_formObj.find("[name^=end_daily]").val('');
         })



      });//document.ready    

         
         function daily_report_regi_formCheck(){
            //업무분야 유효성 체크
            var daily_report_regi_formObj = $("[name=daily_report_regi]");
            var daily_business_field = daily_report_regi_formObj.find("[name=daily_business_field]").val();
               if (daily_business_field==""){
                  alert("업무분야를 체크해주세요.");
                  return;
               }
            //업무내용 유효성 체크
            var daily_business_content = daily_report_regi_formObj.find("[name=daily_business_content]").val();
               if ( daily_business_content=="" ){
                  alert("업무내용을 작성해주세요(두 글자 이상, 첫 글자 공백불가!).");
                  daily_report_regi_formObj.find("[name=daily_business_content]").val("");
                  return;
               }
            //방문시간 시작일 유효성 체크
                var begin_daily_business_year = daily_report_regi_formObj.find("[name=begin_daily_business_year]").val(  );
            var begin_daily_business_month = daily_report_regi_formObj.find("[name=begin_daily_business_month]").val(  );
            var begin_daily_business_date = daily_report_regi_formObj.find("[name=begin_daily_business_date]").val(  );
            var begin_daily_business_hour = daily_report_regi_formObj.find("[name=begin_daily_business_hour]").val(  );
            var begin_daily_business_minute = daily_report_regi_formObj.find("[name=begin_daily_business_minute]").val(  );
            if (begin_daily_business_year =="" || begin_daily_business_month == "" || begin_daily_business_date == "" || begin_daily_business_hour == "" || begin_daily_business_minute == "" )
            {
               alert("방문 시간 시작일을 모두 입력해주세요.");
               return;
            }
            //방문시간 종료일 유효성 체크
                var end_daily_business_year = daily_report_regi_formObj.find("[name=end_daily_business_year]").val(  );
            var end_daily_business_month = daily_report_regi_formObj.find("[name=end_daily_business_month]").val(  );
            var end_daily_business_date = daily_report_regi_formObj.find("[name=end_daily_business_date]").val(  );
            var end_daily_business_hour = daily_report_regi_formObj.find("[name=end_daily_business_hour]").val(  );
            var end_daily_business_minute = daily_report_regi_formObj.find("[name=end_daily_business_maxute]").val(  );
            if (end_daily_business_year =="" || end_daily_business_month == "" || end_daily_business_date == "" || end_daily_business_hour == "" || end_daily_business_minute == "" )
            {
               alert("방문 시간 종료일을 모두 입력해주세요.");
               return;
            }

            //var end_time = daily_report_regi_formObj.find("name^=end_work_]").val();

            if (confirm("등록하시겠습니까?")==false){
                return;
            } 
            
            $.ajax({
               url : "/pro/daily_business_log_reg_proc.do"
               , type : "post"
               , data : $("form").filter("[name=daily_report_regi]").serialize()
               , dataType : "json"
               , success : function( dailyRegCnt ){
	               if( dailyRegCnt > 0  ){
	                      alert("일일 업무 보고서 등록 성공");
	                  location.replace("/pro/dailyList.do");
	               }
	                  else{
	                     alert("일일 업무 보고서 등록 실패! 관리자에게 문의 바람");
	                     location.replace("/pro/dailyList.do");
	                  }           
	               }
               , error : function(){
                  alert("서버 접속 실패!");
               }
            });

         }


      //오늘날
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


      //시작일 시간
        function checkWorkDate(){
            
                 var daily_report_regi_formObj = $("[name=daily_report_regi]");
                 //----------------------------------
                 var begin_daily_business_year = daily_report_regi_formObj.find("[name=begin_daily_business_year]").val( );
                 var begin_daily_business_month = daily_report_regi_formObj.find("[name=begin_daily_business_month]").val( );
                 var begin_daily_business_date = daily_report_regi_formObj.find("[name=begin_daily_business_date]").val( );
                 var begin_daily_business_hour = daily_report_regi_formObj.find("[name=begin_daily_business_hour]").val( );
                 var begin_daily_business_minute = daily_report_regi_formObj.find("[name=begin_daily_business_minute]").val( );
                 //----------------------------------
                 var end_daily_business_year = daily_report_regi_formObj.find("[name=end_daily_business_year]").val( );
                 var end_daily_business_month = daily_report_regi_formObj.find("[name=end_daily_business_month]").val( );
                 var end_daily_business_date = daily_report_regi_formObj.find("[name=end_daily_business_date]").val( );
                 var end_daily_business_hour = daily_report_regi_formObj.find("[name=end_daily_business_hour]").val( );
                 var end_daily_business_minute = daily_report_regi_formObj.find("[name=end_daily_business_minute]").val( );
         //---------------------------------- 
         //년도 먼저 설정
         //----------------------------------        
                 
            if ( (begin_daily_business_year=="" || begin_daily_business_year.length==0) && (begin_daily_business_month !="" && begin_daily_business_month.length>0) )
            {   alert("왼쪽 년도를 먼저 선택해야 합니다.");
               daily_report_regi_formObj.find("[name=begin_daily_business_month]").val( "" );
               return;
            }
         //----------------------------------  
            if ((begin_daily_business_year=="" || begin_daily_business_year.length==0) && (begin_daily_business_date !="" && begin_daily_business_date.length>0) )
            {   alert("왼쪽 년도를 먼저 선택해야 합니다.");
               daily_report_regi_formObj.find("[name=begin_daily_business_date]").val( "" );
               return;
            }
         //---------------------------------- 
            if ((begin_daily_business_year=="" || begin_daily_business_year.length==0) && (begin_daily_business_hour !="" && begin_daily_business_hour.length>0) )
            {   alert("왼쪽 년도를 먼저 선택해야 합니다.");
               daily_report_regi_formObj.find("[name=begin_daily_business_hour]").val( "" );
               return;
            }  
         //---------------------------------- 
            if ((begin_daily_business_year=="" || begin_daily_business_year.length==0) && (begin_daily_business_minute !="" && begin_daily_business_minute.length>0) )
            {   alert("왼쪽 년도를 먼저 선택해야 합니다.");
               daily_report_regi_formObj.find("[name=begin_daily_business_minute]").val( "" );
               return;
            }
         //----------------------------------
         //년도가 선택 된 후 월 먼저 설정
         //----------------------------------
            if ((begin_daily_business_month=="" || begin_daily_business_month.length==0) && (begin_daily_business_date !="" && begin_daily_business_date.length>0) )
            {   alert("왼쪽 월을 먼저 선택해야 합니다.");
               daily_report_regi_formObj.find("[name=begin_daily_business_date]").val( "" );
               return;
            }
         //----------------------------------
            if ((begin_daily_business_month=="" || begin_daily_business_month.length==0) && (begin_daily_business_hour !="" && begin_daily_business_hour.length>0) )
            {   alert("왼쪽 월을 먼저 선택해야 합니다.");
               daily_report_regi_formObj.find("[name=begin_daily_business_hour]").val( "" );
               return;
            }
         //----------------------------------
            if ((begin_daily_business_month=="" || begin_daily_business_month.length==0) && (begin_daily_business_minute !="" && begin_daily_business_minute.length>0) )
            {   alert("왼쪽 월을 먼저 선택해야 합니다.");
               daily_report_regi_formObj.find("[name=begin_daily_business_minute]").val( "" );
               return;
            }
         //----------------------------------
         //년도, 월이 선택 된후 일 설정
         //----------------------------------
         if ( (begin_daily_business_date=="" || begin_daily_business_date.length==0) && (begin_daily_business_hour !="" && begin_daily_business_hour.length>0) )
            {   
            alert("왼쪽 일을 먼저 선택해야 합니다.");
               daily_report_regi_formObj.find("[name=begin_daily_business_hour]").val( "" );
               return;
            }
         //----------------------------------
            if ((begin_daily_business_date=="" || begin_daily_business_date.length==0) && (begin_daily_business_minute !="" && begin_daily_business_minute.length>0) )
            {   alert("왼쪽 일을 먼저 선택해야 합니다.");
               daily_report_regi_formObj.find("[name=begin_daily_business_minute]").val( "" );
               return;
            } 
         
         //----------------------------------
         //시간 설정
         //----------------------------------
         if ((begin_daily_business_hour=="" || begin_daily_business_hour.length==0) && (begin_daily_business_minute !="" && begin_daily_business_minute.length>0) )
            {   alert("왼쪽 시간을 먼저 선택해야 합니다.");
               daily_report_regi_formObj.find("[name^=begin_daily_business]").val( "" );
               daily_report_regi_formObj.find("[name^=end_daily_business]").val( "" );
               return;
            }


      //시작일의 년도가 종료일의 시간보다 클 때
      if (begin_daily_business_year !="" && end_daily_business_year !="")
      {
            if (parseInt(end_daily_business_year,10)< parseInt(begin_daily_business_year,10))
            {
               alert("시작년도가 종료년도보다 큽니다. 재선택바람!");
               daily_report_regi_formObj.find("[name^=begin_daily_business]").val( "" );
               daily_report_regi_formObj.find("[name^=end_daily_business]").val( "" );
               return;
            }
      }


      //시작일의 월이 종료일의 월보다 클 때
      if (begin_daily_business_year !="" && begin_daily_business_month != "" && end_daily_business_year !="" && end_daily_business_month !="")
      {
            var end_date = daily_report_regi_formObj.find("[name=end_daily_business_year]").val(  )+daily_report_regi_formObj.find("[name=end_daily_business_month]").val(  );

              var start_date = daily_report_regi_formObj.find("[name=begin_daily_business_year]").val(  )+daily_report_regi_formObj.find("[name=begin_daily_business_month]").val(  );

            if (parseInt(end_date,10)< parseInt(start_date,10))
            {
               alert("시작월이 종료월보다 큽니다. 재선택바람!");
               daily_report_regi_formObj.find("[name^=begin_daily_business]").val( "" );
               daily_report_regi_formObj.find("[name^=end_daily_business]").val( "" );
               return;
            }
      }
      
      //시작일의 일이 종료일의 일보다 클 때
      if (begin_daily_business_year !="" && begin_daily_business_month != "" && begin_daily_business_date != "" && end_daily_business_year !="" && end_daily_business_month !="" && end_daily_business_date !="")
      {   
            var end_date = daily_report_regi_formObj.find("[name=end_daily_business_year]").val(  )+daily_report_regi_formObj.find("[name=end_daily_business_month]").val(  )+daily_report_regi_formObj.find("[name=end_daily_business_date]").val(  );

              var start_date = daily_report_regi_formObj.find("[name=begin_daily_business_year]").val(  )+daily_report_regi_formObj.find("[name=begin_daily_business_month]").val(  )+daily_report_regi_formObj.find("[name=begin_daily_business_date]").val(  );

            if (parseInt(end_date,10)< parseInt(start_date,10))
            {
               alert("시작일이 종료일보다 큽니다. 재선택바람!");
               daily_report_regi_formObj.find("[name^=begin_daily_business]").val( "" );
               daily_report_regi_formObj.find("[name^=end_daily_business]").val( "" );
               return;
            }
      }

      //시작일의 시간이 종료일의 시간보다 클 때
      if (begin_daily_business_year !="" && begin_daily_business_month != "" && begin_daily_business_date != "" && begin_daily_business_hour != "" && end_daily_business_year !="" && end_daily_business_month !="" && end_daily_business_date !="" && end_daily_business_hour !="")
      {
            var end_date = daily_report_regi_formObj.find("[name=end_daily_business_year]").val(  )+daily_report_regi_formObj.find("[name=end_daily_business_month]").val(  )+daily_report_regi_formObj.find("[name=end_daily_business_date]").val(  )+daily_report_regi_formObj.find("[name=end_daily_business_hour]").val(  );

              var start_date = daily_report_regi_formObj.find("[name=begin_daily_business_year]").val(  )+daily_report_regi_formObj.find("[name=begin_daily_business_month]").val(  )+daily_report_regi_formObj.find("[name=begin_daily_business_date]").val(  )+daily_report_regi_formObj.find("[name=begin_daily_business_hour]").val(  );

            if (parseInt(end_date,10)< parseInt(start_date,10))
            {
               alert("시작시간이 종료시간보다 큽니다. 재선택바람!");
               daily_report_regi_formObj.find("[name^=begin_daily_business]").val( "" );
               daily_report_regi_formObj.find("[name^=end_daily_business]").val( "" );
               return;
            }
      }

      //시작일의 분이 종료일의 분보다 클 때
      if (begin_daily_business_year !="" && begin_daily_business_month != "" && begin_daily_business_date != "" && begin_daily_business_hour != "" && begin_daily_business_minute != "" && end_daily_business_year !="" && end_daily_business_month !="" && end_daily_business_date !="" && end_daily_business_hour !="" && end_daily_business_minute !="")
      {
            var end_date = daily_report_regi_formObj.find("[name=end_daily_business_year]").val(  )+daily_report_regi_formObj.find("[name=end_daily_business_month]").val(  )+daily_report_regi_formObj.find("[name=end_daily_business_date]").val(  )+daily_report_regi_formObj.find("[name=end_daily_business_hour]").val(  )+daily_report_regi_formObj.find("[name=end_daily_business_minute]").val(  );

              var start_date = daily_report_regi_formObj.find("[name=begin_daily_business_year]").val(  )+daily_report_regi_formObj.find("[name=begin_daily_business_month]").val(  )+daily_report_regi_formObj.find("[name=begin_daily_business_date]").val(  )+daily_report_regi_formObj.find("[name=begin_daily_business_hour]").val(  )+daily_report_regi_formObj.find("[name=begin_daily_business_minute]").val(  );

            if (parseInt(end_date,10)< parseInt(start_date,10))
            {
               alert("시작분이 종료분보다 큽니다. 재선택바람!");
               daily_report_regi_formObj.find("[name^=begin_daily_business]").val( "" );
               daily_report_regi_formObj.find("[name^=end_daily_business]").val( "" );
               return;
            }
      }



      if (begin_daily_business_year =="" || begin_daily_business_month == "" || begin_daily_business_date =="" ){
             return;
         }

       //방문 시간 시작일 존재여부
          if (is_valid_date(begin_daily_business_year,begin_daily_business_month,begin_daily_business_date)==false)
          {
            alert("존재하지 않는 날짜입니다.");
            daily_report_regi_formObj.find("[name^=begin_daily]").val("");
            return;
          }
            
    }//checkWorkDate()



       //종료일 시간
        function checkWorkDate1(){
            
         var daily_report_regi_formObj = $("[name=daily_report_regi]");
         //----------------------------------
         var begin_daily_business_year = daily_report_regi_formObj.find("[name=begin_daily_business_year]").val( );
         var begin_daily_business_month = daily_report_regi_formObj.find("[name=begin_daily_business_month]").val( );
         var begin_daily_business_date = daily_report_regi_formObj.find("[name=begin_daily_business_date]").val( );
         var begin_daily_business_hour = daily_report_regi_formObj.find("[name=begin_daily_business_hour]").val( );
         var begin_daily_business_minute = daily_report_regi_formObj.find("[name=begin_daily_business_minute]").val( );
           //----------------------------------
            var end_daily_business_year = daily_report_regi_formObj.find("[name=end_daily_business_year]").val( );
            var end_daily_business_month = daily_report_regi_formObj.find("[name=end_daily_business_month]").val( );
            var end_daily_business_date = daily_report_regi_formObj.find("[name=end_daily_business_date]").val( );
            var end_daily_business_hour = daily_report_regi_formObj.find("[name=end_daily_business_hour]").val( );
            var end_daily_business_minute = daily_report_regi_formObj.find("[name=end_daily_business_minute]").val( );
         //---------------------------------- 
         //년도 먼저 설정
         //----------------------------------        
            if ( (end_daily_business_year=="" || end_daily_business_year.length==0) && (end_daily_business_month !="" && end_daily_business_month.length>0) )
            {   alert("왼쪽 년도를 먼저 선택해야 합니다.");
               daily_report_regi_formObj.find("[name=end_daily_business_month]").val( "" );
               return;
            }
         //----------------------------------  
            if ((end_daily_business_year=="" || end_daily_business_year.length==0) && (end_daily_business_date !="" && end_daily_business_date.length>0) )
            {   alert("왼쪽 년도를 먼저 선택해야 합니다.");
               daily_report_regi_formObj.find("[name=end_daily_business_date]").val( "" );
               return;
            }
         //---------------------------------- 
            if ((end_daily_business_year=="" || end_daily_business_year.length==0) && (end_daily_business_hour !="" && end_daily_business_hour.length>0) )
            {   alert("왼쪽 년도를 먼저 선택해야 합니다.");
               daily_report_regi_formObj.find("[name=end_daily_business_hour]").val( "" );
               return;
            }
         //---------------------------------- 
            if ((end_daily_business_year=="" || end_daily_business_year.length==0) && (end_daily_business_minute !="" && end_daily_business_minute.length>0) )
            {   alert("왼쪽 년도를 먼저 선택해야 합니다.");
               daily_report_regi_formObj.find("[name=end_daily_business_minute]").val( "" );
               return;
            }
         //----------------------------------
         //년도가 선택 된 후 월 먼저 설정
         //----------------------------------
            if ((end_daily_business_month=="" || end_daily_business_month.length==0) && (end_daily_business_date !="" && end_daily_business_date.length>0) )
            {   alert("왼쪽 월을 먼저 선택해야 합니다.");
               daily_report_regi_formObj.find("[name=end_daily_business_date]").val( "" );
               return;
            }
         //----------------------------------
            if ((end_daily_business_month=="" || end_daily_business_month.length==0) && (end_daily_business_hour !="" && end_daily_business_hour.length>0) )
            {   alert("왼쪽 월을 먼저 선택해야 합니다.");
               daily_report_regi_formObj.find("[name=end_daily_business_hour]").val( "" );
               return;
            }
         //----------------------------------
            if ((end_daily_business_month=="" || end_daily_business_month.length==0) && (end_daily_business_minute !="" && end_daily_business_minute.length>0) )
            {   alert("왼쪽 월을 먼저 선택해야 합니다.");
               daily_report_regi_formObj.find("[name=end_daily_business_minute]").val( "" );
               return;
            }
         //----------------------------------
         //년도, 월이 선택 된후 일 설정
         //----------------------------------
            if ( (end_daily_business_date=="" || end_daily_business_date.length==0) && (end_daily_business_hour !="" && end_daily_business_hour.length>0) )
            {   alert("왼쪽 일을 먼저 선택해야 합니다.");
               daily_report_regi_formObj.find("[name=end_daily_business_hour]").val( "" );
               return;
            }
         //----------------------------------
            if ((end_daily_business_date=="" || end_daily_business_date.length==0) && (end_daily_business_minute !="" && end_daily_business_minute.length>0) )
            {   alert("왼쪽 일을 먼저 선택해야 합니다.");
               daily_report_regi_formObj.find("[name=end_daily_business_minute]").val( "" );
               return;
         }
         
         //----------------------------------
         //시간 설정
         //----------------------------------
         if ((end_daily_business_hour=="" || end_daily_business_hour.length==0) && (end_daily_business_minute !="" && end_daily_business_minute.length>0) )
            {   alert("왼쪽 시간을 먼저 선택해야 합니다.");
               daily_report_regi_formObj.find("[name=end_daily_business_minute]").val( "" );
               return;
            }    

      //시작일의 년도가 종료일의 시간보다 클 때
      if (begin_daily_business_year !="" && end_daily_business_year !="")
      {
            if (parseInt(end_daily_business_year,10)< parseInt(begin_daily_business_year,10))
            {
               alert("시작년도가 종료년도보다 큽니다. 재선택바람!");
               daily_report_regi_formObj.find("[name^=begin_daily_business]").val( "" );
               daily_report_regi_formObj.find("[name^=end_daily_business]").val( "" );
               return;
            }
      }


      //시작일의 월이 종료일의 월보다 클 때
      if (begin_daily_business_year !="" && begin_daily_business_month != "" && end_daily_business_year !="" && end_daily_business_month !="")
      {
            var end_date = daily_report_regi_formObj.find("[name=end_daily_business_year]").val(  )+daily_report_regi_formObj.find("[name=end_daily_business_month]").val(  );

              var start_date = daily_report_regi_formObj.find("[name=begin_daily_business_year]").val(  )+daily_report_regi_formObj.find("[name=begin_daily_business_month]").val(  );

            if (parseInt(end_date,10)< parseInt(start_date,10))
            {
               alert("시작월이 종료월보다 큽니다. 재선택바람!");
               daily_report_regi_formObj.find("[name^=begin_daily_business]").val( "" );
               daily_report_regi_formObj.find("[name^=end_daily_business]").val( "" );
               return;
            }
      }
      
      //시작일의 일이 종료일의 일보다 클 때
      if (begin_daily_business_year !="" && begin_daily_business_month != "" && begin_daily_business_date != "" && end_daily_business_year !="" && end_daily_business_month !="" && end_daily_business_date !="")
      {   
            var end_date = daily_report_regi_formObj.find("[name=end_daily_business_year]").val(  )+daily_report_regi_formObj.find("[name=end_daily_business_month]").val(  )+daily_report_regi_formObj.find("[name=end_daily_business_date]").val(  );

              var start_date = daily_report_regi_formObj.find("[name=begin_daily_business_year]").val(  )+daily_report_regi_formObj.find("[name=begin_daily_business_month]").val(  )+daily_report_regi_formObj.find("[name=begin_daily_business_date]").val(  );

            if (parseInt(end_date,10)< parseInt(start_date,10))
            {
               alert("시작일이 종료일보다 큽니다. 재선택바람!");
               daily_report_regi_formObj.find("[name^=begin_daily_business]").val( "" );
               daily_report_regi_formObj.find("[name^=end_daily_business]").val( "" );
               return;
            }
      }

      //시작일의 시간이 종료일의 시간보다 클 때
      if (begin_daily_business_year !="" && begin_daily_business_month != "" && begin_daily_business_date != "" && begin_daily_business_hour != "" && end_daily_business_year !="" && end_daily_business_month !="" && end_daily_business_date !="" && end_daily_business_hour !="")
      {
            var end_date = daily_report_regi_formObj.find("[name=end_daily_business_year]").val(  )+daily_report_regi_formObj.find("[name=end_daily_business_month]").val(  )+daily_report_regi_formObj.find("[name=end_daily_business_date]").val(  )+daily_report_regi_formObj.find("[name=end_daily_business_hour]").val(  );

              var start_date = daily_report_regi_formObj.find("[name=begin_daily_business_year]").val(  )+daily_report_regi_formObj.find("[name=begin_daily_business_month]").val(  )+daily_report_regi_formObj.find("[name=begin_daily_business_date]").val(  )+daily_report_regi_formObj.find("[name=begin_daily_business_hour]").val(  );

            if (parseInt(end_date,10)< parseInt(start_date,10))
            {
               alert("시작시간이 종료시간보다 큽니다. 재선택바람!");
               daily_report_regi_formObj.find("[name^=begin_daily_business]").val( "" );
               daily_report_regi_formObj.find("[name^=end_daily_business]").val( "" );
               return;
            }
      }

      //시작일의 분이 종료일의 분보다 클 때
      if (begin_daily_business_year !="" && begin_daily_business_month != "" && begin_daily_business_date != "" && begin_daily_business_hour != "" && begin_daily_business_minute != "" && end_daily_business_year !="" && end_daily_business_month !="" && end_daily_business_date !="" && end_daily_business_hour !="" && end_daily_business_minute !="")
      {
            var end_date = daily_report_regi_formObj.find("[name=end_daily_business_year]").val(  )+daily_report_regi_formObj.find("[name=end_daily_business_month]").val(  )+daily_report_regi_formObj.find("[name=end_daily_business_date]").val(  )+daily_report_regi_formObj.find("[name=end_daily_business_hour]").val(  )+daily_report_regi_formObj.find("[name=end_daily_business_minute]").val(  );

              var start_date = daily_report_regi_formObj.find("[name=begin_daily_business_year]").val(  )+daily_report_regi_formObj.find("[name=begin_daily_business_month]").val(  )+daily_report_regi_formObj.find("[name=begin_daily_business_date]").val(  )+daily_report_regi_formObj.find("[name=begin_daily_business_hour]").val(  )+daily_report_regi_formObj.find("[name=begin_daily_business_minute]").val(  );

            if (parseInt(end_date,10)< parseInt(start_date,10))
            {
               alert("시작분이 종료분보다 큽니다. 재선택바람!");
               daily_report_regi_formObj.find("[name^=begin_daily_business]").val( "" );
               daily_report_regi_formObj.find("[name^=end_daily_business]").val( "" );
               return;
            }
      }


         if (end_daily_business_year =="" || end_daily_business_month == "" || end_daily_business_date ==""){
          return;
         }

          //방문 시간 종료일 존재여부
           if (is_valid_date(end_daily_business_year,end_daily_business_month,end_daily_business_date)==false)
          {
            alert("존재하지 않는 날짜입니다.");
            daily_report_regi_formObj.find("[name^=end_daily]").val("");
            return;
          }


                
}//checkWorkDate1()
      </script>
      <BODY>
      <form name="daily_report_regi" action="">
      <br><br><center> <h3 align="top"><b>[일일 업무일지 등록]</b></h3><br>
      <TABLE class="tbcss1" >
      <TR>
         <th align="left" class="real_table">1.작성자</th>
         <td class="real_td">${sessionScope.emp_name}
      <TR>
         <th align="left" class="real_table">2.업무분야</th>
         <TD class="real_td">
            <select name="daily_business_field"  style="width:80px;">
            <option value= ""> </option>
            <option value= "1">행정 </option>
            <option value= "2">사무 </option>
            <option value= "3">구매 </option>
            <option value= "4">접대 </option>
            <option value= "5">회계 </option>
            <option value= "6">기타</option>
            </select>&nbsp;&nbsp;
      <TR>
         <th align="left" class="real_table">3.업무내용</th>
         <td class="real_td"> <input type="text" name="daily_business_content" size=60 maxlength="50"></td>
      </TR>
      <TR>
         <th align="left" class="real_table">4.시간</th>
         <td class="real_td"> 시작일:
         <select name = "begin_daily_business_year" onChange = "checkWorkDate()"> 
            <option value="">
               <script>
                  for (var i=1990; i<=new Date().getFullYear()+1 ; i++ )
                  {   document.write("<option value="+i+">"+i);
                  }
               </script> 
            </select>&nbsp;&nbsp;년&nbsp;&nbsp;
            <select name = "begin_daily_business_month" onChange = "checkWorkDate()">
            <option value="">
               <script>
                  for (var i=1; i<=12 ; i++ )
                  {   var m = (i<10)?"0"+i:i;
                     document.write("<option value="+m+">"+m);
                  }
               </script>
            </select>&nbsp;&nbsp;월&nbsp;&nbsp;
            <select name = "begin_daily_business_date" onChange = "checkWorkDate()">
            <option value="">
               <script>
                  for (var i=1; i<=31 ; i++ )
                  {   var m = (i<10)?"0"+i:i;
                     document.write("<option value="+m+">"+m);
                  }
               </script>
            </select>&nbsp;&nbsp;일&nbsp;&nbsp;
            <select name = "begin_daily_business_hour" onChange = "checkWorkDate()">
            <option value="">
               <script>
                  for (var i=0; i<24 ; i++ )
                  {   var m = (i<10)?"0"+i:i;
                     document.write("<option value="+m+">"+m);
                  }
               </script>
            </select>&nbsp;&nbsp;시&nbsp;&nbsp;
            <select name = "begin_daily_business_minute" onChange = "checkWorkDate()">
            <option value="">
               <script>
                  for (var i=0; i<60 ; i++ )
                  {   var m = (i<10)?"0"+i:i;
                     document.write("<option value="+m+">"+m);
                  }
               </script>
            </select>&nbsp;&nbsp;분&nbsp;&nbsp;&nbsp;
            <span  style="cursor:pointer" name="to_today1">[오늘로]</span>&nbsp;
            <span  style="cursor:pointer" name="start_empty">[비움]</span><BR>
            <div style="height:5px"></div>
            종료일:
         <select name = "end_daily_business_year" onChange = "checkWorkDate1()"> 
            <option value="">
               <script>
                  for (var i=1990; i<=new Date().getFullYear()+1 ; i++ )
                  {   document.write("<option value="+i+">"+i);
                  }
               </script> 
            </select>&nbsp;&nbsp;년&nbsp;&nbsp;
            <select name = "end_daily_business_month" onChange = "checkWorkDate1()">
            <option value="">
               <script>
                  for (var i=1; i<=12 ; i++ )
                  {   var m = (i<10)?"0"+i:i;
                     document.write("<option value="+m+">"+m);
                  }
               </script>
            </select>&nbsp;&nbsp;월&nbsp;&nbsp;
            <select name = "end_daily_business_date" onChange = "checkWorkDate1()">
            <option value="">
               <script>
                  for (var i=1; i<=31 ; i++ )
                  {   var m = (i<10)?"0"+i:i;
                     document.write("<option value="+m+">"+m);
                  }
               </script>
            </select>&nbsp;&nbsp;일&nbsp;&nbsp;
            <select name = "end_daily_business_hour" onChange = "checkWorkDate1()">
            <option value="">
               <script>
                  for (var i=0; i<24 ; i++ )
                  {   var m = (i<10)?"0"+i:i;
                     document.write("<option value="+m+">"+m);
                  }
               </script>
            </select>&nbsp;&nbsp;시&nbsp;&nbsp;
            <select name = "end_daily_business_minute" onChange = "checkWorkDate1()">
            <option value="">
               <script>
                  for (var i=0; i<60 ; i++ )
                  {   var m = (i<10)?"0"+i:i;
                     document.write("<option value="+m+">"+m);
                  }
               </script>
            </select>&nbsp;&nbsp;분&nbsp;&nbsp;&nbsp;
            <span style="cursor:pointer" name="to_today2">[오늘로]</span>&nbsp;
            <span style="cursor:pointer" name="end_empty">[비움]</span>
			</td>
      </TR>
      <TR>
         <th align="left" class="real_table">5.완료여부</th>
         <td class="real_td"> <input type ="checkbox" name="is_daily_business_finish" value=1>&nbsp;완료&nbsp;</td>
      <TR>
         <th align="center" class="real_table" name = "daily_business_remarks">6.지시사항</th>
         <td class="real_td"> 없음 </td>
            
            
      </TR>
      </TABLE>
      <div style="height:5px"></div><br>

      <span style="width:100px;" onClick="daily_report_regi_formCheck()" class="btn btn1">등록하기</span>&nbsp;&nbsp;
      <span style="width:100px;" onClick="location.replace('/pro/dailyList.do')" class="btn btn1">화면닫기</span>&nbsp;&nbsp;
      <span class="reset btn btn1" style="width:100px;">초기화</span>&nbsp;&nbsp;


      <div style="height:4px"></div>
      </form>
      </BODY>
</HTML>