<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/style_lol.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.1.min.js"></script>
<script type="text/javascript">
	let paramObj;
	$(function() {
		paramObj = get_query();
	});
	function nextPage() {
		let url = "lol.do?";
		if(paramObj['page'] > 0) {
			url += '&page=' + (parseInt(paramObj['page'])-1);
		}
		else {
			return;
		}
		if(paramObj['keyword'] != null && paramObj['keyword'] != "") {
			url += '&keyword=' + paramObj['keyword'];
		}
		location.href = url;
	}
	function prevPage() {
		let url = 'lol.do?page=' + (parseInt(paramObj['page'])+1);
		if(paramObj['keyword'] != null && paramObj['keyword'] != "") {
			url += '&keyword=' + paramObj['keyword'];
		}
		location.href = url;
	}
	function get_query() {
	    var url = document.location.href;
	    var qs = url.substring(url.indexOf('?') + 1).split('&');
	    for(var i = 0, result = {}; i < qs.length; i++){
	        qs[i] = qs[i].split('=');
	        result[qs[i][0]] = decodeURIComponent(qs[i][1]);
	    }
	    return result;
	}
</script>
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
	                <input type="hidden" name="page" value="0">
	                <input type="submit" value="글검색">
	                <br>
	                <input type="button" value="다음 페이지로" onclick="nextPage();">
	                <input type="button" value="이전 페이지로" onclick="prevPage();">
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
								<li>
									<p class="boardno">-</p>
									<p class="boardkategorie">-</p>
									<p class="boardtitle">작성된 글이 없습니다...</p>
									<p class="boardname">-</p>
									<p class="boarddate">-</p>
									<p class="boardview">-</p>
									<p class="boardlike">-</p>
								</li>
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