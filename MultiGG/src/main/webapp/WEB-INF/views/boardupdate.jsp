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
	<form action="updateres.do" method="post">
		<input type="hidden" name="myno" value="${dto.boardno }">
		<table border="1">
			<tr>
				<th>WRITER</th>
				<td>${dto.boardname }</td>
			</tr>
			<tr>
				<th>TITLE</th>
				<td><input type="text" value="${dto.boardtitle }" name="mytitle">
			</tr>
			<tr>
				<th>CONTENT</th>
				<td><textarea rows="10" cols="40" name="mycontent">${dto.boardcontent }</textarea></td>
			</tr>
			<tr>
				<td colspan="2" align="right">
					<input type="submit" value="완료">
					<input type="button" value="취소" onclick="location.href='lol.do'">
					<input type="button" value="삭제" onclick="location.href='boarddelete.do?boardno=${dto.boardno}'">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>