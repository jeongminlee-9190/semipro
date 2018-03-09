<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script type="text/javascript" src="./js/jquery-3.3.1.js"></script>
<script type="text/javascript">
$(document).ready(function(){
		
	$("#delBtn").on("click",function(){
		location.href="mDeleteServlet?mId="+$("#mid").text();
	});
	
	$("#memberAdd").on("click",function(){
		location.href="";
	});
});
</script>

<table border="1">
	<tr>
		<th>번호</th>
		<th>아이디</th>
		<th>이름</th>
		<th>핸드폰</th>
	</tr>
	
	<c:forEach var="dto" items="${list}" varStatus="status">
	 <tr>
	  <td>${dto.rownum}</td>
	  <td id="mid">${dto.mId}</td>
	  <td>${dto.mName}</td>
	  <td>${dto.mPhone1}-${dto.mPhone2}-${dto.mPhone3}</td>
	  <td>
	  		<button onclick="window.open('mUpdateUIServlet?rownum=${dto.rownum}',
			  '멤버 수정폼','width=430px,height=500px,location=no,status=no,scrollbars=yes');">수정
			</button>
	  </td>
	  <td><button id="delBtn">삭제</button></td>
	 </tr>
	</c:forEach>
</table>
	<button id="memberAdd">등록</button>
