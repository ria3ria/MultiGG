<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="getBySummonerName.do">
		<input type="text" name="summonername" placeholder="소환사 닉네임 입력">
		<input type="submit" value="전적 검색">
	</form>
	<c:choose>
		<c:when test="${not empty res }">
			<p>${res }</p>
		</c:when>
		<c:otherwise>
			<p>-</p>
		</c:otherwise>
	</c:choose>
</body>
</html>