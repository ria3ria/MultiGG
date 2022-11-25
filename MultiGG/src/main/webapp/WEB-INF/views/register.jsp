<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/style_regist.css" rel="stylesheet" type="text/css">
</head>
<body>

<form action="register.do" method="post">

 <div class="wrap">
        <div class="login">
            <h3>MULTI.GG 회원가입을 환영합니다</h3>
            <hr>
            <div class="loginform_input" id="loginemail">
                <h4>ID(email)</h4>
                <input type="email" name="memberemail" id="" placeholder="Email">
            </div>
            <div class="loginform_input" id="loginpw">
                <h4>Password</h4>
                <input type="password" name="memberpw" id="" placeholder="Password">
            </div>
            <div class="loginform_input" id="loginname">
                <h4>NAME</h4>
                <input type="text" name="membername" id="" placeholder="이름">
            </div>
            <div class="submit">
                <input type="submit" value="회원가입">
                <input type="submit" value="취소" onclick="index.html">
            </div>
        </div>
    </div>
</form>
</body>
</html>