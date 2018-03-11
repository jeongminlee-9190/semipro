<%@page import="dto.SoNoticeDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/so/so_mainwrapper.css">
<link rel="stylesheet" type="text/css" href="css/so/content/so_noticelist.css">
<link rel="stylesheet" type="text/css" href="css/so/so_footer.css">
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
	<div class="soNoticeList">
		<jsp:include page="shopowner/soNoticeList.jsp" flush="true"/>
	</div>
	<div class="footer">
			footer
	</div>
</div>	

</body>
</html>