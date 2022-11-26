<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/style_boarddetail.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#content_area").html('${dto.boardcontent}');
	});
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
			<input type="button" value="수정" onclick="location.href='boardupdateform.do?boardno=${dto.boardno}'">
			<input type="button" value="삭제" onclick="location.href='boarddelete.do?boardno=${dto.boardno}'">
		</div>
	</div>
</body>
</html>