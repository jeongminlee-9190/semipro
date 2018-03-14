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
</head>
<body>
  <header>
    <jsp:include page="search0.jsp" flush="true"></jsp:include>
    <jsp:include page="subway0.jsp" flush="true"></jsp:include>
    <jsp:include page="keyword0.jsp" flush="true"></jsp:include>
    <jsp:include page="memberUI0.jsp" flush="true"></jsp:include>
    <hr>
  </header>
  <c:set var="shopList" value="${shopList }" scope="request"></c:set>
  <c:forEach var="shop" items="${shopList }">
  	<a href="ShopTrieveServlet?sCode=${shop.sCode }" >shop : ${shop.sName }</a>  <br>
  	address : ${shop.sAddr }<br>
  	tel : ${shop.sPhone }<br>
  	<a href="InterestServlet?sCode=${shop.sCode }">관심</a><br>
  	<hr>
  </c:forEach>
</body>
</html>
