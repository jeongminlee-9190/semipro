<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 
<style>	
	a{
		text-decoration: none;
	}
	span{
		font-size: 20px;
	}
 	.main_menu{
 		background-color: #99e6ff; 
 		padding-top: 10px;
 		height: 40px;
 	
 	}
</style>

<div class="main_menu">
	<a href="SoFindsoIdServlet"><span>아이디 찾기</span></a>&nbsp;&nbsp;
	<a href="SoFindsoPasswdServlet"><span>비밀번호 찾기</span></a>&nbsp;&nbsp;
</div>



