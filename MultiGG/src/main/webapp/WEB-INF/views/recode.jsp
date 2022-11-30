<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script type="text/javascript">
$(function(){
	$("#craw_submit").click(function(){
		$.ajax({
            url :"craw_select.do",
            data :{
                user_id : $("#craw_id").val()
            },
            dataType : "json",
            type : "post",
            success : function(data){
            	//console.log(data);
            	
            	let keyArr = new Array();
            	for( key in data ) {
           	    	//console.log( 'key:' + key + ' / ' + 'value:' + data[key].NameResult +"/"+data[key].PlayedResult );
					keyArr.push(key);
            	}
				keyArr.sort();
				for(var i=0; i<keyArr.length; i++){
					let key = keyArr[i];
					$(".content_craw").append("<tr><th>"+data[key].NameResult+"</th><th>"+data[key].PlayedResult+"</th></tr>");
				}
				
            }
            
        })
	     
	})
	
})
  
 </script>

</head>
<body>
<div class="craw_submit">
     <input type="text" id="craw_id" name="craw_id" class="form-control" placeholder="ID 입력" style="width:300px;"/>
     <input type="button" id="craw_submit" value="조회">
</div>

 <div class="content_craw"></div>

</body>
</html>