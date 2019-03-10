<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      
<%@include file="/WEB-INF/views/common3.jsp"%>

<HTML>
 <HEAD>
  <TITLE> My Page </TITLE>

   

  <script>
  
  $(document).ready(function(){
	  

      $('ul.tabs li').click(function(){

         var tab_id = $(this).attr('data-tab');

 

         $('ul.tabs li').removeClass('current');

         $('.tab-content').removeClass('current');

 

         $(this).addClass('current');

         $("#"+tab_id).addClass('current');

      })
	  
	  
	  
      $(".myPageList").find("tr:eq(0)").nextAll().each(function(){
         // class=myPageList를 가진 태그의 후손 중 tr 태그 중 1번째를 뺀
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
   
      $(".myPageList").find("tr:eq(0)").nextAll().hover(function(){
    	 
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
      
    //*************************************************
      
      $(".myPageList2").find("tr:eq(0)").nextAll().each(function(){
          var obj = $(this);
          var index = $(this).index();
          if( index%2==0 ){
             obj.attr("bgcolor", "#f1f7fc")
          }
          
       });
    
       $(".myPageList2").find("tr:eq(0)").nextAll().hover(function(){
     	 
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
      
      //*************************************************
      
      $(".myPageList3").find("tr:eq(0)").nextAll().each(function(){
         var obj = $(this);
         var index = $(this).index();
         if( index%2==0 ){
            obj.attr("bgcolor", "#f1f7fc")
         }
         
      });

      $(".myPageList3").find("tr:eq(0)").nextAll().hover(function(){
    	 
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
      
      
      
   });
   
  

   function goMy_Page_Form(){
      document.my_Page_Form.submit();
   }
   
   
   
    function goReportUpDelForm( report, report_no, writer, max_return_no , sign_name){
		if(report=="영업보고서"){
		   $("[name=goBusinessUpDelForm]").find("[name=writer]").val(writer);
		   $("[name=goBusinessUpDelForm]").find("[name=report_no]").val(report_no);
		   $("[name=goBusinessUpDelForm]").find("[name=max_return_no]").val(max_return_no);
		   $("[name=goBusinessUpDelForm]").find("[name=sign_name]").val(sign_name);
		   document.goBusinessUpDelForm.submit();
		}
		else if(report=="지출보고서"){
		   $("[name=goExpenseUpDelForm]").find("[name=writer]").val(writer);
		   $("[name=goExpenseUpDelForm]").find("[name=report_no]").val(report_no);
		   $("[name=goExpenseUpDelForm]").find("[name=max_return_no]").val(max_return_no);
		   $("[name=goExpenseUpDelForm]").find("[name=sign_name]").val(sign_name);
		   document.goExpenseUpDelForm.submit();
		}
   } 
    
    function goWorkReportUpDelForm( report, report_no, writer ){
    	if(report=="일일 업무보고서"){
    		$("[name=goDailyUpDelForm]").find("[name=writer]").val(writer);
 		    $("[name=goDailyUpDelForm]").find("[name=report_no]").val(report_no);
 		   document.goDailyUpDelForm.submit();
    	}
    	else if(report=="주간 업무보고서"){
    		$("[name=goWeekUpDelForm]").find("[name=writer]").val(writer);
 		    $("[name=goWeekUpDelForm]").find("[name=report_no]").val(report_no);
 		   document.goWeekUpDelForm.submit();
    	}
    }
  
   
  </script>
  
 </HEAD>



 <BODY>
 
  <style>

   .wen {width:130px; height:130px; border-radius:130px; margin:0 auto; overflow:hidden; object-fit: cover;}

   .wen img {height:auto; width:130px; }

   

         body{

         line-height: 1.6

      }

      .container{

         width: 800px;

         margin: 0 auto;

      }

      

      ul.tabs{

       width: 420px;
       height: 39px;

      	background: #3f5384;

         margin: 0px;

         padding: 0px;

         list-style: none;

      }

      ul.tabs li{

         background: #3f5384;

         color: WHITE;

         display: inline-block;

      padding: 10px 15px;
      
         cursor: pointer;

      }

      

      ul.tabs li.current{

         background: #e4eaf3;

         color: BLACK;

          padding: 4px 10px;

      }

      

      .tab-content{         display: none;

         background: WHITE;

         padding: 15px;

      }

      

      .tab-content.current{

         display: inherit;

      }

   </style>


<center> 
<div><h2>
[마이 페이지]
</h2></div><BR>

<form name="my_Page_Form" method="post" action="/pro/myPageList.do">

   <div class="wen">
   		<c:set var="photo" value="/pro/resources/photo/${sessionScope.emp_no}.PNG"/>
			    <img src="<c:out value="${photo}"/>"/>
   	</div>
  <BR><BR>
   <TABLE width="250">
   <TR>
      <th class="th_color" colspan="2" height="30">
	      ${sessionScope.emp_name}&nbsp;(${sessionScope.jikup})
      </th>
  </TR>
   <TR>
      <th align="center" class="td_color" width="150" height="30">${sessionScope.company_name}</th>
      <th align="center" class="td_color" width="150" height="30">${sessionScope.company_emp_no}차</th>
   </TR>
   </TABLE>
   
   <table align=center>
   <TR>
      <TD colspan="2" style="cursor:pointer" onclick="location.replace('/pro/loginForm.do')" align="center">[로그아웃]&nbsp;</TD>
      <TD colspan="2" style="cursor:pointer" onclick="document.gomyPageUpDelForm.submit()" align="center">[회원정보 수정]</TD>
   </TR>
   </table> 
   
   <BR><br><br>
   
     <div class="container">

 

   <c:if test="${sessionScope.company_emp_no!=1}">   

      <ul class="tabs">

         <li class="tab-link current" data-tab="tab-1">그래프</li>

         <li class="tab-link" data-tab="tab-2">미결재함</li>
         
 		<c:if test="${sessionScope.company_emp_no != sessionScope.max_company_emp_no}">
 		
         <li class="tab-link" data-tab="tab-3">반려함</li>

         <li class="tab-link" data-tab="tab-4">결재종료함</li>
         
		</c:if>
		
         <li class="tab-link" data-tab="tab-5">미완료 업무함</li>

      </ul>

   </c:if>
   
   
   <c:if test="${sessionScope.company_emp_no==1}">      

         <ul class="tabs">

         <li class="tab-link current" data-tab="tab-1">그래프</li>

         <li class="tab-link" data-tab="tab-3">반려함</li>

         <li class="tab-link" data-tab="tab-4">결재종료함</li>

         <li class="tab-link" data-tab="tab-5">미완료 업무함</li>

      </ul>

   </c:if>   
   
   
   <div id="tab-1" class="tab-content current">
	 <div style="height:20px"></div>
 
		<center>
	      <TABLE width="450px" class="tbcss2 myPageList5">
		   <tr align="left">
		      <th align="left" width="130px">총 완료 업무 비율</th>
		      <td width="300px">
					<span class="iGraph">
						<span class="gBar"><span class="gAction" style="width:${unfinishListPer}%"></span></span>
						<span class="gPercent"><strong>${unfinishListPer}</strong>%</span>
					</span> 
				</td>
		   </tr>
		   <tr align=left>
		      <th align="left" width="130px">일일 완료 업무 비율</th>
		      <td width="300px">
		      		<span class="iGraph">
						<span class="gBar"><span class="gAction" style="width:${unfinishDailyListPer}%"></span></span>
						<span class="gPercent"><strong>${unfinishDailyListPer}</strong>%</span>
					</span> 
		      </td>
		   </tr>
		   <tr align=left>
		      <th align="left" width="130px">주간 완료 업무 비율</th>
	          <td width="300px">
		      		<span class="iGraph">
						<span class="gBar"><span class="gAction" style="width:${unfinishWeekListPer}%"></span></span>
						<span class="gPercent"><strong>${unfinishWeekListPer}</strong>%</span>
					</span> 
		     </td>
		   </tr>
	   </table>
  	 </center>

   </div>
   
    <div id="tab-2" class="tab-content">
    <div style="height:20px"></div>
   
		   <c:if test="${sessionScope.company_emp_no!=1}">   
		      <div style="width:700px; height:20px;" align="right"><b>보고서 개수:</b>&nbsp;${notApprovalListAllCnt}개 </div>
		      
		       
		   <TABLE width="700px" class="tbcss2 myPageList">
		   <tr  align="left" height="25">
		      <th class="color_list_left" width="80" align="center">보고서 종류</th>
		      <th class="color_list" align="center">보고서명</th>
		      <th class="color_list_right" width="150" align="center">결재날짜</th>
		   </tr>
		   <c:forEach var="notApprovalList" items="${notApprovalList}" varStatus="loopTagStatus"> 
		      <tr align=center style="cursor:pointer" onClick="goReportUpDelForm(&quot;${notApprovalList.report}&quot;,${notApprovalList.report_no},${notApprovalList.writer},${notApprovalList.max_return_no},&quot;${notApprovalList.sign_name}&quot;)">
		         <TD  align="center"  width="50">${notApprovalList.report}</TD>
		         <TD  align="center">${notApprovalList.report_name}</TD>
		         <TD  align="center">${notApprovalList.sign_date}</TD>
		       </tr>
		   </c:forEach>
		         
		   </table>
		   	
		   	 <c:if test="${empty notApprovalList}">
		    	<br><b>미결재 된 보고서가 없습니다</b><br>
		   	</c:if>
		   
		 </c:if> 
   
    </div>
   
   
   
    <div id="tab-3" class="tab-content">
     <div style="height:20px"></div>
		   <c:if test="${sessionScope.company_emp_no != sessionScope.max_company_emp_no}">  
		   <div style="width:700px; height:20px;" align="right"><b>보고서 개수:</b>&nbsp;${refuseListAllCnt}개</div>
		   <TABLE width="700px" class="tbcss2 myPageList2">
		   <tr  align="left" height="25">
		      <th class="color_list_left" width="80" align="center">보고서 종류</th>
		      <th class="color_list" align="center">보고서명</th>
		      <th class="color_list_right" width="150" align="center">결재날짜</th>
		   </tr>
		   <c:forEach var="refuseList" items="${refuseList}" varStatus="loopTagStatus"> 
		      <tr align=center style="cursor:pointer" onClick="goReportUpDelForm(&quot;${refuseList.report}&quot;,${refuseList.report_no},${refuseList.writer},${refuseList.max_return_no},&quot;${refuseList.sign_name}&quot;)">
		         <TD 	align="center">${refuseList.report}</TD>
		         <TD align="center">${refuseList.report_name}</TD>
		         <TD align="center">${refuseList.sign_date}</TD>
		      </tr>
		   </c:forEach>
		   
		   </table>
		        <c:if test="${empty refuseList}">
		    		<br><b>반려된 보고서가 없습니다</b><br>
		   		</c:if>
		   
		     </c:if> 
		   
   
   </div>
   
   
    <div id="tab-4" class="tab-content">
    <div style="height:20px"></div>
   
		   <c:if test="${sessionScope.company_emp_no != sessionScope.max_company_emp_no}">    
		    <div style="width:700px; height:20px;" align="right"><b>보고서 개수:</b>&nbsp;${finishListAllCnt}개 </div>
		    
		   <TABLE width="700px" class="tbcss2 myPageList3">
		   <tr  align="left" height="25">
		      <th class="color_list_left" width="80" align="center">보고서 종류</th>
		      <th class="color_list" align="center">보고서명</th>
		      <th class="color_list_right" width="150" align="center">결재날짜</th>
		   </tr>
		   <c:forEach var="finishList" items="${finishList}" varStatus="loopTagStatus"> 
		      <tr align=center style="cursor:pointer" onClick="goReportUpDelForm(&quot;${finishList.report}&quot;,${finishList.report_no},${finishList.writer},${finishList.max_return_no},&quot;${finishList.sign_name}&quot;)">
		         <TD  align="center">${finishList.report}</TD>
		         <TD  align="center">${finishList.report_name}</TD>
		         <TD  align="center">${finishList.sign_date}</TD>
		      </tr>
		   </c:forEach>
		   </table>
		   
		           <c:if test="${empty finishList}">
		    		<br><b>결재 종료 된 보고서가 없습니다</b><br>
		   		</c:if>
		   </c:if>
		     <div style="height:15px"></div>
		     
		   <!-- 검색 결과물의 개수가 1개 이상이면 -->
		      <c:if test="${finishListAllCnt>0}">
		      
		         <c:if test="${beginPageNo>pageNoCntPerPage}">
		            <a href="javascript:$('[name=selectPageNo]').val('1');goMy_Page_Form();">[처음]</a>
		            <a href="javascript:$('[name=selectPageNo]').val('${beginPageNo-1}');goMy_Page_Form();">
		               [이전]&nbsp;&nbsp;
		            </a>
		         </c:if>
		         <!-- [시작페이지 번호]부터 [마지막 페이지 번호]까지 페이지번호를 출력하기 -->
		         
		         <c:forEach var="pageNo" begin="${beginPageNo}" end="${endPageNo}">
		            <c:if test="${selectPageNo!=pageNo}">
		               <c:if test="${sessionScope.session_pageNo}">
		                  <a href="javascript:$('[name=selectPageNo]').val('${sessionScope.session_pageNo}');goMy_Page_Form();" class="pageNo"> 
		                     [${sessionScope.session_pageNo}]
		                  </a>
		               </c:if>
		               
		               <a href="javascript:$('[name=selectPageNo]').val('${pageNo}');goMy_Page_Form();" class="pageNo">
		                  [${pageNo}]
		               </a>
		            </c:if>
		            <c:if test="${selectPageNo==pageNo}">
		               ${pageNo}
		            </c:if>
		         </c:forEach>
		         
		         <c:if test="${endPageNo<lastPageNo}">
		            <a href="javascript:$('[name=selectPageNo]').val('${endPageNo+1}');goMy_Page_Form();">
		               &nbsp;&nbsp;[다음]
		            </a>
		            <a href="javascript:$('[name=selectPageNo]').val('${lastPageNo}');goMy_Page_Form();">
		               [마지막]
		            </a>
		         </c:if>
		         
		      </c:if>
		         
		      <c:set  value="${selectPageNo}" var = "selectPageNo"/> 
   
    </div>
   
   
    
   
   <div id="tab-5" class="tab-content">
    <div style="height:20px"></div>
 
		    <div style="width:700px; height:20px;" align="right"><b>보고서 개수:</b>&nbsp;${unfinishListAllCnt}개 </div>
		    
		   <TABLE width="700px" class="tbcss2 myPageList4">
			   <tr  align="left" height="25">
			      <th class="color_list_left" width="80" align="center">보고서 종류</th>
			      <th class="color_list" align="center">업무분야</th>
			      <th class="color_list" align="center">업무내용</th>
			      <th class="color_list_right" width="150" align="center">업무날짜</th>
			   </tr>
			   <c:forEach var="unfinishList" items="${unfinishList}" varStatus="loopTagStatus"> 
			      <tr align=center style="cursor:pointer" onClick="goWorkReportUpDelForm(&quot;${unfinishList.report}&quot;,${unfinishList.report_no},${unfinishList.writer})">
			         <TD  align="center">${unfinishList.report}</TD>
			         <TD  align="center">${unfinishList.busi_type}</TD>
			         <TD  align="center">${unfinishList.content}</TD>
			         <TD  align="center">${unfinishList.busi_date}</TD>
			      </tr>
			   </c:forEach>
		   </table>
		   
		   <c:if test="${empty unfinishList}">
		 		<br><b>미완료된 업무 보고서가 없습니다</b><br>
		   </c:if>
   		
 
  </div>

   
   </div>
  
    <br><br>
	
      
  
   </form>
   
   
   <form name="goBusinessUpDelForm" method="post" action="/pro/business_report_upDel_form.do">
   		<input type="hidden" name="emp_no" value="${sessionScope.emp_no}">
   		<input type="hidden" name="sign_name" >
   		<input type="hidden" name="writer" >
   		<input type="hidden" name="report_no" >
   		<input type="hidden" name="max_return_no" >
   </form>
   
     <form name="goExpenseUpDelForm" method="post" action="/pro/expense_report_upDel_form.do">
   		<input type="hidden" name="emp_no" value="${sessionScope.emp_no}">
   		<input type="hidden" name="sign_name">
   		<input type="hidden" name="writer">
   		<input type="hidden" name="report_no" >
   		<input type="hidden" name="max_return_no">
   </form>
   
   <form name="gomyPageUpDelForm" method="post" action="/pro/myPageUpDelForm.do">
      
   </form>
   
   <form name="goDailyUpDelForm" method="post" action="/pro/daily_business_log_upDel_form.do">
   		<input type="hidden" name="emp_no" value="${sessionScope.emp_no}">
   		<input type="hidden" name="writer">
   		<input type="hidden" name="report_no" >
   </form>
   
      <form name="goWeekUpDelForm" method="post" action="/pro/week_business_log_upDel_form.do">
   		<input type="hidden" name="emp_no" value="${sessionScope.emp_no}">
   		<input type="hidden" name="writer">
   		<input type="hidden" name="report_no">
   </form>
   

 </BODY>

</html>