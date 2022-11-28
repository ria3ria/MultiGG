<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>my page</h1>
<form  method="post" onsubmit="return checkForm();" action="mypageupdate.do">

 <div class="wrap">
        <div class="mypage">
            <h3>${login.membernickname}님의 정보</h3>
            <hr>
            <div class="mypageform" id="loginemail">
            <div id="emailbox">
            <h4>ID(email)</h4>
            </div>
                <input type="email" name="memberemail" title="n" id="memberemail" value="${login.memberemail}" readonly="readonly">
            </div>
            <div class="mypageform_input" id="loginnickname">
                <h4>Nickname</h4>
                <input type="text" name="membernickname" id="" value="${login.membernickname}" readonly="readonly">
            </div>
            <div class="mypageform_input" id="loginname">
                <h4>NAME</h4>
                <input type="text" name="membername" id="" value="${login.membername}" readonly="readonly">
            </div>
            <div class="mypageform_input" id="logindate">
                <h4>NAME</h4>
                <input type="text" name="memberdate" id="" value="${login.memberdate}" readonly="readonly">
            </div>
            <div class="submit">
                <input type="submit" value="내 정보 수정" >
                <input type="button" value="취소" onclick="location.href='index.jsp'">
            </div>
        </div>
    </div>
</form>

</body>
</html>