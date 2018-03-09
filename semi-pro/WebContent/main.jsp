<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="jquery/main.js"></script>
<title>Insert title here</title>
<style media="screen">
  header {text-align: center;}
</style>
</head>
<body>
  <header>
    <h1 id="title">GAEMSEONG<br>GAENDAN</h1>
    <jsp:include page="search/search.jsp" flush="true"/>
  </header>
  <div id="center_wrapper">
	  <jsp:include page="search/subway.jsp" flush="true" />
	  <%-- <jsp:include page="search/keyword.jsp" flush="true" /> --%>
  </div>
</body>
</html>
