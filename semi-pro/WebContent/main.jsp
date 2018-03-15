<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- css -->
<!-- reset -->
<link rel="stylesheet" href="css/reset.css">
<!-- font -->
<link rel="stylesheet" href="css/font.css">

<link rel="stylesheet" href="css/main.css">
<link rel="stylesheet" href="css/search.css">

<!-- jquery -->
<script src="//ajax.googleapis.com/ajax/libs/webfont/1.4.10/webfont.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="js/main.js"></script>
<script src="js/subway.js"></script>

<title>갬성갱단</title>

</head>
<body>

<header id="header">
	<div id="logo">
		<img src="images/logo.png" title="logo">
	</div>
	<jsp:include page="search/search.jsp" flush="true"/>
</header>

<div id="center_wrapper">
	<jsp:include page="search/subway.jsp" flush="true" />
	<%-- <jsp:include page="search/keyword.jsp" flush="true" /> --%>
</div>
<a href="MJoinFormServlet">회원가입</a>
<a href="">로그인</a>
</body>
</html>
