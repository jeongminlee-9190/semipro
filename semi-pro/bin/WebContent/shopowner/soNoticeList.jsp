<%@page import="dto.SoNoticeDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- 검색 -->
  <tr>
   <td colspan="5">
   <form action="SoNoticeListServlet" method="get">
    <select name="searchName">
        <option value="title">제목</option>
        <option value="content">내용</option>
     </select>
     <input type="text" name="searchValue">
     <input type="submit" value="검색">
   </form> 
   </td>
  </tr>
 <!-- 검색 -->
 
<table border="1">
 <tr>
  <td>글번호</td>
  <td>제목</td>
  <td>작성자</td>
  <td>작성일</td>
  <td>조회수</td>
 </tr>
 
<c:set var="pageDTO" value="${list}"></c:set>
<c:forEach var="dto" items="${pageDTO.list}" varStatus="status">
 <tr>
  <td>${dto.noticeNum}</td>
  <td>${dto.noticeTitle}</td>
  <td>${dto.noticeWriter}</td>
  <td>${dto.noticeWritedate}</td>
  <td>${dto.noticeReadcnt}</td>
 </tr>

</c:forEach>
  <!-- 페이지번호 -->
  <tr>
   <td colspan="5"><jsp:include page="soNoticePaging.jsp" flush="true" /></td>
  </tr>
  <!-- 페이지번호 -->
</table>
