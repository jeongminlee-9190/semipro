<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	.sInfoEnrollForm {
		position: fixed;
		top:20%;
		left:35%;
		width: 450px;
		height: 60%;
	}
	
	.bottom{
		text-align: center;
		border: 1px solid grey;
		position: fixed;
		top: 80%;
		width: 99%;
		height: 19%;
	}

</style>
</head>
<body>
<span class="logo">(로고)상점 관리 센터</span><br>
<jsp:include page="shopowner/include/top.jsp" flush="true"/>
<jsp:include page="soLoginForm.jsp" flush="true"/>
<div class="sInfoEnrollForm">
<h4>상점 기본 정보 등록</h4>
<jsp:include page="shop/sInfoEnrollForm.jsp" flush="true" />
</div>
<div class="bottom">
<jsp:include page="shopowner/include/bottom.jsp" flush="true" />
</div>
</body>
</html>