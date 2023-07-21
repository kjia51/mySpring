<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
        body {
		  min-height: 75rem;
		  padding-top: 4.5rem;
		}
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
      0img:hover {
      transition: all 2s
      }
      .card{
      	display:inline-block;
      }
    </style>

	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

</head>

<body>
<script>
function requestAction(url,bno){
	searchForm.action=url;
	searchForm.bno.value=bno;
	searchForm.submit();
}
	window.addEventListener('load', function(){
		btnList.addEventListener('click', function(){
			viewForm.action = "/board/list";
			viewForm.method = "get";
			viewForm.submit();
		});
	})
</script>

<%@include file="../common/header.jsp" %>


<main class="container">
<!--  
<form class="row g-3 align-items-center" action="/board/list" method="get" name="searchForm1">

	<div class="row g-3 justify-content-center">
  <div class="col-sm-3">
	  <select class="form-select" name="searchField"  aria-label="Default select example">
	  <option selected>선택</option>
	  <option value="bno">번호</option>
		</select>
  </div>
  <div class="col-sm-6">
    <label for="inputPassword2" class="visually-hidden">Password</label>
    <input type="text" class="form-control" id="searchWord" name="searchWord" value="${pageDto.cri.searchWord}" placeholder="검색어">
  </div>
  <div class="col-sm-3">
    <button type="submit" class="btn btn-primary mb-3 w-100" onclick="go(1)">검색</button>
  </div>
  </div>
</form>
  
<div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel">
  <div class="carousel-indicators" data-bs-interval="10">
    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
  </div>
  <div class="carousel-inner">
    <div class="carousel-item active" data-bs-interval="3000">
      <img src="../resources/img/driver.jpg" class="d-block w-100" alt="..." style="width:100px;height:400px">
      <div class="carousel-caption d-none d-md-block">
        <h5>First slide label</h5>
        <p>Some representative placeholder content for the first slide.</p>
      </div>
    </div>
    <div class="carousel-item" data-bs-interval="2000">
      <img src="../resources/img/rain.gif" class="d-block w-100" alt="..." style="width:100px;height:400px">
      <div class="carousel-caption d-none d-md-block">
        <h5>Second slide label</h5>
        <p>Some representative placeholder content for the second slide.</p>
      </div>
    </div>
    <div class="carousel-item" data-bs-interval="2000">
      <img src="../resources/img/together.jpg" class="d-block w-100" alt="..." style="width:100px;height:400px">
      <div class="carousel-caption d-none d-md-block">
        <h5>Third slide label</h5>
        <p>Some representative placeholder content for the third slide.</p>
      </div>
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>


