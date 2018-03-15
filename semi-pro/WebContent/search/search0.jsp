<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	form {text-align:center;}
</style>
<form action="SearchServlet"  method="get">
  <input id="stationInfo" type="hidden" name="station">
  <input id="search" type="text" name="search" placeholder="키워드를 입력하세요" >
  <input type="submit" name="" value="검색" ><br><br>
</form>

