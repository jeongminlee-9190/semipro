<%@page import="dto.SoNoticeDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
   function update(f){
	   f.action="MyBoardUpdateServlet";
   }
   function del(f){
	   f.action="MyBoardDeleteServlet";
   }
</script>
</head>
<body>
<br>
<input type="hidden" name="num" value="${retrieve}">
<table border="1">
	<tr>
		<td>제목</td>
		<td><input type="text" name="title" value="${retrieve.qnaTitle}" size="100px"></td>
	</tr>
	<tr>
		<td>문의내용</td>
		<td><textarea rows="10" cols="100" name="qnaContent" >${retrieve.qnaContent}</textarea></td>
	</tr>
		<tr>
		<td>문의날짜</td>
		<td>${retrieve.qnaWritedate}</td>
	</tr>
	<tr>
		<td>답변상태</td>
		<td>${retrieve.qnaComplete}</td>
	</tr>
	<tr>
		<td colspan="2"><button  onclick="update(myForm);">수정</button>
		<button onclick="del(myForm)">삭제</button></td>
	</tr>
</table>
</form>
<a href="SoQnaServlet">목록보기</a><br>
<a href="SoQnaServlet">목록보기2</a><br> hotfix2
</body>
</html>