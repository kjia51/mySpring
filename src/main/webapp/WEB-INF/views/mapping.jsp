<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
name : ${param.name }<br>
age : ${param.age }<br>
===================
<h3>vo 출력</h3>
${member.name }<br>
${member.age }<br>
${member.dueDate }<br>
${message }<br>
${ids} <br>
===================
<h3>배열 출력</h3>
<a href="/mapping/">호출</a><br>
<a href="/mapping/requestMapping">requestMapping호출</a><br>
<a href="/mapping/getMapping?name=모모&age=25">getMapping호출</a><br>
<a href="/mapping/getMappingVO?name=모모&age=25&dueDate=2023/07/03">getMappingVO호출</a><br>
<a href="/mapping/getMappingArr?ids=id1&ids=id2&ids=id3">getMappingVO호출</a><br>
<a href="/mapping/getMappingList?ids=id1&ids=id2&ids=id3">getMappingList호출</a><br>
<h3>객체 리스트를 파라메터로 전달</h3>
파라메터 전달방법 : list[0].name=momo&list[0].age=123&list[1].name=admin&list[1].age=456<br>
<script>
	function voList(){
		let url = "/mapping/getMappingList?list[0].name=momo&list[0].age=123&list[1].name=admin&list[1].age=456"
		// 자바에서 호출할시 일반인증키 사용 가능
		url = encodeURI(url);
		alert(url);
		location.href=url;
	}
</script>
<a href="#" onclick="voList()">객체리스트 전달</a>

<form action="/mapping/requestMapping" method="post">
	<input type=submit value="전송">
</form>

</body>
</html>