<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style media="screen">
  img{
    width: 200px;
    height: 200px;
  }
</style>

<c:set var="images" value="${shopImages }" scope="request"></c:set>
<c:forEach var="image" items="${images }">
 <img src="upload/${image }">
</c:forEach>
