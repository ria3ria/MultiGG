<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
form {
    width: 100%;
    height: 100%;
}
#screen{
    width: 100%;
    height: 100%;
}
#title_area{
    width:100%;
    height:10%;
    background-color:pink;
}
#board_body_area{
    width:100%;
    height:80%;
    background-color:greenyellow;
    position: relative;
}
#textarea_body {
    width: 95%;
    height: 90%;
    position: absolute;
    left: 50%;
    top: 50%;
    transform: translate(-50%, -50%);
}
textarea {
    width: 100%;
    height: 100%;
}
#board_footer_area{
    width:100%;
    height:10%;
    background-color:skyblue;
}
</style>
</head>
<body>
	<form action="boardwrite.do" method="post">
        <input type="hidden" name="boardname" value="유저닉네임">
        <input type="hidden" name="boardkategorie" value="유머">
        <input type="hidden" name="boardview" value="0">
        <input type="hidden" name="boardlike" value="0">
        <div id="screen">
            <div id="title_area">
                제목:<input type="text" name="boardtitle" placeholder="제목을 입력하세요...">
            </div>
            <div id="board_body_area">
                <div id="textarea_body">
                    <textarea name="boardcontent" placeholder="내용을 입력하세요..."></textarea>
                </div>
            </div>
            <div id="board_footer_area">
                <input type="button" value="사진 업로드">
                <input type="button" value="취소" onclick="history.back();">
                <input type="submit" value="등록">
            </div>
        </div>
    </form>
</body>
</html>