<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
</head>
<body>
<form class="row g-3" method="post" action ="/login">
  <div class="col-md-6">
    <label for="inputEmail4" class="form-label">id</label>
    <input type="text" class="form-control" id="id" name="id" placeholder="아이디">
  </div>
  <div class="col-md-6">
    <label for="inputPassword4" class="form-label">Password</label>
    <input type="text" class="form-control" id="pw" name="pw" placeholder="비밀번호(8~15자리)">
  </div>
  <div class="col-12">
    <label for="inputAddress" class="form-label">이름</label>
    <input type="text" class="form-control" id="name" placeholder="이름">
  </div>
  <div class="col-12">
    <label for="inputAddress2" class="form-label">주소</label>
    <input type="text" class="form-control" id="inputAddress" placeholder="주소">
  </div>
  <div class="col-md-6">
    <label for="inputCity" class="form-label">City</label>
    <input type="text" class="form-control" id="inputCity">
  </div>
  <div class="col-md-4">
    <label for="inputState" class="form-label">State</label>
    <select id="inputState" class="form-select">
      <option selected>Choose...</option>
      <option>...</option>
    </select>
  </div>
  <div class="col-md-2">
    <label for="inputZip" class="form-label">Zip</label>
    <input type="text" class="form-control" id="inputZip">
  </div>
  <div class="col-12">
    <div class="form-check">
      <input class="form-check-input" type="checkbox" id="gridCheck">
      <label class="form-check-label" for="gridCheck">
        Check me out
      </label>
    </div>
  </div>
      일자: <input type="text" id="datepicker">
    
    <script>
        $("#datepicker").datepicker();
    </script>
  <div class="col-12">
    <button type="submit" class="btn btn-primary">Sign in</button>
  </div>
</form>
</body>
</html>