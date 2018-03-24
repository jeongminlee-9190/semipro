<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="js/jquery-3.3.1.js"></script>

<c:set var="login" value="${loginInfo }" scope="session"></c:set>
<c:set var="shop" value="${shopInfo }" scope="request"></c:set>
  <jsp:include page="memberUI0.jsp" flush="true" />
  <jsp:include page="search0.jsp" flush="true"/>
  <jsp:include page="subway0.jsp" flush="true"></jsp:include>
  <jsp:include page="keyword0.jsp" flush="true"></jsp:include><br>
<h1>${shop.sName }</h1>
<hr>
<jsp:include page="shopimage0.jsp" flush="true"></jsp:include>
<hr>
<button id="shopInfo">상점정보</button>
<button id="shopMenu">메뉴</button>
<hr>
map information
<hr>
<jsp:include page="review0.jsp"></jsp:include>


<script>
$("#shopInfo").on("click",function(){
	window.open("ShopInfoServlet?sCode=${dto.sCode}","상점정보","width=500,height=600");
});
$("#shopMenu").on("click",function(){
	window.open("ShopMenuServlet?sCode=${dto.sCode}","상점메뉴","width=500,height=600");
});


</script>
