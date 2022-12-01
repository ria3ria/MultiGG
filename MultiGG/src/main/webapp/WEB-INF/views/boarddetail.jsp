<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/style_boarddetail.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#content_area").html('${dto.boardcontent}');
	});
	
	function commentShow(){
		$("#comment").attr("style","display:table")
	}
	
	function commentWriteShow(){
		$("#commentwrite").attr("style","display:table")
	}
	
	function commentUpdateForm(){
		$("#commentupdateform").attr("style","display: none");
		$("#commenttitle").removeAttr("readonly");
		$("#commentupdate").attr("style","display: true");
	}
	
	
</script>
</head>
<body>
	<div id="screen">
		<div id="title_area">
			번호: ${dto.boardno } 제목: ${dto.boardtitle } 카테고리: ${dto.boardkategorie }
			작성자: ${dto.boardname } 작성일: ${dto.boarddate } 조회수: ${dto.boardview }
			좋아요: ${dto.boardlike }
		</div>
		<div id="board_body_area">
			<div id="content_area" style="overflow:auto;"></div>
		</div>
		<div id="board_footer_area">
			<input type="button" value="목록" onclick="location.href='lol.do?page=0'">
			<c:choose>
				<c:when test="${not empty login and dto.memberno eq login.memberno }">
					<input type="button" value="수정" onclick="location.href='boardupdateform.do?boardno=${dto.boardno}'">
					<input type="button" value="삭제" onclick="location.href='boarddelete.do?boardno=${dto.boardno}'">
				</c:when>
				<c:otherwise>
					<input type="button" value="추천" onclick="location.href='boardlike.do?boardno=${dto.boardno}&memberno=${login.memberno }'">
				</c:otherwise>
			</c:choose>
			<input type="button" value="댓글" onclick="commentShow();">
		</div>
	</div>
	
	
	
		<table id="comment" border="1" style="display:none">
				<colgroup>
					<col width="50"/>
					<col width="100"/>
					<col width="300"/>
					<col width="100"/>
					<col width="50"/>
					<col width="50"/>
				</colgroup>
				<tr>
					<th>NO</th>
					<th>WRITER</th>
					<th>TITLE</th>
					<th>DATE</th>
					<th>RECOMMEND</th>
					<th>DERECOMMEND</th>
				</tr>
				<c:choose>
					<c:when test="${empty commentList }">
						<tr>
							<td colspan="6" align="center">-------- 작성된 글이 없습니다 --------</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach items="${commentList }" var="commentdto">
							<form action="commentupdate.do" method="post">
								<input type="hidden" name="commentno" value="${commentdto.commentno}">
								<input type="hidden" name="boardno" value="${dto.boardno }">
								
								<tr>
									<td>${commentdto.commentno}</td>
									<td>${commentdto.commentwriter }</td>
									<td><textarea id="commenttitle"rows="5" cols="100" readonly="readonly" name="commenttitle">${commentdto.commenttitle }</textarea></td>
									<td>${commentdto.commentdate }</td>
									<td>${commentdto.commentgood }<input type="button" value="추천" onclick="location.href='commentrecommend.do?memberno=${login.memberno}&commentno=${commentdto.commentno}&recommend=1&boardno=${dto.boardno }'"></td>
									<td>${commentdto.commentbad }<input type="button" value="비추천" onclick="location.href='commentrecommend.do?memberno=${login.memberno}&commentno=${commentdto.commentno}&recommend=-1&boardno=${dto.boardno }'"></td>
								</tr>
								
								<tr>
									<th colspan="6" align="right">
										<c:if test="${login.memberno == commentdto.memberno }">
											<input id="commentupdateform" type="button" value="수정" style="display: true" onclick="commentUpdateForm();">
											<input id="commentupdate" type="submit" value="수정 완료" style="display: none" >
											<input type="button" value="삭제" onclick="location.href='commentdelete.do?commentno=${commentdto.commentno}&boardno=${dto.boardno }&memberno=${login.memberno }'">
										</c:if>
									</th>
								</tr>
							</form>
							
						</c:forEach>
					</c:otherwise>
				</c:choose>
				<tr>
					<td colspan="6" align="right">
						<input type="button" value="글쓰기" onclick="commentWriteShow();">
					</td>
				</tr>
			</table>
			
		
		<form action="commentinsert.do" method="post">
			<input type="hidden" name="boardno" value="${dto.boardno }">
			<input type="hidden" name="memberno" value="${login.memberno }">
			<table id="commentwrite" border="1" style="display:none" >
				<tr>
					<th>WRITER</th>
					<td><input type="text" name="commentwriter" value="${login.membernickname }" readonly="readonly"></td>
				</tr>
				<tr>
					<th>TITLE</th>
					<td><textarea rows="10" cols="40" name="commenttitle"></textarea></td>
				</tr>
				<tr>
					<td colspan="2" align="right">
						<input type="submit" value="작성">
					</td>
				</tr>
					
					
			
			</table>
		</form>
</body>
</html>