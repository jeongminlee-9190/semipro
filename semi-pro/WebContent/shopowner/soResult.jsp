<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<style>
	.result {
		margin-top: 10%;
		margin-left: 43%;
		width: 550px;
	}
	.findResult {
		margin-top: 10%;
		margin-left: 43%;
		width: 550px;
	}
	.btn_main{
		border: 1px solid #99e6ff;
		background-color: white;
		margin-top: 10px;
		margin-left:5%;
		height:35px;
		width: 150px;
		/*color: white;*/
	}
	
	.btn_login{
		border: 1px solid #99e6ff;
		background-color: white;
		margin-top: 10px;
		margin-left:5%;
		height:35px;
		width: 200px;
		/*color: white;*/
	}
</style>
<c:if test="${!empty result}">
	<div class="result">
		<span>${result}</span>가 변경되었습니다.<br>
		<a href="main_shopowner.jsp"><button class="btn_main">메인으로</button></a>
	</div>
	<c:remove var="isCaptchaSolved" scope="session" />
	<c:remove var="result" scope="session" />
</c:if>
<c:if test="${!empty findSoIdResult}">
	<div class="findResult">
		아이디는 <span>${findSoIdResult}</span> 입니다.<br>
		<a href="index_shopowner.jsp"><button class="btn_login">로그인 화면으로</button></a>
	</div>
	<c:remove var="findSoIdResult" scope="session" />
</c:if>

<c:if test="${!empty findSoPasswdResult}">
	<div class="findResult">
		비밀번호는 <span>${findSoPasswdResult}</span> 입니다.<br>
		<a href="index_shopowner.jsp"><button class="btn_login">로그인 화면으로</button></a>
	</div>
	<c:remove var="findSoPasswdResult" scope="session" />
</c:if>




