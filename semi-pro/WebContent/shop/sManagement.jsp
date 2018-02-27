<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<style>
	.shopbasicinfo,.shopimageinfo,.shopinfodelete {
		font-size: 20px;
	}

</style>

<!-- 레벨이 0인 경우 메뉴를 클릭하면 다른페이지로 -->
<br>
<table>
	<tr>
		<td colspan="2"><span class="shopbasicinfo">상점 기본정보</span></td>
	</tr>
	<tr>
		<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
		<td><a href="SInfoEnrollFormServlet">등록</a></td>
	</tr>
		<tr>
		<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
		<td><a href="">수정</a></td>
	</tr>
	<tr>
		<td colspan="2"><span class="shopimageinfo">상점 사진정보</span></td>
	</tr>
	<tr>
		<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
		<td><a href="SImgEnrollFormServlet">등록</a></td>
	</tr>
	<tr>
		<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
		<td><a href="">수정</a></td>
	</tr>
	<tr>
		<td colspan="2"><span class="shopinfodelete">상점 삭제</span></td>
	</tr>
</table>