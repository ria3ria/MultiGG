<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MULTI.GG 내 정보 변경</title>
<link href="css/style_mypage_infoUpdate.css" rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c" %>
  <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript">
function fn_nickCheck(){
    var membernickname = $('#membernickname').val(); 
    $.ajax({
    	async:false,
        url:'./nickUpdateChk.do', //Controller에서 요청 받을 주소
        type:'post', //POST 방식으로 전달
        data:{membernickname : membernickname},
        success:function(res){ //컨트롤러에서 넘어온 cnt값을 받는다 
        	if(res == "nickConfirmSame"){//cnt가 1이 아니면(=0일 경우) -> 사용 가능한 닉네임	
        		$('.nick_ok').html("현재와 동일한 닉네임입니다. 사용가능 합니다.").css("display","flex"); 
                $('.nick_already').css("display", "none");
               	
	        }
            else if(res == "nickConfirmNo"){ 
                $('.nick_already').css("display","flex");
                $('.nick_ok').css("display", "none");
            }
            else if(res == "nickConfirmOk"){ 
            	$('.nick_ok').html("사용가능한 닉네임입니다.").css("display","flex"); 
                $('.nick_already').css("display", "none");
                
            }
            
        },
        error:function(){
            alert("에러입니다");
        }
        
    });
    };
var msg = '${msg}';
if (msg === 'ok'){
	alert("수정이 완료되었습니다.");
}
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
.mypage{
height: 750px;
}
</style>
</head>
<body>
<form  method="post" action="mypageInfoUpdate.do">
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
                <div id="nickbox">
                <h4>Nickname</h4>
                <button class="nickCheck" type="button" id="nickCheck" onclick="fn_nickCheck();" value="닉네임 중복확인">닉네임 확인</button>
                </div>
                <input type="text" name="membernickname" onclick="idChkConfirm();" id="membernickname"  value="${login.membernickname}" placeholder="닉네임" required="required">
                <span class="nick_ok">사용 가능한 닉네임 입니다.</span>
				<span class="nick_already">누군가 사용중인 닉네임 입니다.</span>
            </div>
            <div class="mypageform_input" id="loginname">
                <h4>NAME</h4>
                <input type="text" name="membername" id="" value="${login.membername}"placeholder="이름" required="required">
            </div>
            <div class="mypageform_input" id="logindate">
                <h4>등록일</h4>
                <div id="regdate"><fmt:formatDate  value="${login.memberdate}" pattern="yyyy/MM/dd" /></div>
            </div>
            <div class="submit">
                <input type="submit" value="수정 완료" >
                <input type="button" id="cancelbtn" value="취소" onclick="location.href='lol.do?page=0'">
            </div>
        </div>
    </div>
</form>

</body>
</html>
