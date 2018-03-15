<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!-- <a href="MJoinFormServlet">회원가입</a> -->
<c:if test="${empty memberlogin}">
	<div id="login_wrap">
		<a href="MLoginFormServlet" title="login">
			<span id="login">LOGIN</span>
			<span id="lgoin_icon"><img src="images/login_icon.png"></span>
		</a>
	</div>
</c:if>

<c:if test="${!empty memberlogin}">
	<span>${memberlogin.mId}&nbsp;</span>
	<img src="images/login_icon.png"><a href="MLogoutServlet"><span>로그아웃</span></a>
	<a href="MMypageServlet"><span>MyPage</span></a>
</c:if>