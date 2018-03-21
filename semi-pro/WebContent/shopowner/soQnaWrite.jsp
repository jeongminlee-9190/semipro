<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="wrapper">

	<div class="soQnaWrite_form">
		<h3>1:1 문의 접수</h3>
		<form action="soQnaWriteServlet">
			<input type="hidden" name="soQnaWrite" value="soQnaWriteForm">
			<table class="soQnaWrite_tbl">
			 	<tr>
				  <td>문의유형</td>
				  <td>제목</td>
			 	</tr>
			 	
			 	<tr>
				  <td>
				  	 <select name="qnaCategory">
				  		<option>서비스이용</option>			
				  		<option>서비스결제</option>
				  		<option>이용불만</option>
				  	 </select>
				  </td>
				  <td><input type="text" name="qnaTitle" size="76"></td>
			 	</tr>
			 	
			 	<tr>
			 		<td colspan="2"><textarea name="qnaContent" rows="15" cols="93"></textarea></td>
			 	</tr>
			 	<tr>
			 		<td colspan="2"><input type="submit" class="btn_submit" value="접수"><a href="soQna.jsp">&nbsp;&nbsp;&nbsp;<input type="button" class="btn_cancel" value="취소"></a></td>
			 	</tr>
			 </table>
		</form>
	</div>	 
</div>