<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h3>글번호 : ${writerdto.seq }</h3>
<h3>글제목 : ${writerdto.title }</h3>
<h3>글내용 : ${writerdto.contents }</h3>
<h3>글암호 : ${writerdto.pw }</h3>
<h3>아이디 : ${writerdto.member.memberid }</h3>
<h3>이름 : ${writerdto.member.name }</h3>
<h3>이메일 : ${writerdto.member.email }</h3>
<h3>폰번호 : ${writerdto.member.phone }</h3>
<h3>가입일 : ${writerdto.member.regtime }</h3>
<h3>글암호 : ${writerdto.member.pw }</h3>
</body>
</html>