<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div class="wrapper">

	<div class="soQna_View">
		<h3>1:1 문의</h3>
		<table class="soQna_tbl">
			<colgroup>
				<col width="15%">
				<col width="40%">
				<col width="10%">
				<col width="10%">
			</colgroup>
		 	<tr>
			  <td scope="col">문의유형</td>
			  <td scope="col">제목</td>
			  <td scope="col">문의날짜</td>
			  <td scope="col">답변상태</td>
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
		
		<form action="soQnaWriteServlet" method="post">
			<table>
				<tr>
					<td>
						<input type="hidden" name="soQnaWrite" value="soQnaWriteLink">
						<input type="submit" class="btn_submit" value="1:1 문의하기">
					</td>
				</tr>
			</table>
		</form>
	</div>
</div>