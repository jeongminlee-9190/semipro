<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<form id="search_wrap" action="#"  method="get">

  <input id="search" type="text" name="search" placeholder="키워드를 입력하세요" >
  <input id="search_btn" type="submit" name="" value="">
  
  <div id="subway">
	  <select id="line" name="line">
	    <option value="">호선</option>
	    <option value="line1">1호선</option>
	    <option value="line2">2호선</option>
	  </select>
	  <select id="station" class="" name="station" >
	  	<option value="">역을 선택하세요</option>
	    <option value="station1">강남</option>
	    <option value="station2">교대</option>
	  </select>
  </div>
  
</form>
