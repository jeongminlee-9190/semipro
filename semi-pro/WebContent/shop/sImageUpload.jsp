<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String value = (String)request.getAttribute("value");
	String fileName = (String)request.getAttribute("fileName");
	long sizeInBytes = (Long)request.getAttribute("sizeInBytes");
%>
입력값:<%=value %><br>
파일명:<a href="FileDown?fileName=<%=fileName%>"><%=fileName%></a><br>
파일크기:<%=sizeInBytes %><br>
    
