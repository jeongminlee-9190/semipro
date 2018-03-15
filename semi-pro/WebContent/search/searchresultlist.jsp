<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
  <script src="js/jquery-3.3.1.js"></script>

  <c:set var="shopList" value="${shopList }" scope="request"></c:set>
  <c:set var="login" value="${loginInfo}" scope="session"/>
  <c:forEach var="shop" items="${shopList }">
  	<a href="ShopTrieveServlet?sCode=${shop.sCode }" >${shop.sName }</a>  <br>
  	address : ${shop.sAddr }<br>
  	tel : ${shop.sPhone }<br>

    <span id="${shop.sCode}">☆</span>
  	<button><a href="InterestServlet?sCode=${shop.sCode }">관심</a><br></button>
  	<button id="interest${shop.sCode}" class="int" value="${shop.sCode}">관심</button>
  	<hr>
  	<script>
    	$("body").on("click","#interest"+"${shop.sCode}",function(){
         $.ajax({
          type : "post",
          url : "InterestServlet",
          dataType : "text",
          data : {
            mId : '${login.mId}',
            sCode : '${shop.sCode}'
          },
          success : function(data,status,xhr){
            if(data="1"){
              $("#"+"${shop.sCode}").replaceWith("<span id='"+"${shop.sCode}"+"'>★</span>");
            }
          }
        });
    });

  	</script>
  </c:forEach>
