<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="log">
<head>
<meta charset="UTF-8">
<link href="/css/import.css" rel="stylesheet" type="text/css" />
<script  src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script src="/js/script.js"></script>
<title>OnS | 온라인 스터디</title>
</head>
<body class="log">
	<div id="wrapper" class="wid-100p">
		<div class="loginCon wid-100p">
			<div class="loginBox">
				<img id="logo-img" alt="logo" src="/img/Logo.png" width="200" class="mb20" style="cursor: pointer;">
				<input type="text" placeholder="E-MAIL" class="inpw" id="id">
				<input type="password" placeholder="PW" class="inpw" id="pw">
				<input type="submit" id="logIn" value="LOGIN" class="btnLogin" onclick="loginform_check();">
				<div class="signUp">
					<a href="/signup">회원가입</a>
				</div>
			</div>
		</div>
	</div>
</body>
<script>
	$('#logo-img').click(function(){
        location.href = '/recruitmentlist';
    });

	$(function(){
	  $('.loginBox input').focus(function(){
		 $('.loginBox input').removeClass('changeplaceholder');
	  });
	});

	function loginform_check() {
		var id = document.getElementById("id");
		var pw = document.getElementById("pw");
		
		if (id.value == "") { //해당 입력값이 없을 경우 같은말: if(!id.value)
			id.placeholder='아이디를 입력해주세요';
			id.className+=" changeplaceholder";
			return false; //return: 반환하다 return false:  아무것도 반환하지 말아라 아래 코드부터 아무것도 진행하지 말것
		}else if (pw.value == "") { 
			pw.placeholder='비밀번호를 입력해주세요';
			pw.className+=" changeplaceholder"; 
			return false; 
		} else {
			let data = {
				'email': id.value,
				'password': pw.value,
			}
			loginRequest('/request-login', data);
		}
	};
	
	function loginRequest(url, data) {
		$.ajax({
			url: url,
			type: 'POST',
			dataType: 'json',
			data: JSON.stringify(data),
			contentType: 'application/json',
			success: function(response) {
				console.log(response);
				location.href = '/recruitmentlist';
			},
			error: function(xhr, status, error) {
				// 요청 실패 시 실행할 코드
				alert("로그인 실패");
			}
		});
		
	
	}
</script>
</html>