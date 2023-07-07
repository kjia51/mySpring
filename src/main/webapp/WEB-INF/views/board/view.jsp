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
<link href="/resources/css/style.css" rel="stylesheet">

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function requestAction(url){
		viewForm.action=url;
		viewForm.submit();
		
	}
</script>
</head>
<body>
<%@include file="../common/header.jsp" %>
<p><br><br><br></p>


<main class="container">
  <div class="bg-light p-5 rounded">
    <h1>게시판 상세화면</h1>
    <p class="lead">부트스트랩을 이용한 게시판 만들기</p>
    <a class="btn btn-lg btn-primary" href="/board/list?pageNo=${param.pageNo }&searchField=${param.searchField}&searchWord=${param.searchWord}" role="button">목록보기 &raquo;</a>
  </div>
  <p></p>

  <div class="list-group w-auto">
  <form method="get" action="" name="viewForm">
  <input type="hidden" name="bno" value="${board.bno }">  
  <div class="mb-3">
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
	  <input type="button" onclick="requestAction('/board/edit')" value="수정">
	  <input type="button" onclick="requestAction('/board/delete?bno=${board.bno}')" value="삭제">
	</div>
</form>
</div>
</main>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>    
</body>
</html>