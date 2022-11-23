<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="boardwrite.do" method="post">
		<input type="hidden" name="boardkategorie" value="humor">
		<table border="1">
			<tr>
				<th>WRITER</th>
				<td><input type="text" name="boardname"></td>
			</tr>
			<tr>
				<th>TITLE</th>
				<td><input type="text" name="boardtitle"></td>
			</tr>
			<tr>
				<th>CONTENT</th>
				<td><textarea rows="10" cols="40" name="boardcontent"></textarea></td>
			</tr>
			<tr>
				<td colspan="2" align="right">
					<input type="submit" value="완료">
					<input type="button" value="취소" onclick="history.back();">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>