<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	<script src="https://kit.fontawesome.com/ba30180671.js" crossorigin="anonymous"></script>
	
	<!-- css -->
	<link href="/resources/css/style.css" rel="stylesheet">
	
	<!-- js -->
	<script src="/resources/js/reply.js"></script>
	
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

	<!--  
	<script src="/resources/js/bootstrap-datepicker.js"></script>
	<script src="/resources/js/jquery.js"></script>
	<link rel="stylesheet" href="/resources/css/bootstrap-datepicker3.css">
	-->
	
	<link rel="stylesheet" href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css" />
</head>

<body>

<%@include file="../common/header.jsp" %>

<script  type="text/javascript">
window.addEventListener('load',function(){

	btnEdit.addEventListener('click', function(){
		viewForm.action='/board/edit';
		viewForm.submit();	
	});
	btnDelete.addEventListener('click', function(){
		viewForm.action='/board/delete';
		viewForm.submit();	
	});
	btnList.addEventListener('click', function(){
		viewForm.action='/board/list';
		viewForm.submit();	
	});
	btnReplyWrite.addEventListener('click', function(){
		replyWrite();

	});
	getReplyList();
});
	/*
	 function requestAction(url){
		viewForm.action=url;
		viewForm.submit();		
	}
	*/
	$("#datepicker").datepicker();

</script>

<main class="container">
${userId }
${userName }
  <div class="bg-light p-5 rounded">
    <h1>게시판 상세화면</h1>
    <p class="lead">부트스트랩을 이용한 게시판 만들기</p>
    <a class="btn btn-secondary btn-primary" href="#" id="btnList" role="button">목록보기 &raquo;</a>
  </div>
  <p></p>
  <div class="list-group w-auto">
  <form method="get" action="" name="viewForm">
  
  <input type="text" name="bno" id="bno" value="${board.bno }">  
  <input type="text" name="pageNo" id="pageNo" value="${param.pageNo }">  
  <input type="text" name="searchField" value="${param.searchField }">  
  <input type="text" name="searchWord" value="${param.searchWord }">  
  
  <div class="mb-3 " >
    <label for="title" class="form-label">제목</label>
    <input type="text" name="title" id="title" class="form-control" readonly value="${board.title }" >
  </div>
  <div class="mb-3">
    <label for="content" class="form-label">내용</label>
    <textarea type="text" name="content" id="content" class="form-control" readonly rows="3">${board.content }</textarea>
  </div>
  <div class="mb-3">
    <label for="writer" class="form-label">작성자</label>
    <input type="text" name="writer" id="writer" class="form-control" readonly value="${board.writer }">
    
	</div>
	<div class="d-grid gap-2 d-md-flex justify-content-md-center">
	  <input type="button" id="btnEdit" value="수정">
	  <input type="button" id="btnDelete" value="삭제">
	</div>
</form>
<p></p>
</div>
<p></p>
<div class="input-group">
  <span class="input-group-text">답글작성</span>
  <input type="text" aria-label="First name" class="form-control" id="reply">
  <input type="hidden" aria-label="First name" class="form-control" id="replyer" value="${userId }">
  <input type="text" id="btnReplyWrite" aria-label="Last name" class="input-group-text"  value="등록하기">
</div>

<p></p>
<!-- 댓글리스트 -->
<div id="replyDiv"></div>

</main>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>    
</body>
</html>