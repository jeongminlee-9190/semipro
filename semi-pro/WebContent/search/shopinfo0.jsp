<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="dto" value="${shopdto }" scope="request"></c:set>
<c:set var="businessHour" value="${businessHours }" scope="request"></c:set>


<h1>${dto.sName }</h1>
<hr>
<br>
주소 ${dto.sAddr}<br><br>
전화번호 ${dto.sPhone}<br><br>

영업시간 <br>
평일 : ${businessHours[0] }<br>
주말 : ${businessHours[1] }<br>
휴일 : ${businessHours[2] }<br>
<br>
주차여부 ${dto.sParkingLot }<br>
<br>
테라스여부 ${dto.sTerrace }


<script src="js/jquery-3.3.1.js"></script>
<script>

</script>
