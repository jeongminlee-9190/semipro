<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style media="screen">
  header {
    text-align: center;
  }
</style>
</head>
<body>
  <header>
    <h1 id="title">GAEMSEONG<br>GAENDAN</h1>
  </header>
  <jsp:include page="search/memberUI0.jsp" flush="true" />
  <jsp:include page="search/search0.jsp" flush="true"/>
  <br><br>
  <jsp:include page="search/subway0.jsp" flush="true"></jsp:include>
  <jsp:include page="search/keyword0.jsp" flush="true"></jsp:include>
</body>
</html>
