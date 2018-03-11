<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	@import url("http://fonts.googleapis.com/earlyaccess/nanumgothic.css");
	body { font-family:"Nanum Gothic"; }
	
	.main {
		/*background-color: #99e6ff;*/
		text-align: center;
		padding-top: 5%;
	}
	.logo{
		
		font-size: 40px;
	}
</style>
</head>
<body>
<c:if test="${! empty success}">
   <script type="text/javascript">
    alert('${success}');
   </script>
</c:if>

<c:if test="${!empty logout}">
	<script type="text/javascript">
    	alert('${logout}');
    </script>
</c:if>

<div class="main">
	<span class="logo">(갬성갱단)<br>상점 관리 센터</span><br>
	<jsp:include page="shopowner/include/top.jsp" flush="true"/>
</div>

<div class="loginForm">
<jsp:include page="shopowner/soLoginForm.jsp" flush="true"/>
</div>
</body>
</html>