$(document).ready(function() {

	const homeRoute = '/recruitmentlist';

	// 로고
	$('#logo').click(function() {
		location.href = homeRoute;
	})

	// 로그인/로그아웃 버튼 클릭
	$('#login-logout-button').click(function() {
		if ($(this).text() == '로그인') {
			location.href = "/login";
		} else {
			requestGet('/request-logout');
			alert(`로그아웃 되었습니다.`);
			// 회원만 사용할 수 있는 기능도 로그아웃 후에 남아있게 되므로, 갱신처리함
			location.reload();
		}
	})

	function requestGet(url) {
		$.ajax({
			url: url,
			type: 'GET',
			dataType: 'json',
			success: function(response) {
				console.log(response);
			},
			error: function(xhr, status, error) {
				console.error(error);
			}
		});
	}

	// 메뉴 스타일
	$('.menu').css('text-decoration', 'none');

	$('.menu').click(function() {
		$('.menu').removeClass("choose");
		$('.menu').css('color', '#848484');
		$(this).addClass("choose");
		$(this).css('color', 'black');
	});

	$('.menu').hover(
		function() {
			$(this).css('backgroundColor', '#e9ecef');
		},
		function() {
			$(this).css('backgroundColor', 'white');
		}
	);

	const urlParams = new URLSearchParams(window.location.search);
	let board = urlParams.get('board');

	if (location.href.includes('/recruit')) {
		board = 1;
	} else if (location.href.includes('/qna')) {
		board = 2;
	} else if (location.href.includes('ProofShot.html')) {
		board = 3;
	} else if (location.href.includes('/review')) {
		board = 4;
	} else if (location.href.includes('/profile')) {
		board = 9;
	}

	if (board <= 8) {
		const menuElementList = $('.menu');
		menuElementList.eq((board - 1) % 4).addClass('choose');
		menuElementList.eq((board - 1) % 4).css('color', 'black');
	}
})