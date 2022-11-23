<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
html, body {
    height: 100%;
    margin: 0;
}
body{
    padding:0;
    font-size: 1.5rem;
    font-family: "verdana";
    font-weight: bolder;
    text-align: center;
}
#screen{
    width: 100%;
    height: 100%;
}
#header{
    width:100%;
    height:10%;
    background-color:pink;
}
#userInfo{
    width:20%;
    height:30%;
    background-color:green;
    float:left;
}
#kategorie{
    width:20%;
    height:60%;
    background-color:yellow;
    float:left;
}
#board_body{
    width:80%;
    height:90%;
    float:right;
}
#board_top{
    width:100%;
    height:20%;
    background-color: hotpink;
}
#board_bottom{
    width:100%;
    height:80%;
    background-color: aqua;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.1.min.js"></script>
</head>
<body>
	<div id="screen">
        <div id="header">header</div>
        <div id="userInfo">userInfo</div>
        <div id="board_body">
            <div id="board_top">
                <input type="button" value="글쓰기" onclick="location.href='boardwriteform.do'">
                <input type="text">
                <input type="button" value="글검색">
                <input type="button" value="글정렬">
            </div>
            <div id="board_bottom">
				<table border="1">
					<colgroup>
						<col width="50"/>
						<col width="100"/>
						<col width="300"/>
						<col width="100"/>
					</colgroup>
					<tr>
						<th>NO</th>
						<th>WRITER</th>
						<th>TITLE</th>
						<th>DATE</th>
					</tr>
					<c:choose>
						<c:when test="${empty list }">
							<tr>
								<td colspan="4" align="center">-------- 작성된 글이 없습니다 --------</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach items="${list }" var="dto">
								<tr>
									<td>${dto.boardno }</td>
									<td>${dto.boardname }</td>
									<td><a href="boarddetail.do?boardno=${dto.boardno }">${dto.boardtitle }</a></td>
									<td>${dto.boarddate }</td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</table>
            </div>
        </div>
        <div id="kategorie">kategorie</div>
    </div>
</html>