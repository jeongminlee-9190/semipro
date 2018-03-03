<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<style>
	.shopbasicinfo,.shopimageinfo,.shopdelete {
		font-size: 20px;
		text-align: center;
	}
	
	
	.shopbasicInfoform {
		text-align: center;
		position: fixed;
		left: 10%;
		width: 20%;
		height: 50%;
		/*border: 1px solid grey;*/
		background-color: WhiteSmoke;

		
	}
	.shopimageInfoform {
		text-align: center;
		position: fixed;
		left: 40%;
		width: 20%;
		height: 50%;
		/*  border: 1px solid grey;*/
		background-color: WhiteSmoke;
	
	}
	.shopDeleteform {
		text-align: center;
		position: fixed;
		left: 70%;
		width: 20%;
		height: 50%;
		/*border: 1px solid grey;*/
		background-color: WhiteSmoke;
	}
	.shopdeletewarn{
		font-size: 10px;
		color: red;
	}
	a{
		font-size: 13px;
	}
</style>

<!-- 레벨이 0인 경우 메뉴를 클릭하면 다른페이지로 -->
<br>
<div class="shopbasicInfoform">
	<h3>1단계</h3>
	<span class="shopbasicinfo">상점 기본정보</span><br><br>
	<a href="SInfoEnrollFormServlet">등록</a><br><br>
	<a href="">수정</a><br><br>
	<a href="SViewServlet">확인</a><br><br>
</div>

<div class="shopimageInfoform">
	<h3>2단계</h3>
	<span class="shopimageinfo">상점 사진정보</span><br><br>
	<a href="SImageUploadFormServlet">등록</a><br><br>
	<a href="">수정</a><br><br>
	<a href="">확인</a><br><br>
</div>
<div class="shopDeleteform"> 
	<span class="shopdelete">상점 삭제</span><br><br>
	<p class="shopdeletewarn">삭제하면 복원되지 않습니다.<p>
	<a href="">삭제</a><br><br>
</div>
</table>
