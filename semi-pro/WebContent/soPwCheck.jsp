<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
		top:7%;
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
	}
	
	/* 페이지 하단 */
	.footer{
		border: 1px solid grey;
		position: fixed;
		top: 85%;
		width: 99%;
		height: 13%;
		text-align:center;
	}
	.soPwCheck{
		position: absolute;
		top: 50%;
		width: 99%;
	}
</style>
</head>
<body>


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
	<div class="soPwCheck">
		<jsp:include page="shopowner/soPwCheck.jsp" flush="true"/>
	</div>
	<div class="footer">
			footer
	</div>
</div>	
</body>
</html>