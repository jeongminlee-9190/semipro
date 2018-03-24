<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/resources/css/so_mainwrapper.css" rel="stylesheet" >
<link href="${pageContext.request.contextPath}/resources/css/so_mypage" rel="stylesheet" >
<link href="${pageContext.request.contextPath}/resources/css/so_footer.css" rel="stylesheet" >

</head>
<body>
<c:if test="${!empty login}">
	<div class="wrapper">
		<div class="mainwrapper">
			<div class="logo">
				<span>(갬성갱단)상점 관리 센터</span><br>
			</div>
			<div class="loginForm">
				<jsp:include page="soLoginForm2.jsp" flush="true"/>
			</div>
			<div class="mainmenu">
				<jsp:include page="includes/soTop.jsp" flush="true"/>
			</div>
		</div>
		<div class="soMyPage">
			<jsp:include page="includes/soResult.jsp" flush="true"/>
		</div>
		<div class="footer">
				footer
		</div>
	</div>
</c:if>
<c:if test="${!empty findSoIdResult}">
	<div class="wrapper">
		<div class="mainwrapper">
			<div class="logo">
				<span>(갬성갱단)상점 관리 센터</span><br>
			</div>
		</div>
		<div class="soMyPage">
			<jsp:include page="includes/soResult.jsp" flush="true"/>
		</div>
		<div class="footer">
				footer
		</div>
	</div>
</c:if>	

<c:if test="${!empty findSoPasswdResult}">
	<div class="wrapper">
		<div class="mainwrapper">
			<div class="logo">
				<span>(갬성갱단)상점 관리 센터</span><br>
			</div>
		</div>
		<div class="soMyPage">
			<jsp:include page="includes/soResult.jsp" flush="true"/>
		</div>
		<div class="footer">
				footer
		</div>
	</div>
</c:if>	
</body>
</html>