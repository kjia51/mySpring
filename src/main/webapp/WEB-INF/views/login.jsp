<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>로그인</h1>
	<form method="post" action ="./loginAction">
		<input type="text" name="id" value="admin" placeholder='아이디'><br>
		<input type="text" name="pw" value="1234" placeholder='비밀번호 (8~15자리)'><br>
		<input type="submit" value="로그인"><br>
		<input type="button" value="아이디찾기">
		<input type="button" value="비밀번호 재설정">
		<input type="button" value="회원가입" onclick="location.href='/join'">
	</form>
	
</body>
</html>