<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page trimDirectiveWhitespaces="true"%>
<%@taglib prefix="botDetect" uri="https://captcha.com/java/jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<style>
	p{
		font-size: 13px;
	}
	input{
		width: 191px;
		height: 25px;
	}
	.soPwUpdateForm{
		position: relative;
		margin-left: auto;
		margin-top: auto;
	}
	.soPwUpdateFormField{
		position: absolute;
		border: 1px solid #99e6ff;
		margin-left: 35%;
		margin-top: 5%;
		width: 400px;
	}
	
	.btn_submit {
		border: 1px solid #99e6ff;
		background-color: #99e6ff;
		margin-top: 20px;
		height:35px;
		width: 195px;
		/*color: white;*/
	}
	
	.btn_cancel{
		border: 1px solid #99e6ff;
		background-color: white;
		margin-top: 10px;
		height:35px;
		width: 195px;
		/*color: white;*/
	}
	.captchaView{
		
	
	}
	
	#div01{
		position: absolute;
		margin-left: 35%;
		margin-top: 25%;
		width: 400px;
	}	
</style>

<c:set var="dto" value="${login}"></c:set>
<form action="SoPwUpdateServlet" method="post">
	<div class="soPwUpdateForm">
		<fieldset class="soPwUpdateFormField">
			<h3>비밀번호 변경</h3>
			<p>*비밀번호는 특수문자는 불가하며, 8자 이상 10자 이하만 가능합니다.</p>
			<p>*이전에 사용한 적 없는 비밀번호가 안전합니다.</p>
			<input type="password" maxlength="10" size="35" id="soPasswd" name="soPasswd" placeholder="새 비밀번호">
			<input type="password" maxlength="10" size="35" id="soPasswd2" name="soPasswd2" placeholder="새 비밀번호 확인"><br>
			
			<%
       			if (request.getSession().getAttribute("isCaptchaSolved") == null) {
      		%>
          	<p>아래 이미지를 보이는 대로 입력해주세요.</p>
			
		  	<div class="captchaView">
         	 	<!-- Adding BotDetect Captcha to the page -->
          		<botDetect:captcha id="formCaptcha" 
                    userInputID="captchaCode"
                    codeLength="3"
                    imageWidth="200"
                    codeStyle="ALPHA" />
		  	</div>
          <div class="validationDiv">
            <input id="captchaCode" type="text" name="captchaCode" />
            <label class="incorrect" for="captchaCode">${messages.captchaIncorrect}</label>
          </div>
      <%
        }
      %>
			<input type="submit" name="submit" class="btn_submit" value="변경">
			<a href="main_shopowner.jsp"><input type="button" name="submit" class="btn_cancel" value="취소"></a>
		</fieldset>	
	</div>
	
</form>