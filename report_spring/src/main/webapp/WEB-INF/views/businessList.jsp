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
    // 영업보고서 검색 결과물의 짝 홀수행 배경색 달리하기
    // 즉, class=businesstList를 가진 태그의 후손 태그 중 첫번째 tr 태그 이후
    // tr들에 차례대로 접근하여 bgcolor의 인덱스 번호가 짝수인 tr의 속성값을 #cfcfcf로 설정한다
    //*************************************************
    $(".businessList").find("tr:eq(0)").nextAll().each(function(){
       // class=businesstList를 가진 태그의 후손 중 tr 태그 중 1번째를 뺀
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
    // 영업보고서 검색 결과물의 마우스 대면 색상 변하고 떼면 원래대로 돌리기
    //*************************************************
    $(".businessList").find("tr:eq(0)").nextAll().hover(function(){
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
         // name=boardListForm 을 가진 폼태그의 action값의 URL주소로 이동
         // 즉 /z_jsp/boardList.do로 이동
         business_report_FormCheck();
      });
      
      
     
      var business_report_FormObj = $("[name=business_report]");

      // [오늘로] 글씨를 클릭하면 실행할 구문 설정 (for 결재일)
      business_report_FormObj.find(".to_today").click(function(){

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
         //if(month<10){month="0"+month}
         // 현재 날짜의 월을 name=min_reg_year 을 가진 입력양식에 넣어주기
         business_report_FormObj.find("[name=min_approval_year]").val(year);
         // 현재 날짜의 월을 name=min_reg_month 을 가진 입력양식에 넣어주기
         business_report_FormObj.find("[name=min_approval_month]").val(month);
         business_report_FormObj.find("[name=max_approval_year]").val(year);
         // 현재 날짜의 월을 name=min_reg_month 을 가진 입력양식에 넣어주기
         business_report_FormObj.find("[name=max_approval_month]").val(month);
      });
      
      // [오늘로] 글씨를 클릭하면 실행할 구문 설정 (for 영업일)
      business_report_FormObj.find(".to_today1").click(function(){

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
         //if(month<10){month="0"+month}
         // 현재 날짜의 월을 name=min_reg_year 을 가진 입력양식에 넣어주기
         business_report_FormObj.find("[name=min_business_year]").val(year);
         // 현재 날짜의 월을 name=min_reg_month 을 가진 입력양식에 넣어주기
         business_report_FormObj.find("[name=min_business_month]").val(month);
         business_report_FormObj.find("[name=max_business_year]").val(year);
         // 현재 날짜의 월을 name=min_reg_month 을 가진 입력양식에 넣어주기
         business_report_FormObj.find("[name=max_business_month]").val(month);
      });

      

      business_report_FormObj.find("[name^=min_approval_],[name^=max_approval_]").change(function(){
         //결재일 날짜 검색 조건 입력 양식의 유효성 체크함수 호출
         check_reg_date_approval();
      });
      
      business_report_FormObj.find("[name^=min_business_year],[name^=min_business_month],[name^=max_business_year],[name^=max_business_month]").change(function(){
          //결재일 날짜 검색 조건 입력 양식의 유효성 체크함수 호출
         check_reg_date_business();
      });
     

      //*************************************************
      // [비움] 글씨를 클릭하면 실행할 구문 설정
      //*************************************************
      
      // 결재일 비움
        business_report_FormObj.find(".empty_approval").click(function(){
           business_report_FormObj.find("[name^=min_approval]").val('');
           business_report_FormObj.find("[name^=max_approval]").val('');
        });
      
        // 영업일 비움
      business_report_FormObj.find(".empty_business").click(function(){
         business_report_FormObj.find("[name^=min_business]").val('');
         business_report_FormObj.find("[name^=max_business]").val('');
        });

      // 결재여부 비움
      business_report_FormObj.find(".empty_rejection").click(function(){
         business_report_FormObj.find("[name=approval_rejection]").prop("checked",false);
        });
      
      // 방문목적 비움
      business_report_FormObj.find(".empty_reasons").click(function(){
         business_report_FormObj.find("[name=business_reasons]").prop("checked",false);
      });

     
      // 키워드 비움
      business_report_FormObj.find(".empty_keyword").click(function(){
         business_report_FormObj.find("[name^=keyword]").val('');
         business_report_FormObj.find("[name=or_and]").val('');
        });
      
      //*************************************************
      // name=sort_multi를 가진 입력 양식에 change 이벤트가 발생하면 실행할 코드 설정하기
      //*************************************************
      business_report_FormObj.find("[name=sort_multi]").change(function(){
          // 멀티 정렬 데이터 가져오기
          var sort_multi = business_report_FormObj.find("[name=sort_multi]").val();
          // 멀티 정렬 데이터가 있으면 name=sort를 가진 hidden 태그에 값을 저장
          if(sort_multi!=""){
             business_report_FormObj.find("[name=sort]").val(sort_multi);
          }
          business_report_FormCheck();
      });
      


      //************************************************* 
      // 초기화 후 모두검색 버튼에 클릭 이벤트 시 실행할 구문 (미완) 정렬과 행보기 지워지기 제외시켜야함
      //************************************************
      business_report_FormObj.find(".searchAll").click(function(){
      
        // 검색 조건 관련 입력 양식의 데이터를 비우거나 체크를 풀기
        // <주의> name=selectPageNo, name=rowCntPerPage를 가진 입력 양식은 제외
        business_report_FormObj.find("[name^=min_approval]").val('');
        business_report_FormObj.find("[name^=max_approval]").val('');
        business_report_FormObj.find("[name^=min_business_]").val('');
        business_report_FormObj.find("[name^=max_business_]").val('');
        business_report_FormObj.find("[name^=cost_]").val('');
        business_report_FormObj.find("[name^=keyword]").val('');
        business_report_FormObj.find("[name^=or_and]").val('');
        business_report_FormObj.find("[name=approval_rejection]").prop("checked",false);
        business_report_FormObj.find("[name=business_reasons]").prop("checked",false);
        business_report_FormObj.find("[name=sort_multi]").val('');
        business_report_FormObj.find("[name=sort]").val('');
        business_report_FormObj.find("[name=selectPageNo]").val('1');
        
        business_report_FormCheck();
      });
         
         business_report_FormObj.find("[name=min_approval_year]").val('${param.min_approval_year}');
         business_report_FormObj.find("[name=max_approval_year]").val('${param.max_approval_year}');
         business_report_FormObj.find("[name=min_approval_month]").val('${param.min_approval_month}');
         business_report_FormObj.find("[name=max_approval_month]").val('${param.max_approval_month}');
         business_report_FormObj.find("[name=min_business_year]").val('${param.min_business_year}');
         business_report_FormObj.find("[name=max_business_year]").val('${param.max_business_year}');
         business_report_FormObj.find("[name=min_business_month]").val('${param.min_business_month}');
         business_report_FormObj.find("[name=max_business_month]").val('${param.max_business_month}');
         
         <c:forEach var="approval_rejection" items="${paramValues.approval_rejection}">
            business_report_FormObj.find("[name=approval_rejection]").filter("[value=${approval_rejection}]").attr("checked",true);
         </c:forEach>
         
         <c:forEach var="business_reasons" items="${paramValues.business_reasons}">
            business_report_FormObj.find("[name=business_reasons]").filter("[value=${business_reasons}]").attr("checked",true);
         </c:forEach>
         
         business_report_FormObj.find("[name=sort]").val('${param.sort}');
         business_report_FormObj.find("[name=sort_multi]").val('${param.sort_multi}');
         business_report_FormObj.find("[name=keyword1]").val('${param.keyword1}');
         business_report_FormObj.find("[name=keyword2]").val('${param.keyword2}');
         business_report_FormObj.find("[name=or_and]").val('${param.or_and}');
         business_report_FormObj.find("[name=selectPageNo]").val('${businessListDTO.selectPageNo}');
         business_report_FormObj.find("[name=rowCntPerPage]").val('${businessListDTO.rowCntPerPage}');


      });

