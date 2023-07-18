<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
window.addEventListener('load', function(){
	btnGetList.addEventListener('click', function(){
		getFileList();
});
});
function getFileList(){
	let bno = document.querySelector("#bno").value;
	fetch('/file/list/'+bno)
		.then(response=>response.json())
		.then(map => viewFileList(map));
}
function viewFileList(map){
	console.log(map);
	let content = '';
	if(map.list.length > 0){
	map.list.forEach(function(item,index){
		content += item.filename +"\n" +item.savePath+"\n"+item.s_savePath + '<br><br>';
	})		
	} else{
		content = '등록된 파일이 없습니다.'
	}
	fileUpload.innerHTML = content;
}
</script>
</head>
<body>
res : ${param.msg }
	<h2>파일업로드</h2>
	<form method="post" action="/file/fileuploadAction" enctype="multipart/form-data" name="fileuploadForm">
		<h2>파일선택</h2>
		bno : <input type="text" name="bno" id="bno" value="141"><br>
		<input type="file" name="files"><br>
		<input type="file" name="files"><br>
		<input type="file" name="files"><br>
		<button type="submit">파일업로드</button>
	</form>
	res : ${param.msg }
	<h2>파일리스트 조회</h2>
	<button type="button" id="btnGetList">리스트 조회</button>
	<div id="fileUpload"></div>
</body>
</html>