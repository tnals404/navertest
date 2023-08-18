$(document).ready(function() {

	const urlParams = new URLSearchParams(window.location.search);
	const id = urlParams.get('id');
	let homeUrl = '';
	if (location.href.includes('/recruit')) {
		// 그룹원 모집 게시판 처리용
		homeUrl = '/recruitmentlist';
	} else if (location.href.includes('/qna')) {
		homeUrl = '/qnaboard';
		// 버튼 위에 마우스 올렸을 때 검은색으로 변하게 하기
		$('#button-box > button').hover(
			function() {
				$(this).css('backgroundColor', 'black');
			},
			function() {
				$(this).css('backgroundColor', '#404040');
			}
		);

		// 목록 버튼 누르면 질문 목록으로 다시 이동
		$('#list-button').click(function() {
			window.location.href = homeUrl;
		});

		// 질문 글 삭제
		$('#delete-button').click(function() {
			if (confirm("정말 삭제하시겠습니까? 답변 글이 있는 경우 답변 글 보호를 위해 게시물은 유지됩니다.")) {
				const userId = $('.user-id').val();
				// 삭제 요청

				// 초기화
				let data = null;
				let requestUrl = null;
				let method = null;

				// 답변을 질문 작성자만 작성한 경우 확인
				let isExistOnlyAuthorComments = true;
				$('.comment-user-id').toArray().forEach(function(element) {
					if (element.value != userId) {
						isExistOnlyAuthorComments = false;
						return;
					}
				});

				if ($('#comment-counter').text() > 0 && !isExistOnlyAuthorComments) {
					// 다른 사람이 작성한 답변이 존재하는 경우 삭제 표시
					data = {
						'id': id,
						'userId': userId,
						'title': '삭제된 질문입니다.',
						'contents': '<p>삭제된 질문입니다.</p>',
						'deleted': true,
					}
					requestUrl = '/api/qna/modify';
					method = 'PUT';
				} else {
					// 다른 사람이 작성한 답변이 존재하지 않는 경우 게시물 완전 제거
					data = {
						'id': id,
						'userId': userId,
					}
					requestUrl = '/api/qna/delete';
					method = 'DELETE';
				}

				request(requestUrl, method, data);
			}
		});

		// 질문 글 수정
		$('#modify-button').click(function() {
			// 수정 페이지로 이동
			location.href = `/qnamodify?id=${id}`;

		});

		// 조회수 증가
		if (localStorage.getItem(`${id}`) == null) {
			localStorage.setItem(`${id}`, `${id}`);
			url = '/api/qna/read';
			method = 'PUT';
			data = {
				'id': id,
			}
			request(url, method, data);
		}
		
		// 질문 해결 표시
		$('#solve-button').click(function() {
			data = {
				'id': id,
			}
			
			// 해결 여부를 반전된 값으로 갱신 요청 
			url = '/api/qna/solve';
			method = 'PUT';
			request(url, method, data);
			
		});

	} else if (location.href.includes('/review')) {
		// 수강후기 게시판 처리용
		homeUrl = '/reviewboard';
	}

	function request(url, method, data) {
		$.ajax({
			url: url, // 백엔드 서버의 저장 요청을 처리하는 URL
			type: method,
			dataType: 'json',
			data: JSON.stringify(data),
			contentType: 'application/json',
			success: function(response) {
				// 서버에 저장 완료 후 서버에서 응답을 받았을 때 실행할 코드
				if(response.id !== 0) {
					// 삭제한 경우 이동
					location.href = homeUrl;
				} else if (response.viewCount !== 0) {
					$('#view-count').text(Number($('#view-count').text()) + 1);
				}
			},
			error: function(xhr, status, error) {
				// 요청 실패 시 실행할 코드
				alert("오류가 발생하였습니다. 나중에 다시 시도해주세요.");
			}
		});
	}

});