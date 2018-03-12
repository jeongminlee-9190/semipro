<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/main.css">
<link rel="stylesheet" href="css/search.css">
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="jquery/main.js"></script>

<!-- ====================== select plugin ======================= -->
<link rel="stylesheet" href="css/subway/line/prettydropdowns.css">
<link rel="stylesheet" href="css/subway/station/prettydropdowns.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="js/line/jquery.prettydropdowns.js"></script>
<script src="js/station/jquery.prettydropdowns.js"></script>
<!-- ============================================================ -->

<title>갬성갱단</title>
<style media="screen">
  header {text-align: center;}
</style>
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

</body>
</html>
