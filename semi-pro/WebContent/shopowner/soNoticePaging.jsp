<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="pageDTO" value="${list}"/>
<c:set var="curPage" value="${pageDTO.curPage}"/>
<c:set var="perPage" value="${pageDTO.perPage}"/>
<c:set var="totalCnt" value="${pageDTO.totalCnt}"/>
<c:set var="pageNum" value="${totalCnt/perPage}"/>
<c:if test="${totalCnt%perPage !=0}">
    <c:set var="pageNum" value="${pageNum+1}" />
</c:if>
<c:set var="searchName" value="${pageDTO.searchName}" />
<c:set var="searchValue" value="${pageDTO.searchValue}" />
<c:forEach var="i" begin="1" end="${pageNum}" varStatus="status">
    <c:if test="${curPage == (status.index)}">
      ${status.index}&nbsp;&nbsp;
    </c:if>
    <c:if test="${curPage != (status.index)}">
    <a href="SoNoticeListServlet?curPage=${status.index}&searchName=${searchName}&searchValue=${searchValue}">${status.index}</a>&nbsp;&nbsp;
    </c:if>
</c:forEach>