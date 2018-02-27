<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<c:if test="${empty login}">
	<form action="SoLoginServlet" method="post" >
		<span class="login">로그인을 해주세요!</span><br>
		<input type="text" name="oId" placeholder="아이디(이메일 형식)">
		<input type="password" name="oPasswd" placeholder="비밀번호"><br>
		<input type="submit" value="로그인"><input type="reset" value="취소">
	</form>
</c:if>

<c:if test="${!empty login}">
	${login.oId}&nbsp;
	<a href="SoLogoutServlet">로그아웃</a>
	<a href="SoMyPageServlet">MyPage</a>
</c:if>