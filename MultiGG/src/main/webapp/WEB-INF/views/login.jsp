<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/style_login.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">

<!-- <script src="https://apis.google.com/js/platform.js" async defer></script> -->
<!-- <meta name="google-signin-client_id" content="144682792161-l8eooufvpjet3hlcb0jo92tg0f31gpgi.apps.googleusercontent.com"> -->
<script src="https://kit.fontawesome.com/53a8c415f1.js" crossorigin="anonymous"></script>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script type="text/javascript">

   $(function(){
      $("#loginChk").hide();
   });
   
   function login(){
      let memberemail = $("#memberemail").val().trim();
      let memberpw=$("#memberpw").val().trim();
      
      let loginVal={
            "memberemail":memberemail,
            "memberpw":memberpw
      };
      
      if(memberemail == null || memberemail == "" || memberpw == null||memberpw==""){
         alert("id및 pw를 확인해주세요")
      }else{
         $.ajax({
            url:"ajaxlogin.do",
            type:"post",
            data: JSON.stringify(loginVal),
            contentType:"application/json",
            dataType:"json",
            success:function(msg){
               console.log(msg);
               if(msg.check == true){
            	   location.href="./index.jsp";
               }else{
            	   $("#loginChk").show();
            	   $("#loginChk").html("ID 혹은 PW가 잘못되었습니다").css("color","red");
               }
            },
            error:function(){
               alert("통신 실패");
            }
         });
      }
      
   }

</script>

</head>
<body>





</head>
<body>
   <div class="wrap">
        <div class="login">
            <h2>MULTI.GG</h2>
            
            <div class="login_id">
                <div id="logintext"><h4>이메일로 로그인</h4></div>
                <h4>E-mail</h4>
                <input type="email" name="" id="memberemail" placeholder="Email">
                
            </div>
            <div class="login_pw">
                <h4>Password</h4>
                <input type="password" name="" id="memberpw" placeholder="Password">
            </div>
             <div id="loginChk"></div>
            <div class="submit">
                <input type="button" value="로그인" onclick="login();">
            </div>
            <div class="login_sns">
                <li><a href=""><i class="fab fa-google"></i></a></li>
                </div>
        <div id="register">MULTI.GG에 처음이세요? <a href="registerform.do">회원가입</a></div>
        </div>
    </div>
</body>
</html>