//----------------------------------------------------------------------------------------------------- 

      
      function goBusiness_report_reg_form( ){
         //name=businessRegForm 을 가진 form 태그 안의 action에 설정된 url로 이동하기 
         //이동 시 form 태그 안의 모든 입력양식이 파라미터값으로 전송된다.
         document.businessRegForm.submit();
      }


      // 검색 눌렀을 때 입력 여부 확인 경고문 띄우기
      function business_report_FormCheck( ){
   
       // 키워드 앞칸과 뒷칸 내용 중복 금지
          var business_report_FormObj = $("[name=business_report]");
          if ( business_report_FormObj.find("[name=keyword1]").val() !="" && business_report_FormObj.find("[name=keyword2]").val() !=""  ){
             if( business_report_FormObj.find("[name=keyword1]").val() == business_report_FormObj.find("[name=keyword2]").val() ){
                 alert("키워드 입력란의 내용이 중복되었습니다.");
                 business_report_FormObj.find("[name=keyword2]").val("");
                 return;
             }
             
             if(business_report_FormObj.find("[name=or_and]").val()==""){
             	alert("검색 키워드의 검색조건 (or 또는 and)을 선택해주십시오.");
             	return;
             }
          }


         // 키워드 앞 칸을 비고 뒤에 먼저 쓰지 않게 하기
         var business_report_FormObj = $("[name=business_report]");
         if ( business_report_FormObj.find("[name=keyword1]").val() =="" && business_report_FormObj.find("[name=keyword2]").val() !=""  ){
             alert("키워드 첫번째 입력란은 비워둘 수 없습니다.");
             business_report_FormObj.find("[name=keyword2]").val("");
             return;
         }
         
         // 키워드 첫 칸에 첫 글자가 공백 불가, 최소 1글자 쓰기
         var keyword1 = $("[name=keyword1]").val();
         if ( business_report_FormObj.find("[name=keyword1]").val() !="" ){
           if ( new RegExp(/^[가-힣a-zA-Z0-9][가-힣a-zA-Z0-9 ]{0,20}$/).test(keyword1)==false  ){
               alert("첫 글자 공백 불가, 최소 한 글자 작성요망");
               business_report_FormObj.find("[name=keyword1]").val("");
               return;
            }
         }
         
         business_report_FormObj.find("[name=or_and]").val(parseInt(business_report_FormObj.find("[name=or_and]").val()));
         document.business_report.submit();
         
      }


      //************************************************************************
      //존재하는 년,월,일 인지의 여부를 리턴하는 함수
      //존재하는 년,월,일이면 true를 리턴
      //************************************************************************
      function is_valid_date(year, month){   

         year = parseInt( year, 10);  
         month = parseInt( month, 10);

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
      
    


      // 반전 선택 
      function reverseChecked(classV){
         var obj1 = $('.'+classV+":checked");
         var obj2 = $('.'+classV+":not(:checked)");
         obj1.prop("checked",false);
         obj2.prop("checked",true);   
      }


      //------------------------------------------------------------------------


      // 월보다 년도 먼저 선택하게함.
      function check_reg_date_approval(){
         var business_report_FormObj=$("[name=business_report]");
         //----------------------------------
         var min_reg_year = business_report_FormObj.find("[name=min_approval_year]").val( );
         var min_reg_month = business_report_FormObj.find("[name=min_approval_month]").val( );
         var max_reg_year = business_report_FormObj.find("[name=max_approval_year]").val( );
         var max_reg_month = business_report_FormObj.find("[name=max_approval_month]").val( );
         
         
         //----------------------------------
         if( (min_reg_year==null || min_reg_year.length==0) && (min_reg_month!=null && min_reg_month.length>0) ){
            alert("왼쪽 년도를 먼저 선택해야 합니다.");
            business_report_FormObj.find("[name=min_approval_month]").val( "" );
            return;
         }
         
         if( (max_reg_year==null || max_reg_year.length==0) && (max_reg_month!=null && max_reg_month.length>0) ){
             alert("왼쪽 년도를 먼저 선택해야 합니다.");
             business_report_FormObj.find("[name=max_approval_month]").val( "" );
             return;
         }
         
         //----------------------------------
         if(  (min_reg_year!=null && min_reg_year.length>0)  && (min_reg_month==null || min_reg_month.length==0) ){
            business_report_FormObj.find("[name=min_approval_month]").val( "01" );
            min_reg_month = "01";
         }
         if(  (max_reg_year!=null && max_reg_year.length>0)  && (max_reg_month==null || max_reg_month.length==0) ){
            business_report_FormObj.find("[name=max_approval_month]").val( "12" );
            max_reg_month = "12";
         }
         //----------------------------------
         
         if( (min_reg_year!=null && min_reg_year.length>0) && (min_reg_month!=null && min_reg_month.length>0)){
          
        	 
        	 if((max_reg_year!=null && max_reg_year.length>0) &&  (max_reg_month!=null && max_reg_month.length>0) ){

          var max_date = business_report_FormObj.find("[name=max_approval_year]").val(  )+business_report_FormObj.find("[name=max_approval_month]").val(  );
          var min_date = business_report_FormObj.find("[name=min_approval_year]").val(  )+business_report_FormObj.find("[name=min_approval_month]").val(  );
             if( parseInt(max_date,10) < parseInt(min_date,10) ) {
               alert("[최소 년월]이 [최대 년월] 보다 큽니다. 재 선택 바람!");
               business_report_FormObj.find("[name^=min_approval_]").val("");
               business_report_FormObj.find("[name^=max_approval_]").val("");
               return;
            }
        	 }
         }
      }


      function check_reg_date_business(){
         var business_report_FormObj=$("[name=business_report]");
         //----------------------------------
         var min_reg_year1 = business_report_FormObj.find("[name=min_business_year]").val( );
         var min_reg_month1 = business_report_FormObj.find("[name=min_business_month]").val( );
         var max_reg_year1 = business_report_FormObj.find("[name=max_business_year]").val( );
         var max_reg_month1 = business_report_FormObj.find("[name=max_business_month]").val( );
         //----------------------------------
         if( (min_reg_year1==null || min_reg_year1.length==0) && (min_reg_month1!=null && min_reg_month1.length>0) ){
          alert("왼쪽 년도를 먼저 선택해야 합니다.");
          business_report_FormObj.find("[name=min_business_month]").val( "" );
         
          
         }
         
         if( (max_reg_year1==null || max_reg_year1.length==0) && (max_reg_month1!=null && max_reg_month1.length>0) ){
          alert("왼쪽 년도를 먼저 선택해야 합니다.");
          business_report_FormObj.find("[name=max_business_month]").val( "" );
          
         }
         

         //----------------------------------
         if(  (min_reg_year1!=null && min_reg_year1.length>0)  && (min_reg_month1==null || min_reg_month1.length==0) ){

             business_report_FormObj.find("[name=min_business_month]").val( "01" );
             min_reg_month1 = "01";
             
          }
          if(  (max_reg_year1!=null && max_reg_year1.length>0)  && (max_reg_month1==null || max_reg_month1.length==0) ){

             business_report_FormObj.find("[name=max_business_month]").val( "12" );
             max_reg_month1 = "12";
             
          }
         //----------------------------------
         
         
         //alert(min_reg_year1);
         
          if( (min_reg_year1!=null && min_reg_year1.length>0) && (min_reg_month1!=null && min_reg_month1.length>0)){
              
         	 
         	 if((max_reg_year1!=null && max_reg_year1.length>0) &&  (max_reg_month1!=null && max_reg_month1.length>0) ){
         		
             var max_date = business_report_FormObj.find("[name=max_business_year]").val(  )+business_report_FormObj.find("[name=max_business_month]").val(  );
             var min_date = business_report_FormObj.find("[name=min_business_year]").val(  )+business_report_FormObj.find("[name=min_business_month]").val(  );
              if( parseInt(max_date,10) < parseInt(min_date,10) ) {
                alert("[최소 년월]이 [최대 년월] 보다 큽니다. 재 선택 바람!");
                business_report_FormObj.find("[name^=min_business_]").val("");
                business_report_FormObj.find("[name^=max_business_]").val("");
                return;
             }
         	 }
          }
     }



      //확인요망
      function goBusinessContentForm( max_return_no , report_no , writer ,  sign_name ){
         $("[name=businessContentForm] [name=max_return_no]").val(max_return_no);
         $("[name=businessContentForm] [name=report_no]").val(report_no);
         $("[name=businessContentForm] [name=writer]").val(writer);
         $("[name=businessContentForm] [name=sign_name]").val(sign_name);
         document.businessContentForm.submit(); 
      }


   </script>


   
      
      
   <body><center>
   <br><br>
       <form name="business_report" method="post" action="/pro/businessList.do">
         <table width=700>
         <tr>
            <th class="color_list1" align=center height=35>[영업 보고서 검색]
          <tr> 
      
        <th><table class="tbcss3" width="700">
            <th class="th_1" width=80 align=center>결재일</th>
            <td align=left class="search_td">&nbsp;
               <select name = "min_approval_year" value="approval"> 
          <option value="">
            <script>
               for (var i=1990; i<=new Date().getFullYear()+1 ; i++ )
               {   document.write("<option value="+i+">"+i);
               }
            </script> 
          </select>&nbsp;년
          <select name = "min_approval_month" value="approval">
          <option value="">
            <script>
               for (var i=1; i<=12 ; i++ )
               {   var m = (i<10)?"0"+i:i;
                 document.write("<option value="+m+">"+m);
               }
            </script>
          </select>&nbsp;&nbsp;월&nbsp;&nbsp;~&nbsp;&nbsp;
          <select name = "max_approval_year" value="approval"> 
          <option value="">
            <script>
               for (var i=1990; i<=new Date().getFullYear()+1 ; i++ )
               {   document.write("<option value="+i+">"+i);
               }
            </script> 
          </select>&nbsp;년
          <select name = "max_approval_month" value="approval">
          <option value="">
            <script>
               for (var i=1; i<=12 ; i++ )
               {   var m = (i<10)?"0"+i:i;
                 document.write("<option value="+m+">"+m);
               }
            </script>
          </select>&nbsp;&nbsp;월&nbsp;&nbsp;&nbsp;
            <span style="cursor:pointer" class="empty_approval">[비움]</span>
            <span style="cursor:pointer" class="to_today">[오늘로]</span>
            </td>
          </tr>

          <tr>
          <th class="th_2" width=80 align=center>영업일</th>
            <td>&nbsp;&nbsp;<select name = "min_business_year" value="business"> 
          <option value="">
            <script>
               for (var i=1990; i<=new Date().getFullYear()+1 ; i++ )
               {   document.write("<option value="+i+">"+i);
               }
            </script> 
          </select>&nbsp;년
          <select name = "min_business_month" value="business">
          <option value="">
            <script>
               for (var i=1; i<=12 ; i++ )
               {   var m = (i<10)?"0"+i:i;
                 document.write("<option value="+m+">"+m);
               }
            </script>
          </select>&nbsp;&nbsp;월&nbsp;&nbsp;~&nbsp;&nbsp;
          <select name = "max_business_year" value="business"> 
          <option value="">
            <script>
               for (var i=1990; i<=new Date().getFullYear()+1 ; i++ )
               {   document.write("<option value="+i+">"+i);
               }
            </script> 
          </select>&nbsp;년
          <select name = "max_business_month" value="business">
          <option value="">
            <script>
               for (var i=1; i<=12 ; i++ )
               {   var m = (i<10)?"0"+i:i;
                 document.write("<option value="+m+">"+m);
               }
            </script>
          </select>&nbsp;&nbsp;월&nbsp;&nbsp;&nbsp;
            <span style="cursor:pointer" class="empty_business">[비움]</span>
            <span style="cursor:pointer" class="to_today1">[오늘로]</span>
            </td>
          </tr>
          <tr>
          <th class="th_1" align=center>결재여부</th>
            <td class="search_td">&nbsp;
               <input type="checkbox"  name="approval_rejection" value=1 class="approval_rejection arrange">결재완료
               <input type="checkbox"  name="approval_rejection" value=2 class="approval_rejection arrange">미결재
               <input type="checkbox"  name="approval_rejection" value=3 class="approval_rejection arrange">반려
               <input type="checkbox"  name="approval_rejection" value=4 class="approval_rejection arrange">결재종료 &nbsp;&nbsp;
               <input type="hidden" name="approval_rejection_check" value="">
            <span style="cursor:pointer" onclick="reverseChecked('approval_rejection');">[반전선택]</span>&nbsp;&nbsp;&nbsp;
            <span style="cursor:pointer" class="empty_rejection">[비움]</span>
            </td>
          </tr>
          <tr>
          <th align=center class="th_2">방문목적</th>
            <td>&nbsp;
               <input type="checkbox" name="business_reasons" value=1 class="business_reasons arrange">영업지관리
               <input type="checkbox" name="business_reasons" value=2 class="business_reasons arrange">수금
               <input type="checkbox" name="business_reasons" value=3 class="business_reasons arrange">회의
               <input type="checkbox" name="business_reasons" value=4 class="business_reasons arrange">거래처확보 
               <input type="checkbox" name="business_reasons" value=5 class="business_reasons arrange">기타&nbsp;&nbsp;
            <span style="cursor:pointer" onclick="reverseChecked('business_reasons');">[반전선택]</span>&nbsp;&nbsp;&nbsp;
            <span style="cursor:pointer" class="empty_reasons">[비움]</span>
            </td>
          </tr>
          <tr>
            <th class="th_1" align=center>키워드</th>
            <td class="search_td">&nbsp;
               <input type="text" name="keyword1" size=20 maxlength=30>&nbsp;
               <select name="or_and" class="or_and" value="keyword">
                  <option value="" >선택요망</option>
                 <option value="1">or</option>
                 <option value="2">and</option>
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




      
      
   <BR>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <span style="cursor:pointer;width:50px;" onclick="business_report_FormCheck( )" class="btn btn1">검색</span>&nbsp;&nbsp;
        <span class="searchAll btn btn1" onclick="business_report_FormCheck();">초기화 후 모두검색</span>&nbsp;&nbsp;
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&emsp;&emsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <span style="cursor:pointer" onclick="goBusiness_report_reg_form()"><b>[영업보고서 등록]</b></span>
        <div style="height:50px"></div>   
 
        <span>[다중 정렬] : 
        <select name="sort_multi" >
         <option value=""></option>              
         <option value="7 desc, 8 asc">결재/보류일내림>영업일오름</option>
         <option value="7 desc, 8 desc">결재/보류일내림>영업일내림</option>
         <option value="7 asc, 8 asc">결재/보류일오름>영업일오름</option>
         <option value="7 asc, 8 desc">결재/보류일오름>영업일내림</option>
        </select>

      &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
      &emsp;&emsp;&emsp;&emsp;&nbsp;
            
            <!----------------------------------->
            <!-- 검색 결과물의 개수가 1개 이상일 경우 페이징 처리 관련 html 출력-->
            <!----------------------------------->
            <c:if test="${businessListAllCnt>0}">
               <!-- 만약 [시작페이지 번호]가 [화면당 보이는 페이지 번호 개수]보다 크면-->
               <!-- [처음], [이전] 글씨 보이게 하고, 클릭하면 원하는 페이지번호를 hidden 입력 양식에 담고-->
               <!-- 현재 페이지로 다시 이동하기-->
               <c:if test="${pageingData.beginPageNo>pageingData.pageNoCntPerPage}">
                  <a href="javascript:$('[name=selectPageNo]').val('1');business_report_FormCheck();">[처음] </a>
                  <a href="javascript:$('[name=selectPageNo]').val('${pageingData.beginPageNo-1}');business_report_FormCheck();">[이전]  </a>
               </c:if>
               <!-- [시작페이지 번호]부터 [마지막 페이지 번호]까지 페이지번호를 출력하기-->
               <!-- 선택된 페이지 번호는 번호만 출력하고 클릭하지 못하게 하고-->
               <!-- 선택 안된 페이지 번호는 대괄호로 감싸 출력하고 클릭하면 원하는 -->
               <!-- 원하는 페이지번호를 hidden 입력 양식에 담고 현재 페이지로 다시 이동하기-->
               <c:forEach var="pageNo" begin="${pageingData.beginPageNo}" end="${pageingData.endPageNo}">
                  <c:if test="${pageingData.selectPageNo!=pageNo}">
                     <a href="javascript:$('[name=selectPageNo]').val('${pageNo}');business_report_FormCheck();">[${pageNo}]</a>
                  </c:if>
                  <c:if test="${pageingData.selectPageNo==pageNo}">
                     ${pageNo}
                  </c:if>
               </c:forEach>
               <!-- 만약면 현재 화면에서 보이는 [끝 페이지 번호]가 [맨 마지막 페이지 번호]보다 작으면-->
               <!-- [다음], [마지막] 글씨 보이게 하고, 클릭하면 원하는 페이지번호를 hidden 입력 양식에 담고-->
               <!-- 현재 페이지로 다시 이동하기-->
               <c:if test="${pageingData.endPageNo<pageingData.lastPageNo}">
                  <a href="javascript:$('[name=selectPageNo]').val('${pageingData.endPageNo+1}');business_report_FormCheck();">  [다음] </a>
                  <a href="javascript:$('[name=selectPageNo]').val('${pageingData.lastPageNo}');business_report_FormCheck();">[마지막] </a>
               </c:if>
            </c:if> 
             
            
            &nbsp;&emsp;&emsp;&emsp;&emsp;&nbsp;&nbsp;&nbsp;&emsp;&emsp;
            &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&nbsp;
            &emsp;&emsp;&emsp;&emsp;&nbsp;&nbsp;&nbsp;
            
           <!--**********************************************-->
            <!--[검색 수] 출력--->
            <!--**********************************************-->
            <font size="2"><b>[검색 개수 : ${businessListAllCnt}개]</b></font>&nbsp;&nbsp;
            
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
      <table class="tbcss2 businessList" border="1" width="1000">
     <th class="color_list_left">번호
      <c:choose>
         <c:when test="${param.sort=='&quot;report_name&quot; desc'}">
            <th style="cursor:pointer"
               onclick="$('[name=sort_multi]').val('');$('[name=sort]').val( '&quot;report_name&quot; asc' );business_report_FormCheck();" class="color_list">▼영업제목
         </c:when>
         <c:when test="${param.sort=='&quot;report_name&quot; asc'}">
            <th style="cursor:pointer"
               onclick="$('[name=sort_multi]').val('');$('[name=sort]').val('&quot;report_name&quot; desc');business_report_FormCheck();" class="color_list">▲영업제목
         </c:when>
         <c:otherwise>
            <th style="cursor:pointer"
               onclick="$('[name=sort_multi]').val('');$('[name=sort]').val('&quot;report_name&quot; asc');business_report_FormCheck();" class="color_list">영업제목
         </c:otherwise>
      </c:choose>
      <!------------------------------------->
      <c:choose>
         <c:when test="${param.sort=='&quot;sales_type&quot; desc'}">
            <th style="cursor:pointer"
               onclick="$('[name=sort_multi]').val('');$('[name=sort]').val('&quot;sales_type&quot; asc');business_report_FormCheck();" class="color_list">▼방문목적
         </c:when>
         <c:when test="${param.sort=='&quot;sales_type&quot; asc'}">
            <th style="cursor:pointer"
               onclick="$('[name=sort_multi]').val('');$('[name=sort]').val('&quot;sales_type&quot; desc');business_report_FormCheck();" class="color_list">▲방문목적
         </c:when>
         <c:otherwise>
            <th style="cursor:pointer"
               onclick="$('[name=sort_multi]').val('');$('[name=sort]').val('&quot;sales_type&quot; asc');business_report_FormCheck();" class="color_list">방문목적
         </c:otherwise>
      </c:choose>
      <!------------------------------------->
      <c:choose>
         <c:when test="${param.sort=='&quot;sign_name&quot; desc'}">
            <th style="cursor:pointer"
               onclick="$('[name=sort_multi]').val('');$('[name=sort]').val('&quot;sign_name&quot; asc');business_report_FormCheck();" class="color_list">▼결재여부
         </c:when>
         <c:when test="${param.sort=='&quot;sign_name&quot; asc'}">
            <th style="cursor:pointer"
               onclick="$('[name=sort_multi]').val('');$('[name=sort]').val('&quot;sign_name&quot; desc');business_report_FormCheck();" class="color_list">▲결재여부
               </c:when>
         <c:otherwise>
            <th style="cursor:pointer"
               onclick="$('[name=sort_multi]').val('');$('[name=sort]').val('&quot;sign_name&quot; asc');business_report_FormCheck();" class="color_list">결재여부
         </c:otherwise>
      </c:choose>
      <!------------------------------------->
      <c:choose>
         <c:when test="${param.sort=='&quot;sign_date&quot; desc'}">
            <th style="cursor:pointer"
               onclick="$('[name=sort_multi]').val('');$('[name=sort]').val('&quot;sign_date&quot; asc');business_report_FormCheck();" class="color_list">▼결재/보류일
         </c:when>
         <c:when test="${param.sort=='&quot;sign_date&quot; asc'}">
            <th style="cursor:pointer"
               onclick="$('[name=sort_multi]').val('');$('[name=sort]').val('&quot;sign_date&quot; desc');business_report_FormCheck();" class="color_list">▲결재/보류일
         </c:when>
         <c:otherwise>
            <th style="cursor:pointer"
               onclick="$('[name=sort_multi]').val('');$('[name=sort]').val('&quot;sign_date&quot; asc');business_report_FormCheck();" class="color_list">결재/보류일
         </c:otherwise>
      </c:choose>
      <!------------------------------------->
      <c:choose>
         <c:when test="${param.sort=='&quot;sales_date&quot; desc'}">
            <th style="cursor:pointer"
               onclick="$('[name=sort_multi]').val('');$('[name=sort]').val('&quot;sales_date&quot; asc');business_report_FormCheck();" class="color_list">▼영업일
         </c:when>
         <c:when test="${param.sort=='&quot;sales_date&quot; asc'}">
            <th style="cursor:pointer"
               onclick="$('[name=sort_multi]').val('');$('[name=sort]').val('&quot;sales_date&quot; desc');business_report_FormCheck();" class="color_list">▲영업일
         </c:when>
         <c:otherwise>
            <th style="cursor:pointer"
               onclick="$('[name=sort_multi]').val('');$('[name=sort]').val('&quot;sales_date&quot; asc');business_report_FormCheck();" class="color_list">영업일
         </c:otherwise>
      </c:choose>
      <!------------------------------------->
      <c:choose>
         <c:when test="${param.sort=='&quot;sign_state&quot; desc'}">
            <th style="cursor:pointer"
               onclick="$('[name=sort_multi]').val('');$('[name=sort]').val('&quot;sign_state&quot; asc');business_report_FormCheck();" class="color_list_right">▼결재상황         
         </c:when>
         <c:when test="${param.sort=='&quot;sign_state&quot; asc'}">
            <th style="cursor:pointer"
               onclick="$('[name=sort_multi]').val('');$('[name=sort]').val('&quot;sign_state&quot; desc');business_report_FormCheck();" class="color_list_right">▲결재상황
         </c:when>
         <c:otherwise>
            <th style="cursor:pointer"
               onclick="$('[name=sort_multi]').val('');$('[name=sort]').val('&quot;sign_state&quot; asc');business_report_FormCheck();" class="color_list_right">결재상황
         </c:otherwise>
      </c:choose>

       
     <c:forEach var="business" items="${businessList}" varStatus="loopTagStatus"> 
            <tr align=center style="cursor:pointer" onClick="goBusinessContentForm(${business.max_return_no},${business.report_no},${business.writer},&quot;${business.sign_name}&quot;)">
            <td>${pageingData.beginRowNo_desc-loopTagStatus.index}
            <td align=center>
               ${business.report_name}
            <td>${business.sales_type}
            <td>${business.sign_name}
            <td>${business.sign_date}
            <td>${business.sales_date}
            <td>${business.sign_state}
   </c:forEach>
   
      </table>
      
      
   <c:if test="${empty businessList}">
     <br>
      <b>검색 조건에 맞는 결과가 없습니다.</b><br>
   </c:if>
      
      
      <c:set  value="${selectPageNo}" var = "selectPageNo"/> 
      

      <form name="businessRegForm" method="post" action ="/pro/business_report_reg_form.do">
          <input type="hidden" name="selectPageNo">
      </form>
      
      
      <form name="businessContentForm" method="post" action ="/pro/business_report_upDel_form.do">
      <!-- [보고서 고유번호] 가 저장되는 hidden 입력양식 선언 -->
         <input type="hidden" name="report_no" value="">
         <input type="hidden" name="max_return_no" value="">
         <input type="hidden" name="selectPageNo" value="">
         <input type="hidden" name="sign_name" value="">
         <input type="hidden" name="writer" value="">
      </form>
      
             
       
   
   

   </body><br><br>
   


</HTML>



