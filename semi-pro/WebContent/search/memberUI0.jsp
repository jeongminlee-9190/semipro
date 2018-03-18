<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<style>
  .memberUI {
  text-align: right;
  }

  li {
    list-style-type: none;
  }
</style>

<c:set var="loginInfo" value="${loginInfo }" scope="session" />

<c:if test="${empty loginInfo }">
<ul class="memberUI">
  <li><a href="MLoginUIServlet">로그인이 필요합니다<a></li>
</ul>
</c:if>

<c:if test="${!empty loginInfo }">
<ul class="memberUI">
  <li><a href="#">나의 맛집</a></li>
  <li><a href="#">프로필 정보</a></li>
  <li><a href="#">문의 사항</a></li>
  <li><a href="MLogoutServlet">로그아웃</a></li>
</ul>
</c:if>
