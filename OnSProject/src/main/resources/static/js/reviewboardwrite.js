$(document).ready(function () {
	//버튼 위에 마우스 올렸을때 검은색으로 변하게 하기
	$('button').hover(
        function () {
            $(this).css('backgroundColor', 'black');
        },
        function () {
            $(this).css('backgroundColor', '#404040');
        }
    );

	$("#savebtn").hover(
        function () {
            $(this).css('backgroundColor', 'black');
        },
        function () {
            $(this).css('backgroundColor', '#404040');
        }
    );
    
	//save 버튼 클릭시 입력값 저장, 창 이동
/*	$("#savebtn").on('click', function(){
		
	//시간 저장
	let nowTime = new Date().toLocaleString();
	localStorage.setItem("time",nowTime);
	//입력값 확인코드:	alert(localStorage.getItem("time"));
	
	//제목 입력값 저장
	localStorage.setItem("title", $("#title").val());
	//입력값 확인코드: alert(localStorage.getItem("title"));
	
	//내용 입력값 저장
	localStorage.setItem("text", $("#text").val());
	//입력값 확인코드: 	alert(localStorage.getItem("text"));
	
	alert("저장되었습니다.");
	//넘어가는 화면 지정(목록 화면)?
	window.location.href = "./ReviewBoard.html?board=4";
	});*/
	
	//delete 버튼 클릭시 이전 페이지(게시글 조회 화면) 이동
	$("#backbtn").on('click', function(){
	alert("이전 페이지로 돌아갑니다.");
	window.location.href = "/reviewboard"; 
	});
	
	
 
});//ready end