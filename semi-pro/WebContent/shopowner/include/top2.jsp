<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 
<style>	
	a{
		text-decoration: none;
	}
	span{
		font-size: 20px;
	}
 	.main_menu{
 		background-color: #99e6ff; 
 		padding-top: 10px;
 		height: 40px;
 	
 	}
</style>
<c:if test="${!empty login}">
	<div class="main_menu">
		<a href=""><span>서비스 소개</span></a>&nbsp;&nbsp;
		<a href="SManagementUIServlet"><span>상점 관리</span></a>&nbsp;&nbsp;
		<a href="SoCenterUIServlet"><span>고객센터</span></a>
	</div>
</c:if>



