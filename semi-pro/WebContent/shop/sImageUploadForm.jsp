<%@page import="java.io.File"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<form action="SImageUploadServlet" method="post" enctype="multipart/form-data">	
	<c:set var="sdto" value="${sinfo}"></c:set>
	상점소유자<input Type="text" name="soId" id="soId" value="${sdto.soId}">
	<table>
		<tr>
			<td>메인 이미지: </td>
			<td><input type="file" name="sImage1" id="sImage1"></td>
		</tr>
		
		<tr>
			<td>상세 이미지: </td>
			<td><input type="file" name="sImage2" id="sImage2"></td>
		</tr>
	
		<tr>
			<td colspan="2"><input type="submit" value="등록">
			<a href="sManagement.jsp"><input type="button" value="취소"></a></td>
		</tr>
	</table>
</form>