$(document).ready(function() {

	// 질문 올리기 버튼 선택한 경우
	$('#question-btn').click(function() {
		window.location.href = '/qnawrite';
	});

	// 질문 게시물을 선택했을 때 query parameter 로 id 전달
	$(document).on('click', '#articles-container article', function() {
		let clickedArticle = $(this);
		let id = clickedArticle.find('.qna-id').val();
		window.location.href = `/qnapostview?id=${id}`;
	});

	// 검색 버튼 클릭한 경우
	$('#search-btn').click(function() {
		if ($('#search-input').val() == '') {
			alert('검색할 키워드를 입력해주세요.');
		} else {
			location.href = `/qnaboard?query=${$('#search-input').val().trim()}`;
		}
	});

	// 키워드를 입력하고 엔터 키를 누른 경우
	$('#search-input').on('keydown', function(event) {
		if (event.keyCode === 13) {
			event.preventDefault(); // 기본 엔터 행동 방지
			if ($('#search-input').val() == '') {
				alert('검색할 키워드를 입력해주세요.');
			} else {
				location.href = `/qnaboard?query=${$(this).val().trim()}`;
			}
		}
	});
	
	// 인기 태그를 클릭한 경우
	$('#popular-tag-container .popular-tag').click(function() {
		location.href = `/qnaboard?tag=${$(this).text().substring(2)}`
	});

	// 검색 키워드 또는 태그의 존재 여부에 따라 페이지 이동 시 파라미터 추가
	const urlParams = new URLSearchParams(window.location.search);
	let modifier = null;
	let value = null;
	if (urlParams.get('query') != null) {
		value = urlParams.get('query');
		modifier = 'query';
	} else if (urlParams.get('tag') != null) {
		value = urlParams.get('tag');
		modifier = 'tag';
	}
	$('.paging').each(function() {
		let href = $(this).attr('href');
		href = modifier != null ? `${href}&${modifier}=${value}` : href;
		$(this).attr('href', href);
	});

});