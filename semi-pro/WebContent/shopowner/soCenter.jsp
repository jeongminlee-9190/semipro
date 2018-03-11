<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<!--  
<c:if test="${!empty login}">
	${login.soId}&nbsp;
	<a href="SoLogoutServlet">로그아웃</a>
	<a href="SoMyPageServlet">MyPage</a>
</c:if>
-->
<br>
<a href="SoNoticeListServlet">공지사항</a>
<a href="">자주하는 질문</a>
<a href="SoQnaServlet">1:1 문의</a>
<a href="SoQnaReplyServlet">1:1 문의 답변하기(관리자)</a>
<a href="SoQnaReplyServlet">1:1 문의 답변하기(상점)</a>
