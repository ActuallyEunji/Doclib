<!-- JSP 기술의 한 종류인 [page Directive]를 이용하여 현 JSP 페이지 처리방식 선언하기 -->
<!-- 현재 이 JSP 페이지 실행 후 생성되는 문서는 HTML이고, 이 문서는 UTF-8 방식으로 인코딩한다고 설정 -->
<!-- ******************************************************************************** -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- ******************************************************************************** -->   
<!-- JSP 페이지에서 사용할 [사용자 정의 태그]인 [JSTL의 C코어 태그] 선언 -->       
<!-- ******************************************************************************** -->  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!-- ******************************************************************************** -->   
<!-- JSP 페이지에서 사용할 [사용자 정의 태그]인 [Spring 폼 태그] 선언 -->       
<!-- ******************************************************************************** -->  
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
     
<!-- ******************************************************************************** -->
<!-- JSP 페이지에서 사용할 JQuery API 수입 --> 
<!-- ******************************************************************************** -->   
<script src="/pro/resources/jquery-1.11.0.min.js" type="text/javascript"></script>



<!-- ******************************************************************************** -->
<!-- JSP 페이징서 사용할 CSS 파일 수입 -->
<!-- ******************************************************************************** -->
<link href="/pro/resources/style1.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="//fonts.googleapis.com/earlyaccess/nanumgothic.css">
<link rel="stylesheet" href="//fonts.googleapis.com/earlyaccess/nanumgothiccoding.css">
<link rel="stylesheet" href="//fonts.googleapis.com/earlyaccess/nanummyeongjo.css">
<link rel="stylesheet" href="//fonts.googleapis.com/earlyaccess/nanumbrushscript.css">
<link rel="stylesheet" href="//fonts.googleapis.com/earlyaccess/nanumpenscript.css">
<link rel="stylesheet" href="//cdn.jsdelivr.net/font-nanum/1.0/nanumbarungothic/nanumbarungothic.css">



<!-- ******************************************************************************** -->
<!-- JEL을 사용하여 HttpServletRequest객체에 bgcolor1 라는 키값으로 색상이 저장된 자바 변수 선언 -->
<!-- ******************************************************************************** -->
<c:set var="bgcolor1" value="skyblue" scope="request"/>