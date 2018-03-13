<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 
<style>	
	/*
	.content{
		position:relative;
		width: 900%;
		height: 500px;
		border: 1px solid grey;
	}*/
	
	.contentwrapper{
		position:fixed;
		background-color: #99e6ff;
		width: 99%;
		height:30%;
	}
	.content_Left{
		position:fixed;
		margin-top:3px;
		margin-left: 10%;
		height: 130px;
		width: 600px;
		border: 1px solid grey;
	}
	
	.content_right{
		position:fixed;
		margin-top:3px;
		border-top: 1px solid black;
		margin-left: 50%;
		margin-right: 15%;
		height: 130px;
		width: 600px;
		border: 1px solid grey;
	}
</style>
<c:if test="${!empty login}">
<div class="contentwrapper">
		<div class="content_top">
			<span>회원상태: 미승인(2~3일 정도 소요...), 체험(체험일은 00까지 입니다.), 유료(자동 결제일은..입니다.)..</span>
		</div>
		<div class="content_Left">
				<h4>개인회원⇔상점</h4>
			<a href="SManagementUIServlet"><span>관심상점</span></a>&nbsp;&nbsp;
			<a href="SoCenterUIServlet"><span>후기</span></a>&nbsp;&nbsp;
			<a href="SoCenterUIServlet"><span>예약</span></a>&nbsp;&nbsp;
		</div>
		<div class="content_right">
			<h4>상점⇔갬성갱단</h4>
			<a href=""><span>서비스 결제</span></a>&nbsp;&nbsp;
			<a href="SoCenterUIServlet"><span>F&Q</span></a>
		</div>
</div>

</c:if>



