<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>파일업로드</h2>
	메시지 : ${message }
	<!--  파일 전송할 때 타입 : multipart/form-data -->
	<form action="/fileupload" method="post" enctype="multipart/form-data">
		파일선택 <br>
		<input type="file" name="files"><br>
		<input type="file" name="files"><br>
		<input type="file" name="files"><br>
		<input type="submit">
	</form>
</body>
</html>