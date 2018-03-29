<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- css -->
<!-- reset -->
<link rel="stylesheet" href="../css/reset.css">
<!-- font -->
<link rel="stylesheet" href="../css/fonts.css">

<link rel="stylesheet" href="../css/member_login.css">
<link rel="stylesheet" href="../css/footer.css">

<title>갬성갱단 로그인</title>
</head>
<body>

<div id="loginHeader">
	<a href="index.jsp">
		<img src="images/logo_login.png" title="home">
	</a>
</div>

<div id="login_title">
	<p>LOGIN</p>
</div>

<jsp:include page="member/mLoginForm.jsp" flush="true"/>

<div id="footer">
	<jsp:include page="../footer/footer.jsp" flush="true" />
</div>

</body>
</html>