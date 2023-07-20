<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="log">
<head>
<meta charset="UTF-8">
<link href="/css/import.css" rel="stylesheet" type="text/css" />
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script src="/js/script.js"></script>
<title>OnS | 온라인 스터디</title>
</head>
<body class="log">
	<div id="wrapper" class="wid-100p">
		<div class="loginCon wid-100p">
			<div class="loginBox SignupBox">
				<img id="logo-img" alt="logo" src="/img/Logo.png" width="200"
					class="mb20" style="cursor: pointer;">
				<div class="inputForm">
					<label for="id" class="mb5">이메일</label> <input id="id" type="text"
						placeholder="이메일을 입력하세요" class="inpw wid-100p">
				</div>
				<div class="inputForm">
					<label for="nick" class="mb5">닉네임</label> <input id="nick"
						type="text" placeholder="닉네임을 입력하세요" class="inpw wid-100p">
				</div>
				<div class="inputForm">
					<label for="pw" class="mb5">비밀번호</label> <input id="pw"
						type="password" placeholder="영문자/숫자/특수문자 조합 8~25자리"
						class="inpw wid-100p">
				</div>
				<input type="submit" value="Sign Up" id="signUp" class="btnLogin"
					onclick="joinform_check();">
				<div class="signUp">
					<span class="mr5">Already have an account?</span> <a href="login">로그인</a>
				</div>
			</div>
		</div>
	</div>
</body>
<script>
	$('#logo-img').click(function() {
		location.href = '/recruitmentlist';
	});

	$(function() {
		$('.inputForm input').focus(function() {
			$('.inputForm input').removeClass('changeplaceholder');
		});
	});

	function joinform_check() {
		var id = document.getElementById("id");
		var nick = document.getElementById("nick");
		var pw = document.getElementById("pw");
		var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
		var pwdCheck = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/;

		if (id.value == "") { //해당 입력값이 없을 경우 같은말: if(!id.value)
			id.placeholder = '필수 입력 항목입니다';
			id.className += " changeplaceholder";
			return false; //return: 반환하다 return false:  아무것도 반환하지 말아라 아래 코드부터 아무것도 진행하지 말것
		} else if (nick.value == "") {
			nick.placeholder = '필수 입력 항목입니다';
			nick.className += " changeplaceholder";
			return false;
		} else if (pw.value == "") {
			pw.placeholder = '필수 입력 항목입니다';
			pw.className += " changeplaceholder";
			return false;
		} else if (exptext.test(id.value) == false) {
			//이메일 형식이 알파벳+숫자@알파벳+숫자.알파벳+숫자 형식이 아닐경우	
			id.value = null;
			id.placeholder = '이메일 입력 양식을 맞춰주세요';
			id.className += " changeplaceholder";
			return false;
		} else if (pwdCheck.test(pw.value) == false) {
			pw.value = null;
			pw.placeholder = '비밀번호 입력 양식을 맞춰주세요';
			pw.className += " changeplaceholder";
			return false;
		} else {
			const url = '/request-signup';
			let data = {
				email: $('.inpw:eq(0)').val(),
				nickname: $('.inpw:eq(1)').val(),
				password: $('.inpw:eq(2)').val(),
			}
			signUpRequest(url, data);
		}
	};

	function signUpRequest(url, data) {
		$.ajax({
			url : url,
			type : 'POST',
			dataType : 'json',
			data : JSON.stringify(data),
			contentType : 'application/json',
			success : function(response) {
				alert("회원가입이 완료되었습니다.");
				location.href = '/login';
			},
			error : function(xhr, status, error) {
				alert("회원가입에 실패하였습니다.");
			}
		});
	}
</script>

</html>