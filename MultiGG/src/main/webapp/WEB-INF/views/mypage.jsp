<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MULTI.GG 내정보</title>
<link href="css/style_mypage.css" rel="stylesheet" type="text/css">
<style>
.cancelBtn{
    
  margin: 15px 0px;
      width: 900px;
      display: flex;
      align-items: center;
      justify-content:center;
}
.mypage{
height: 750px;
}
</style>
</head>
<body>
<form  method="post"  action="mypageInfoUpdateForm.do">

 <div class="wrap">
        <div class="mypage">
            <h3>${login.membernickname}님의 정보</h3>
            <hr>
            <div class="mypageform_input" id="loginemail">
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
                <h4>등록일</h4>
                <div id="regdate"><fmt:formatDate  value="${login.memberdate}" pattern="yyyy/MM/dd" /></div>
            </div>
            <div class="submit">
                <div class="modifyBtn">
                <input type="submit" value="내 정보 수정" >
                <input type="button" value="비밀번호 변경"onclick="location.href='modifyPwForm.do'" >
                </div>
                <div class="cancelBtn">
                <input type="button" value="취소" onclick="location.href='index.jsp'">
                </div>
            </div>
        </div>
    </div>
    
</form>


</body>
</html>