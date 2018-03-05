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
	.mainwrapper {
		/*background-color: #99e6ff;*/
		position: relative;
		top:0px;
		left:0px;
		max-width:100%;
		height: 80px;
	}
	.logo{
		position: absolute;
		font-size: 25px;
		top:0%;
		left:3%;
		width:300px;
	}
	.loginForm{
		position: absolute;
		top:3%;
		margin-left: 400px;
		text-align:right;
		width:70%;	
		float:right;
	}
	.mainmenu{
		position: absolute;
		top:70%;
		width:100%;	
		text-align:center;
		font-size: 20px;
	}
	.contentwrapper{
		position: absolute;
		top:110px;
		max-width:100%;	
		height: 70%;
		text-align:center;
		font-size: 20px;
	}
	.footer{
		border: 1px solid grey;
		position: fixed;
		top: 85%;
		width: 99%;
		height: 13%;
		text-align:center;
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

<div class="wrapper">
	<div class="mainwrapper">
		<div class="logo">
			<span>(갬성갱단)상점 관리 센터</span><br>
		</div>
		<div class="loginForm">
			<jsp:include page="soLoginForm2.jsp" flush="true"/>
		</div>
		<div class="mainmenu">
			<jsp:include page="shopowner/include/top2.jsp" flush="true"/>
		</div>
	</div>
	
	<div class="contentwrapper">
		<div class="content_top">
			<jsp:include page="shopowner/include/content_top.jsp" flush="true"/>
		</div>
	</div>

	<div class="footer">
		footer
	</div>	
</div>
</body>
</html>