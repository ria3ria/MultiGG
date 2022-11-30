<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MULTI.GG 회원가입</title>
<link href="css/style_regist.css" rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c" %>
<script type="text/javascript">

function checkForm(){
	var memberpw = $("#memberpw").val();
	var memberpw2 = $("#memberpw2").val();
	if(memberpw != memberpw2){
		alert("비밀번호가 일치하지 않습니다.");
		return false;
	}
};

function fn_IdCheck(){
    var memberemail = $('#memberemail').val(); //id값이 "id"인 입력란의 값을 저장
    var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
    $.ajax({
    	async:false,
        url:'./idChk.do', //Controller에서 요청 받을 주소
        type:'post', //POST 방식으로 전달
        data:{memberemail:memberemail},
        success:function(res){ //컨트롤러에서 넘어온 cnt값을 받는다 
        	if(exptext.test(memberemail)==false){
    			//이메일 형식이 알파벳+숫자@알파벳+숫자.알파벳+숫자 형식이 아닐경우			
    			$('.id_already').html("올바른 이메일 형식으로 작성해주세요").css("display","flex");
                $('.id_ok').css("display", "none");
    			alert("이메일형식이 올바르지 않습니다.");
	        }
        	else if(res == 0){ //cnt가 1이 아니면(=0일 경우) -> 사용 가능한 아이디 
                $('.id_ok').css("display","flex"); 
                $('.id_already').css("display", "none");
                document.getElementById("memberemail").title = "y";
            }
            else if(res == 1){ // cnt가 1일 경우 -> 이미 존재하는 아이디
                $('.id_already').css("display","flex");
                $('.id_ok').css("display", "none");
            }
            
        },
        error:function(){
            alert("에러입니다");
        }
        
    });
    };
    
    function fn_nickCheck(){
        var membernickname = $('#membernickname').val(); 
        $.ajax({
        	async:false,
            url:'./nickChk.do', //Controller에서 요청 받을 주소
            type:'post', //POST 방식으로 전달
            data:{membernickname : membernickname},
            success:function(res){ //컨트롤러에서 넘어온 cnt값을 받는다 
            	if(res == 0){//cnt가 1이 아니면(=0일 경우) -> 사용 가능한 닉네임	
            		$('.nick_ok').css("display","flex"); 
                    $('.nick_already').css("display", "none");
    	        }
                else if(res == 1){ // cnt가 1일 경우 -> 이미 존재하는 닉네임
                    $('.nick_already').css("display","flex");
                    $('.nick_ok').css("display", "none");
                }
                
            },
            error:function(){
                alert("에러입니다");
            }
            
        });
        };
    
    function idChkConfirm(){
    	let chk = document.getElementById("memberemail").title;
    	if(chk=='n'){
    	alert("아이디를 중복체크를 해주세요");
    	document.getElementById("memberemail").focus();
    	}
    	
    };
    
    $(function(){
    	  $('#memberpw').keyup(function(){
    	   $('.pw_confirm').text('');
    	  }); //#user_pass.keyup

    	  $('#memberpw2').keyup(function(){
    	   if($('#memberpw').val()!=$('#memberpw2').val()){
    	    $('.pw_confirm').html("암호가 일치하지 않습니다.").css("display","flex").css("color","#f23c3c");
    	   }else{
    	    $('.pw_confirm').html("암호가 일치합니다.").css("display","flex").css("color","#008000");
    	   }
    	  }); //#chpass.keyup
    	  
    	 });
   
    
</script>
<style>
.nick_ok,
.id_ok{
color:#008000;
display: none;
align-items: center;
justify-content: center;
}
.nick_already,
.pw_confirm,
.id_already{
color:#f23c3c; 
display: none;
align-items: center;
justify-content: center;
}
.login{
height: 750px;
}
#nickbox,
#emailbox{
	display: flex;
	align-items: center;
    justify-content: space-between;
}
#nickCheck,
#idCheck{
	width: 30%;
    height: 30px;
    border: 0;
    outline: none;
    border-radius: 40px;
    background: #4D8BFF;
    color: white;
    font-size: 15px;
    font-weight: 600;
    letter-spacing: 2px;
}

</style>
</head>
<body>

<form  method="post" onsubmit="return checkForm();" action="register.do">

 <div class="wrap">
        <div class="login">
            <h3>MULTI.GG 회원가입을 환영합니다</h3>
            <hr>
            <div class="loginform_input" id="loginemail">
            <div id="emailbox">
            <h4>ID(email)</h4>
            <button class="idCheck" type="button" id="idCheck" onclick="fn_IdCheck();" value="중복확인">ID 확인</button>
            </div>
                <input type="email" name="memberemail" title="n" id="memberemail" placeholder="Email" required="required">
                <span class="id_ok">사용 가능한 이메일 입니다.</span>
				<span class="id_already">누군가 사용중인 이메일 입니다.</span>
            </div>
            <div class="loginform_input" id="loginnickname">
                <div id="nickbox">
                <h4>Nickname</h4>
                <button class="nickCheck" type="button" id="nickCheck" onclick="fn_nickCheck();" value="닉네임 중복확인">닉네임 확인</button>
                </div>
                <input type="text" name="membernickname" onclick="idChkConfirm();" id="membernickname" placeholder="닉네임" required="required">
                <span class="nick_ok">사용 가능한 닉네임 입니다.</span>
				<span class="nick_already">누군가 사용중인 닉네임 입니다.</span>
            </div>
            <div class="loginform_input" id="loginpw">
                <h4>Password</h4>
                <input type="password" name="memberpw" id="memberpw" onclick="idChkConfirm();"  placeholder="Password" required="required">
            </div>
            <div class="loginform_input" id="loginpw2">
                <h4>Password 확인</h4>
                <input type="password" name="memberpw2" id="memberpw2" onclick="idChkConfirm();"  placeholder="Password 확인" required="required">
                <span class="pw_confirm">패스워드가 일치합니다.</span>
            </div>
            <div class="loginform_input" id="loginname">
                <h4>NAME</h4>
                <input type="text" name="membername" onclick="idChkConfirm();" id="membername" placeholder="이름" required="required">
            </div>
            <div class="submit">
                <input type="submit" value="회원가입" >
                <input id="cancelbtn" type="button" value="취소" onclick="location.href='index.jsp'">
            </div>
        </div>
    </div>
</form>
</body>
</html>