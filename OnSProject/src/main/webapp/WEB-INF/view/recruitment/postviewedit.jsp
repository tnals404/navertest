<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="/js/jquery-3.6.4.min.js" ></script>
<link href="/css/import.css" rel="stylesheet" type="text/css" />
<script src="/js/qnapostview.js"></script>
<script src="/js/menu.js"></script>
<!-- 에디터 사용시 추가 링크 -->
<!-- Include stylesheet -->
<link href="https://cdn.quilljs.com/1.3.6/quill.snow.css" rel="stylesheet">
<!-- Create the editor container -->
<!-- Include the Quill library -->
<script src="https://cdn.quilljs.com/1.3.6/quill.js"></script>
<!-- 에디터 사용시 추가 링크 -->
</head>
<body>
	<!--스터디모집 게시판-게시글작성-->
	<div class="modal">
      <div class="modal_body">
      	<h3 class="mb20">저장되었습니다</h3>
<!--       	<button id="check" class="button ml10 pt5 pb5 pl20 pr20 fon-13" >확인</button> -->
      </div>
    </div>
	<!-- 파일첨부 <input type="file" id="file"></input><br>-->
	<jsp:include page="../header.jsp" />
	<br />
	
	<form action="/recruit/postviewedit" method="post" onsubmit="getText();">
		<input type="hidden" name="study_group_id" value="${postviewlist3.study.id}">
		<input type="hidden" name="id" value="${postviewlist.id}">
		<div id="wrap">
			<div class="board-box pppp20">
				<div id="titlearea" class="mb15">
					<input type="text" id="title" class="fon-20 pb5" name="title"
						placeholder="제목을 작성해주세요" value="${postviewlist.title }"></input>
				</div>
				<div id="textarea">
					<input type="text" id="title" class="fon-16 pb5 wid-100p mb20"
						placeholder="스터디 그룹명을 작성해주세요" name="study.name" value="${postviewlist3.study.name }"></input>
					<input type="text" id="title" class="fon-16 pb5 wid-100p mb20"
						placeholder="사용 언어를 작성해주세요" name="skill.name" value="${postviewlist2.skill.name }"></input>
					<input type="number" id="title" class="fon-16 pb5 wid-100p mb20"
					 name="study.total_member" placeholder="모집인원을 작성해주세요" value="${postviewlist3.study.total_member }"></input>
					<div class="datebox mb20">
						<label for="date" class="fon-16 mr10" >마감 기한 :</label> 
						<input type="date" data-placeholder="날짜 선택" class="mr15 postviewDate" value="${postviewlist3.study.recruit_period }"  name="study.recruit_period">
						<label for="date" class="fon-16 mr10" >시작일 :</label> 
						<input type="date" data-placeholder="날짜 선택" class="mr15 postviewDate" value="${postviewlist3.study.start_date }"  name="study.start_date">
						<label for="date" class="fon-16 mr10" >종료일 :</label> 
						<input type="date" data-placeholder="날짜 선택" class="mr15 postviewDate" value="${postviewlist3.study.end_date }" name="study.end_date">
					</div>
	<!-- 			에디터 사용시 추가 textarea대신 쓰세요! -->
					<div id="editor">
					${postviewlist.contents }
					</div>
					<input type="hidden" id="contents" name="contents" value="1">
	<!-- 			에디터 사용시 추가 textarea대신 쓰세요! -->
					<br>
					<div class="btn-box mt20">
						<button type="submit" id="save" class="button ml10 pt5 pb5 pl20 pr20 fon-13" >저장</button>
						<button id="cancel" class="button ml10 pt5 pb5 pl20 pr20 fon-13" onclick="document.location.href='recruit/recruitmentwriteresult'">취소</button>
					</div>
				</div>
				
			</div>
		</div>
	</form>
</body>
<script type="text/javascript">
function getText()
{
    document.getElementById("contents").value = document.getElementsByClassName("ql-editor")[0].innerHTML;
    return true;
}
	// $(window).on('load',function(){
	//     $('.menu').removeClass("choose");
	//     $('.menu').eq(0).addClass("choose");
	// });
	
// 	$('#check').click(function(){
// 		location.href = './boardRecruitment.html?board=1';
// 	});
	
// 	$('#cancel').click(function(){
// 		location.href = './boardRecruitment.html?board=1';
// 	});
	/*에디터 사용시 추가*/
	<!-- Initialize Quill editor -->
	  var quill = new Quill('#editor', {
	    theme: 'snow'
	  });
	/*에디터 사용시 추가*/
	/*모달창*/
      const body = document.querySelector('body');
      const modal = document.querySelector('.modal');
      const save = document.querySelector('#save');

      	save.addEventListener('click', () => {
        modal.classList.toggle('show');

        if (modal.classList.contains('show')) {
          body.style.overflow = 'hidden';
        }
      });
</script>
</html>