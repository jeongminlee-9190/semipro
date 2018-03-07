<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/main.css" rel="stylesheet" type="text/css">
<link href="css/search.css" rel="stylesheet" type="text/css">
<title>Gaemseong-Gaengdan</title>
</head>
<body>
  <header id="header">
  	<div id="logo">
  		<img src="images/logo.png">
  	</div>
    <jsp:include page="search/search.jsp" flush="true"/>
  </header>
  <br><br>
  <jsp:include page="search/keyword.jsp" flush="true"></jsp:include>
</body>
</html>
