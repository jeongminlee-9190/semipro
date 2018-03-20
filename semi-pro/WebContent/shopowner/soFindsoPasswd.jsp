<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script type="text/javascript" src="//code.jquery.com/jquery-3.3.1.js"></script>
<script>
	$(document).ready(function(){
		var re_phone1=/^[0-9]{3,4}$/;
		var re_phone2=/^[0-9]{4,4}$/;
		var re_phone3=/^[0-9]{4,4}$/;
		var re_license=/^[0-9]{10,10}$/;
		var re_email=/^([\w\.-]+)@([a-z\d\.-]+)\.([a-z\.]{2,6})$/;
		$("#SoFindForm").submit(function(e){
			if(re_email.test($("#soId").val())!= true){
				alert('아이디를 입력하세요');
				$("#soId").focus();
				e.preventDefault();
			}
			
			if(re_license.test($("#soLicense").val())!= true){
				alert('유효한 사업자 번호를 입력하세요. 10자리&하이픈제거');
				$("#soLicense").focus();
				e.preventDefault();
			}
			
			if($("#soName").val()==""){
				alert('이름을 입력하세요');
				$("#soName").focus();
				e.preventDefault();
			}
			
			
			if(re_phone1.test($("#soPhone1").val())!= true){
				alert('유효한 전화번호를 입력하세요');
				$("#soPhone1").focus();
				e.preventDefault();
			}
			if(re_phone2.test($("#soPhone2").val())!= true){
				alert('유효한 전화번호를 입력하세요');
				$("#soPhone2").focus();
				e.preventDefault();
			}
			if(re_phone3.test($("#soPhone3").val())!= true){
				alert('유효한 전화번호를 입력하세요');
				$("#soPhone3").focus();
				e.preventDefault();
			}	
		});
	});
</script>




<div class="wrapper">
	<div class="soFindForm">
		<h3>비밀번호 찾기</h3><hr><br>
		<form action="SoFindServlet" id="SoFindForm" method="get">
			<input type="hidden" name="find" value="soPasswd">
			<table class="soFindsoPasswdForm_tbl">
		 		<tr>
		 			<th>아이디</th>
		 			<td><input type="text" name="soId" id="soId" size="25" maxlength="30" placeholder="이메일 형식"></td>
		 		</tr>
		 		<tr>
		 			<th>사업자 번호</th>
		 			<td><input type="text" name="soLicense" id="soLicense" size="11" maxlength="10" placeholder="-하이픈 입력X"></td>
		 		</tr>
		 		<tr>
		 			<th>사업주 이름</th>
		 			<td><input type="text" name="soName" id="soName" size="11" maxlength="10"></td>
		 		</tr>
		 		<tr>
		 			<th>사업주 전화번호</th>
		 			<td><input type="text" name="soPhone1" id="soPhone1" size="2" maxlength="3">-<input type="text" name="soPhone2" id="soPhone2" size="2" maxlength="4">-<input type="text" name="soPhone3" id="soPhone3" size="2" maxlength="4"></td>
		 		</tr>
				<tr>
					<td colspan="2" align="center"><input type="submit" class="btn_soFindsoId" value="찾기"></td>
				</tr>
				
				<tr>
					<td colspan="2" align="center"><a href="index_shopowner.jsp"><input type="button" class="btn_loginPage" value="로그인 페이지로 가기"></a></td>
				</tr>			
			</table>
		</form>
	</div>
</div>
