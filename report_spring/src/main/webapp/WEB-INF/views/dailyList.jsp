<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      
<%@include file="/WEB-INF/views/common2.jsp"%>


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
   

   
      
   //*************************************************
    // 일일 업무일지 검색 결과물의 짝 홀수행 배경색 달리하기
    // 즉, class=businesstList를 가진 태그의 후손 태그 중 첫번째 tr 태그 이후
    // tr들에 차례대로 접근하여 bgcolor의 인덱스 번호가 짝수인 tr의 속성값을 #cfcfcf로 설정한다
    //*************************************************
    $(".dailyBusinessList").find("tr:eq(0)").nextAll().each(function(){
       // class=dailyBusinesstList를 가진 태그의 후손 중 tr 태그 중 1번째를 뺀
       // 나머지 tr중 i번째 tr 태그를 관리하는 JQuery 객체 생성하여 obj에 저장.
       var obj = $(this);
       // i번째 tr 태그가 형제 tr 중 위치하는 인덱스 번호 얻기
       // 즉, i번째 tr 태그의 형제 서열 인덱스 번호 얻기
       var index = $(this).index();
       // 형제 서열 인덱스 번호가 홀수면 배경색을 #CFCFCF로 설정하기
       // tr 태그의 bgcolor 속성값을 #CFCFCF로 설정하여 배경색을 바꾸는 원리다.
       if( index%2==0 ){
          obj.attr("bgcolor", "#f1f7fc")
       }
    });
    
    //*************************************************
    // 일일 업무일지 검색 결과물의 마우스 대면 색상 변하고 떼면 원래대로 돌리기
    //*************************************************
    $(".dailyBusinessList").find("tr:eq(0)").nextAll().hover(function(){
          var obj = $(this);
          obj.attr("bgcolor", "#c1d8f0")
       }
       ,function(){
          var obj = $(this);
          var index = $(this).index();
          if( index%2==0 ){
             obj.attr("bgcolor", "#f1f7fc")
          }else{
             obj.attr("bgcolor", "white")
          }
       }
    );   
   
   
   
      // 이전 화면에서 입력, 선택한 데이터를 재 입력하여 흔적 남기기 
      
      // 한 페이지에서 보여줄 게시판 목록 행의 개수를 조절하는
      // select 입력양식에 change 이벤트 발생시 실행할 코드 설정
      $("[name=rowCntPerPage]").change(function(){
         daily_business_report_FormCheck();
      });
      
      
     
      var daily_business_report_FormObj = $("[name=daily_business_report]");

      // [오늘로] 글씨를 클릭하면 실행할 구문 설정 (for 업무일)
      daily_business_report_FormObj.find(".to_today").click(function(){

         // 현재 날짜를 관리하는 Date 객체 생성해서 객체의 메위주를 today라는 변수에 저장.
         // 월을 세팅할 땐 1을 빼고, 월을 얻을 땐 1을 더하자. ex) 2월을 세팅할 땐, 1월로 집어넣기
         // n월의 마지막날을 얻고 싶으면 n월 0일을 세팅
         var today = new Date(  );
         // 현재 날짜의 년도 얻기
         var year = today.getFullYear();
         // 현재 날짜의 월 얻기. 주의> 월을 얻고 나서 1을 더할 것
         var month = today.getMonth()+1;
         var date = today.getDate();
         if(month<10){month="0"+month}
         if(date<10){date="0"+date}
         // 현재 날짜의 월을 name=min_reg_year 을 가진 입력양식에 넣어주기
         daily_business_report_FormObj.find("[name=min_daily_business_year]").val(year);
         // 현재 날짜의 월을 name=min_reg_month 을 가진 입력양식에 넣어주기
         daily_business_report_FormObj.find("[name=min_daily_business_month]").val(month);
         daily_business_report_FormObj.find("[name=min_daily_business_date]").val(date);
         daily_business_report_FormObj.find("[name=max_daily_business_year]").val(year);
         // 현재 날짜의 월을 name=min_reg_month 을 가진 입력양식에 넣어주기
         daily_business_report_FormObj.find("[name=max_daily_business_month]").val(month);
         daily_business_report_FormObj.find("[name=max_daily_business_date]").val(date);
      });

      // [현재시간으로] 글씨를 클릭하면 실행할 구문 설정 
      daily_business_report_FormObj.find(".to_today1").click(function(){

         // 현재 날짜를 관리하는 Date 객체 생성해서 객체의 메위주를 today라는 변수에 저장.
         // 월을 세팅할 땐 1을 빼고, 월을 얻을 땐 1을 더하자. ex) 2월을 세팅할 땐, 1월로 집어넣기
         // n월의 마지막날을 얻고 싶으면 n월 0일을 세팅
         var today = new Date(  );
         // 현재 날짜의 시간 얻기
         var hour = today.getHours();
         var minute = today.getMinutes();
         
         if(hour<10){hour="0"+hour}
         if(minute<10){minute="0"+minute}

         daily_business_report_FormObj.find("[name=min_daily_business_hour]").val(hour);
         daily_business_report_FormObj.find("[name=min_daily_business_minute]").val(minute);
         daily_business_report_FormObj.find("[name=max_daily_business_hour]").val(hour);
         daily_business_report_FormObj.find("[name=max_daily_business_minute]").val(minute);
      });

      daily_business_report_FormObj.find("[name$=daily_business_year],[name$=daily_business_month],[name$=daily_business_date]").change(function(){
         //업무일 년,월 검색 조건 입력 양식의 유효성 체크함수 호출
         check_reg_date_daily_business1();
      });
      
      daily_business_report_FormObj.find("[name$=daily_business_hour],[name$=daily_business_minute]").change(function(){
          //업무일 시간,분 검색 조건 입력 양식의 유효성 체크함수 호출
         check_reg_date_daily_business2();
      });
     

      //*************************************************
      // [비움] 글씨를 클릭하면 실행할 구문 설정
      //*************************************************
      
      // 업무일 비움
             daily_business_report_FormObj.find(".empty_daily_business1").click(function(){
           daily_business_report_FormObj.find("[name$=daily_business_year]").val('');
           daily_business_report_FormObj.find("[name$=daily_business_month]").val('');
           daily_business_report_FormObj.find("[name$=daily_business_date]").val('');
        });
      
        // 업무시간 비움
      daily_business_report_FormObj.find(".empty_daily_business2").click(function(){
         daily_business_report_FormObj.find("[name$=daily_business_hour]").val('');
         daily_business_report_FormObj.find("[name$=daily_business_minute]").val('');
        });

      // 업무분야 비움
      daily_business_report_FormObj.find(".empty_daily_business_field").click(function(){
         daily_business_report_FormObj.find("[name=daily_business_field]").prop("checked",false);
        });
      

      // 키워드 비움
         daily_business_report_FormObj.find(".empty_keyword").click(function(){
         daily_business_report_FormObj.find("[name^=keyword]").val('');
         daily_business_report_FormObj.find("[name=or_and]").val('');
         
        });
      
      //*************************************************
      // name=sort_multi를 가진 입력 양식에 change 이벤트가 발생하면 실행할 코드 설정하기
      //*************************************************
      daily_business_report_FormObj.find("[name=sort_multi]").change(function(){
          // 멀티 정렬 데이터 가져오기
          var sort_multi = daily_business_report_FormObj.find("[name=sort_multi]").val();
          // 멀티 정렬 데이터가 있으면 name=sort를 가진 hidden 태그에 값을 저장
          if(sort_multi!=""){
             daily_business_report_FormObj.find("[name=sort]").val(sort_multi);
          }
          daily_business_report_FormCheck();
      });
      


      //************************************************* 
      // 초기화 후 모두검색 버튼에 클릭 이벤트 시 실행할 구문 (미완) 정렬과 행보기 지워지기 제외시켜야함
      //************************************************
      daily_business_report_FormObj.find(".searchAll").click(function(){
      
        // 검색 조건 관련 입력 양식의 데이터를 비우거나 체크를 풀기
        // <주의> name=selectPageNo, name=rowCntPerPage를 가진 입력 양식은 제외
        daily_business_report_FormObj.find("[name$=daily_business_year]").val('');
        daily_business_report_FormObj.find("[name$=daily_business_month]").val('');
        daily_business_report_FormObj.find("[name$=daily_business_date]").val('');
        daily_business_report_FormObj.find("[name$=daily_business_hour]").val('');
        daily_business_report_FormObj.find("[name$=daily_business_minute]").val('');
        daily_business_report_FormObj.find("[name^=keyword]").val('');
        daily_business_report_FormObj.find("[name=or_and]").val('');
        daily_business_report_FormObj.find("[name=daily_business_field]").prop("checked",false);
        daily_business_report_FormObj.find("[name=is_daily_business_finish]").prop("checked",false);
        daily_business_report_FormObj.find("[name=sort_multi]").val('');
        daily_business_report_FormObj.find("[name=sort]").val('');
      
        daily_business_report_FormCheck();
      });
        
         daily_business_report_FormObj.find("[name=min_daily_business_year]").val('${param.min_daily_business_year}');
         daily_business_report_FormObj.find("[name=max_daily_business_year]").val('${param.max_daily_business_year}');
         daily_business_report_FormObj.find("[name=min_daily_business_month]").val('${param.min_daily_business_month}');
         daily_business_report_FormObj.find("[name=max_daily_business_month]").val('${param.max_daily_business_month}');
         daily_business_report_FormObj.find("[name=min_daily_business_date]").val('${param.min_daily_business_date}');
         daily_business_report_FormObj.find("[name=max_daily_business_date]").val('${param.max_daily_business_date}');
         daily_business_report_FormObj.find("[name=min_daily_business_hour]").val('${param.min_daily_business_hour}');
         daily_business_report_FormObj.find("[name=min_daily_business_minute]").val('${param.min_daily_business_minute}');
         daily_business_report_FormObj.find("[name=max_daily_business_hour]").val('${param.max_daily_business_hour}');
         daily_business_report_FormObj.find("[name=max_daily_business_minute]").val('${param.max_daily_business_minute}');
         
         <c:forEach var="daily_business_field" items="${paramValues.daily_business_field}">
            daily_business_report_FormObj.find("[name=daily_business_field]").filter("[value=${daily_business_field}]").attr("checked",true);
         </c:forEach>
         
         <c:forEach var="is_daily_business_finish" items="${paramValues.is_daily_business_finish}">
            daily_business_report_FormObj.find("[name=is_daily_business_finish]").filter("[value=${is_daily_business_finish}]").attr("checked",true);
         </c:forEach>
         
         daily_business_report_FormObj.find("[name=sort]").val('${param.sort}');
         daily_business_report_FormObj.find("[name=sort_multi]").val('${param.sort_multi}');
         daily_business_report_FormObj.find("[name=keyword1]").val('${param.keyword1}');
         daily_business_report_FormObj.find("[name=keyword2]").val('${param.keyword2}');
         daily_business_report_FormObj.find("[name=or_and]").val(${empty param.or_and?3:param.or_and});
         daily_business_report_FormObj.find("[name=selectPageNo]").val('${dailyListDTO.selectPageNo}');
         daily_business_report_FormObj.find("[name=rowCntPerPage]").val('${dailyListDTO.rowCntPerPage}');


      });

