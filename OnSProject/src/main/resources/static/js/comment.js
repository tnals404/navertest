$(document).ready(function() {
	const urlParams = new URLSearchParams(window.location.search);
	
	// 대댓글 왼쪽 마진 추가하기
	var elements = $('.comment-parent'); // 동일한 클래스를 가진 요소들 가져오기

    elements.each(function(index, element) {
        var value = $(element).attr('value'); // value 속성의 값 가져오기

        // 대댓글이 아닌 경우 parentId가 없어 0이 되므로 0보다 큰 경우 왼쪽 마진 추가
        if (value > 0) {
            $(element).siblings('.comment-info, .comment-content').addClass('ml30');
        }
    });

    // 신규 댓글 추가 기능
    $('.comment-save-button').click(function () {
		// 개행 문자는 개행 태그로 변경해서 저장
		const comment = $('.comment-input').val().replace(/\n/g, "<br>");
		
		if (comment === '') {
            alert('댓글 내용을 입력해 주세요.');
            return;
        }

        const data = {
			'contents': comment,
			'contentId': urlParams.get('id'),
			'userId': $('.user-id').val(),
			'parentId': null,
		};
		
        commentRequest('/save-comment', 'POST', data);
        appendNewComment($('#comment-box'), comment, 0);
        $(this).parent().siblings('.comment-content-box:last')
        .find('#content-delimeter').before('<button class="comment-reply-button mt20 mb10 pt5 pb5 pl20 pr20 fon-13">🗨️답글 달기</button>')
        $('.comment-input').val('');
        modifyCommandCount(1);
        
    });
	
	// 댓글 삭제 기능
	$(document).on('click', '.comment-content-box .comment-delete-button', function() {
		
		if (confirm('정말 댓글을 삭제하시겠습니까?')) {
			const commentId = $(this).parent().parent().siblings('.comment-id').val();
				
			const data = {
				'id': commentId,
				'contentId': urlParams.get('id'),
				'userId': $('.user-id').val(),
			};
			
	        commentRequest('/delete-comment', 'DELETE', data);
	        
	        $(this).parent().siblings('p').text('(삭제된 답변입니다.)');
	        $(this).parent().remove();
	        
	        /*// 댓글을 담는 <div> 태그 중 comment-content-box 를 삭제 
	        $(this).parent().parent().parent().remove();
	        // 답변 갯수 표시 감소
	        modifyCommandCount(-1);*/
	        
		}
		
	});
	
	// 댓글 내 답글 달기 기능
	$(document).on('click', '.comment-content-box .comment-reply-button', function() {
		if($(this).parent().find('.comment-reply-input').val() == undefined) {
			$(this).parent().append(`
				<textarea class="comment-reply-input pppp20" style="width:100%"></textarea>
				<div id="button-box">
					<button class="comment-cancel-reply-button mt20 mb10 ml10 pt5 pb5 pl20 pr20 fon-13">취소</button>
					<button	class="comment-save-reply-button mt20 mb10 ml10 pt5 pb5 pl20 pr20 fon-13">답글 등록</button>
				</div>
			`);
			$('html, body').animate({
			  	scrollTop: $('.comment-reply-input').offset().top
			}, 800);
		}
		
		// 답글 등록 버튼 눌렀을 때, 내용이 있는 경우 등록
		$(document).on('click', '#comment-box .comment-save-reply-button', function() {
			const reply = $(this).parent().siblings('.comment-reply-input').val().replace(/\n/g, "<br>");
			if (reply !== '') {
				// comment-content-box 내에서 comment-id 클래스를 가진 태그의 값 가져오기
				const parentId = $(this).parent().parent().find('.comment-id').val();
				
				const data = {
					'contents': reply,
					'contentId': urlParams.get('id'),
					'userId': $('.user-id').val(),
					'parentId': parentId,
				};
			    commentRequest('/save-comment', 'POST', data);
			    // comment-content-box 안에 새로운 댓글 붙여넣기
				appendNewComment($(this).parent().parent(), reply, 0);
				// 추가된 답글의 들여쓰기 표시
				$(this).parent().parent().find('.comment-info:last, .comment-content:last').addClass('ml30');
				removeReplyInput($(this));
				modifyCommandCount(1);
			} else {
				alert('답글 내용을 입력해주세요.')
			}
		});
		
		// 취소 버튼 누를 경우 입력창 제거
		$(document).on('click', '#comment-box .comment-cancel-reply-button', function() {
			removeReplyInput($(this));
		});
		
		function removeReplyInput(t) {
			t.parent().siblings('textarea').remove();
			t.parent().remove();
		}
	});
	
	// 댓글 내 수정 버튼을 눌렀을 경우
	$(document).on('click', '.comment-content-box .comment-modify-button', function() {
		const commentHtml = $(this).parent().siblings('p').html();
		
		// 입력창이 여러개 중복되지 않기 위해 존재 여부 검사 후 수정 입력창 추가
		if($(this).parent().parent().parent().find('.comment-modify-input').val() == undefined) {
			$(this).parent().parent().siblings('#content-delimeter').first().after(`
				<textarea class="comment-modify-input pppp20" style="width:100%">${commentHtml.replace(/<br\s*\/?>/gi, '\n')}</textarea>
				<div id="button-box">
					<button class="comment-modify-cancel-button mt20 mb10 ml10 pt5 pb5 pl20 pr20 fon-13">취소</button>
					<button	class="comment-save-modify-button mt20 mb10 ml10 pt5 pb5 pl20 pr20 fon-13">수정완료</button>
				</div>
			`);
			$('html, body').animate({
			  	scrollTop: $('.comment-modify-input').offset().top,
			}, 800);
		}
		
		// 수정 완료 버튼 눌렀을 때, 기존과 다른 경우 서버에 반영
		$(document).on('click', '#comment-box .comment-save-modify-button', function() {
			const modifiedCommentHtml = $(this).parent().siblings('.comment-modify-input').val().replace(/\n/g, "<br>");
			if (commentHtml !== modifiedCommentHtml) {
				
				const commentId = $(this).parent().parent().find('.comment-id').val();
				
				const data = {
					'id': commentId,
					'contents': modifiedCommentHtml,
					'contentId': urlParams.get('id'),
					'userId': $('.user-id').val(),
				};
				
			    commentRequest('/modify-comment', 'PUT', data);
				$(this).parent().parent().find('.comment').html(modifiedCommentHtml);
			}
			removeModifyCommentInput($(this));
		});
		
		// 취소 버튼 누를 경우 입력창 제거
		$(document).on('click', '#comment-box .comment-modify-cancel-button', function() {
			removeModifyCommentInput($(this));
		});
		
		function removeModifyCommentInput(t) {
			t.parent().siblings('textarea').remove();
			t.parent().remove();
		}
		
	});
	
	function modifyCommandCount(value) {
		let commandCount = $('#comment-counter').text();
	    $('#comment-counter').text(Number(commandCount) + value);
	}
	
	function commentRequest(url, method, data) {
		$.ajax({
			url: url,
			type: method,
			dataType: 'json',
			data: JSON.stringify(data),
			contentType: 'application/json',
			success: function(response) {
				// 새로 추가한 댓글은 id를 알 수 없어, 요청 전에 id 값을 지정할 수 없다.
				// 댓글 새로 요청 시에만 id 값을 서버에서 반환하고, 클라이언트에서 수신하여 id 값이 지정되지 않아 0으로 지정해둔 댓글의 id를 변경한다.
				if (response.id) {
					let elements = $('.comment-id').toArray();
					elements.forEach(function(element) {
						if (element.value == 0) {
							element.value = response.id;
							return;
						}
					});
				}
			},
			error: function(xhr, status, error) {
				// 요청 실패 시 실행할 코드
				alert("오류가 발생하였습니다. 나중에 다시 시도해주세요.");
			}
		});
	}
	
	function appendNewComment(parentElement, comment, parentCommentId) {
		const now = new Date();
		const date = now.toLocaleDateString('ko-KR', { year: 'numeric', month: '2-digit', day: '2-digit' })
						.replace(/\s/g, "")
						.replace(/\./g, '-')
						.slice(0, -1);
		const time = now.toLocaleTimeString('ko-KR', { hour: '2-digit', minute: '2-digit', hour12: true });
		
		parentElement.append(`
        <div class="pppp10 comment-content-box">
			<!-- 댓글 관련 정보 저장 -->
			<input type=hidden 
				class="comment-parent" value="${parentCommentId}" />
			<input type=hidden
				class="comment-id" value="${0}" />
				
			<div class="comment-info flex">
				<p id="comment-username" class="fon-bold">${$('#username').text().trim()}</p>
				<p id="comment-time" class="ml10">
					${date + " " + time}
				</p>
			</div>
			<div class="comment-content mt10">
				<p>${comment}</p>
				<div>
					<a class="comment-modify-button">수정</a> <span>&#124;</span>
					<a class="comment-delete-button">삭제</a>
				</div>
			</div>
			<div id="content-delimeter" class="mt20 mb10"></div>
		</div>
        `);
	}

});