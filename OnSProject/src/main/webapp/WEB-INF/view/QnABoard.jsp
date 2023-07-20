<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.ons.study.dto.QnAContentDTO"%>
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
<script src="/js/qnaboard.js"></script>
<script src="/js/menu.js"></script>

<title>OnS | 온라인 스터디</title>
</head>
<body>
	<!-- 로고 및 메뉴 추가 -->
	<jsp:include page="header.jsp" />

	<div id="post-container">
		<div id="left-menu"></div>
		<section class="qna-post-section">
			<div class="selectBox mb20">
				<div class="btn-box">
					<div id="search-box">
						<input type="text" id="search-input" class="fon-15"
							placeholder="궁금한 키워드를 입력하고 검색버튼을 눌러주세요."></input>
						<button id="search-btn"
							class="button ml10 pt5 pb5 pl20 pr20 fon-13 mr10">검색</button>
					</div>
					<div id="question-btn-box">
						<button id="question-btn"
							class="button ml10 pt5 pb5 pl20 pr20 fon-13 mr10">질문 하기</button>
					</div>
				</div>
			</div>
			<div id="articles-container" class="container">
				<!-- 질문 컴포넌트 -->
				<c:forEach items="${qnaLists }" var="dto">
					<article class="blog-list">
						<input type="hidden" class="qna-id" value="${dto.getId()}" />
						<div class="blog-item">
							<c:if test="${dto.solved}">
								<div class="badge fon-11 mb10" style="background: black; color: white;">해결</div>
							</c:if>
							<c:if test="${!dto.solved}">
								<div class="badge fon-11 mb10">미해결</div>
							</c:if>
							<div class="blog-content">
								<h2 class="mb10 qna-title">${dto.title }</h2>
								<!-- 질문 작성 시간 -->
								<%
								QnAContentDTO dto = (QnAContentDTO) pageContext.getAttribute("dto");
								DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd a hh:mm");
								out.println("<p class='blog-date mb10 fon11'>" + dto.getCreatedTime().format(dtf) + "</p>");
								%>
								<!-- 질문 내용 초반부 출력 -->
								<p class="blog-excerpt mb20 qna-content">
									${dto.contents.trim().substring(dto.contents.indexOf("<p>")+3, dto.contents.indexOf("</p>")) }
								</p>
								<!-- 태그 출력, 최대 2개 -->
								<div id="tag-box" class="mb20">
									<%
									String[] tags = dto.getTags();
									int index = 0;
									for (String item : tags) {
										if (index > 1)
											break;
										out.println("<span class='tag fon-11'>#" + item + "</span>");
										++index;
									}
									%>
								</div>
								<div id="content-delimeter" class="mt10 mb10"></div>
								<div id="question-info-box">
									<span id="username" class="fon-15 fon-bold">${dto.nickname}</span>
									<div>
										<span class="fon-12">조회수&nbsp;</span>
										<span id="view-counter" class="fon-12">${dto.viewCount }</span>
										<span class="fon-12">&nbsp;답변수&nbsp;</span>
										<span id="answer-counter" class="fon-12">${dto.commentCount}</span>
									</div>
								</div>
							</div>
						</div>
					</article>
				</c:forEach>
			</div>
			<div class="mt20" style="text-align: center">
				<%
				int pageLimit = (int) request.getAttribute("pageLimit");
				long totalCount = (long) request.getAttribute("qnaContentsTotalCount");
				long totalPage = totalCount / pageLimit;
				totalPage += totalCount % pageLimit != 0 ? 1 : 0;
				for (int i = 1; i <= totalPage; ++i) {
					out.println("<a class='paging ml20 fon-13' href='/qnaboard?page=" + i + "'>" + i + "</a>");
				}
				%>
			</div>
		</section>
		<div id="right-menu">
			<div id="popular-tag-box">
				<h2 class="mb20">주간 인기 태그</h2>
				<div id="popular-tag-container" class="mb20">
					<c:forEach items="${popularTags}" var="tag">
						<span class="popular-tag tag fon-11">#&nbsp;${tag}</span>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
</body>
</html>