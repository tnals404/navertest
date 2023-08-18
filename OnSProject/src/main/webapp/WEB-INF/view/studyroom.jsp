<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>OnS | 온라인 스터디</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link href="css/sidebars.css" rel="stylesheet">
    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }

      .b-example-divider {
        height: 3rem;
        background-color: rgba(0, 0, 0, .1);
        border: solid rgba(0, 0, 0, .15);
        border-width: 1px 0;
        box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em rgba(0, 0, 0, .15);
      }

      .b-example-vr {
        flex-shrink: 0;
        width: 1.5rem;
        height: 100vh;
      }

      .bi {
        vertical-align: -.125em;
        fill: currentColor;
      }

      .nav-scroller {
        position: relative;
        z-index: 2;
        height: 2.75rem;
        overflow-y: hidden;
      }

      .nav-scroller .nav {
        display: flex;
        flex-wrap: nowrap;
        padding-bottom: 1rem;
        margin-top: -1px;
        overflow-x: auto;
        text-align: center;
        white-space: nowrap;
        -webkit-overflow-scrolling: touch;
      }
    </style>
  </head>
  <body>
  	<header class="p-3 border-bottom bg-light sticky-top">
	    <div class="container">
	      <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
	        <a href="/recruitmentlist" class="d-flex align-items-center mb-2 mb-lg-0 text-dark text-decoration-none">
	          <img src="img/LogoTrim.png" alt="Logo" width="100" height="30" class="d-inline-block align-text-top">
	        </a>
	
	        <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
	          <li><a href="/recruitmentlist" class="nav-link px-2 link-dark">스터디원 모집</a></li>
	          <li><a href="/qnaboard" class="nav-link px-2 link-dark">질문</a></li>
	          <li><a href="/reviewboard" class="nav-link px-2 link-dark">수강후기</a></li>
	        </ul>
	
	        <div class="dropdown text-end">
	          <a href="#" class="d-block link-dark text-decoration-none dropdown-toggle me-4" data-bs-toggle="dropdown" aria-expanded="false">
	            <img src="https://github.com/mdo.png" alt="mdo" width="32" height="32" class="rounded-circle">
	          </a>
	          <ul class="dropdown-menu text-small">
	            <li><a class="dropdown-item" href="#">신규 스터디 만들기</a></li>
	            <li><a class="dropdown-item" href="#">설정</a></li>
	            <li><a class="dropdown-item" href="#">내 프로필</a></li>
	            <li><hr class="dropdown-divider"></li>
	            <li><a class="dropdown-item" href="#">로그아웃</a></li>
	          </ul>
	        </div>
	      </div>
	    </div>
  	</header>
  	<main class="d-flex flex-nowrap">
	  	<div class="flex-shrink-0 p-3 bg-light" style="width: 280px; min-height: 100vh;">
		    <a href="#" class="d-flex align-items-center pb-3 mb-3 link-dark text-decoration-none border-bottom">
		      <img src="img/LogoTrim.png" alt="Logo" width="60" height="25" class="d-inline-block align-text-top">
		    </a>
		    <ul class="list-unstyled ps-0">
		      <li class="mb-1">
		        <button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed" data-bs-toggle="collapse" data-bs-target="#home-collapse" aria-expanded="true">
		          Home
		        </button>
		        <div class="collapse show" id="home-collapse">
		          <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
		            <li><a href="#" class="link-dark d-inline-flex text-decoration-none rounded">스터디 그룹</a></li>
		            <li><a href="#" class="link-dark d-inline-flex text-decoration-none rounded">Updates</a></li>
		            <li><a href="#" class="link-dark d-inline-flex text-decoration-none rounded">Reports</a></li>
		          </ul>
		        </div>
		      </li>
		      <li class="mb-1">
		        <button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed" data-bs-toggle="collapse" data-bs-target="#dashboard-collapse" aria-expanded="false">
		          학습 현황
		        </button>
		        <div class="collapse" id="dashboard-collapse">
		          <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
		            <li><a href="#" class="link-dark d-inline-flex text-decoration-none rounded">Overview</a></li>
		            <li><a href="#" class="link-dark d-inline-flex text-decoration-none rounded">Weekly</a></li>
		            <li><a href="#" class="link-dark d-inline-flex text-decoration-none rounded">Monthly</a></li>
		            <li><a href="#" class="link-dark d-inline-flex text-decoration-none rounded">Annually</a></li>
		          </ul>
		        </div>
		      </li>
		      <li class="border-top my-3"></li>
		    </ul>
		</div>
		<h1>뭘 넣어야 하지</h1>
  	</main>
   	<!-- bootstrap -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
  	<script src="js/sidebars.js"></script>
  </body>
</html>