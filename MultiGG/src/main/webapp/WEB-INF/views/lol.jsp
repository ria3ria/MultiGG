<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    width:15%;
    height:30%;
    background-color:green;
    float:left;
}
#kategorie{
    width:15%;
    height:60%;
    background-color:yellow;
    float:left;
}
#board_body{
    width:85%;
    height:90%;
    float:right;
}
#board_top{
    width:100%;
    height:15%;
    background-color: hotpink;
}
#board_bottom{
    width:100%;
    height:85%;
    background-color: aqua;
    position: relative;
}
#board_list_area {
    width: 96%;
    height: 94%;
    background-color: skyblue;
    position: absolute;
    left: 50%;
    top: 50%;
    transform: translate(-50%, -50%);
}
ul, li {
    width: 100%;
    margin: 0;
    padding: 0;
}
ul {
    height: 100%;
    list-style: none;
}
li {
    height: 10%;
    font-size: 1.2rem;
}
li p {
    float: left;
    background-color: greenyellow;
}
li:first-child p {
    background-color: pink;
}
li p {
    height: 100%;
    margin: 0;
}
.boardno {
    width: 7%;
}
.boardkategorie {
    width: 10%;
}
.boardtitle {
    width: 40%;
}
.boardname {
    width: 15%;
}
.boarddate {
    width: 14%;
}
.boardview {
    width: 7%;
}
.boardlike {
    width: 7%;
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
                <input type="button" value="글정렬">
                <form action="boardsearch.do">
	                <input type="text" name="keyword" placeholder="검색어 입력">
	                <input type="submit" value="글검색">
                </form>
            </div>
            <div id="board_bottom">
                <div id="board_list_area">
                    <ul>
                        <li>
                            <p class="boardno">번호</p>
                            <p class="boardkategorie">카테고리</p>
                            <p class="boardtitle">제목</p>
                            <p class="boardname">작성자</p>
                            <p class="boarddate">작성일</p>
                            <p class="boardview">조회수</p>
                            <p class="boardlike">추천</p>
                        </li>
						<c:choose>
							<c:when test="${empty list }">
								
							</c:when>
							<c:otherwise>
								<c:forEach items="${list }" var="dto">
									<li>
			                            <p class="boardno">${dto.boardno }</p>
			                            <p class="boardkategorie">${dto.boardkategorie }</p>
			                            <p class="boardtitle"><a href="boarddetail.do?boardno=${dto.boardno }">${dto.boardtitle }</a></p>
			                            <p class="boardname">${dto.boardname }</p>
			                            <fmt:formatDate var="date" value="${dto.boarddate }" pattern="yy/MM/dd"/>
			                            <p class="boarddate">${date }</p>
			                            <p class="boardview">${dto.boardview }</p>
			                            <p class="boardlike">${dto.boardlike }</p>
									</li>
								</c:forEach>
							</c:otherwise>
						</c:choose>
                    </ul>
                </div>
            </div>
        </div>
        <div id="kategorie">kategorie</div>
    </div>
</html>