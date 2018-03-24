<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

한줄평
<button id="reviewWrite">평가하기</button>
<hr>
${login.mName }<br>
<form id="reviewContentSubmit" action="RevieWriteServlet" method="post">
  <input type="text" name="reviewContent" style="width:800; height:200">
  <input type="submit" name="" value="남기기" >
  <input type="hidden" name="mName" value="${login.mName}">
  <input type="hidden" name="sCode" value="${shop.sCode}">
  <input type="hidden" name="url" value="" id="url">
</form>

1.loginUI + memberName<br>
2.review details<br>
3.keyword and score<br>

<script>
$("#reviewContentSubmit").on("submit",function(evt){
	if(${empty login}){
    alert("로그인을 하세요");
		evt.preventDefault();
	}
})
$(document).ready(function(){
  console.log($(location).attr("search"));

  $("#url").val($(location).attr("search"));
  console.log($("#url").val());
})
</script>
