<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1">
		<tr>
			<th>WRITER</th>
			<td>${dto.boardname }</td>
		</tr>
		<tr>
			<th>TITLE</th>
			<td>${dto.boardtitle }</td>
		</tr>
		<tr>
			<th>CONTENT</th>
			<td><textarea rows="10" cols="40" readonly>${dto.boardcontent }</textarea></td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="button" value="목록" onclick="location.href='lol.do'">
				<input type="button" value="수정" onclick="location.href='boardupdateform.do?boardno=${dto.boardno}'">
				<input type="button" value="삭제" onclick="location.href='boarddelete.do?boardno=${dto.boardno}'">
			</td>
		</tr>
	</table>
</body>
</html>