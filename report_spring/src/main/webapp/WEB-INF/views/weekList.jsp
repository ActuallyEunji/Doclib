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
    $(".weekBusinessList").find("tr:eq(0)").nextAll().each(function(){
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
    $(".weekBusinessList").find("tr:eq(0)").nextAll().hover(function(){
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
         week_business_report_FormCheck();
      });
      
      
     
      var week_business_report_FormObj = $("[name=week_business_report]");

      // [오늘로] 글씨를 클릭하면 실행할 구문 설정 (for 업무일)
      week_business_report_FormObj.find(".to_today").click(function(){

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
         week_business_report_FormObj.find("[name=min_week_business_year]").val(year);
         // 현재 날짜의 월을 name=min_reg_month 을 가진 입력양식에 넣어주기
         week_business_report_FormObj.find("[name=min_week_business_month]").val(month);
         //week_business_report_FormObj.find("[name=min_week_business_date]").val(date);
         week_business_report_FormObj.find("[name=max_week_business_year]").val(year);
         // 현재 날짜의 월을 name=min_reg_month 을 가진 입력양식에 넣어주기
         week_business_report_FormObj.find("[name=max_week_business_month]").val(month);
         //week_business_report_FormObj.find("[name=max_week_business_date]").val(date);
      });

      // [현재시간으로] 글씨를 클릭하면 실행할 구문 설정 
      week_business_report_FormObj.find(".to_today1").click(function(){

         // 현재 날짜를 관리하는 Date 객체 생성해서 객체의 메위주를 today라는 변수에 저장.
         // 월을 세팅할 땐 1을 빼고, 월을 얻을 땐 1을 더하자. ex) 2월을 세팅할 땐, 1월로 집어넣기
         // n월의 마지막날을 얻고 싶으면 n월 0일을 세팅
         var today = new Date(  );
         // 현재 날짜의 시간 얻기
         var hour = today.getHours();
         var minute = today.getMinutes();
         
         if(hour<10){hour="0"+hour}
         if(minute<10){minute="0"+minute}

         week_business_report_FormObj.find("[name=min_week_business_hour]").val(hour);
         week_business_report_FormObj.find("[name=min_week_business_minute]").val(minute);
         week_business_report_FormObj.find("[name=max_week_business_hour]").val(hour);
         week_business_report_FormObj.find("[name=max_week_business_minute]").val(minute);
      });

      week_business_report_FormObj.find("[name$=week_business_year],[name$=week_business_month]").change(function(){
         //업무일 년,월 검색 조건 입력 양식의 유효성 체크함수 호출
         check_reg_date_week_business1();
      });
      
      week_business_report_FormObj.find("[name$=week_business_hour],[name$=week_business_minute]").change(function(){
          //업무일 시간,분 검색 조건 입력 양식의 유효성 체크함수 호출
         check_reg_date_week_business2();
      });
     

      //*************************************************
      // [비움] 글씨를 클릭하면 실행할 구문 설정
      //*************************************************
      
     // 업무분야 비움
      week_business_report_FormObj.find(".empty_week_business_field").click(function(){
         week_business_report_FormObj.find("[name=week_business_field]").prop("checked",false);
        });
      
      // 업무일 비움
        week_business_report_FormObj.find(".empty_week_business1").click(function(){
           week_business_report_FormObj.find("[name$=week_business_year]").val('');
           week_business_report_FormObj.find("[name$=week_business_month]").val('');
           //week_business_report_FormObj.find("[name$=week_business_date]").val('');
        });
      
        // 업무시간 비움
      week_business_report_FormObj.find(".empty_week_business2").click(function(){
         week_business_report_FormObj.find("[name$=week_business_hour]").val('');
         week_business_report_FormObj.find("[name$=week_business_minute]").val('');
        });

      // 키워드 비움
      week_business_report_FormObj.find(".empty_keyword").click(function(){
         week_business_report_FormObj.find("[name^=keyword]").val('');
        });
      
      //*************************************************
      // name=sort_multi를 가진 입력 양식에 change 이벤트가 발생하면 실행할 코드 설정하기
      //*************************************************
      week_business_report_FormObj.find("[name=sort_multi]").change(function(){
          // 멀티 정렬 데이터 가져오기
          var sort_multi = week_business_report_FormObj.find("[name=sort_multi]").val();
          // 멀티 정렬 데이터가 있으면 name=sort를 가진 hidden 태그에 값을 저장
          if(sort_multi!=""){
             week_business_report_FormObj.find("[name=sort]").val(sort_multi);
          }
          week_business_report_FormCheck();
      });
      


      //************************************************* 
      // 초기화 후 모두검색 버튼에 클릭 이벤트 시 실행할 구문 (미완) 정렬과 행보기 지워지기 제외시켜야함
      //************************************************
      week_business_report_FormObj.find(".searchAll").click(function(){
      
        // 검색 조건 관련 입력 양식의 데이터를 비우거나 체크를 풀기
        // <주의> name=selectPageNo, name=rowCntPerPage를 가진 입력 양식은 제외
        week_business_report_FormObj.find("[name$=week_business_year]").val('');
        week_business_report_FormObj.find("[name$=week_business_month]").val('');
        week_business_report_FormObj.find("[name$=week_business_hour]").val('');
        week_business_report_FormObj.find("[name$=week_business_minute]").val('');
        week_business_report_FormObj.find("[name^=keyword]").val('');
        week_business_report_FormObj.find("[name=or_and]").val('');
        week_business_report_FormObj.find("[name=week_business_field]").prop("checked",false);
        week_business_report_FormObj.find("[name=is_week_business_finish]").prop("checked",false);
        week_business_report_FormObj.find("[name=sort_multi]").val('');
        week_business_report_FormObj.find("[name=sort]").val('');
      
        week_business_report_FormCheck();
      });
        
         week_business_report_FormObj.find("[name=min_week_business_year]").val('${param.min_week_business_year}');
         week_business_report_FormObj.find("[name=max_week_business_year]").val('${param.max_week_business_year}');
         week_business_report_FormObj.find("[name=min_week_business_month]").val('${param.min_week_business_month}');
         week_business_report_FormObj.find("[name=max_week_business_month]").val('${param.max_week_business_month}');
         week_business_report_FormObj.find("[name=min_week_business_hour]").val('${param.min_week_business_hour}');
         week_business_report_FormObj.find("[name=min_week_business_minute]").val('${param.min_week_business_minute}');
         week_business_report_FormObj.find("[name=max_week_business_hour]").val('${param.max_week_business_hour}');
         week_business_report_FormObj.find("[name=max_week_business_minute]").val('${param.max_week_business_minute}');
         
         <c:forEach var="week_business_field" items="${paramValues.week_business_field}">
            week_business_report_FormObj.find("[name=week_business_field]").filter("[value=${week_business_field}]").attr("checked",true);
         </c:forEach>
         
         <c:forEach var="is_week_business_finish" items="${paramValues.is_week_business_finish}">
	         week_business_report_FormObj.find("[name=is_week_business_finish]").filter("[value=${is_week_business_finish}]").attr("checked",true);
	      </c:forEach>
         
         week_business_report_FormObj.find("[name=sort]").val('${param.sort}');
         week_business_report_FormObj.find("[name=sort_multi]").val('${param.sort_multi}');
         week_business_report_FormObj.find("[name=keyword1]").val('${param.keyword1}');
         week_business_report_FormObj.find("[name=keyword2]").val('${param.keyword2}');
         week_business_report_FormObj.find("[name=or_and]").val(${empty param.or_and?3:param.or_and});
         week_business_report_FormObj.find("[name=selectPageNo]").val('${weekListDTO.selectPageNo}');
         week_business_report_FormObj.find("[name=rowCntPerPage]").val('${weekListDTO.rowCntPerPage}');


      });

