<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	.sInfoForm {
		border: 1px solid grey;
		position: fixed;
		left: 30%;
	}

</style>
</head>
<body>
<span class="logo">(로고)상점 관리 센터</span><br>
<jsp:include page="shopowner/include/top.jsp" flush="true"/>
<jsp:include page="soLoginForm.jsp" flush="true"/>
<div class="sInfoForm">
<h4>상점 기본 정보</h4>
<jsp:include page="shop/sView.jsp" flush="true" />
</div>
</body>
</html>