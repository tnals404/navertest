$(document).ready(function () {
	
    // 작성 버튼 위에 마우스 올렸을 때 검은색으로 변하게 하기
    $('#writebtn').hover(
        function () {
            $(this).css('backgroundColor', 'black');
        },
        function () {
            $(this).css('backgroundColor', '#404040');
        }
    );

  $('#writebtn').click(
        function () {
           window.location.href = "reviewboardwrite";
        } );        

    });