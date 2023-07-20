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

    <script src="./js/reviewpostview.js"></script>
    <script src="./js/menu.js"></script>
    <script src="./js/reviewboardwrite.js"></script>
    <script src="./js/reviewboardlist.js"></script>
    <title>OnS | 온라인 스터디</title>

</head>
<body>
<jsp:include page="header.jsp" />

    <!-- 로고 및 메뉴 추가 -->
    <div id="header"></div>
    <br/>
  	
    <section class="blog-section">
      
      <div class="selectBox mb20"> 
      
       <a href="reviewboard"><h2>전체 수강평 조회</h2></a>
    
	<form action="searchboard">
      <br><br> <br><br>
      	<select name="item">
      	<option>제목</option>
      	<option>내용</option>
      	<option>인강사이트명</option>
      	</select>

      	<input type="text" name="searchword" class="searchword" size=60>
          <input type="submit" id="searchbtn" class="button ml10 pt5 pb5 pl20 pr20 fon-13 mr10" value="검색">
      </form>
            <button id="writebtn" class="button ml10 pt5 pb5 pl20 pr20 fon-13 mr10">글 작성하기</button>
   
		</div>
    
      <div class="container">

			<c:forEach items="${totalPagingList}" var="boardDTO">
        <a href="reviewpostview?id=${boardDTO.id }">
        <div class="blog-list">
		<div class="blog-item">
          	<div id="category" class="badge badgesy fon-11 mb15">${boardDTO.lecture_sitename } </div>
            <div class="blog-content">
              <h4 id="title" class="mb5">${boardDTO.title }</h4>
              <p class="blog-date mb5 fon11">강의만족도: ${boardDTO.lecture_rating }</p>
              <p class="blog-date mb5 fon11">작성시간: ${boardDTO.created_time }</p>
              <p id="text" class="blog-excerpt mb5">${boardDTO.contents }</p> 
        
            </div>
           </div>
            </div>
           </a>
			</c:forEach>
	            </div>
	
          <!-- 추가적인 게시물 아이템을 여기에 추가할 수 있습니다 
          	게시글 클릭시 이동:<a href="./ReviewPostView.html?board=4" class="read-more">...</a> 
            <div id="badge-viewcount" class="badge-viewcount fon-11 mb15">조회수🔥</div>
            <div id="badge-recommend" class="badge-recommend fon-11 mb15">추천수👍</div>
            <div id="badge-new" class="badge-new fon-11 mb15">NEW💬</div>
          
          </div>
         </div>
       </div>-->
       
   <%
   int totalBoardCnt = (Integer)request.getAttribute("totalBoardCnt");
   int totalPage = 0;
   if(totalBoardCnt%12==0){
	   totalPage = totalBoardCnt/12;
   }else {
	   totalPage = (totalBoardCnt/12) +1;
   }%>
   <div class="txt-center mt10">
   <% for(int i=1; i<=totalPage; i++){  %>
	   <a href="reviewboard?page=<%=i %>"><font size="3px"><%=i %>페이지</font> &nbsp;&nbsp;</a>	   
  <% } %>
    </div>
   </section>
  </body>
  </html>
