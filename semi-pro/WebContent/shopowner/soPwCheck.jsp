<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<style>
	input{
		width: 150px;
		height: 25px;
	}
	.soPwCheck{
		position: relative;
		margin-left: auto;
		margin-top: auto;
	}
	.soPwCheck_tbl {
		text-align: center;
		margin-top: 13%;
		margin-left: 30%;
		border: 1px solid #99e6ff;
		width: 550px;
	}
	.soInfoView_tbl th{
		height: 30px;
	}
	.soInfoView_tbl td{
		height: 30px;
		font-size: 14px;
	}
	.btn_submit {
		border: 1px solid #99e6ff;
		background-color: #99e6ff;
		margin-top: 20px;
		height:35px;
		width: 150px;
		/*color: white;*/
	}
	
	.btn_cancel{
		border: 1px solid #99e6ff;
		background-color: white;
		margin-top: 10px;
		height:35px;
		width: 150px;
		/*color: white;*/
	}
</style>


<c:set var="dto" value="${login}"></c:set>
<form action="SoPwCheckServlet" method="post">
	<div class="soPwCheck">
		<table class="soPwCheck_tbl">
			<tr>
				<th>비밀번호를 입력해주세요</th>
			<tr>
			
			<tr>
				<td><input type="password" name="soPasswdchk" id="soPasswdchk" size="13" maxlength="10" placeholder="비밀번호"></td>
			</tr>
			
			<tr>
				<td  align="center"><input type="submit" name="submit" class="btn_submit" value="확인"><br>
			</tr>
	
		</table>
	</div>
</form>