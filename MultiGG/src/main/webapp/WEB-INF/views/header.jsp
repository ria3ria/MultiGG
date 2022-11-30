<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>헤더페이지</h1>
 
<c:choose>
    <c:when test="${sessionScope.login eq null}">
       
     <input type="button" value="로그인" onclick="location.href='loginform.do'">
       
    </c:when>
    <c:otherwise>
     
     <input type="button" value="내정보" onclick="location.href='mypage.do'">
     <input type="button" value="로그아웃" onclick="location.href='logout.do'">
     
    </c:otherwise>
</c:choose>
 
</body>
</html>
