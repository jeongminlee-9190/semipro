<%@page import="dto.SoNoticeDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<div class="wrapper">
	<input type="hidden" name="num" value="${sonoticeretrieve}">
	<div class="NoticeRetrieve">
		<h3>공지사항</h3>
		<table class="noticeRetrieve_tbl">
			<colgroup>
				<col width="15%">
				<col width="15%">
				<col width="15%">
				<col width="25%">
				<col width="15%">
				<col width="15%">
			</colgroup>
 			<tr>
  				<th scope="col">글번호</th>
  				<td>${sonoticeretrieve.noticeNum}</td>
  				<th scope="col">제목</th>
  				<td colspan="3">${sonoticeretrieve.noticeTitle}</td>
 			</tr>
 			<tr>
 				<th>작성자</th>
 				<td>${sonoticeretrieve.noticeWriter}</td>
 				<th>작성일</th>
 				<td>${sonoticeretrieve.noticeWritedate}</td>
 				<th>조회수</th>
 				<td>${sonoticeretrieve.noticeReadcnt}</td>
 			</tr>
 			<tr>
 				<td colspan="6" align="left" class="noticeContent">${sonoticeretrieve.noticeContent}</td>	
 			</tr>
			<tr>
				<td colspan="6"><a href="SoNoticeListServlet">목록보기</a><br></td>
			</tr>
		</table>
	</div>
	<table>
		
	</table>
</div>
