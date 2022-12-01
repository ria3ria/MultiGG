<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
	<%@ include file="/WEB-INF/views/header.jsp" %>
<div>
	${dto.title}
	${dto.headcontent}
	${dto.content}
	<img src="https://images.contentstack.io/v3/assets/blt731acb42bb3d1659/blt6f2631f87da3bf14/636db672766d1730ca20f257/111522_Patch_12_22_Chem_Drake_v2.jpg" width="550" height="315">
	<iframe width="560" height="315" src="https://www.youtube.com/embed/oGAPSwjRySE" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen=""></iframe>
	
</div>
</body>
</html>