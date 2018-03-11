<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<table border="1">
 <tr>
  <td>문의유형</td>
  <td>제목</td>
  <td>문의날짜</td>
  <td>답변상태</td>
  <td>삭제</td>
 </tr>

<c:forEach var="dto" items="${list}" varStatus="status">
 <tr>
  <td>${dto.qnaCategory}</td>
  <td><a href="soQnaRetrieveServlet?qnaNum=${dto.qnaNum}">${dto.qnaTitle}</a></td>
  <td>${dto.qnaWritedate}</td>
  <td>${dto.qnaComplete}</td>
  <td><input type="button" value="X"></td>
 </tr>
</c:forEach>
</table>
<a href ="">1:1 문의하기</a>
