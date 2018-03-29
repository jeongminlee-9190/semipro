<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<form action="MLoginServlet" method="post" id="mLoginForm">
	<input type="text" name="mId" id="mId" placeholder="아이디 또는 이메일">
	<input type="text" name="mPasswd" id="mPasswd" placeholder="비밀번호">
	<input type="submit" value="LOGIN" id="mLogin">
	<a href="" title="회원가입">
		<input type="button" value="회원가입">
	</a>
	<!-- &#124; -->
	<div id="mLine"></div>
	<a href="" title="아이디 및 비밀번호 찾기">
		<input type="button" value="아이디 및 비밀번호 찾기">
	</a>
</form>

