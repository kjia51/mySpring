<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.104.2">
    <title>게시판 만들기</title>

<link rel="canonical" href="https://getbootstrap.com/docs/5.2/examples/navbar-fixed/">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<link href="/resources/css/style.css" rel="stylesheet">

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
</script>
</head>
<meta charset="UTF-8">

<%@include file="../common/header.jsp" %>
<p><br><br><br></p>
<body>
<main class="container">
<p></p>
  <div class="bg-light p-5 rounded">
    <h1>게시판</h1>
    <p class="lead">부트스트랩을 이용한 게시판 만들기</p>
    <a class="btn btn-lg btn-primary" href="/board/List" role="button">리스트 &raquo;</a>
  </div>
  <p></p>
  <div class="list-group w-auto">
  
  
  <form method="post" action="/board/write">
  <input type="text" name="bno" value="${board.bno }">
  <div class="mb-3">
    <label for="title" class="form-label">제목</label>
    <input type="text" name="title" id="title" class="form-control" readonly  value="${board.title }">
  </div>
  <div class="mb-3">
    <label for="content" class="form-label">내용</label>
    <textarea type="text" name="content" id="content" class="form-control" rows="3" >${board.content }</textarea>
  </div>
  <div class="mb-3">
    <label for="writer" class="form-label">작성자</label>
    <input type="text" name="writer" id="writer" class="form-control" value="${board.writer }">
	</div>
	<div class="d-grid gap-2 d-md-flex justify-content-md-center">
	  <button class="btn btn-primary" type="submit">글쓰기</button>
	  <button class="btn btn-primary" type="reset">초기화</button>
	</div>
</form>
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