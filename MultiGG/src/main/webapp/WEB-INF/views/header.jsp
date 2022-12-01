<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MULTI.GG header</title>
<link href="css/style_header.css" rel="stylesheet" type="text/css">
<style>
#head{
  color: #4D8BFF;
  font-size: 50px;
  font-weight: 900;
}
</style>
</head>
<body>
    <div id="headers">
<div id="head" onclick="location.href='lol.do?page=0'">MULTI.GG</div>
 
<c:choose>
    <c:when test="${sessionScope.login eq null}">
       <div id="loginBtn" class="btns">
     <input type="button"  value="로그인" onclick="location.href='loginform.do'">
       </div>
    </c:when>
    <c:otherwise>
     <div id="loginBtn2" class="btns">
     <input type="button"  value="내정보" onclick="location.href='mypage.do'">
     <input type="button" value="로그아웃" onclick="location.href='logout.do'">
     </div>
    </c:otherwise>
</c:choose>
</div>
</body>
</html>
