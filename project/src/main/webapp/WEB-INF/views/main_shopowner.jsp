<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/resources/css/so_mainwrapper.css" rel="stylesheet" >
<link href="${pageContext.request.contextPath}/resources/css/so_maincontent.css" rel="stylesheet" >
<link href="${pageContext.request.contextPath}/resources/css/so_footer.css" rel="stylesheet" >
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
			<jsp:include page="so/soLoginForm2.jsp" flush="true"/>
		</div>
		<div class="mainmenu">
			<jsp:include page="so/includes/soTop.jsp" flush="true"/>
		</div>
	</div>
	
	<div class="contentwrapper">
		<div class="content_top">
			<jsp:include page="so/includes/coContent_top.jsp" flush="true"/>
		</div>
	</div>

	<div class="footer">
		footer
	</div>	
</div>
</body>
</html>