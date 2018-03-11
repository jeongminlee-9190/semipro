<%@page import="dto.SoNoticeDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<style>
	.Notice{
		margin-left: 27%;
	
	}
	.notice_tbl,.noticesearch_tbl{
		width: 700px;
		border-bottom: 1px solid grey;
	}
	.notice_tbl td{
		border-top: 1px solid lightgrey;
	}

</style>

<div class="wrapper">
	<div class="Notice">
		<h3>공지사항</h3>
	
<!-- 검색 -->
		<form action="SoNoticeListServlet" method="get">
			<table class="noticesearch_tbl">
  				<tr align="center">
   					<td colspan="5">
    					<select name="searchName">
        					<option value="title">제목</option>
        					<option value="content">내용</option>
     					</select>
     					<input type="text" name="searchValue" size="40">
     					<input type="submit" value="검색">
   					</td>
 				</tr>
  			</table>
  		</form> 
 <!-- 검색 -->
 
		<table class="notice_tbl">
			<colgroup>
				<col width="10%">
				<col width="40%">
				<col width="10%">
				<col width="15%">
				<col width="10%">
			</colgroup>
 			<tr>
  				<th scope="col">글번호</th>
  				<th scope="col">제목</th>
  				<th scope="col">작성자</th>
  				<th scope="col">작성일</th>
  				<th scope="col">조회수</th>
 			</tr>
 
			<c:set var="pageDTO" value="${noticelist}"></c:set>
			<input type="hidden" name="num" value="${noticelist}">
			<c:forEach var="dto" items="${pageDTO.list}" varStatus="status">
 				<tr>
  					<td align="center">${dto.noticeNum}</td>
  					<td><a href="SoNoticeRetrieveServlet?num=${dto.noticeNum}">${dto.noticeTitle}</a></td>
  					<td align="center">${dto.noticeWriter}</td>
  					<td align="center">${dto.noticeWritedate}</td>
  					<td align="center">${dto.noticeReadcnt}</td>
 				</tr>
			</c:forEach>
  <!-- 페이지번호 -->
  			<tr>
   				<td colspan="5" align="center">◀&nbsp;<jsp:include page="soNoticePaging.jsp" flush="true" />▶</td>
  			</tr>
  <!-- 페이지번호 -->
		</table>
	</div>
</div>