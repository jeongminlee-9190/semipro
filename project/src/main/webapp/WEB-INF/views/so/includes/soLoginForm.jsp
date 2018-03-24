<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:if test="${empty login}">
	<form action="sologin" method="get">
		<span class="loginText">로그인을 해주세요!</span><br>
		<input type="text" name="soId" class="input_soId" placeholder="아이디(이메일 형식)" maxlength="30"><br>
		<input type="password" name="soPasswd" class="input_soPasswd" placeholder="비밀번호" maxlength="10"><br>
		<input type="submit" class="btn_submit" value="로그인"><br>
	</form>
		<a href="soJoinForm"><input type="button" class="btn_join" value="회원가입"></a><br>
		<a href="soFindIdForm"><input type="button" class="btn_find" value="아이디 찾기"></a>&nbsp;<a href="soFindPwForm"><input type="button" class="btn_find" value="비밀번호 찾기"></a>
	
</c:if>

<c:if test="${!empty login}">
	<span class="state_login">${login.soId}&nbsp;</span>
	<a href="SoLogoutServlet"><span class="state_login">로그아웃</span></a>
	<a href="SoPwCheckUIServlet"><span class="state_login">MyPage</span></a>
</c:if>