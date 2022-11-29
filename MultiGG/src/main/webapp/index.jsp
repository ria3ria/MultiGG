<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>    
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="/WEB-INF/views/header.jsp" %>
<hr>
	<input type="button" value="main.do" onclick="location.href='main.do'">
	<input type="button" value="lol.do" onclick="location.href='lol.do?page=0'">
	<input type="button" value="recode.do" onclick="location.href='recode.do'">
	<input type="button" value="lolinfo.do" onclick="location.href='lolinfo.do'">
</body>
</html>