<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.time.format.DateTimeFormatter"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="/js/jquery-3.6.4.min.js"></script>
<link href="/css/import.css" rel="stylesheet" type="text/css" />
<script src="/js/qnapostview.js"></script>
<script src="/js/menu.js"></script>
<script src="/js/comment.js"></script>
</head>
<body>
	<jsp:include page="../header.jsp" />
	<br />
	<div class="modal">
		<div class="modal_body">
			<h3 class="mb20">수정되었습니다</h3>
		</div>
	</div>
	<div class="modal">
		<div class="modal_body">
			<h3 class="mb20">삭제되었습니다</h3>
		</div>
	</div>
	<div id="post-box" class="ppp20">
		<!-- 게시글 내용 -->
		<div id="post-content-box" class="pppp20 mr20 ml20">
			<div>
				<h1 id="post-title" class="mb10">${postviewlist.title}</h1>
				<p id="post-info">
					<span id="view-count">&nbsp;${postviewlist.view_count}</span> <span>조회수</span>
					<span id="post-datetime">${postviewlist.created_time}&nbsp;</span>
					<span id="username" class="fon-bold">${postviewlist.user.nickname}&nbsp;</span>
				</p>
			</div>
			<div class="recruitmentPostview">
				<ul>
					<li>
						<span class="inform">스터디 그룹명</span> 
						<span>${postviewlist3.study.name }</span>
					</li>
					<li>
						<span class="inform">사용 언어</span> 
						<span>${postviewlist2.skill.name }</span>
					</li>
					<li>
						<span class="inform">모집 인원</span> 
						<span>${postviewlist3.study.total_member }</span>
					</li>
					<li>
						<span class="inform">마감 기한</span> 
						<span>${postviewlist3.study.recruit_period }</span>
					</li>
					<li>
						<span class="inform">시작일</span> 
						<span>${postviewlist3.study.start_date }</span>
					</li>
					<li>
						<span class="inform">종료일</span> 
						<span>${postviewlist3.study.end_date }</span>
					</li>
				</ul>			
			</div>
			<div id="content-delimeter" class="mt10 mb10"></div>
			<div id="content" class="mt10 mb10 fon-fam-ver plus">
				${postviewlist.contents}</div>
			<div id="content-delimeter" class="mt10 mb10"></div>
			<!-- 수정/삭제는 게시글 작성자일 때만 보이게 수정 필요 -->
			<div id="button-box">
				<button id="list-button" class="ml10 pt5 pb5 pl20 pr20 fon-13"
					onclick="document.location.href='/recruitmentlist'">목록</button>
				<c:if test="${postviewlist.user.id == user.getId()}">
					<button id="delete" class="button ml10 pt5 pb5 pl20 pr20 fon-13"
						onclick="document.location.href='/recruit/postviewdelete?groupid=${postviewlist.skill.study_group_id} &contentid=${ postviewlist.id}'">삭제</button>
					<button id="modify" class="button ml10 pt5 pb5 pl20 pr20 fon-13"
						onclick="document.location.href='/recruit/postviewedit?id=${postviewlist.id }'">수정</button>
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
					<button
						class="comment-save-button mt20 mb10 ml10 pt5 pb5 pl20 pr20 fon-13">등록</button>
				</div>
			</c:if>

			<c:forEach items="${comments}" var="comment">
				<div class="pppp10 comment-content-box">
					<!-- 댓글 관련 정보 저장 -->
					<input type=hidden class="comment-parent"
						value="${comment.getParentId()}" /> <input type=hidden
						class="comment-id" value="${comment.getId()}" /> <input
						type=hidden class="comment-user-id" value="${comment.getUserId()}" />

					<div id="comment-info" class="flex">
						<p id="comment-username" class="fon-bold">${comment.getNickname()}</p>
						<p id="comment-time" class="ml10">
							${comment.getCreatedTime().format(DateTimeFormatter.ofPattern("yyyy-MM-dd a hh:mm"))}
						</p>
					</div>
					<div class="comment-content mt10">
						<p class="comment" style="width: 90%">${comment.getContents()}</p>
						<c:if
							test="${comment.getUserId() == user.getId() && !comment.isDeleted()}">
							<div>
								<a class="comment-modify-button">수정</a> <span>&#124;</span> <a
									class="comment-delete-button">삭제</a>
							</div>
						</c:if>
					</div>
					<c:if test="${not empty user}">
						<button
							class="comment-reply-button mt20 mb10 pt5 pb5 pl20 pr20 fon-13">🗨️답글
							달기</button>
					</c:if>

					<div id="content-delimeter" class="mt20 mb10"></div>
					<!-- 대댓글 -->
					<c:forEach items="${comment.childComments}" var="childComment">
						<div class="pppp10 comment-content-box">
							<!-- 댓글 관련 정보 저장 -->
							<input type=hidden class="comment-parent"
								value="${childComment.getParentId()}" /> <input type=hidden
								class="comment-id" value="${childComment.getId()}" /> <input
								type=hidden class="comment-user-id"
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
										<a class="comment-modify-button">수정</a> <span>&#124;</span> <a
											class="comment-delete-button">삭제</a>
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
<script type="text/javascript">
	// $(window).on('load',function(){
	//     $('.menu').removeClass("choose");
	//     $('.menu').eq(0).addClass("choose");
	// });
	// 		$('.check').click(function(){
	// 			location.href = 'boardRecruitment.html?board=1';
	// 		});

	/*모달창*/
	// 	      const body = document.querySelector('body');
	// 	      const modal = document.querySelectorAll('.modal')[0];
	// 	      const modal2 = document.querySelectorAll('.modal')[1];
	// 	      const mod = document.querySelector('#modify');
	// 	      const del = document.querySelector('#delete');
	// 	      	mod.addEventListener('click', () => {
	// 	        	modal.classList.toggle('show');
	// 		        if (modal.classList.contains('show')) {
	// 			          body.style.overflow = 'hidden';
	// 			        }
	// 	      	});
	// 		    del.addEventListener('click', () => {
	// 		      	modal2.classList.toggle('show');
	// 	        if (modal2.classList.contains('show')) {
	// 		          body.style.overflow = 'hidden';
	// 		        }
	// 	      });
</script>
</html>