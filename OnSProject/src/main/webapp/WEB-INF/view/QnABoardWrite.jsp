<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://code.jquery.com/jquery-3.6.4.min.js"
	integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8="
	crossorigin="anonymous"></script>

<!-- 에디터 사용시 추가 링크 -->
<!-- Include stylesheet -->
<link href="https://cdn.quilljs.com/1.3.6/quill.snow.css"
	rel="stylesheet">
<!-- Create the editor container -->
<!-- Include the Quill library -->
<script src="https://cdn.quilljs.com/1.3.6/quill.js"></script>
<!-- 에디터 사용시 추가 링크 -->


<link href="/css/import.css" rel="stylesheet" type="text/css" />
<script src="/js/qnaboardwrite.js"></script>
<script src="/js/menu.js"></script>
<title>OnS | 온라인 스터디</title>

</head>
<body>
	<!-- 로고 및 메뉴 추가 -->
	<jsp:include page="header.jsp" />
	
	<br />
	<div id="wrap">
		<input type="hidden" class="user-id" value="${user.getId()}" />
		<input type="hidden" class="content-origin" value="${qnaContent.getContents()}"/>
		<div class="board-box pppp20">
			<div id="titlearea" class="mb15">
				<input type="text" id="title" class="fon-20 pb5"
					placeholder="질문을 입력해주세요." value="${qnaContent.getTitle()}"/>
			</div>
			<div id="textarea">
				<div id="editor"></div>
				<br>
				<div id="tag-box">
				<c:forEach items="${tags }" var="tag">
					<span class="tag fon-11">#&nbsp;${tag}&nbsp;x</span>
				</c:forEach>
				</div>
				<div id="tag-editor"></div>
				<div class="btn-box mt20">
					<button id="save" class="button ml10 pt5 pb5 pl20 pr20 fon-13">저장</button>
					<button id="delete" class="button ml10 pt5 pb5 pl20 pr20 fon-13">취소</button>
				</div>
			</div>
		</div>
	</div>
	<script>
		
	</script>
</body>
</html>