//----------------------------------------------------------------------------------------------------- 

      
      function goDaily_business_report_reg_form( ){
         //name=businessRegForm 을 가진 form 태그 안의 action에 설정된 url로 이동하기 
         //이동 시 form 태그 안의 모든 입력양식이 파라미터값으로 전송된다.
         document.dailyBusinessRegForm.submit();
      }


      // 검색 눌렀을 때 입력 여부 확인 경고문 띄우기
      function daily_business_report_FormCheck( ){
   
       // 키워드 앞칸과 뒷칸 내용 중복 금지
          var daily_business_report_FormObj = $("[name=daily_business_report]");
          if ( daily_business_report_FormObj.find("[name=keyword1]").val() !="" && daily_business_report_FormObj.find("[name=keyword2]").val() !=""  ){
             if( daily_business_report_FormObj.find("[name=keyword1]").val() == daily_business_report_FormObj.find("[name=keyword2]").val() ){
                 alert("키워드 입력란의 내용이 중복되었습니다.");
                 daily_business_report_FormObj.find("[name=keyword1]").val("");
                 daily_business_report_FormObj.find("[name=keyword2]").val("");
                 return;
             }
             
             if(daily_business_report_FormObj.find("[name=or_and]").val()=="3"){
              	alert("검색 키워드의 검색조건 (or 또는 and)을 선택해주십시오.");
              	return;
              }
          }


         // 키워드 앞 칸을 비고 뒤에 먼저 쓰지 않게 하기
         var daily_business_report_FormObj = $("[name=daily_business_report]");
         if ( daily_business_report_FormObj.find("[name=keyword1]").val() =="" && daily_business_report_FormObj.find("[name=keyword2]").val() !=""  ){
             alert("키워드 첫번째 입력란은 비워둘 수 없습니다.");
             daily_business_report_FormObj.find("[name=keyword2]").val("");
             return;
         }
         
         // 키워드 첫 칸에 첫 글자가 공백 불가, 최소 1글자 쓰기
         var keyword1 = $("[name=keyword1]").val();
         if ( daily_business_report_FormObj.find("[name=keyword1]").val() !="" ){
           if ( new RegExp(/^[가-힣a-zA-Z0-9][가-힣a-zA-Z0-9 ]{0,20}$/).test(keyword1)==false  ){
               alert("첫 글자 공백 불가, 최소 한 글자 작성요망");
               daily_business_report_FormObj.find("[name=keyword1]").val("");
               return;
            }
         }

         document.daily_business_report.submit();
         
      }



      // 반전 선택 
      function reverseChecked(classV){
         var obj1 = $('.'+classV+":checked");
         var obj2 = $('.'+classV+":not(:checked)");
         obj1.prop("checked",false);
         obj2.prop("checked",true);   
      }


    //------------------------------------------------------------------------
   // 월보다 년도 먼저 선택하게함.
      function check_reg_date_daily_business1(){
         var daily_business_report_FormObj=$("[name=daily_business_report]");
         //----------------------------------
         var min_reg_year = daily_business_report_FormObj.find("[name=min_daily_business_year]").val( );
         var min_reg_month = daily_business_report_FormObj.find("[name=min_daily_business_month]").val( );
         var min_reg_date = daily_business_report_FormObj.find("[name=min_daily_business_date]").val( );
         var max_reg_year = daily_business_report_FormObj.find("[name=max_daily_business_year]").val( );
         var max_reg_month = daily_business_report_FormObj.find("[name=max_daily_business_month]").val( );
         var max_reg_date = daily_business_report_FormObj.find("[name=max_daily_business_date]").val( );
         
         
         //---------------------------------- 
         //년도 먼저 설정
         //----------------------------------
            if ( (min_reg_year=="" || min_reg_year.length==0) && (min_reg_month !="" && min_reg_month.length>0) )
            {   alert("왼쪽 년도를 먼저 선택해야 합니다.");
               daily_business_report_FormObj.find("[name=min_daily_business_month]").val( "" );
               return;
            }

            if ((min_reg_year=="" || min_reg_year.length==0) && (min_reg_date !="" && min_reg_date.length>0) )
            {   alert("왼쪽 년도를 먼저 선택해야 합니다.");
               daily_business_report_FormObj.find("[name=min_daily_business_date]").val( "" );
               return;
            }

          if ( (min_reg_month=="" || min_reg_month.length==0) && (min_reg_date !="" && min_reg_date.length>0) )
            {   alert("왼쪽 월을 먼저 선택해야 합니다.");
               daily_business_report_FormObj.find("[name=min_daily_business_date]").val( "" );
               return;
            } 

      
            if ( (max_reg_year=="" || max_reg_year.length==0) && (max_reg_month !="" && max_reg_month.length>0) )
            {   alert("왼쪽 년도를 먼저 선택해야 합니다.");
               daily_business_report_FormObj.find("[name=max_daily_business_month]").val( "" );
               return;
            }
  
            if ((max_reg_year=="" || max_reg_year.length==0) && (max_reg_date !="" && max_reg_date.length>0) )
            {   alert("왼쪽 년도를 먼저 선택해야 합니다.");
               daily_business_report_FormObj.find("[name=max_daily_business_date]").val( "" );
               return;
            }

            if ((max_reg_month=="" || max_reg_month.length==0) && (max_reg_date !="" && max_reg_date.length>0) )
            {   alert("왼쪽 월을 먼저 선택해야 합니다.");
               daily_business_report_FormObj.find("[name=max_daily_business_date]").val( "" );
               return;
            }
          

         
         //----------------------------------
         if(  (min_reg_year!=null && min_reg_year.length>0)  && (min_reg_month==null || min_reg_month.length==0) ){
            daily_business_report_FormObj.find("[name=min_daily_business_month]").val( "01" );
            min_reg_month = "01";
         }
         if(  (max_reg_year!=null && max_reg_year.length>0)  && (max_reg_month==null || max_reg_month.length==0) ){
            daily_business_report_FormObj.find("[name=max_daily_business_month]").val( "12" );
            max_reg_month = "12";
         }
         if(  (min_reg_year!=null && min_reg_year.length>0)  && (min_reg_date==null || min_reg_date.length==0) ){
             daily_business_report_FormObj.find("[name=min_daily_business_date]").val( "01" );
             min_reg_month = "01";
          }
          if(  (max_reg_year!=null && max_reg_year.length>0)  && (max_reg_date==null || max_reg_date.length==0) ){
             daily_business_report_FormObj.find("[name=max_daily_business_date]").val( "31" );
             max_reg_month = "31";
          } 
         //----------------------------------
         
      if( (min_reg_year!=null && min_reg_year.length>0) && (min_reg_month!=null && min_reg_month.length>0)
          && (max_reg_year!=null && max_reg_year.length>0) &&  (max_reg_month!=null && max_reg_month.length>0) ){

          var max_date = daily_business_report_FormObj.find("[name=max_daily_business_year]").val(  )+daily_business_report_FormObj.find("[name=max_daily_business_month]").val(  )
                         +daily_business_report_FormObj.find("[name=max_daily_business_date]").val(  );
          var min_date = daily_business_report_FormObj.find("[name=min_daily_business_year]").val(  )+daily_business_report_FormObj.find("[name=min_daily_business_month]").val(  )
                         +daily_business_report_FormObj.find("[name=min_daily_business_date]").val(  );
             if( parseInt(max_date,10) < parseInt(min_date,10) ) {
               alert("[최소 년월]이 [최대 년월] 보다 큽니다. 재 선택 바람!");
               daily_business_report_FormObj.find("[name$=daily_business_year]").val("");
               daily_business_report_FormObj.find("[name$=daily_business_month]").val("");
              daily_business_report_FormObj.find("[name$=daily_business_date]").val("");
               return;
            } 
         }
      }


      function check_reg_date_daily_business2(){
          var daily_business_report_FormObj=$("[name=daily_business_report]");
          //----------------------------------
          var min_reg_year1 = daily_business_report_FormObj.find("[name=min_daily_business_hour]").val( );
          var min_reg_month1 = daily_business_report_FormObj.find("[name=min_daily_business_minute]").val( );
          var max_reg_year1 = daily_business_report_FormObj.find("[name=max_daily_business_hour]").val( );
          var max_reg_month1 = daily_business_report_FormObj.find("[name=max_daily_business_minute]").val( );
          //----------------------------------
          if( (min_reg_year1==null || min_reg_year1.length==0) && (min_reg_month1!=null && min_reg_month1.length>0) ){
           alert("왼쪽 시간을 먼저 선택해야 합니다.");
           daily_business_report_FormObj.find("[name=min_daily_business_minute]").val( "" );
           return;
          }
          
          if( (max_reg_year1==null || max_reg_year1.length==0) && (max_reg_month1!=null && max_reg_month1.length>0) ){
           alert("왼쪽 시간을 먼저 선택해야 합니다.");
           daily_business_report_FormObj.find("[name=max_daily_business_minute]").val( "" );
           return;
          }
          
          //----------------------------------
          
          if( (min_reg_year1!=null && min_reg_year1.length>0) && (min_reg_month1!=null && min_reg_month1.length>0)
           && (max_reg_year1!=null && max_reg_year1.length>0) &&  (max_reg_month1!=null && max_reg_month1.length>0) ){
              var max_date1 = daily_business_report_FormObj.find("[name=max_daily_business_hour]").val(  )+daily_business_report_FormObj.find("[name=max_daily_business_minute]").val(  );
              var min_date1 = daily_business_report_FormObj.find("[name=min_daily_business_hour]").val(  )+daily_business_report_FormObj.find("[name=min_daily_business_minute]").val(  );
              if( parseInt(max_date1,10) - parseInt(min_date1,10) < 0 ) {
                alert("[최소 시간]이 [최대 시간] 보다 큽니다. 재 선택 바람!");
                daily_business_report_FormObj.find("[name$=daily_business_minute]").val("");
                daily_business_report_FormObj.find("[name$=daily_business_hour]").val("");
                return;
             }
          }
       }

      


      //확인요망
      function goDailyBusinessContentForm(report_no , writer  ){
       
         $("[name=dailyBusinessContentForm] [name=report_no]").val(report_no);
         $("[name=dailyBusinessContentForm] [name=writer]").val(writer);
         document.dailyBusinessContentForm.submit(); 
      }


      
      
      

   </script>





   
      
      
   <body><center>
   <br><br>
       <form name="daily_business_report" method="post" action="/pro/dailyList.do">
         <table width=800>
         <tr>
            <th class="color_list1" align=center height=35>[일일 업무일지 검색]
          <tr>
        	<th><table class="tbcss3" width=800>
            <th class="th_1" width=80 align=center>업무일</th>
            <td align=left class="search_td">&nbsp;&nbsp;
               <select name = "min_daily_business_year"> 
          <option value="">
            <script>
               for (var i=1990; i<=new Date().getFullYear()+1 ; i++ )
               {   document.write("<option value="+i+">"+i);
               }
            </script> 
          </select>&nbsp;년
          <select name = "min_daily_business_month" >
          <option value="">
            <script>
               for (var i=1; i<=12 ; i++ )
               {   var m = (i<10)?"0"+i:i;
                 document.write("<option value="+m+">"+m);
               }
            </script>
          </select>&nbsp;&nbsp;월&nbsp;&nbsp;
          <select name="min_daily_business_date" >
              <option value="">
                <script>
                    for (var i=1; i<=31 ; i++ )
                    {   var m = (i<10)?"0"+i:i;
                     document.write("<option value="+m+">"+m);
                    }
                </script>
            </select>&nbsp;&nbsp;일&nbsp;&nbsp;~&nbsp;&nbsp; 
          <select name = "max_daily_business_year"> 
          <option value="">
            <script>
               for (var i=1990; i<=new Date().getFullYear()+1 ; i++ )
               {   document.write("<option value="+i+">"+i);
               }
            </script> 
          </select>&nbsp;년
          <select name = "max_daily_business_month">
          <option value="">
            <script>
               for (var i=1; i<=12 ; i++ )
               {   var m = (i<10)?"0"+i:i;
                 document.write("<option value="+m+">"+m);
               }
            </script>
          </select>&nbsp;&nbsp;월
           <select name="max_daily_business_date" >
              <option value="">
                <script>
                    for (var i=1; i<=31 ; i++ )
                    {   var m = (i<10)?"0"+i:i;
                     document.write("<option value="+m+">"+m);
                    }
                </script>
            </select>&nbsp;&nbsp;일&nbsp; 
            <span style="cursor:pointer" class="empty_daily_business1">[비움]</span>
            <span style="cursor:pointer" class="to_today">[오늘로]</span>
            </td>
          </tr>

          <tr>
          <th  class="th_2" width=80 align=center>업무시간</th>
            <td align="left">&nbsp;&nbsp;
            <select name="min_daily_business_hour">
              <option value="">
                <script>
                   for (var i=1; i<=23 ; i++ )
                   {   var m = (i<10)?"0"+i:i;
                    document.write("<option value="+m+">"+m);
                   }
                </script>
            </select>&nbsp;&nbsp;시&nbsp;
          <select name="min_daily_business_minute">
              <option value="">
                <script>
                   for (var i=0; i<=59 ; i++ )
                   {   var m = (i<10)?"0"+i:i;
                    document.write("<option value="+m+">"+m);
                   }
                </script>
             </select>&nbsp;&nbsp;분&nbsp;&nbsp;~&nbsp;&nbsp;
          <select name="max_daily_business_hour">
              <option value="">
                <script>
                   for (var i=1; i<=23 ; i++ )
                   {   var m = (i<10)?"0"+i:i;
                    document.write("<option value="+m+">"+m);
                   }
                </script>
            </select>&nbsp;&nbsp;시&nbsp;
       <select name="max_daily_business_minute">
              <option value="">
                <script>
                   for (var i=0; i<=59 ; i++ )
                   {   var m = (i<10)?"0"+i:i;
                    document.write("<option value="+m+">"+m);
                   }
                </script>
             </select>&nbsp;&nbsp;분&nbsp;
            <span style="cursor:pointer" class="empty_daily_business2">[비움]</span>
            <span style="cursor:pointer" class="to_today1">[현재시간으로]</span>
            </td>
          </tr>
          <tr>
          <th class="th_1" width=80 align=center>업무분야</th>
            <td align="left" class="search_td">&nbsp;
               <input type="checkbox" name="daily_business_field" value=1 class="daily_business_field arrange">행정
               <input type="checkbox" name="daily_business_field" value=2 class="daily_business_field arrange">사무
               <input type="checkbox" name="daily_business_field" value=3 class="daily_business_field arrange">구매
               <input type="checkbox" name="daily_business_field" value=4 class="daily_business_field arrange">접대 
               <input type="checkbox" name="daily_business_field" value=5 class="daily_business_field arrange">회계 
               <input type="checkbox" name="daily_business_field" value=6 class="daily_business_field arrange">기타&nbsp;&nbsp;
            <span style="cursor:pointer" onclick="reverseChecked('daily_business_field');">[반전선택]</span>&nbsp;&nbsp;&nbsp;
            <span style="cursor:pointer" class="empty_daily_business_field">[비움]</span>
            </td>
          </tr>
           <tr>
          <th class="th_2" width=80 align=center>업무완료여부</th>
            <td>&nbsp;
               <input type="checkbox" name="is_daily_business_finish" value=1 class="is_daily_business_finish arrange">완료 
               <input type="checkbox" name="is_daily_business_finish" value=0 class="is_daily_business_finish arrange">미완료&nbsp;&nbsp;

            </td>
          </tr>
          <tr>
            <th class="th_1" width=80 align=center>키워드</th>
            <td align="left" class="search_td">&nbsp;&nbsp;
               <input type="text" name="keyword1" size=20 maxlength=30>&nbsp;
               <select name="or_and" class="or_and" value="keyword">
                  <option value=3 >선택요망</option>
                 <option value=1>or</option>
                 <option value=2>and</option>
               </select>&nbsp;
               <input type="text" name="keyword2" size=20 maxlength=30>&nbsp;&nbsp;&nbsp;
            <span style="cursor:pointer" class="empty_keyword">[비움]</span>
            </td>
          </tr>
          
        </table>
       
       
       </th>
     
         </tr>
         </table>

      </table>




      
      
   <BR>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
   		&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
        <span class="btn btn1" style="cursor:pointer;width:50px;" onclick="daily_business_report_FormCheck( )">검색</span>&nbsp;
        <span class="searchAll btn btn1" onclick="daily_business_report_FormCheck();">초기화 후 모두검색</span>&nbsp;&nbsp;
       &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
       &emsp;&emsp;&emsp;&emsp;&nbsp;&nbsp;
        <span style="cursor:pointer" onclick="goDaily_business_report_reg_form()"><b>[일일 업무일지 등록]</b></span>
        <div style="height:50px"></div>   
 
        <span>[다중 정렬] : 
        <select name="sort_multi" >
         <option value=""></option>              
         <option value="6 desc, 7 asc">날짜 내림>완료여부 오름</option>
         <option value="6 desc, 7 desc">날짜 내림>완료여부 내림</option>
         <option value="6 asc, 7 asc">날짜 오름>완료여부 오름</option>
         <option value="6 asc, 7 desc">날짜 오름>완료여부 내림</option>
        </select>

      &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
      &emsp;&emsp;&emsp;&emsp;&nbsp;
            
            <!----------------------------------->
            <!-- 검색 결과물의 개수가 1개 이상일 경우 페이징 처리 관련 html 출력-->
            <!----------------------------------->
            <c:if test="${dailyListAllCnt>0}">
               <!-- 만약 [시작페이지 번호]가 [화면당 보이는 페이지 번호 개수]보다 크면-->
               <!-- [처음], [이전] 글씨 보이게 하고, 클릭하면 원하는 페이지번호를 hidden 입력 양식에 담고-->
               <!-- 현재 페이지로 다시 이동하기-->
               <c:if test="${pageingData.beginPageNo>pageingData.pageNoCntPerPage}">
                  <a href="javascript:$('[name=selectPageNo]').val('1');daily_business_report_FormCheck();">[처음] </a>
                  <a href="javascript:$('[name=selectPageNo]').val('${pageingData.beginPageNo-1}');daily_business_report_FormCheck();">[이전]  </a>
               </c:if>
               <!-- [시작페이지 번호]부터 [마지막 페이지 번호]까지 페이지번호를 출력하기-->
               <!-- 선택된 페이지 번호는 번호만 출력하고 클릭하지 못하게 하고-->
               <!-- 선택 안된 페이지 번호는 대괄호로 감싸 출력하고 클릭하면 원하는 -->
               <!-- 원하는 페이지번호를 hidden 입력 양식에 담고 현재 페이지로 다시 이동하기-->
               <c:forEach var="pageNo" begin="${pageingData.beginPageNo}" end="${pageingData.endPageNo}">
                  <c:if test="${pageingData.selectPageNo!=pageNo}">
                     <a href="javascript:$('[name=selectPageNo]').val('${pageNo}');daily_business_report_FormCheck();">[${pageNo}]</a>
                  </c:if>
                  <c:if test="${pageingData.selectPageNo==pageNo}">
                     ${pageNo}
                  </c:if>
               </c:forEach>
               <!-- 만약면 현재 화면에서 보이는 [끝 페이지 번호]가 [맨 마지막 페이지 번호]보다 작으면-->
               <!-- [다음], [마지막] 글씨 보이게 하고, 클릭하면 원하는 페이지번호를 hidden 입력 양식에 담고-->
               <!-- 현재 페이지로 다시 이동하기-->
               <c:if test="${pageingData.endPageNo<pageingData.lastPageNo}">
                  <a href="javascript:$('[name=selectPageNo]').val('${pageingData.endPageNo+1}');daily_business_report_FormCheck();">  [다음] </a>
                  <a href="javascript:$('[name=selectPageNo]').val('${pageingData.lastPageNo}');daily_business_report_FormCheck();">[마지막] </a>
               </c:if>
            </c:if> 
             
            
            &nbsp;&emsp;&emsp;&emsp;&emsp;&nbsp;&nbsp;&nbsp;&emsp;&emsp;
            &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&nbsp;
            &emsp;&emsp;&emsp;&emsp;&nbsp;&nbsp;&nbsp;
            
           <!--**********************************************-->
            <!--[검색 수] 출력--->
            <!--**********************************************-->
            <font size="2"><b>[검색 개수 : ${dailyListAllCnt}개]</b></font>&nbsp;&nbsp;
            
        <!-- name은 spring에서 가져온대로 했습니다.  -->
         <th ><select name ="rowCntPerPage">
                  <option value="10">10행보기
                  <option value="15">15행보기
                  <option value="20">20행보기
                  <option value="25">25행보기
                  <option value="30">30행보기
             </select>
      
   
            <input type="hidden" name="sort">
            <input type="hidden" name="selectPageNo">
            <input type="hidden" name="company_no" value="${sessionScope.company_no}">
            <input type="hidden" name="company_emp_no" value="${sessionScope.company_emp_no}">
            
      </form>
      <br><br>
      
      <!-- -------------------------------------- -->
      <!-- 페이징 번호 출력 -->
      <!-- -------------------------------------- -->
      <table>
      <table class="tbcss2 dailyBusinessList" width="1000">
     <th class="color_list_left">번호
      <c:choose>
         <c:when test="${param.sort=='dbr.emp_no desc'}">
            <th style="cursor:pointer"
               onclick="$('[name=sort_multi]').val('');$('[name=sort]').val( 'dbr.emp_no asc' );daily_business_report_FormCheck();" class="color_list">▼작성자
         </c:when>
         <c:when test="${param.sort=='dbr.emp_no asc'}">
            <th style="cursor:pointer"
               onclick="$('[name=sort_multi]').val('');$('[name=sort]').val('dbr.emp_no desc');daily_business_report_FormCheck();" class="color_list">▲작성자
         </c:when>
         <c:otherwise>
            <th style="cursor:pointer"
               onclick="$('[name=sort_multi]').val('');$('[name=sort]').val('dbr.emp_no asc');daily_business_report_FormCheck();" class="color_list">작성자
         </c:otherwise>
      </c:choose>
      <!------------------------------------->
      <c:choose>
         <c:when test="${param.sort=='cbt.busi_type_name desc'}">
            <th style="cursor:pointer"
               onclick="$('[name=sort_multi]').val('');$('[name=sort]').val('cbt.busi_type_name asc');daily_business_report_FormCheck();" class="color_list">▼업무분야
         </c:when>
         <c:when test="${param.sort=='cbt.busi_type_name asc'}">
            <th style="cursor:pointer"
               onclick="$('[name=sort_multi]').val('');$('[name=sort]').val('cbt.busi_type_name desc');daily_business_report_FormCheck();" class="color_list">▲업무분야
         </c:when>
         <c:otherwise>
            <th style="cursor:pointer"
               onclick="$('[name=sort_multi]').val('');$('[name=sort]').val('cbt.busi_type_name asc');daily_business_report_FormCheck();" class="color_list">업무분야
         </c:otherwise>
      </c:choose>
      <!------------------------------------->
      <c:choose>
         <c:when test="${param.sort=='dbr.busi_content desc'}">
            <th style="cursor:pointer"
               onclick="$('[name=sort_multi]').val('');$('[name=sort]').val('dbr.busi_content asc');daily_business_report_FormCheck();" class="color_list">▼업무내용
         </c:when>
         <c:when test="${param.sort=='dbr.busi_content asc'}">
            <th style="cursor:pointer"
               onclick="$('[name=sort_multi]').val('');$('[name=sort]').val('dbr.busi_content desc');daily_business_report_FormCheck();" class="color_list">▲업무내용
               </c:when>
         <c:otherwise>
            <th style="cursor:pointer"
               onclick="$('[name=sort_multi]').val('');$('[name=sort]').val('dbr.busi_content asc');daily_business_report_FormCheck();" class="color_list">업무내용
         </c:otherwise>
      </c:choose>
      <!------------------------------------->
      <c:choose>
         <c:when test="${param.sort=='dbr.busi_start_date desc'}">
            <th style="cursor:pointer"
               onclick="$('[name=sort_multi]').val('');$('[name=sort]').val('dbr.busi_start_date asc');daily_business_report_FormCheck();" class="color_list">▼날짜
         </c:when>
         <c:when test="${param.sort=='dbr.busi_start_date asc'}">
            <th style="cursor:pointer"
               onclick="$('[name=sort_multi]').val('');$('[name=sort]').val('dbr.busi_start_date desc');daily_business_report_FormCheck();" class="color_list">▲날짜
         </c:when>
         <c:otherwise>
            <th style="cursor:pointer"
               onclick="$('[name=sort_multi]').val('');$('[name=sort]').val('dbr.busi_start_date asc');daily_business_report_FormCheck();" class="color_list">날짜
         </c:otherwise>
      </c:choose>
      <!------------------------------------->
      <c:choose>
         <c:when test="${param.sort=='dbr.fin_state desc'}">
            <th style="cursor:pointer"
               onclick="$('[name=sort_multi]').val('');$('[name=sort]').val('dbr.fin_state asc');daily_business_report_FormCheck();" class="color_list_right">▼완료여부
         </c:when>
         <c:when test="${param.sort=='dbr.fin_state asc'}">
            <th style="cursor:pointer"
               onclick="$('[name=sort_multi]').val('');$('[name=sort]').val('dbr.fin_state desc');daily_business_report_FormCheck();" class="color_list_right">▲완료여부
         </c:when>
         <c:otherwise>
            <th style="cursor:pointer"
               onclick="$('[name=sort_multi]').val('');$('[name=sort]').val('dbr.fin_state asc');daily_business_report_FormCheck();" class="color_list_right">완료여부
         </c:otherwise>
      </c:choose>
      <!------------------------------------->

       
     <c:forEach var="daily_business" items="${dailyList}" varStatus="loopTagStatus"> 
            <tr align=center style="cursor:pointer" onClick="goDailyBusinessContentForm(${daily_business.report_no},${daily_business.writer})">
            <td>${pageingData.beginRowNo_desc-loopTagStatus.index}
            <td align=center>
               ${daily_business.writer_name}
            <td>${daily_business.daily_business_field}
            <td>${daily_business.daily_business_content}
            <td>${daily_business.busi_date}
            <td>${daily_business.is_daily_business_finish}
   </c:forEach>
   
      </table>
      
      
   <c:if test="${empty dailyList}">
     <br>
      <b>검색 조건에 맞는 결과가 없습니다.</b><br>
   </c:if>
      
      
      <c:set  value="${selectPageNo}" var = "selectPageNo"/> 
      

      <form name="dailyBusinessRegForm" method="post" action ="/pro/daily_business_log_reg_form.do">
          <input type="hidden" name="selectPageNo">
      </form>
      
      
      <form name="dailyBusinessContentForm" method="post" action ="/pro/daily_business_log_upDel_form.do">
      <!-- [보고서 고유번호] 가 저장되는 hidden 입력양식 선언 -->
         <input type="hidden" name="report_no" value="">
         <input type="hidden" name="selectPageNo" value="">
         <input type="hidden" name="writer" value="">
      </form>
      


   </body><br><br>
   


</HTML>


  