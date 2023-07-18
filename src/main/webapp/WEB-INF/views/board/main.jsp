<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
      img:hover {
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
<%@include file="../common/header.jsp" %>
<main class="container">
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

<div><%@include file="../common/pageNavi.jsp" %></div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>    
</main>
</body>
</html>