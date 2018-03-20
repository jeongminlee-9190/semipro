<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<style>
	.loginText{
		font-size: 20px;
	}
	.input_soId,.input_soPasswd{
		margin-top: 10px;
		height: 35px;
		width: 300px;
		border: 1px solid #99e6ff;
	}
	.btn_submit{
		margin-top: 10px;
		height: 35px;
		width: 303px;
		border: 1px solid #99e6ff;
		background-color: #99e6ff;
		/* color: white;  
		font-weight: bold;*/
	}
	.btn_join{
		margin-top: 10px;
		height: 35px;
		width: 303px;
		border: 1px solid #99e6ff;
		background-color: white;
	}
	.btn_find{
		margin-top: 10px; 
		height: 35px;
		width: 150px;
		border: 1px solid #99e6ff;
		background-color: white;
	}
	.state_login{
		font-size:15px;	
	}
</style>

<c:if test="${empty login}">
	<form action="SoLoginServlet" method="post" >
		<span class="loginText">로그인을 해주세요!</span><br>
		<input type="text" name="soId" class="input_soId" placeholder="아이디(이메일 형식)" maxlength="30"><br>
		<input type="password" name="soPasswd" class="input_soPasswd" placeholder="비밀번호" maxlength="10"><br>
		<input type="submit" class="btn_submit" value="로그인"><br>
		<a href="SoJoinUIServlet"><input type="button" class="btn_join" value="회원가입"></a><br>
		<a href="SoFindsoIdServlet"><input type="button" class="btn_find" value="아이디 찾기"></a>&nbsp;<a href="SoFindsoPasswdServlet"><input type="button" class="btn_find" value="비밀번호 찾기"></a>
	</form>
</c:if>

<c:if test="${!empty login}">
	<span class="state_login">${login.soId}&nbsp;</span>
	<a href="SoLogoutServlet"><span class="state_login">로그아웃</span></a>
	<a href="SoPwCheckUIServlet"><span class="state_login">MyPage</span></a>
</c:if>