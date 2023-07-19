<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="/js/jquery-3.6.4.min.js" ></script>
<script>
$(document).ready(function(e){
	$("#writinglink").on("click",function(e){
 		
	let sessionid = <%=session.getAttribute("sessionid")%>;
	if(sessionid == null){
		alert("로그인 먼저 하셔야 합니다.");
		e.preventDefault();
	}
	});
	
});
</script>
</head>
<body>
<h1 style="color:red">로그인여부 = ${sessionScope.sessionid }</h1>
<h1>나의 게시판 시작화면입니다.</h1>
<h1>메뉴는 다음과 같습니다.</h1>
<ul>
	<li><a href='boardlist'>게시물리스트보기(로그인하지 않아도 됩니다)</a></li>
	<li><a id='writinglink' href='boardwrite'>글쓰러 가기(로그인하셔야 합니다)</a></li>
	<li><a href='boardlogin'>로그인하기</a></li>
	<li><a href='boardlogout'>로그아웃</a></li>
</ul>
</body>
</html>