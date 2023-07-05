<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>

window.onload=function(){
	String msg = ${msg};
	if(msg!=""){
		document.querySelector(".modal-body").innerHTML = msg;
		document.querySelector("$btnModalSave").style.display = 'none';
		
	}
	const myModal = new bootstrap.Modal('#myModal', {
		  keyboard: false
		});

	myModal.show();
}

function formAction(action(){
	
})
}
</script>
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
    </style>

</head>
<body>
<%@include file="../common/header.jsp" %>
<main class="container">
  <div class="bg-light p-5 rounded">
    <h1>게시판 만들기</h1>
    <p class="lead">부트스트랩을 이용한 게시판 만들기</p>
    <a class="btn btn-lg btn-primary" href="/board/write" role="button">글쓰기 &raquo;</a>
  </div>
  <!-- searchForm  -->

  <form class="row g-3" name="searchForm" >
  <div class="">
  <div class="col-auto">
   <select name="searchField" class="form-control me-2" style="width:100px;height:38px;">
    <option value="id" ${param.searchField eq "id" ? "selected" : "" }>제목</option>
    <option value="name" ${param.searchField eq "name" ? "selected" : "" }>내용</option>
    <option value="adminyn" ${param.searchField eq "adminyn" ? "selected" : "" }>작성자</option>
  </select>

  </div>
  <div class="col-auto">
    <input type="text" class="form-control" id="searchWord" name="searchWord" placeholder="searchWord">
  </div>
  <div class="col-auto">
    <button type="submit" class="btn btn-primary mb-3">검색하기</button>
  </div>
  </div>
</form>
	<input type="text" name="pageNo">

  <div class="list-group w-auto">
    <a href="#" class="list-group-item list-group-item-action d-flex gap-3 py-3" aria-current="true">
      <img src="https://github.com/twbs.png" alt="twbs" width="32" height="32" class="rounded-circle flex-shrink-0">
      <div class="d-flex gap-2 w-100 justify-content-between">
        <div>
          <h6 class="mb-0">제목</h6>
          <p class="mb-0 opacity-75">작성자</p>
        </div>
        <small class="opacity-50 text-nowrap">등록일</small>
      </div>
    </a>
    <c:forEach items="${list }" var="vo">
    <a href="/board/view?bno=${vo.bno }" class="list-group-item list-group-item-action d-flex gap-3 py-3" aria-current="true">
      <img src="https://github.com/twbs.png" alt="twbs" width="32" height="32" class="rounded-circle flex-shrink-0">
      <div class="d-flex gap-2 w-100 justify-content-between">
        <div>
          <h6 class="mb-0">${vo.title }</h6>
          <p class="mb-0 opacity-75">${vo.content }</p>
        </div>
        <small class="opacity-50 text-nowrap">${vo.regdate }</small>
      </div>
    </a>
    </c:forEach>
    <div><%@include file="../common/pageNavi.jsp" %></div>
 
  </div>
<!-- Modal -->
<div id="myModal" class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">Modal title</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">확인</button>
        <button type="button" class="btnModalSave">저장</button>
      </div>
    </div>
  </div>
</div>
</main>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>    
</body>
</html>