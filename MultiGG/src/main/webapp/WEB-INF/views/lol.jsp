<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
		$("#headers").css("height", "10%");
		if(paramObj['page'] == null || paramObj['page'] == "") {
			location.href = 'lol.do?page=0';
		}
	});
	function nextPage() {
		let url = "lol.do?";
		if(paramObj['page'] > 0) {
			url += '&page=' + (parseInt(paramObj['page'])-1);
		}
		else {
			return;
		}
		location.href = get_url(url);
	}
	function prevPage() {
		let url = 'lol.do?page=' + (parseInt(paramObj['page'])+1);
		location.href = get_url(url);
	}
	function get_url(url) {
		if(paramObj['keyword'] != null && paramObj['keyword'] != "") {
			url += '&keyword=' + paramObj['keyword'];
		}
		if(paramObj['boardkategorie'] != null && paramObj['boardkategorie'] != "") {
			url += '&boardkategorie=' + paramObj['boardkategorie'];
		}
		if(paramObj['view'] != null && paramObj['view'] != "") {
			url += '&view=' + paramObj['view'];
		}
		if(paramObj['like'] != null && paramObj['like'] != "") {
			url += '&like=' + paramObj['like'];
		}
		return url;
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
	function search() {
		location.href = 'lol.do?page=0&keyword=' + $("#keyword").val();
	}
</script>
</head>
<body>
	<div id="screen">
        <%@ include file="/WEB-INF/views/header.jsp" %>
        <div id="userInfo">
        	<p>내 정보</p>
        	<c:choose>
				<c:when test="${empty login }">
					<input type="button" value="로그인" onclick="location.href='loginform.do'">
				</c:when>
				<c:otherwise>
					<input type="button" value="내정보" onclick="location.href='mypage.do'">
					<input type="button" value="로그아웃" onclick="location.href='logout.do'">
					<br>
					게시글 개수: ${contentCnt }
					<br>
					댓글 개수: ${commentCnt }
				</c:otherwise>
			</c:choose>
        </div>
        <div id="board_body">
            <div id="board_top">
                <input type="button" value="글쓰기" onclick="location.href='boardwriteform.do'">
                <input type="button" value="글정렬">
				<input type="text" id="keyword" placeholder="검색어 입력">
				<input type="button" value="글검색" onclick="search();">
				<br>
				<input type="button" value="다음 페이지로" onclick="nextPage();">
				<input type="button" value="이전 페이지로" onclick="prevPage();">
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
		                            	<c:set var = "content" value = "${dto.boardcontent }"></c:set>
			                            <c:choose>
			                            	<c:when test="${fn:contains(content, '<img src=')}">
					                            <p class="boardtitle"><a href="boarddetail.do?boardno=${dto.boardno }">${dto.boardtitle }(사진)[${dto.commentCnt }]</a></p>
			                            	</c:when>
			                            	<c:otherwise>
					                            <p class="boardtitle"><a href="boarddetail.do?boardno=${dto.boardno }">${dto.boardtitle }[${dto.commentCnt }]</a></p>
			                            	</c:otherwise>
			                            </c:choose>
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
        <div id="kategorie">
        	<p>카테고리</p>
			<a href='lol.do?page=0'>전체보기</a><br>
			<a href='lol.do?page=0&boardkategorie=유머'>유머</a><br>
			<a href='lol.do?page=0&boardkategorie=질문'>질문</a><br>
			<br><br>
			<p>정보</p>
			<a href='lolinfo.do'>패치노트</a><br>
			<a href='recode.do'>전적검색</a>
        </div>
    </div>
</html>