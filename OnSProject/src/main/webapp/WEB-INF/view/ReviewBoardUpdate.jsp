<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://code.jquery.com/jquery-3.6.4.min.js"
	integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8="
	crossorigin="anonymous"></script>

<link href="/css/import.css" rel="stylesheet" type="text/css" />
<script src="./js/reviewboardlist.js"></script>
<script src="./js/menu.js"></script>
<script src="./js/reviewboardwrite.js"></script>
<script src="./js/reviewpostview.js"></script>


    <title>OnS | 온라인 스터디</title>
    
<style type="text/css">
	input[name=stars]{
		margin:0;
	}
	.board-box.plus{
		align-items: stretch;
	}
</style>
</head>
<body>
<jsp:include page="header.jsp" />

	<div id="header"></div>
	<br />
	<div id="wrap">
		<form action="/updateboard" method="post">
		<div class="board-box plus pppp20">
			<div id="titlearea" class="mb15">
			
			<h4>강의명</h4>
			<input type="text" size=50 name="title" class="writetitle" value="${dto.title.replace(' ', ' ')}"/>
			</div>
			<h4 id="categoryh6" class="mb5">강의 종류 </h4>
			<select name="lecture_sitename" class="mb10 select">
				<option id="none" value="미지정" selected>-- 선택하세요 --</option>
				<option id="inflearn" value="인프런">인프런</option>
				<option id="udemy" value="UDEMY">UDEMY</option>
				<option id="fastcampus" value="패스트캠퍼스">패스트캠퍼스</option>
				<option id="edx" value="EDX">EDX</option>
				<option id="생활코딩" value="생활코딩">생활코딩</option>
			</select>
				<h4>강의 만족도</h4>
			<div id="lecture_rating" class="mb5">
				<input type="radio" name="lecture_rating" value="⭐">⭐ 
				<input type="radio" name="lecture_rating" value="⭐⭐">⭐⭐ 
				<input type="radio" name="lecture_rating" value="⭐⭐⭐">⭐⭐⭐ 
				<input type="radio" name="lecture_rating" value="⭐⭐⭐⭐">⭐⭐⭐⭐ 
				<input type="radio" name="lecture_rating" value="⭐⭐⭐⭐⭐">⭐⭐⭐⭐⭐
			</div>

			<div id="textarea">
				<textarea id="comment-input" name="contents" class="textarea pppp20">
				${dto.contents}
				</textarea>
				<h4 class="mt10">게시글 번호 <input type="text" name="id" class="num" value=${id } readonly></h4>
				<div class="btn-box mt20">
					<input type="submit" id="savebtn" class="button ml10 pt5 pb5 pl20 pr20 fon-13" value="저장"/>
					<button id="backbtn" class="button ml10 pt5 pb5 pl20 pr20 fon-13">취소</button>
				</div>
			</div>
			
			<!--titlearea end-->
		</div>
		<!-- board-box pppp end -->
				</form>
	</div>
</body>
</html>
