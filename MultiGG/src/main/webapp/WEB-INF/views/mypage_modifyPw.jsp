<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MULTI.GG 비밀번호 변경</title>
<link href="css/modifyPw.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script type="text/javascript">

$(function() {
	let chk1 = false, chk2 = false, chk3 = false;
	
	
	//현재 비밀번호
	$('#memberpw').on('keyup', function() {
		//비밀번호 공백 확인
		if($("#memberpw").val() === ""){
			$('#pwMsg').html('<b>비밀번호는 필수 정보입니다.</b>');
			chk1 = false;
			
		} else {
			
			const memberpw = $('#memberpw').val();
			
			$.ajax({
				async:false,
				type:"POST",
				url: "./checkpw.do",
				data: memberpw,
				headers: {
					"Content-Type": "application/json"
	                
				},
				datatype: "text",
				success: function(res) {
					
					console.log(res);
					
					if(res === "pwok") {
						$('#pwMsg').html('');
						chk1 = true;
						console.log("오케이");
					} else {
						$('#pwMsg').html('');
						chk1 = false;
					}
					
					
				},
				error : function(request, status, error) {
					console.log(chk1);
					console.log("status : " + request.status + ", message : " + request.responseText + ", error : " + error);
	            }
			});
			
		}
		
	});  //end of old password
	
	
	//새로운 비번
	$('#newmemberpw1').on('keyup', function() {
		//비밀번호 공백 확인
		if($("#newmemberpw1").val() === ""){
			$('#newPwMsg').html('비밀번호는 필수 정보입니다').css("display","flex").css("color","#f23c3c");
			chk2 = false;
		}		         
		else {
			$('#newPwMsg').html('');
			chk2 = true;
		}
		
	}); //end of new password
	
	
	//비밀번호 확인
	$('#newmemberpw2').on('keyup', function() {
		
		if($("#newmemberpw2").val() === "") {
			$('#newPwMsg').html('비밀번호 확인은 필수 정보입니다.').css("display","flex").css("color","#f23c3c");
			chk3 = false;
		} else if( $("#newmemberpw1").val() != $("#newmemberpw2").val() ) {
			$('#newPwMsg').html('비밀번호가 일치하지 않습니다.').css("display","flex").css("color","#f23c3c");
			chk3 = false;
		} else {
			$('#newPwMsg').html('');
			chk3 = true;
		}
		
	});//end of passwordCheck
	
	
	//비밀번호 변경 요청처리하기
	$('.emailChkBtn').click(function(e) {
		 
		if(chk1 == false) {
			alert('현재 비밀번호가 틀렸습니다.');	
		
		} else if(chk2 == false){
			alert('2번 틀림');
		} else if(chk3 == false){
			alert('3번 틀림');
			
		} else if(chk1 && chk2 && chk3) {
			const memberno = $("#memberno").val();
			const memberpw = $("#newmemberpw1").val();

			const memberVal ={
					memberno:memberno,
					memberpw : memberpw,
			};
			console.log(memberVal);
			
			$.ajax({
				type: "POST",
				url: "./modifyPw.do",
				headers: {
					"Content-Type": "application/json"
				},
	            dataType: "text",
	            data: JSON.stringify(memberVal),
	            success: function(res) {
	            	console.log(res);
	            	
	            	if(res === "changeSuccess") {
	            		alert('비밀번호가 변경되었습니다! 다시 로그인 해주세요.');
	            		location.href ="mypage.do";
	            	} else {
	            		alert('현재 비밀번호가 틀렸습니다.');
	            	}
	            }
			});
			
		} else {
			alert('입력정보를 다시 확인하세요.');	
        }
    });

});
</script>
<style>
#newPwMsg
#pwMsg{
color:#f23c3c; 
display: none;
align-items: center;
justify-content: center;
}
.mypage{
height: 750px;
}

</style>
</head>
<body>
<form action="modifyPw.do" method="post" id="pwUpdateForm" name="pwUpdateForm" >
   
    <div class="wrap">
        <div class="mypage">
            <h3>비밀번호 변경</h3>
            <hr>
            <div class="mypageform_input" id="loginpw">
                <input type="password" name="memberpw" id="memberpw" class="form-control form-control-inline text-center" placeholder="현재 비밀번호" />
                <span class="error_next_box" id="pwMsg"></span>
            </div>
                <div class="mypageform_input">
                    <input type="password" name="newmemberpw1" id="newmemberpw1" class="form-control form-control-inline text-center" placeholder="새 비밀번호" />
                </div>
                <div class="mypageform_input">
                    <input type="password" name="newmemberpw2" id="newmemberpw2" class="form-control form-control-inline text-center" placeholder="새 비밀번호 확인" />
                    <span class="error_next_box" id="newPwMsg"></span>
                </div>
            <div class="submit">
                <input type="hidden" id="memberno" name="memberno" value="${login.memberno}">
                <button type="button" id="pwUpdate" name="pwUpdate" class="emailChkBtn">비밀번호 변경</button> 
                <button type="button" id ="cancelbtn" onclick="location.href='mypage.do'">취소</button>
            </div>
        </div>
    </div>
    </form>
</body>
</html>