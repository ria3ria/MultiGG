<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MULTI.GG</title>
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
		if(paramObj['order'] != null && paramObj['order'] != "") {
			url += '&order=' + paramObj['order'];
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
        	<b>내 정보</b>
        	<c:choose>
				<c:when test="${empty login }">
					<input type="button" value="로그인" onclick="location.href='loginform.do'">
				</c:when>
				<c:otherwise>
					<b>게시글 개수: ${contentCnt }</b>
					<b>댓글 개수: ${commentCnt }</b>
				</c:otherwise>
			</c:choose>
        </div>
        <div id="board_body">
            <div id="board_top">
            	<div id="menu_top">
					<input type="text" id="keyword" placeholder="검색어 입력">
					<input type="button" value="글검색" onclick="search();" style="border-radius: 0 0 50px 0;">
	                <form action="lol.do">
		                <select name="order">
			                <option value="like">추천순</option>
				 			<option value="view">조회순</option>
			 			</select>
		                <input type="hidden" name=page value="0">
		                <input type="submit" value="정렬" style="border-radius: 50px 0 0 0;">
	                </form>
            	</div>
            	<div id="menu_bottom">
					<input type="button" value="글쓰기" onclick="location.href='boardwriteform.do'" style="float: left;">
					<input type="button" value="이전 페이지로" onclick="prevPage();" style="float: right;">
					<input type="button" value="다음 페이지로" onclick="nextPage();" style="float: right; border-radius: 50px 0 0 0;">
            	</div>
            </div>
            <div id="board_bottom">
                <div id="board_list_area">
                    <ul>
                        <li>
                            <b class="boardno">번호</b>
                            <b class="boardkategorie">카테고리</b>
                            <b class="boardtitle" style="cursor: default; pointer-events: none;">제목</b>
                            <b class="boardname">작성자</b>
                            <b class="boarddate">작성일</b>
                            <b class="boardview">조회수</b>
                            <b class="boardlike">추천</b>
                        </li>
						<c:choose>
							<c:when test="${empty list }">
								<li>
									<b class="boardno">-</b>
									<b class="boardkategorie">-</b>
									<b class="boardtitle">작성된 글이 없습니다...</b>
									<b class="boardname">-</b>
									<b class="boarddate">-</b>
									<b class="boardview">-</b>
									<b class="boardlike">-</b>
								</li>
							</c:when>
							<c:otherwise>
								<c:forEach items="${list }" var="dto">
									<li>
			                            <b class="boardno">${dto.boardno }</b>
			                            <b class="boardkategorie">${dto.boardkategorie }</b>
		                            	<c:set var = "content" value = "${dto.boardcontent }"></c:set>
			                            <c:choose>
			                            	<c:when test="${fn:contains(content, '<img src=')}">
			                            		<c:choose>
					                            	<c:when test="${dto.commentCnt > 0}">
							                            <b class="boardtitle" onclick="location.href='boarddetail.do?boardno=${dto.boardno }'">${dto.boardtitle }(사진)[${dto.commentCnt }]</b>
					                            	</c:when>
					                            	<c:otherwise>
							                            <b class="boardtitle" onclick="location.href='boarddetail.do?boardno=${dto.boardno }'">${dto.boardtitle }(사진)</b>
					                            	</c:otherwise>
												</c:choose>
			                            	</c:when>
			                            	<c:otherwise>
			                            		<c:choose>
					                            	<c:when test="${dto.commentCnt > 0}">
							                            <b class="boardtitle" onclick="location.href='boarddetail.do?boardno=${dto.boardno }'">${dto.boardtitle }[${dto.commentCnt }]</b>
					                            	</c:when>
					                            	<c:otherwise>
							                            <b class="boardtitle" onclick="location.href='boarddetail.do?boardno=${dto.boardno }'">${dto.boardtitle }</b>
					                            	</c:otherwise>
												</c:choose>
			                            	</c:otherwise>
			                            </c:choose>
			                            <b class="boardname">${dto.boardname }</b>
			                            <fmt:formatDate var="date" value="${dto.boarddate }" pattern="yy/MM/dd"/>
			                            <b class="boarddate">${date }</b>
			                            <b class="boardview">${dto.boardview }</b>
			                            <b class="boardlike">${dto.boardlike }</b>
									</li>
								</c:forEach>
							</c:otherwise>
						</c:choose>
                    </ul>
                </div>
            </div>
        </div>
        <div id="kategorie">
        	<b>카테고리</b>
        	<b onclick="location.href='lol.do?page=0'">전체보기</b>
        	<b onclick="location.href='lol.do?page=0&boardkategorie=유머'">유머</b>
        	<b onclick="location.href='lol.do?page=0&boardkategorie=질문'">질문</b>
			<br><br>
			<b>정보</b>
        	<b onclick="location.href='lolinfo.do'">패치노트</b>
        	<b onclick="location.href='recode.do'">전적검색</b>
        </div>
    </div>
</html>