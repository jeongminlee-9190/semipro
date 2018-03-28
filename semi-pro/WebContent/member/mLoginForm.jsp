<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<form action="MLoginServlet" method="post">
	<input type="text" name="mId" id="mId" placeholder="아이디 또는 이메일">
	<input type="text" name="mPasswd" id="mPasswd" placeholder="비밀번호">
	<input type="submit" value="로그인">
	<a href=""><input type="button" value="회원가입"></a>
	<a href=""><input type="button" value="아이디/비밀번호 찾기"></a>
</form>

