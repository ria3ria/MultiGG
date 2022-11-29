<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/style_boardwriteform.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.1.min.js"></script>
<script type="text/javascript">
$(function() {
	$("#uploadFile").change(function(){
		if($("#uploadFile")[0].files.length != 0) {
			fileUpload();
		}
	});
});
function viewImg() {
	const files = $("#uploadFile")[0].files;
	for(var i=0; i<files.length; i++) {
		const fileName = files[i].name;
		let img = $("<img>").attr("src", "./img/"+fileName).attr("alt", fileName);
		$("#content_area").append(img);
    }
	$("#uploadFile").val("");
}
function fileUpload() {
	var formData = new FormData();
    var files = $("#uploadFile")[0].files;
    console.log(files);
    
    for(var i=0; i<files.length; i++) {
        formData.append("uploadFile", files[i]);
    }
    
    $.ajax({
        url: 'fileuploadajax.do',
        processData : false,
        contentType: false,
        data: formData,
        type: 'POST',
        success: function(fileNameArr) {
            console.log("업로드 성공");
            viewImg();
            for(var i=0; i<fileNameArr.length; i++) {
                console.log(fileNameArr[i]);
            }
        }
    });
}
function loadBoardContent() {
	console.log($("#content_area").html());
	console.log($("#content_area").text());
	$("input[name='boardcontent']").val($("#content_area").html());
	return true;
}
</script>
</head>
<body>
	<form id="writeForm" action="boardwrite.do" method="post" onsubmit="return loadBoardContent();">
		<input type="hidden" name="boardname" value="${login.membernickname }">
        <input type="hidden" name="boardcontent" value="">
        <input type="hidden" name="memberno" value="${login.memberno }">
        <div id="screen">
            <div id="title_area">
            	<select name="boardkategorie" form="writeForm">
            		<option value="유머">유머</option>
            		<option value="질문">질문</option>
            	</select>
                제목:<input type="text" name="boardtitle" placeholder="제목을 입력하세요...">
                <br>
                <input type="file" id="uploadFile" multiple accept="image/*">
            </div>
            <div id="board_body_area">
                <div id="content_area" contentEditable="true" placeholder="내용을 입력하세요..." style="overflow:auto;"></div>
            </div>
            <div id="board_footer_area">
                <input type="button" value="취소" onclick="history.back();">
                <input type="submit" value="등록">
            </div>
        </div>
    </form>
</body>
</html>