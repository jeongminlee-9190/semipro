<%@page import="java.io.File"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<style>
	.imageUpload_tbl{
		border: 1px solid grey;
		position: relative;
		padding-left: 35%;
		width: 100%;
		text-align: center;
	}
	.imageUpload_tbl th{
		width: 150px;
	}
	.imageUpload_tbl td{
		width: 100px;
	}
	.btn_submit {
		border: 1px solid #99e6ff;
		background-color: #99e6ff;
		margin-top: 20px;
		height:35px;
		width: 100px;
		/*color: white;*/
	}
	
	.btn_cancel{
		border: 1px solid #99e6ff;
		background-color: white;
		margin-top: 10px;
		height:35px;
		width: 100px;
		/*color: white;*/
	}
</style>

<form action="SImageUploadServlet" method="post" enctype="multipart/form-data">	
	<c:set var="sdto" value="${sinfo}"></c:set>
	<input Type="hidden" name="soId" id="soId" value="${sdto.soId}"><br>
	
	<div class="imageUpload_tbl">
	
		<table>
			<tr>
				<th>이미지1 </th>
				<td><input type="file" name="sImage1" id="sImage1"></td>
			</tr>
		
			<tr>
				<th>이미지2 </th>
				<td><input type="file" name="sImage2" id="sImage2"></td>
			</tr>
			<tr>
				<th>이미지3 </th>
				<td><input type="file" name="sImage3" id="sImage3"></td>
			</tr>
			
			<tr>
				<th>이미지4 </th>
				<td><input type="file" name="sImage4" id="sImage4"></td>
			</tr>
			
			<tr>
				<th>이미지5 </th>
				<td><input type="file" name="sImage5" id="sImage5"></td>
			</tr>
			<tr>
				<td colspan="2">*이미지는 최대 5개까지 등록 가능합니다.<br>
				<input type="submit" class="btn_submit" value="등록">
				<a href="sManagement.jsp"><input type="button" class="btn_cancel" value="취소"></a></td>
			</tr>
	</table>
	</div>
</form>