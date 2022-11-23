<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>UPDATE</h1>
	<form action="boardupdate.do" method="post">
		<input type="hidden" name="boardno" value="${dto.boardno }">
		<table border="1">
			<tr>
				<th>TITLE</th>
				<td><input type="text" name="boardtitle" value="${dto.boardtitle }"></td>
			</tr>
			<tr>
				<th>CONTENT</th>
				<td><textarea name="boardcontent">${dto.boardcontent }</textarea></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="완료">
					<input type="button" value="취소" onclick="location.href='lol.do'">
					<input type="button" value="삭제" onclick="location.href='boarddelete.do?boardno=${dto.boardno}'">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>