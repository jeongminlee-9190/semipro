<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="shop" value="${shopInfo }" scope="request"></c:set>
<c:set var="businessHour" value="${businessHours }" scope="request"></c:set>


<h1>${shop.sName }</h1>
<hr>
<br>
주소 ${Shop.sAddr}<br><br>
전화번호 ${Shop.sPhone}<br><br>

영업시간 <br>
평일 : ${businessHours[0] }<br>
주말 : ${businessHours[1] }<br>
휴일 : ${businessHours[2] }<br>
<br>
주차여부 ${Shop.sParkingLot }<br>
<br>
테라스여부 ${Shop.sTerrace }


<script src="js/jquery-3.3.1.js"></script>
<script>

</script>
