<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<!-- css -->
<!-- reset -->
<link rel="stylesheet" type="text/css" href="css/reset.css">
<!-- font -->
<link rel="stylesheet" type="text/css" href="css/fonts.css">

<link rel="stylesheet" type="text/css" href="css/member_header.css">
<link rel="stylesheet" type="text/css" href="css/member_join.css">
<link rel="stylesheet" type="text/css" href="css/footer.css">


<!-- jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="js/jquery-3.3.1.js"></script>
<script src="js/member_join.js"></script>

<title>회원가입</title>

</head>
<body>

<jsp:include page="member/memberHeader.jsp" flush="true"/>

<jsp:include page="member/mJoinForm.jsp" flush="true"/>

<jsp:include page="footer/footer.jsp" flush="true" />

</body>
</html>