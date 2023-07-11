<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<form class="row g-3 align-items-center" action="/board/list" method="get" name="searchForm">

	<input type="hidden" name="bno" value="">
	<input type="hidden" name="pageNo" value="${pageDto.cri.pageNo}">
	<div class="row g-3 justify-content-center">
  <div class="col-sm-3">
	  <select class="form-select" name="searchField"  aria-label="Default select example">
	  <option selected>선택</option>

	  <option value="title" ${pageDto.cri.searchField eq "title" ? "selected" : "" }>제목</option>
	  <option  value="content" ${pageDto.cri.searchField eq "content" ? "selected" : "" }>내용</option>
	  <option value="writer" ${pageDto.cri.searchField eq "writer" ? "selected" : "" }>저자</option>
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
</body>
</html>