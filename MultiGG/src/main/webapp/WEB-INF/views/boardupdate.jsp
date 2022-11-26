<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/style_boardupdate.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.1.min.js"></script>
<script type="text/javascript">
$(function() {
	$("#content_area").html('${dto.boardcontent}');
		
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
	<form action="boardupdate.do" method="post" onsubmit="return loadBoardContent();">
		<input type="hidden" name="boardno" value=${dto.boardno }>
        <input type="hidden" name="boardname" value=${dto.boardname }>
        <input type="hidden" name="boardkategorie" value=${dto.boardkategorie }>
        <input type="hidden" name="boardcontent" value="">
        <input type="hidden" name="boardview" value=${dto.boardview }>
        <input type="hidden" name="boardlike" value=${dto.boardlike }>
        <div id="screen">
            <div id="title_area">
                제목:<input type="text" name="boardtitle" value="${dto.boardtitle }">
                <br>
                <input type="file" id="uploadFile" multiple accept="image/*">
            </div>
            <div id="board_body_area">
                <div id="content_area" contentEditable="true" style="overflow:auto;"></div>
            </div>
            <div id="board_footer_area">
                <input type="submit" value="완료">
				<input type="button" value="취소" onclick="location.href='lol.do?page=0'">
				<input type="button" value="삭제" onclick="location.href='boarddelete.do?boardno=${dto.boardno}'">
            </div>
        </div>
    </form>
</body>
</html>