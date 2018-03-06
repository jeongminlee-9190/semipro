<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 
<style>	
	.content_top{
		width:100%;
		background-color: #99e6ff;
	}
</style>
<c:if test="${!empty login}">
	<div class="content_top">
		<a href="SManagementUIServlet"><span>상점 관리</span></a>&nbsp;&nbsp;
		<a href="SoCenterUIServlet"><span>공지사항</span></a>
	</div>
</c:if>