<div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel">
  <div class="carousel-indicators" data-bs-interval="10">
    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
  </div>
  <div class="carousel-inner">
  
    <div class="carousel-item active" data-bs-interval="3000">
		<div class="card" style="width: 12rem;">
		  <img src="../resources/img/dog.gif" class="card-img-top" alt="...">
		  <div class="card-body">
		    <h5 class="card-title">사모예드</h5>
		    <p class="card-text">커다랗고 풍성한 털이 덕분에 몸집이 많이 커 보인다. 주둥이가 넓고...</p>
		  </div>
		</div>
		<div class="card" style="width: 12rem;">
		  <img src="../resources/img/dog.gif" class="card-img-top" alt="...">
		  <div class="card-body">
		    <h5 class="card-title">사모예드</h5>
		    <p class="card-text">커다랗고 풍성한 털이 덕분에 몸집이 많이 커 보인다. 주둥이가 넓고...</p>
		  </div>
		</div>
		<div class="card" style="width: 12rem;">
		  <img src="../resources/img/dog.gif" class="card-img-top" alt="...">
		  <div class="card-body">
		    <h5 class="card-title">사모예드</h5>
		    <p class="card-text">커다랗고 풍성한 털이 덕분에 몸집이 많이 커 보인다. 주둥이가 넓고...</p>
		  </div>
		</div>

    </div>
    <div class="carousel-item active" data-bs-interval="3000">
		<div class="card" style="width: 12rem;">
		  <img src="../resources/img/dog.gif" class="card-img-top" alt="...">
		  <div class="card-body">
		    <h5 class="card-title">사모예드</h5>
		    <p class="card-text">커다랗고 풍성한 털이 덕분에 몸집이 많이 커 보인다. 주둥이가 넓고...</p>
		  </div>
		</div>
		<div class="card" style="width: 12rem;">
		  <img src="../resources/img/dog.gif" class="card-img-top" alt="...">
		  <div class="card-body">
		    <h5 class="card-title">사모예드</h5>
		    <p class="card-text">커다랗고 풍성한 털이 덕분에 몸집이 많이 커 보인다. 주둥이가 넓고...</p>
		  </div>
		</div>
		<div class="card" style="width: 12rem;">
		  <img src="../resources/img/dog.gif" class="card-img-top" alt="...">
		  <div class="card-body">
		    <h5 class="card-title">사모예드</h5>
		    <p class="card-text">커다랗고 풍성한 털이 덕분에 몸집이 많이 커 보인다. 주둥이가 넓고...</p>
		  </div>
		</div>
    </div>
    
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>
-->
  <div class="bg-light p-5 rounded">
    <h1>게시판 만들기</h1>
    <p class="lead">부트스트랩을 이용한 게시판 만들기</p>
    <a class="btn btn-lg btn-primary" href="/board/write" id="btnList" role="button">글쓰기 &raquo;</a>
  </div>
    <div><%@include file="../common/searchForm.jsp" %></div>
    <form class="row g-3 align-items-center" name="searchForm">		
	<fieldset>
	<span class="bunch">
	<input type="hidden" name="lbrry_seq_no" value="">
	<label for="dateFrom">작성일</label>
	<input type="text" id="dateStart" title="조회시작 작성일" name="dateStart" value="" size="7" maxlength="8"> ~
	<script>
        $("#dateStart").datepicker();
    </script>
	<input type="text" id="dateEnd" title="조회종료 작성일" name="dateEnd" value="" size="7" maxlength="8">
	<script>
        $("#dateEnd").datepicker();
    </script>
	</span>
	<input type="submit" class="btnType8" title="검색" value="검색">
	</fieldset>
	</form>
    <br>


  <div class="list-group w-auto">
    <a onclick="requestAction('/board/view', ${vo.bno})" href="#" class="list-group-item list-group-item-action d-flex gap-3 py-3" aria-current="true">
      <img src="https://github.com/twbs.png" alt="twbs" width="32" height="32" class="rounded-circle flex-shrink-0">
      <div class="d-flex gap-2 w-100 justify-content-between">
        <div>
          <h6 class="mb-0">제목</h6>
          <p class="mb-0 opacity-75">작성자</p>
        <small class="opacity-50 text-nowrap">조회수</small>
        </div>
        <small class="opacity-50 text-nowrap">등록일</small>
      </div>
    </a>
    <c:forEach items="${list }" var="vo">
    <a href="/board/view?bno=${vo.bno }&pageNo=${pageDto.cri.pageNo }&searchField=${pageDto.cri.searchField}&searchWord=${pageDto.cri.searchWord}" class="list-group-item list-group-item-action d-flex gap-3 py-3" aria-current="true">
      <img src="https://github.com/twbs.png" alt="twbs" width="32" height="32" class="rounded-circle flex-shrink-0">
      <div class="d-flex gap-2 w-100 justify-content-between">
        <div>
          <h6 class="mb-0">${vo.title }</h6>
          <p class="mb-0 opacity-75">${vo.content }</p>
        <small class="opacity-50 text-nowrap">${vo.visitcount }</small>
        </div>
        <small class="opacity-50 text-nowrap">${vo.newdate }</small>
      </div>
    </a>
    </c:forEach>
    <div><%@include file="../common/pageNavi.jsp" %></div>
 
  </div>

</main>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>    
</body>
</html>