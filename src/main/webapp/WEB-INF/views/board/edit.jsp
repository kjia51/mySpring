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
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function requestAction(url){
		viewForm.action=url;
		viewForm.submit();
		
	}
	function attachFileDelete(e){
		let bno = e.dataset.bno;
		let uuid = e.dataset.uuid;
		//fetch('/file/delete/'+uuid+'/'+bno)
		fetch(`/file/delete/\${uuid}/\${bno}`)
			.then(response=>response.json())
			.then(map=>fileDeleteRes(map));
	}

	function fileDeleteRes(map){
		if(map.result=='success'){
			console.log(map.msg);
			getFileList();
		} else{
			alert(map.msg);
		}
		
	}
</script>
</head>
<body>
<%@include file="../common/header.jsp" %>
<p><br><br><br></p>
<main class="container">
<h3>게시판 수정화면</h1>
  <div class="list-group w-auto">
  <form method="get" action="" name="viewForm">
  
  <input type="hidden" name="bno" value="${board.bno }">  
  
  
  <div class="mb-3">
    <label for="title" class="form-label">제목</label>
    <input type="text" name="title" id="title" class="form-control"  value="${board.title }" >
  </div>
  <div class="mb-3">
    <label for="content" class="form-label">내용</label>
    <textarea type="text" name="content" id="content" class="form-control"  rows="3">${board.content }</textarea>
  </div>
  <div class="mb-3">
    <label for="writer" class="form-label">작성자</label>
    <input type="text" name="writer" id="writer" class="form-control"  value="${board.writer }">
	</div>
    	<div class="mb-3">
    <label for="writer" class="form-label">첨부파일</label><br>
   	<input class="form-control" type="file" name="files" multiple="multiple">
	</div>
    <label for="attachFile" class="form-label">첨부파일 목록</label>
	<div class="form-control" id="attachFile">
	<c:forEach items="${files }" var="file">
    <a href="/file/download?fileName='${file.savePath }'">${file.filename }</a>
    <i onclick="location.href='../board/EditAction'" data-bno="${file.bno }" data-uuid="${file.uuid }" class="fa-solid fa-trash"></i>	<br>
	</c:forEach>
    </div><br>
	<div class="d-grid gap-2 d-md-flex justify-content-md-center">
	  <input type="button" onclick="requestAction('editAction')" value="수정">
	  <input type="button" onclick="location.href='/board/list'" value="목록">
	  <input type="button" onclick="requestAction('delete')" value="삭제">
	</div>
	
</form>
</div>
</main>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
</body>
</html>