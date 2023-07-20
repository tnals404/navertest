<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
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
<script src="/js/menu.js"></script>
<script src="./js/reviewpostview.js"></script>
<script src="./js/reviewboardwrite.js"></script>
<script src="./js/reviewboard.js"></script>
    

    <title>OnS | 온라인 스터디</title>
</head>
<body>
<jsp:include page="header.jsp" />

    <!-- 로고 및 메뉴 추가 -->
    <div id="header"></div>
    <br/>

    <div id="post-box" class="ppp20">
        <!-- 게시글 내용 -->
        <div id="post-content-box" class="pppp20 mr20 ml20">
            <div>
                <h1 id="post-title" class="mb10"></h1>
                <p id="post-info">
                    <span id="view-count">${onedto.view_count }</span>
                    <span>조회수&nbsp;</span>
                    <span id="post-datetime">${onedto.created_time }&nbsp;</span>
                </p>
                <br>
            </div>
                <h4 class="ml5">${onedto.title }</h4>
            <div id="content-delimeter" class="mt10 mb10"></div>
            <div id="content" class="mt10 mb10 fon-fam-ver">
                <p>${onedto.contents }</p>
                
            </div>
            <div id="content-delimeter" class="mt10 mb10"></div>
            
            <!-- 수정/삭제는 게시글 작성자일 때만 보이게 -->
            <div id="button-box">
            <c:if test="${sessionUserId eq boardUserId }">
                <a href="deleteboard?id=${onedto.id }"><button id="delete-button" class="ml10 pt5 pb5 pl20 pr20 fon-13">삭제</button></a>
               	<a href="updateboard?id=${onedto.id }"><button id="modify-button" class="ml10 pt5 pb5 pl20 pr20 fon-13">수정</button></a>
            </c:if>
            </div>
        </div>
    
        <!-- <!-- 댓글
        <div id="comment-box" class="pppp20 mr20 ml20 mb20 mt10">
            <div id="comment-count-box" class="pppp10 flex">
                <h3>답변</h3>
                <h3 id="comment-counter" class="ml5">댓글수</h3>
            </div>
            <textarea id="comment-input" class="pppp20"></textarea>
            <div id="button-box">
                <button id="comment-button" class="mt20 mb10 ml10 pt5 pb5 pl20 pr20 fon-13">등록</button>
            </div>
            </div>
            더미 데이터1
            <div class="pppp10">
                <div id="comment-info" class="flex">
                    <p id="comment-username" class="fon-bold">hola</p>
                    <p id="comment-time" class="ml10">2023.5.8 14:54</p>
                </div>
                <div class="comment-content">
                    <p>저는 잘 모르겠습니다.</p>
                </div>
            </div>
            더미 데이터2 - 대댓글
            <div id="content-delimeter" class="mt10 mb10"></div>
            <div class="pppp10 ml30">
                <div id="comment-info" class="flex">
                    <p id="comment-username" class="fon-bold">help</p>
                    <p id="comment-time" class="ml10">2023.5.8 14:55</p>
                </div>
                <div class="comment-content">
                    <div>
                        <p>그렇군요...</p>
                        <p>하아...</p>
                    </div>
                    수정/삭제는 게시글 작성자일 때만 보이게 수정 필요
                    <div>
                        <a>수정</a>
                        <span>&#124;</span>
                        <a>삭제</a>
                    </div>
                </div>
            </div>
            더미 데이터3
            <div id="content-delimeter" class="mt10 mb10"></div>
            <div class="pppp10">
                <div id="comment-info" class="flex">
                    <p id="comment-username" class="fon-bold">hoolay</p>
                    <p id="comment-time" class="ml10">2023.5.8 14:57</p>
                </div>
                <div class="comment-content">
                    <p>저도 잘 모르겠습니다.</p>
                </div>
            </div> --> 
      
    
</body>
</html>