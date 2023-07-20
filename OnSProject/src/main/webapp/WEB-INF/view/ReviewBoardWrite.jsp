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
    <script src="/js/reviewboardlist.js"></script>
    <script src="./js/menu.js"></script>    
    <script src="./js/reviewboardwrite.js"></script>
    

    <title>OnS | 온라인 스터디</title>
    
<style type="text/css">
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
		<form action="/reviewboardwrite" method="post">
		<div class="board-box plus pppp20">
			<div id="titlearea" class="mb15">
			<h4 class="title">강의명&nbsp;&nbsp; </h4>
				<br><input type="text" name="title" class="writetitle" placeholder="강의명을 작성해주세요" size=49/>
			</div>
			<h4>작성자&nbsp;&nbsp;<input type="text" name="user_id" value= ${userdto.id } class="userid" size=49 readonly>
			</h4>
			<br>
			<h4 id="categoryh6" class="mb5">강의 종류 </h4>
			<select name="lecture_sitename" class="mb10 select">
				<option id="none" value="미지정" selected>-- 선택하세요 --</option>
				<option id="inflearn" value="인프런">인프런</option>
				<option id="udemy" value="UDEMY">UDEMY</option>
				<option id="fastcampus" value="패스트캠퍼스">패스트캠퍼스</option>
				<option id="edx" value="EDX">EDX</option>
				<option id="생활코딩" value="생활코딩">생활코딩</option>
			</select>
				<!-- 강의만족도 선택 -->
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
🐥 모두에게 도움이 될 수 있도록 강의 후기 예시를 참고해 작성해주세요 🐥
						
[강의 후기 예시]
  
🐣 강의 진도율
🐣 공부한 내용
🐣 강의 개선사항
🐣 강의 추천여부
</textarea>
				<br>
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
