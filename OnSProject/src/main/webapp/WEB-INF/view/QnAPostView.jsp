<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.ons.study.dto.QnAContentDTO"%>
<%@ page import="com.ons.study.dto.CommentDTO"%>
<%@ page import="java.time.format.DateTimeFormatter"%>

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
<script src="/js/qnapostview.js"></script>
<script src="/js/menu.js"></script>
<script src="/js/comment.js"></script>

<title>OnS | 온라인 스터디</title>
</head>
<body>
	<!-- 로고 및 메뉴 추가 -->
	<jsp:include page="header.jsp" />

	<br />

	<div id="post-box" class="ppp20">
		<!-- 게시글 내용 -->
		<div id="post-content-box" class="pppp20 mr20 ml20">
			<div>
				<h1 id="post-title" class="mb10">${qnaContent.getTitle()}</h1>
				<p id="post-info">
					<span id='view-count'>&nbsp;${qnaContent.getViewCount()}</span><span>조회수</span>
					<span id='post-datetime'>
						${qnaContent.getCreatedTime().format(DateTimeFormatter.ofPattern("yyyy-MM-dd a hh:mm"))}
						&nbsp;·&nbsp;</span> <span id='username' class='fon-bold'>${qnaContent.getNickname()}&nbsp;</span>
				</p>
			</div>
			<div id="content-delimeter" class="mt10 mb10"></div>
			<div id="content" class="mt10 mb10 fon-fam-ver">
				${qnaContent.getContents()}</div>
			<div class="mt20 mb20">
				<c:forEach items="${tags }" var="tag">
					<span class="tag fon-11">#&nbsp;${tag }</span>
				</c:forEach>
			</div>
			<div id="content-delimeter" class="mt10 mb10"></div>
			<!-- Rounded switch -->
			<c:if test="${qnaContent.getUserId() == user.getId() && !qnaContent.isDeleted()}">
			<div class="solve-button-box flex" style="align-items: center; justify-content: center;">
				<label class="switch"> <input id="solve-button" type="checkbox" ${qnaContent.solved ? 'checked' : ''}>
					<span class="slider round"></span>
				</label>
				<h2 class="ml10 wid-60px mt5">해결</h2>
			</div>
			
			</c:if>
			<!-- 수정/삭제는 게시글 작성자일 때만 보임 -->
			<div id="button-box">
				<button id="list-button" class="ml10 pt5 pb5 pl20 pr20 fon-13">목록</button>
				<c:if test="${qnaContent.getUserId() == user.getId() && !qnaContent.isDeleted()}">
					<button id="delete-button" class="ml10 pt5 pb5 pl20 pr20 fon-13">삭제</button>
					<button id="modify-button" class="ml10 pt5 pb5 pl20 pr20 fon-13">수정</button>
				</c:if>
			</div>
		</div>

		<!-- 댓글 -->
		<div id="comment-box" class="pppp20 mr20 ml20 mb20 mt10">
			<c:if test="${empty user}">
				<h3 style="text-align: center">답변을 남기시려면 로그인 해주세요.</h3>
				<div id="content-delimeter" class="mt20 mb10"></div>
			</c:if>
			<div id="comment-count-box" class="pppp10 flex">
				<h3>답변</h3>
				<h3 id="comment-counter" class="ml5">${qnaContent.getCommentCount()}</h3>
			</div>

			<!-- 로그인한 경우에만 댓글 등록 가능 -->
			<c:if test="${not empty user}">
				<input type="hidden" class="user-id" value="${user.getId()}" />
				<textarea class="comment-input pppp20"></textarea>
				<div id="button-box">
					<button class="comment-save-button mt20 mb10 ml10 pt5 pb5 pl20 pr20 fon-13">등록</button>
				</div>
			</c:if>

			<c:forEach items="${comments}" var="comment">
				<div class="pppp10 comment-content-box">
					<!-- 댓글 관련 정보 저장 -->
					<input type=hidden class="comment-parent"
						value="${comment.getParentId()}" />
					<input type=hidden class="comment-id"
						value="${comment.getId()}" />
					<input type=hidden class="comment-user-id"
						value="${comment.getUserId()}" />

					<div id="comment-info" class="flex">
						<p id="comment-username" class="fon-bold">${comment.getNickname()}</p>
						<p id="comment-time" class="ml10">
							${comment.getCreatedTime().format(DateTimeFormatter.ofPattern("yyyy-MM-dd a hh:mm"))}
						</p>
					</div>
					<div class="comment-content mt10">
						<p class="comment" style="width: 90%">${comment.getContents()}</p>
						<c:if test="${comment.getUserId() == user.getId() && !comment.isDeleted()}">
							<div>
								<a class="comment-modify-button">수정</a>
								<span>&#124;</span>
								<a class="comment-delete-button">삭제</a>
							</div>
						</c:if>
					</div>
					<c:if test="${not empty user}">
						<button class="comment-reply-button mt20 mb10 pt5 pb5 pl20 pr20 fon-13">🗨️답글 달기</button>
					</c:if>

					<div id="content-delimeter" class="mt20 mb10"></div>
					<!-- 대댓글 -->
					<c:forEach items="${comment.childComments}" var="childComment">
						<div class="pppp10 comment-content-box">
							<!-- 댓글 관련 정보 저장 -->
							<input type=hidden class="comment-parent"
								value="${childComment.getParentId()}" />
							<input type=hidden class="comment-id"
								value="${childComment.getId()}" />
							<input type=hidden class="comment-user-id"
								value="${childComment.getUserId()}" />

							<div class="comment-info flex">
								<p id="comment-username" class="fon-bold">${childComment.getNickname()}</p>
								<p id="comment-time" class="ml10">
									${childComment.getCreatedTime().format(DateTimeFormatter.ofPattern("yyyy-MM-dd a hh:mm"))}
								</p>
							</div>
							<div class="comment-content mt10">
								<p class="comment" style="width: 90%">${childComment.getContents()}</p>
								<c:if test="${childComment.getUserId() == user.getId()}">
									<div class="comment-modify-delete-button-box">
										<a class="comment-modify-button">수정</a>
										<span>&#124;</span>
										<a class="comment-delete-button">삭제</a>
									</div>
								</c:if>
							</div>
							<div id="content-delimeter" class="mt20 mb10"></div>
						</div>
					</c:forEach>
					<!-- 대댓글 끝 -->
				</div>
			</c:forEach>
			<!-- 댓글 끝 -->
		</div>

	</div>

</body>
</html>