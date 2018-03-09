<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- <script type="text/javascript" src="/js/jquery-3.3.1.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#Btn").on('click',function(){
		debugger;
		slef.close();
		location.href="";
	});
});
</script> -->
<script type="text/javascript">
function b1(){
	debugger;
	window.opener.loction.href="../admin/member/memberListForm.jsp";
	window.close();	
}
</script>
</head>
<body>

<form action="mUpdateServlet" method="get" onsubmit="javascript:b1()">
	<input type="hidden" name="rownum"value="${dto.rownum}"/>
	<table border="1">
		<tr>
			<td>아이디:${dto.mId }</td>
		</tr>
		
		<tr>
			<td>비밀번호:<input type="password" name="mPasswd" id="pwd" value="${dto.mPasswd }">
		</tr>
		
		<tr>
			<td>이름:<input type="text" name="mName" value="${dto.mName }"></td>
		</tr>
		
		<tr>
			<td>전화번호:<input type="text" name="mPhone1" value="${dto.mPhone1 }">-
							 <input type="text" name="mPhone2" value="${dto.mPhone2 }">-
							 <input type="text" name="mPhone3" value="${dto.mPhone3 }"></td>
		</tr>
	
		<tr>
			<td><input type="submit" value="수정" id="Btn"><input type="submit" value="닫기" onclick="window.close()"></td>
		</tr>
		
	</table>
</form>

</body>
</html>