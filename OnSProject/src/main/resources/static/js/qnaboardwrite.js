$(document).ready(function() {
	// query 가져오기
	const urlParams = new URLSearchParams(window.location.search);
	const id = urlParams.get('id');
	let routeName = '';
	let requestUrl = '';
	let method = '';

	// 에디터 초기화
	let quill = new Quill('#editor', {
		theme: 'snow'
	});

	if (location.href.includes('/qnawrite')) {
		// 질문 올리기 버튼으로 진입한 경우
		const title = "질문을 작성해주세요."
		$('#title').attr('placeholder', title);
		let text =
			`[질문 내용 예시]
        - 학습 관련 질문을 남겨주세요. 
        - 상세히 작성하면 더 좋아요!
        - 먼저 유사한 질문이 있었는지 검색해보세요.
        - 서로 예의를 지키며 존중하는 문화를 만들어가요.`

		quill.setText(text);
		routeName = 'qnaboard';
		requestUrl = '/api/qna/write';
		method = 'POST';
	} else if (location.href.includes('/qnamodify')) {
		// 수정 버튼으로 진입한 경우

		// 화면 초기화
		quill.root.innerHTML = $(".content-origin").val();

		// 수정 후 이동 대상 설정 - id 도 추가 필요
		routeName = 'qnapostview';

		// 기존 태그가 존재할 경우 class 추가
		if ($('#tag-box').children().length > 0) {
			$('#tag-box').addClass('mt20 mb20');
		}
		requestUrl = '/api/qna/modify';
		method = 'PUT';
	}

	// 태그 목록 초기화
	let tags = $('.tag').map(function() {
		return $(this).text().substring(1, $(this).text().length - 1).trim();
	}).get();; // 태그 저장용 배열 초기화
	
	// 태그 추가 시 삭제 대상 목록 갱신
	function refreshDeleteTagList() {
		$('.tag').click(function() {
			const deletedTagName = $(this).text().substring(1, $(this).text().length - 1).trim();
			tags = tags.filter(function(element) {
				return element !== deletedTagName;
			});
			$(this).remove();
		})
	}

	// 질문 게시판 태그 입력, 삭제 기능
	if (location.href.includes('/qna')) {
		// 태그 입력기
		$('#tag-editor').append(`<div>
        <input type="text" id="tag-input" class="fon-15 ml5 mr5 mt20 input-box" placeholder="추가하려는 태그를 입력하고 엔터키를 눌러주세요."></input>
        <p class="ml5 mr5 mt5">태그는 최대 5개, 20글자 까지 입력 가능하며, 중복된 태그는 입력 불가능합니다.</p>
        </div>`);

		$("#tag-input").keypress(function(event) {
			if (event.which === 13) {
				// 엔터키 입력 감지
				const tagName = $('#tag-input').val()
				if (tagName == '') {
					// 입력된 값이 아무것도 없는 경우 동작하지 않음
					return;
				} else if (tags.length == 5) {
					// 태그 갯수 5개로 제한
					alert('태그는 최대 5개 까지 입력 가능합니다.');
					return;
				} else if (tags.includes(tagName)) {
					// 중복 태그 제한
					alert('이미 존재하는 태그입니다.');
					return;
				} else if (tagName.length > 20) {
					// 태그 길이 제한
					alert('태그의 길이가 너무 깁니다.');
					return;
				}

				tags.push(tagName);

				if ($('#tag-box').children().length == 0) {
					$('#tag-box').addClass('mt20 mb20');
				}

				$('#tag-box').append(`<span class="tag fon-11">#&nbsp;${$("#tag-input").val()}&nbsp;X</span>`);
				$('#tag-input').val('');
				refreshDeleteTagList();
			}
		});

		// 태그 목록 갱신
		refreshDeleteTagList();
	}

	quill.focus();

	//save 버튼 클릭시 입력값 저장, 창 이동
	$("#save").on('click', function() {
		let content = quill.getText().replace(/\s+/g, '');
		if ($('#title').val() == '' || content == '') {
			alert('제목 혹은 내용이 작성되지 않았습니다.');
			return;
		}

		// 데이터 저장 요청
		let data = {
			'id': id,
			'title': $("#title").val(),
			'contents': quill.root.innerHTML,
			'userId': $('.user-id').val(),
			'tags': tags,
		};

		saveRequest(requestUrl, method, data);

	});

	function saveRequest(url, method, data) {
		$.ajax({
			url: url, // 백엔드 서버의 저장 요청을 처리하는 URL
			type: method,
			dataType: 'json',
			data: JSON.stringify(data),
			contentType: 'application/json',
			success: function(response) {
				// 서버에 저장 완료 후 서버에서 응답을 받았을 때 실행할 코드
				alert("저장이 완료되었습니다.");
				// 게시글 id 받아와서 작성 완료된 게시글로 이동
				location.href = `/qnapostview?id=${response.id}`
			},
			error: function(xhr, status, error) {
				// 요청 실패 시 실행할 코드
				alert("오류가 발생하였습니다. 나중에 다시 시도해주세요.");
			}
		});
	}

	//delete 버튼(취소) 클릭시 이전 페이지(게시판 화면) 이동
	$("#delete").on('click', function() {
		location.href = `/${routeName}`;
	});


})