<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="dto" value="${shopdto }" scope="request"></c:set>

<%-- <jsp:include page="shopimage0.jsp" flush="true"></jsp:include> --%>
<h1>${dto.sName }</h1>
<hr>
shop images
<hr>
<button id="shopInfo">상점정보</button>
<button id="shopMenu">메뉴</button>
<hr>
map information
<hr>
<jsp:include page="review0.jsp"></jsp:include>

<script src="jquery-3.3.1.js"></script>
<script>
$("#shopInfo").on("click",function(){
	window.open("ShopInfoServlet?sCode=${dto.sCode}","상점정보","width=600,height=700");
});

</script>