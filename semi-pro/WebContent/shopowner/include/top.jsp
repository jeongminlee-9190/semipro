<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 
<style>
	.header_top_left {
		border:1px solid grey;
		font-size: 30px;
		float:left;
		height:50px;
		position:fixed;
		top:10px;
	}
	.header_top_right{
		position:fixed;
		right:1000px;
		height:20px;
	 	margin-top:20px;
	}
	 
	.header_bottom{
		border:1px solid grey;
		position: fixed;
		top: 40px;
		left:500px;
		font-size: 20px;
	}
	
	a{
		text-decoration: none;
	}
</style>
-->

<div class="header_wrapper">
<c:if test="${empty login}">
	<a href="SoUIServlet">회원가입</a>&nbsp;&nbsp;
</c:if>
<c:if test="${!empty login}">
	<a href="SManagementUIServlet">상점 관리</a>&nbsp;&nbsp;
	<a href="SoCenterUIServlet">고객센터</a>
</c:if>
</div>