//----------------------------------------------------------------------------------------------------- 

      
      function goWeek_business_report_reg_form( ){
         //name=businessRegForm 을 가진 form 태그 안의 action에 설정된 url로 이동하기 
         //이동 시 form 태그 안의 모든 입력양식이 파라미터값으로 전송된다.
         document.weekBusinessRegForm.submit();
      }


      // 검색 눌렀을 때 입력 여부 확인 경고문 띄우기
      function week_business_report_FormCheck( ){
   
       // 키워드 앞칸과 뒷칸 내용 중복 금지
          var week_business_report_FormObj = $("[name=week_business_report]");
          if ( week_business_report_FormObj.find("[name=keyword1]").val() !="" && week_business_report_FormObj.find("[name=keyword2]").val() !=""  ){
             if( week_business_report_FormObj.find("[name=keyword1]").val() == week_business_report_FormObj.find("[name=keyword2]").val() ){
                 alert("키워드 입력란의 내용이 중복되었습니다.");
                 week_business_report_FormObj.find("[name=keyword1]").val("");
                 week_business_report_FormObj.find("[name=keyword2]").val("");
                 return;
             }
             
             if(week_business_report_FormObj.find("[name=or_and]").val()=="3"){
               	alert("검색 키워드의 검색조건 (or 또는 and)을 선택해주십시오.");
               	return;
             }
             
          }


         // 키워드 앞 칸을 비고 뒤에 먼저 쓰지 않게 하기
         var week_business_report_FormObj = $("[name=week_business_report]");
         if ( week_business_report_FormObj.find("[name=keyword1]").val() =="" && week_business_report_FormObj.find("[name=keyword2]").val() !=""  ){
             alert("키워드 첫번째 입력란은 비워둘 수 없습니다.");
             week_business_report_FormObj.find("[name=keyword2]").val("");
             return;
         }
         
         // 키워드 첫 칸에 첫 글자가 공백 불가, 최소 1글자 쓰기
         var keyword1 = $("[name=keyword1]").val();
         if ( week_business_report_FormObj.find("[name=keyword1]").val() !="" ){
           if ( new RegExp(/^[가-힣a-zA-Z0-9][가-힣a-zA-Z0-9 ]{0,20}$/).test(keyword1)==false  ){
               alert("첫 글자 공백 불가, 최소 한 글자 작성요망");
               week_business_report_FormObj.find("[name=keyword1]").val("");
               return;
            }
         }
         

         week_business_report_FormObj.find("[name=or_and]").val(parseInt(week_business_report_FormObj.find("[name=or_and]").val()));
         
         document.week_business_report.submit();
         
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
      function check_reg_date_week_business1(){
         var week_business_report_FormObj=$("[name=week_business_report]");
         //----------------------------------
         var min_reg_year = week_business_report_FormObj.find("[name=min_week_business_year]").val( );
         var min_reg_month = week_business_report_FormObj.find("[name=min_week_business_month]").val( );
         var max_reg_year = week_business_report_FormObj.find("[name=max_week_business_year]").val( );
         var max_reg_month = week_business_report_FormObj.find("[name=max_week_business_month]").val( );
         
         
         //---------------------------------- 
         //년도 먼저 설정
         //----------------------------------
            if ( (min_reg_year=="" || min_reg_year.length==0) && (min_reg_month !="" && min_reg_month.length>0) )
            {   alert("왼쪽 년도를 먼저 선택해야 합니다.");
               week_business_report_FormObj.find("[name=min_week_business_month]").val( "" );
               return;
            }
      
            if ( (max_reg_year=="" || max_reg_year.length==0) && (max_reg_month !="" && max_reg_month.length>0) )
            {   alert("왼쪽 년도를 먼저 선택해야 합니다.");
               week_business_report_FormObj.find("[name=max_week_business_month]").val( "" );
               return;
            }
         
         
         //----------------------------------
         if(  (min_reg_year!=null && min_reg_year.length>0)  && (min_reg_month==null || min_reg_month.length==0) ){
            week_business_report_FormObj.find("[name=min_week_business_month]").val( "01" );
            min_reg_month = "01";
         }
         if(  (max_reg_year!=null && max_reg_year.length>0)  && (max_reg_month==null || max_reg_month.length==0) ){
            week_business_report_FormObj.find("[name=max_week_business_month]").val( "12" );
            max_reg_month = "12";
         }
         //----------------------------------
         
         if( (min_reg_year!=null && min_reg_year.length>0) && (min_reg_month!=null && min_reg_month.length>0)
          && (max_reg_year!=null && max_reg_year.length>0) &&  (max_reg_month!=null && max_reg_month.length>0) ){

          var max_date = week_business_report_FormObj.find("[name=max_week_business_year]").val(  )+week_business_report_FormObj.find("[name=max_week_business_month]").val(  );
          var min_date = week_business_report_FormObj.find("[name=min_week_business_year]").val(  )+week_business_report_FormObj.find("[name=min_week_business_month]").val(  );
             if( parseInt(max_date,10) < parseInt(min_date,10) ) {
               alert("[최소 년월]이 [최대 년월] 보다 큽니다. 재 선택 바람!");
               week_business_report_FormObj.find("[name$=week_business_year]").val("");
               week_business_report_FormObj.find("[name$=week_business_month]").val("");
               return;
            } 
         }
      }


      function check_reg_date_week_business2(){
          var week_business_report_FormObj=$("[name=week_business_report]");
          //----------------------------------
          var min_reg_year1 = week_business_report_FormObj.find("[name=min_week_business_hour]").val( );
          var min_reg_month1 = week_business_report_FormObj.find("[name=min_week_business_minute]").val( );
          var max_reg_year1 = week_business_report_FormObj.find("[name=max_week_business_hour]").val( );
          var max_reg_month1 = week_business_report_FormObj.find("[name=max_week_business_minute]").val( );
          //----------------------------------
          if( (min_reg_year1==null || min_reg_year1.length==0) && (min_reg_month1!=null && min_reg_month1.length>0) ){
           alert("왼쪽 시간을 먼저 선택해야 합니다.");
           week_business_report_FormObj.find("[name=min_week_business_minute]").val( "" );
           return;
          }
          
          if( (max_reg_year1==null || max_reg_year1.length==0) && (max_reg_month1!=null && max_reg_month1.length>0) ){
           alert("왼쪽 시간을 먼저 선택해야 합니다.");
           week_business_report_FormObj.find("[name=max_week_business_minute]").val( "" );
           return;
          }
          
          //----------------------------------
          
          if( (min_reg_year1!=null && min_reg_year1.length>0) && (min_reg_month1!=null && min_reg_month1.length>0)
           && (max_reg_year1!=null && max_reg_year1.length>0) &&  (max_reg_month1!=null && max_reg_month1.length>0) ){
              var max_date1 = week_business_report_FormObj.find("[name=max_week_business_hour]").val(  )+week_business_report_FormObj.find("[name=max_week_business_minute]").val(  );
              var min_date1 = week_business_report_FormObj.find("[name=min_week_business_hour]").val(  )+week_business_report_FormObj.find("[name=min_week_business_minute]").val(  );
              if( parseInt(max_date1,10) - parseInt(min_date1,10) < 0 ) {
                alert("[최소 시간]이 [최대 시간] 보다 큽니다. 재 선택 바람!");
                week_business_report_FormObj.find("[name$=week_business_minute]").val("");
                week_business_report_FormObj.find("[name$=week_business_hour]").val("");
                return;
             }
          }
       }

      


      //확인요망
      function goWeekBusinessContentForm( report_no , writer ){
         $("[name=weekBusinessContentForm] [name=report_no]").val(report_no);
         $("[name=weekBusinessContentForm] [name=writer]").val(writer);
         document.weekBusinessContentForm.submit(); 
      }


      
      
      

   </script>


   
      
      
   <body><center>
   <br><br>
       <form name="week_business_report" method="post" action="/pro/weekList.do">
         <table width=650>
         <tr>
            <th class="color_list1"  align=center height=35>[주간 업무일지 검색]
             <tr>
                <th><table class="tbcss3" width=650>
                <th class="th_1" width=80 align=center>업무분야</th>
               <td align=left class="search_td">&nbsp;
                  <input type="checkbox" name="week_business_field" value=1 class="week_business_field arrange">행정
                  <input type="checkbox" name="week_business_field" value=2 class="week_business_field arrange">사무
                  <input type="checkbox" name="week_business_field" value=3 class="week_business_field arrange">구매
                  <input type="checkbox" name="week_business_field" value=4 class="week_business_field arrange">접대 
                  <input type="checkbox" name="week_business_field" value=5 class="week_business_field arrange">회계 
                  <input type="checkbox" name="week_business_field" value=6 class="week_business_field arrange">기타&nbsp;&nbsp;
                  <span style="cursor:pointer" onclick="reverseChecked('week_business_field');">[반전선택]</span>&nbsp;
                  <span style="cursor:pointer" class="empty_week_business_field">[비움]</span>
               </td>
             </tr>
             <tr>
            <th  class="th_2" width=80 align=center>업무일</th>
            <td align=left>&nbsp;
               <select name = "min_week_business_year"> 
          <option value="">
            <script>
               for (var i=1990; i<=new Date().getFullYear()+1 ; i++ )
               {   document.write("<option value="+i+">"+i);
               }
            </script> 
          </select>&nbsp;년
          <select name = "min_week_business_month" >
          <option value="">
            <script>
               for (var i=1; i<=12 ; i++ )
               {   var m = (i<10)?"0"+i:i;
                 document.write("<option value="+m+">"+m);
               }
            </script>
          </select>&nbsp;&nbsp;월&nbsp;&nbsp;~&nbsp;&nbsp;
          <select name = "max_week_business_year"> 
          <option value="">
            <script>
               for (var i=1990; i<=new Date().getFullYear()+1 ; i++ )
               {   document.write("<option value="+i+">"+i);
               }
            </script> 
          </select>&nbsp;년
          <select name = "max_week_business_month">
          <option value="">
            <script>
               for (var i=1; i<=12 ; i++ )
               {   var m = (i<10)?"0"+i:i;
                 document.write("<option value="+m+">"+m);
               }
            </script>
          </select>&nbsp;&nbsp;월&nbsp;
            <span style="cursor:pointer" class="empty_week_business1">[비움]</span>&nbsp;
            <span style="cursor:pointer" class="to_today">[오늘로]</span>
            </td>
          </tr>

          <tr>
          <th class="th_1" align=center>업무시간</th>
            <td class="search_td" align=left>&nbsp;
            <select name="min_week_business_hour">
              <option value="">
                <script>
                   for (var i=1; i<=23 ; i++ )
                   {   var m = (i<10)?"0"+i:i;
                    document.write("<option value="+m+">"+m);
                   }
                </script>
            </select>&nbsp;&nbsp;시&nbsp;
          <select name="min_week_business_minute">
              <option value="">
                <script>
                   for (var i=0; i<=59 ; i++ )
                   {   var m = (i<10)?"0"+i:i;
                    document.write("<option value="+m+">"+m);
                   }
                </script>
             </select>&nbsp;&nbsp;분&nbsp;&nbsp;~&nbsp;&nbsp;
          <select name="max_week_business_hour">
              <option value="">
                <script>
                   for (var i=1; i<=23 ; i++ )
                   {   var m = (i<10)?"0"+i:i;
                    document.write("<option value="+m+">"+m);
                   }
                </script>
            </select>&nbsp;&nbsp;시&nbsp;
       <select name="max_week_business_minute">
              <option value="">
                <script>
                   for (var i=0; i<=59 ; i++ )
                   {   var m = (i<10)?"0"+i:i;
                    document.write("<option value="+m+">"+m);
                   }
                </script>
             </select>&nbsp;&nbsp;분&nbsp;
            <span style="cursor:pointer" class="empty_week_business2">[비움]</span>&nbsp;
            <span style="cursor:pointer" class="to_today1">[현재시간으로]</span>
            </td>
          </tr>
          <tr>
          	<th align=center class="th_2">완료여부</th>
          	<td align=left>&nbsp;
       			<input type="checkbox" name="is_week_business_finish" value=1>완료&nbsp;&nbsp;
       			<input type="checkbox" name="is_week_business_finish" value=0>미완료
       		</td>
          </tr>
          <tr>
            <th class="th_1" align=center>키워드</th>
            <td class="search_td">&nbsp;
               <input type="text" name="keyword1" size=20 maxlength=30>&nbsp;
               <select name="or_and" class="or_and" value="keyword">
                  <option value=3 >선택요망</option>
                 <option value=1>or</option>
                 <option value=2>and</option>
               </select>&nbsp;
               <input type="text" name="keyword2" size=20 maxlength=30>&nbsp;
            <span style="cursor:pointer" class="empty_keyword">[비움]</span>
            </td>
          </tr>
          
        </table>
       
       
       </th>
     
         </tr>
         </table>

      </table>




      
      
   <BR>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
        <span style="cursor:pointer;width:50px;" onclick="week_business_report_FormCheck( )" class="btn btn1">검색</span>&nbsp;
        <span class="searchAll btn btn1" onclick="week_business_report_FormCheck();">초기화 후 모두 검색</span>&nbsp;&nbsp;
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       &emsp;&emsp;&emsp;
        <span style="cursor:pointer" onclick="goWeek_business_report_reg_form()"><b>[주간 업무일지 등록]</b></span>
        <div style="height:50px"></div>   
 
        <span>[다중 정렬] : 
        <select name="sort_multi" >
         <option value=""></option>              
         <option value="6 desc, 7 asc">업무시간 내림>보고일 오름</option>
         <option value="6 desc, 7 desc">업무시간 내림>보고일 내림</option>
         <option value="6 asc, 7 asc">업무시간 오름>보고일 오름</option>
         <option value="6 asc, 7 desc">업무시간 오름>보고일 내림</option>
        </select>

      &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
      &emsp;&emsp;&emsp;&emsp;&nbsp;
            
            <!----------------------------------->
            <!-- 검색 결과물의 개수가 1개 이상일 경우 페이징 처리 관련 html 출력-->
            <!----------------------------------->
            <c:if test="${weekListAllCnt>0}">
               <!-- 만약 [시작페이지 번호]가 [화면당 보이는 페이지 번호 개수]보다 크면-->
               <!-- [처음], [이전] 글씨 보이게 하고, 클릭하면 원하는 페이지번호를 hidden 입력 양식에 담고-->
               <!-- 현재 페이지로 다시 이동하기-->
               <c:if test="${pageingData.beginPageNo>pageingData.pageNoCntPerPage}">
                  <a href="javascript:$('[name=selectPageNo]').val('1');week_business_report_FormCheck();">[처음] </a>
                  <a href="javascript:$('[name=selectPageNo]').val('${pageingData.beginPageNo-1}');week_business_report_FormCheck();">[이전]  </a>
               </c:if>
               <!-- [시작페이지 번호]부터 [마지막 페이지 번호]까지 페이지번호를 출력하기-->
               <!-- 선택된 페이지 번호는 번호만 출력하고 클릭하지 못하게 하고-->
               <!-- 선택 안된 페이지 번호는 대괄호로 감싸 출력하고 클릭하면 원하는 -->
               <!-- 원하는 페이지번호를 hidden 입력 양식에 담고 현재 페이지로 다시 이동하기-->
               <c:forEach var="pageNo" begin="${pageingData.beginPageNo}" end="${pageingData.endPageNo}">
                  <c:if test="${pageingData.selectPageNo!=pageNo}">
                     <a href="javascript:$('[name=selectPageNo]').val('${pageNo}');week_business_report_FormCheck();">[${pageNo}]</a>
                  </c:if>
                  <c:if test="${pageingData.selectPageNo==pageNo}">
                     ${pageNo}
                  </c:if>
               </c:forEach>
               <!-- 만약면 현재 화면에서 보이는 [끝 페이지 번호]가 [맨 마지막 페이지 번호]보다 작으면-->
               <!-- [다음], [마지막] 글씨 보이게 하고, 클릭하면 원하는 페이지번호를 hidden 입력 양식에 담고-->
               <!-- 현재 페이지로 다시 이동하기-->
               <c:if test="${pageingData.endPageNo<pageingData.lastPageNo}">
                  <a href="javascript:$('[name=selectPageNo]').val('${pageingData.endPageNo+1}');week_business_report_FormCheck();">  [다음] </a>
                  <a href="javascript:$('[name=selectPageNo]').val('${pageingData.lastPageNo}');week_business_report_FormCheck();">[마지막] </a>
               </c:if>
            </c:if> 
             
            
            &nbsp;&emsp;&emsp;&emsp;&emsp;&nbsp;&nbsp;&nbsp;&emsp;&emsp;
            &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&nbsp;
            &emsp;&emsp;&emsp;&emsp;&nbsp;&nbsp;&nbsp;
            
           <!--**********************************************-->
            <!--[검색 수] 출력--->
            <!--**********************************************-->
            <font size="2"><b>[검색 개수 : ${weekListAllCnt}개]</b></font>&nbsp;&nbsp;
            
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
      <table class="tbcss2 weekBusinessList" width="1000">
     <th class="color_list_left">번호
      <c:choose>
         <c:when test="${param.sort=='&quot;writer_name&quot; desc'}">
            <th style="cursor:pointer"
               onclick="$('[name=sort_multi]').val('');$('[name=sort]').val( '&quot;writer_name&quot; asc' );week_business_report_FormCheck();" class="color_list">▼작성자
         </c:when>
         <c:when test="${param.sort=='&quot;writer_name&quot; asc'}">
            <th style="cursor:pointer"
               onclick="$('[name=sort_multi]').val('');$('[name=sort]').val('&quot;writer_name&quot; desc');week_business_report_FormCheck();" class="color_list">▲작성자
         </c:when>
         <c:otherwise>
            <th style="cursor:pointer"
               onclick="$('[name=sort_multi]').val('');$('[name=sort]').val('&quot;writer_name&quot; asc');week_business_report_FormCheck();" class="color_list">작성자
         </c:otherwise>
      </c:choose>
      <!------------------------------------->
      <c:choose>
         <c:when test="${param.sort=='&quot;week_business_field&quot; desc'}">
            <th style="cursor:pointer"
               onclick="$('[name=sort_multi]').val('');$('[name=sort]').val('&quot;week_business_field&quot; asc');week_business_report_FormCheck();" class="color_list">▼업무분야
         </c:when>
         <c:when test="${param.sort=='&quot;week_business_field&quot; asc'}">
            <th style="cursor:pointer"
               onclick="$('[name=sort_multi]').val('');$('[name=sort]').val('&quot;week_business_field&quot; desc');week_business_report_FormCheck();" class="color_list">▲업무분야
         </c:when>
         <c:otherwise>
            <th style="cursor:pointer"
               onclick="$('[name=sort_multi]').val('');$('[name=sort]').val('&quot;week_business_field&quot; asc');week_business_report_FormCheck();" class="color_list">업무분야
         </c:otherwise>
      </c:choose>
      <!------------------------------------->
      <c:choose>
         <c:when test="${param.sort=='&quot;week_business_content&quot; desc'}">
            <th style="cursor:pointer"
               onclick="$('[name=sort_multi]').val('');$('[name=sort]').val('&quot;week_business_content&quot; asc');week_business_report_FormCheck();" class="color_list">▼업무내용
         </c:when>
         <c:when test="${param.sort=='&quot;week_business_content&quot; asc'}">
            <th style="cursor:pointer"
               onclick="$('[name=sort_multi]').val('');$('[name=sort]').val('&quot;week_business_content&quot; desc');week_business_report_FormCheck();" class="color_list">▲업무내용
         </c:when>
         <c:otherwise>
            <th style="cursor:pointer"
               onclick="$('[name=sort_multi]').val('');$('[name=sort]').val('&quot;week_business_content&quot; asc');week_business_report_FormCheck();" class="color_list">업무내용
         </c:otherwise>
      </c:choose>
            <!------------------------------------->
      <c:choose>
         <c:when test="${param.sort=='&quot;week_business_date&quot; desc'}">
            <th style="cursor:pointer"
               onclick="$('[name=sort_multi]').val('');$('[name=sort]').val('&quot;week_business_date&quot; asc');week_business_report_FormCheck();" class="color_list">▼업무시간
         </c:when>
         <c:when test="${param.sort=='&quot;week_business_date&quot; asc'}">
            <th style="cursor:pointer"
               onclick="$('[name=sort_multi]').val('');$('[name=sort]').val('&quot;week_business_date&quot; desc');week_business_report_FormCheck();" class="color_list">▲업무시간
         </c:when>
         <c:otherwise>
            <th style="cursor:pointer"
               onclick="$('[name=sort_multi]').val('');$('[name=sort]').val('&quot;week_business_date&quot; asc');week_business_report_FormCheck();" class="color_list">업무시간
         </c:otherwise>
      </c:choose>
      <!------------------------------------->
      <c:choose>
         <c:when test="${param.sort=='&quot;report_date&quot; desc'}">
            <th style="cursor:pointer"
               onclick="$('[name=sort_multi]').val('');$('[name=sort]').val('&quot;report_date&quot; asc');week_business_report_FormCheck();" class="color_list">▼보고일
         </c:when>
         <c:when test="${param.sort=='&quot;report_date&quot; asc'}">
            <th style="cursor:pointer"
               onclick="$('[name=sort_multi]').val('');$('[name=sort]').val('&quot;report_date&quot; desc');week_business_report_FormCheck();" class="color_list">▲보고일
         </c:when>
         <c:otherwise>
            <th style="cursor:pointer"
               onclick="$('[name=sort_multi]').val('');$('[name=sort]').val('&quot;report_date&quot; asc');week_business_report_FormCheck();" class="color_list">보고일
         </c:otherwise>
      </c:choose>
      <!------------------------------------->
 		<c:choose>
         <c:when test="${param.sort=='&quot;is_week_business_finish&quot; desc'}">
            <th style="cursor:pointer"
               onclick="$('[name=sort_multi]').val('');$('[name=sort]').val('&quot;is_week_business_finish&quot; asc');week_business_report_FormCheck();" class="color_list_right">▼완료여부
         </c:when>
         <c:when test="${param.sort=='&quot;is_week_business_finish&quot; asc'}">
            <th style="cursor:pointer"
               onclick="$('[name=sort_multi]').val('');$('[name=sort]').val('&quot;is_week_business_finish&quot; desc');week_business_report_FormCheck();" class="color_list_right">▲완료여부
         </c:when>
         <c:otherwise>
            <th style="cursor:pointer"
               onclick="$('[name=sort_multi]').val('');$('[name=sort]').val('&quot;is_week_business_finish&quot; asc');week_business_report_FormCheck();" class="color_list_right">완료여부
         </c:otherwise>
      </c:choose>
      <!------------------------------------->

       
     <c:forEach var="week_business" items="${weekList}" varStatus="loopTagStatus"> 
            <tr align=center style="cursor:pointer" onClick="goWeekBusinessContentForm(${week_business.report_no},${week_business.writer})">
            <td>${pageingData.beginRowNo_desc-loopTagStatus.index}
            <td align=center>
               	   ${week_business.writer_name}
            <td>${week_business.week_business_field}
            <td>${week_business.week_business_content}
            <td>${week_business.week_business_date}
            <td>${week_business.report_date}
            <td>${week_business.is_week_business_finish}
   </c:forEach>
   
      </table>
      
      
   <c:if test="${empty weekList}">
     <br>
      <b>검색 조건에 맞는 결과가 없습니다.</b><br>
   </c:if>
      
      
      <c:set  value="${selectPageNo}" var = "selectPageNo"/> 
      

      <form name="weekBusinessRegForm" method="post" action ="/pro/week_business_log_reg_form.do">
          <input type="hidden" name="selectPageNo">
      </form>
      
      
      <form name="weekBusinessContentForm" method="post" action ="/pro/week_business_log_upDel_form.do">
      <!-- [보고서 고유번호] 가 저장되는 hidden 입력양식 선언 -->
         <input type="hidden" name="selectPageNo" value="">
         <input type="hidden" name="report_no" value="">
         <input type="hidden" name="writer" value="">
      </form>
      


   </body><br><br>
   


</HTML>


  