<%@page import="dto.SoNoticeDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script type="text/javascript" src="//code.jquery.com/jquery-3.3.1.js"></script>
<script type="text/javascript">
  $(document).ready(function(){
	 $(".btn_qnaModify").click(function(){
		 $("#soQnaForm").attr("action","SoQnaModifyServlet").submit();
	 }); 
	 $(".btn_qnaDelete").click(function(){
		 $("#soQnaForm").attr("action","SoQnaDeleteServlet").submit();
	 }); 
  });
</script>
</head>
<body>
<form id="soQnaForm" action="">
	<div class="wrapper">
		<div class="soQnaRetrieveForm">
			<h3>1:1 문의 내용 보기</h3>
			<input type="hidden" name="num" value="${soQnaRetrieve}">
			
			<table class="soQnaRetrieve_tbl">
				<tr>
					<th>제목</th>
					<td><input type="text" name="qnaTitle" value="${soQnaRetrieve.qnaTitle}" size="76"></td>
				</tr>
				<tr>
					<th>문의내용</th>
					<td><textarea rows="15" cols="93" name="qnaContent" >${soQnaRetrieve.qnaContent}</textarea></td>
				</tr>
				<tr>
					<th>문의날짜</th>
					<td>${soQnaRetrieve.qnaWritedate}</td>
				</tr>
				<tr>
					<th>답변상태</th>
					<td>${soQnaRetrieve.qnaComplete}</td>
				</tr>
				<c:if test="${soQnaRetrieve.qnaComplete=='확인중'}">
					<tr>
						<td colspan="2" align="center"><button class="btn_qnaModify">수정</button>&nbsp;
						<input type="button" class="btn_qnaDelete" value="삭제">&nbsp;<a href="SoQnaServlet">
						<input type="button" class="btn_qnaList" value="목록보기"></a></td>
					</tr>
				</c:if>
				<c:if test="${soQnaRetrieve.qnaComplete=='처리중' || soQnaRetrieve.qnaComplete=='답변완료'}">
					<tr>
						<td colspan="2" align="center">처리중이나 답변완료일 경우에는 수정, 삭제가 불가합니다.</td>
					</tr>
				</c:if>
			</table>
		</div>
	</div>
</form>
<a href="SoQnaServlet">목록보기</a><br>
</body>
</html>