<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style type="text/css">
	.titleBox{
	
	
		text-align:center;
		border-bottom:2px solid #ccc;
	}
	.contentBox{
	text-align:center;
	}
	.mt-20{
		margin-top:20px;
	}
</style>
</head>
<body>
<script src="resources/js/jquery-3.6.4.min.js"></script>
<script>
$(document).ready(function(){
	$("#ajaxbtn").on('click',function(){
		$.ajax({
			url:'ajaxlogin',
			data:{'id':$("#id").val(),'pw':$("#pw").val()},
			type:'get',
			dataType:'json',
			success:function(response){
 				alert(response.loginresult);
			},
			error:function(){}
		});//ajax
	});
});
</script>
<div class="titleBox">
	<h1>로그인</h1>
</div>
<div class="contentBox mt-20">
	<form action="ajaxlogin" method="get">
		아이디 <input type="text" id="id" name="id"><br>
		비밀번호 <input type="password" id="pw" name="pw"  class="mt-20"><br>
		<button id="ajaxbtn"  class="mt-20">로그인</button>
	</form>
	<button id="cancel"  class="mt-20">취소</button>
</div>
</body>
</html>