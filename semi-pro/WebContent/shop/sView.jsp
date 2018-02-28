<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<style>
	.sImg{
		border: 1px solid grey;
		position: fixed;
		top: 20%;
		left: 10%;
		width:25%;
		height:100px:
	}
	.sInfo{
		border: 1px solid grey;
		position: fixed;
		top: 25;
		left:35%;
	}
	.review{
		border: 1px solid grey;
		position: fixed;
		top: 25;
		left:65%;
	}
</style>

<div class="sImg">
<img src="sInfo">
</div>

<c:set var="sdto" value="${sinfo}"></c:set>


<div class="sInfo">
	<table>
		<br><br><br>
		<tr>
			<td>상점 상호:</td>
			<td>${sdto.sName}<br></td>
			<td></td> 
		</tr>
		<tr>
			<td>상점 전화:</td>
			<td>${sdto.sPhone}<br></td> 
			<td></td>
		</tr>
		<tr>
			<td>상점 주소:</td>
			<td>${sdto.sAddr}<br></td> 
			<td></td>
		</tr>
		<tr>
			<td colspan="2"><input type="button" value="지도"></td>
			<td></td>
			<td></td>
		</tr>
	</table>
</div>


<div class="review">
	<h4>평가</h4>
	단콤:...<br>
	짠맛:...<br>
	신맛:...<br>
</div>