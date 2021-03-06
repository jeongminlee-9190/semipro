<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script type="text/javascript" src="//code.jquery.com/jquery-3.3.1.js"></script>

<script type="text/javascript">
	$(document).ready(function(){
		$(".btn_pw_submit").click(function(){
			$(".phone_modify").html("<form action='soPhoneUpdateServlet' method='get'><input type='text' name='soPhone1' id='soPhone1' size='3'>-<input type='text' name='soPhone2' id='soPhone2' size='3'>-<input type='text' name='soPhone3' id='soPhone2' size='3'><input type='submit' value='변경완료'></form>")
		});
	});
</script>

<c:set var="dto" value="${login}"></c:set>
	<div class="soInfoView">
		<table class="soInfoView_tbl">
			<tr>
				<th>아이디</th>
				<td>${dto.soId}</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><a href="SoPwUpdateFormServlet"><input type="button" name="pw_modify" class="btn_pw_submit" value="변경"></a></td>
			</tr>
			<tr>
				<th>사업주 이름</th>
				<td>${dto.soName}</td>
			</tr>
			<tr>
				<th>사업주 전화번호</th>
				<td>${dto.soPhone} 
				<div class="phone_modify"><input type="button" name="soPhone" class="btn_pw_submit" value="변경"></div></td>
			</tr>
			<tr>
				<th>사업자 번호</th>
				<td>${dto.soLicense}</td>
			</tr>
			<tr>
				<th>주소</th>
				<td>${dto.soPost}<br>${fn:split(dto.soAddr,'/')[0]}&nbsp;&nbsp;${fn:split(dto.soAddr,'/')[1]}</td>
			</tr>
			<tr>
				<th>회원 레벨</th>
				<td><c:if test="${dto.soLevel eq 0}">미승인</c:if><c:if test="${dto.soLevel eq 1}">체험</c:if><c:if test="${dto.soLevel eq 2}">유료</c:if></td>
			</tr>
			<tr>
				<th>가입일</th>
				<td>${dto.soJoindate}</td>
			</tr>
			
			<tr>
				<td colspan="2" align="center">갬성갱단을 더 이상 이용하고 싶지 않다면 <a href="SoLeaveServlet"><button class="btn_leave">회원탈퇴</button></a></td>
			</tr>
		</table>
	</div>