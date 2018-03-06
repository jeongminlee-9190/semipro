<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<style>
	.soInfoView{
		position: relative;
		margin-left: auto;
	}
	.soInfoView_tbl {
		margin-top: 2%;
		margin-left: 30%;
		border: 1px solid #99e6ff;
		width: 550px;
	}
	.soInfoView_tbl th{
		height: 30px;
		width: 200px;
	}
	.soInfoView_tbl td{
		height: 30px;
		font-size: 14px;
		width: 350px;
	}
	.soInfoUpdateComplete{
		position: absolute;
	}
	.btn_submit {
		border: 1px solid #99e6ff;
		background-color: #99e6ff;
		margin-top: 20px;
		height:35px;
		width: 150px;
		/*color: white;*/
	}
	
	.btn_cancel{
		border: 1px solid #99e6ff;
		background-color: white;
		margin-top: 10px;
		height:35px;
		width: 150px;
		/*color: white;*/
	}
</style>
<!--  
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">

	$(document).ready(function(){
		
		
		var re_pw = /^[a-z0-9]{8,10}$/;
		var re_phone1 = /^[0-9]{2,3}$/;
		var re_phone2 = /^[0-9]{3,4}$/;
		var re_phone3 = /^[0-9]{4,4}$/;

		var soPasswd1=$('#soPasswd1').val;
		var soPasswd2=$('#soPasswd2').val;
		var soPhone1=$('#soPhone1').val;
		var soPhone2=$('#soPhone2').val;
		var soPhone3=$('#soPhone3').val;
		console.log(soPasswd1);
		console.log(soPasswd2);
		console.log(soPhone1);
		console.log(soPhone2);
		console.log(soPhone3);
		
		$("form").submit(function(){
			if(re_pw.test(soPasswd1.val())!= true){ //비밀번호 검사
				alert("비밀번호는 특수문자를 제외하고 8자 이상 10자 이하로 기재해주세요.");
				soPasswd1.focus();
				return false;
			}else if(re_phone1.test(soPhone1.val()) != true){
				alert("전화번호 형식이 아닙니다. 다시 입력해 주세요.");
				soPhone1.focus();
				return false;
			}
			console.log(form);
			console.log(soPasswd1);
			console.log(soPasswd2);
			console.log(soPhone1);
			console.log(soPhone2);
			console.log(soPhone3);
		});
	});
</script>
-->


<c:set var="dto" value="${login}"></c:set>
<form action="soInfoUpdateServlet" method="get">
	<div class="soInfoView">
		<table class="soInfoView_tbl">
			<tr>
				<th>아이디</th>
				<td>${dto.soId}</td>
			<tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="text" name="soPasswd" id="soPasswd" size="13" maxlength="10" placeholder="새로운 비밀번호">&nbsp;<input type="text" name="soPasswd2" id="soPasswd2" size="13" maxlength="10" placeholder="재입력">
				<span class="result1"></span><br></td>
			<tr>
			<tr>
				<th>사업주 이름</th>
				<td>${dto.soName}</td>
			<tr>
			<tr>
				<th>사업주 전화번호</th>
				<td><input type="text" value="${fn:split(dto.soPhone,'-')[0]}" size="4" maxlength="4" name="soPhone1" id="soPhone1">-
				<input type="text" value="${fn:split(dto.soPhone,'-')[1]}" size="4" maxlength="4" name="soPhone2" id="soPhone2">-
				<input type="text" value="${fn:split(dto.soPhone,'-')[2]}" size="4" maxlength="4" name="soPhone3" id="soPhone3">
				<span class="result2"></span><br></td>
			<tr>
			<tr>
				<th>사업자 번호</th>
				<td>${dto.soLicense}</td>
			<tr>
			<tr>
				<th>주소</th>
				<td>${dto.soPost}<br>${fn:split(dto.soAddr,'/')[0]}&nbsp;&nbsp;${fn:split(dto.soAddr,'/')[1]}</td>
			<tr>
			<tr>
				<th>회원 레벨</th>
				<td><c:if test="${dto.soLevel eq 0}">미승인</c:if><c:if test="${dto.soLevel eq 1}">체험</c:if><c:if test="${dto.soLevel eq 2}">유료</c:if></td>
			<tr>
			<tr>
				<th>가입일</th>
				<td>${dto.soJoindate}</td>
			<tr>

			<tr>
				<td colspan="2" align="center"><input type="submit" name="submit" class="btn_submit" value="수정">
				<a href="main_shopowner.jsp"><input type="button" name="cancel" class="btn_cancel" value="취소"></a></td>
			</tr>
		</table>
	</div>
</form>