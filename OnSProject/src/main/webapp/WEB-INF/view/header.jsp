<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<header>
	<div id="logo-box">
		<img id="logo" alt="logo" src="/img/Logo.png" width="200" class="mb20">
		<div>
			<c:if test="${not empty user}">
				<a id="username" class="fon-15 mt20 mr10 fon-bold" href="/profile">${user.getNickname()}</a>
				<p id="welcome" class="fon-15 mt20 mr20">님 환영합니다!</p>
				<a id="study-room" class="fon-15 mt20 mr10 fon-bold" href="/studyroom">스터디룸</a>
				<span>|</span>
				<button id="login-logout-button" class="fon-15 ml10 mt20">로그아웃</button>
			</c:if>
			<c:if test="${empty user}">
				<button id="login-logout-button" class="fon-15 mt20">로그인</button>
			</c:if>
			
		</div>
	</div>
</header>

<nav>
	<ul class="allMenu">
		<li><a href="/recruitmentlist" class="menu pppp30">그룹 스터디 모집</a></li>
		<li><a href="/qnaboard" class="menu pppp30">질문</a></li>
		<li><a href="/reviewboard" class="menu pppp30">수강후기</a></li>
	</ul>
</nav>