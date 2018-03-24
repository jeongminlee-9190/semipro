<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${pageContext.request.contextPath}/resources/css/so_mainwrapper.css" rel="stylesheet" >
<link href="${pageContext.request.contextPath}/resources/css/so_find.css" rel="stylesheet" >
<link href="${pageContext.request.contextPath}/resources/css/so_footer.css" rel="stylesheet" >
<title>아이디/비밀번호 찾기</title>
</head>
<body>
<c:if test="${!empty findfail}">
	<script>
		alert("${findfail}");
	</script>
	<c:remove var="findfail" scope="session" />
</c:if>

<div class="wrapper">
	<div class="mainwrapper">
		<div class="logo">
			<span>(갬성갱단)상점 관리 센터</span><br>
		</div>
		<div class="mainmenu">
			<jsp:include page="includes/soTop2.jsp" flush="true"/>
		</div>
	</div>
	<div class="soFind">
		<jsp:include page="includes/soFindIdForm.jsp" flush="true"/>
	</div>
	<div class="footer">
			footer
	</div>
</div>	
</body>
</html>