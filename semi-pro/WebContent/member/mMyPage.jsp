<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<form>
<h3>마이페이지</h3>
아이디 &nbsp;&nbsp;${memberlogin.mId}<br>
비밀번호<input type="button" value="변경하기"><br>
닉네임&nbsp;&nbsp;${memberlogin.mName}<br>
휴대전화&nbsp;&nbsp;${memberlogin.mPhone}<br>
출생년도&nbsp;&nbsp; ${memberlogin.mBirth}<br>
<a href="main.jsp"><input type="button" value="확인"></a>
</form>