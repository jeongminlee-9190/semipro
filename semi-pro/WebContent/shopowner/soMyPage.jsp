<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:set var="dto" value="${login}"></c:set>
<form>
아이디: ${dto.soId}<br>
비밀번호: <input type="text" name="passwd1" id="passwd1" placeholder="현재 비밀번호"><br>
	   <input type="text" name="passwd2" id="passwd2" placeholder="새로운 비밀번호"><br>
사업주 이름: ${dto.soName}<br>
사업주 전화번호: <input type="text" value="${fn:split(dto.soPhone,'-')[0]}" size="4" maxlength="4">-
			<input type="text" value="${fn:split(dto.soPhone,'-')[1]}" size="4" maxlength="4">-
			<input type="text" value="${fn:split(dto.soPhone,'-')[2]}" size="4" maxlength="4"><br>
사업자 번호: ${dto.soLicense}<br>
주소: ${dto.soPost} ${fn:split(dto.soAddr,'/')[0]}&nbsp;${fn:split(dto.soAddr,'/')[1]}<br>
회원 레벨: <c:if test="${dto.soLevel eq 0}">미승인</c:if><c:if test="${dto.soLevel eq 1}">체험</c:if><c:if test="${dto.soLevel eq 2}">유료</c:if><br>
가입일: ${dto.soJoindate}<br>
<input type="submit" name="submit" value="수정">
<a href="index_shopowner.jsp"><input type="button" name="cancel" id="cancel" value="취소"></a>
</form>