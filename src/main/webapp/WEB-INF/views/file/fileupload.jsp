<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
window.addEventListener('load', function(){
	//리스트 조회
	btnGetList.addEventListener('click', function(){
		getFileList();
	});
	
	//파일업로드
	btnfileupload.addEventListener('click', function(){
		//웹 개발에서 HTML폼데이터를 JavaScript로 쉽게 .. 전송하는 방법을 제공하는 API이다
		
		let formData = new FormData(fileuploadForm);

		
		console.log("formData : ", formData);
		// FormData값 확인
		
		for(var pair of formData.entries()){
			console.log(pair);
			console.log(pair[0]+' : '+pair[1]);
			
			if(typeof(pair[1])=='object'){
				let fileName = pair[1].name;
				let fileSize = pair[1].fileSize;
				
				if(!checkExtension(fileName, fileSize)){
					return false;	
				}
				console.log('fileName', pair[1].name);
				console.log('fileSize', pair[1].fileSize);
				
				//파일 확장자, 크기 체크
				// 서버에 전송 가능한 형식인지 확인
				// 최대 전송 가능한 용량을 초과하였는지
			}
			
		}
		
		fetch('/file/fileuploadActionFetch'
				,{
				method:'post',
				body : formData
					})
				.then(response => response.json())
				.then(map=>fileuploadRes(map));
				//.then(map=>console.log(map));

				
	});
	
})

function checkExtension(fileName, fileSize){
	let maxSize=1024*1024*10;
	// 정규표현식 : 특정 규칙을 가진 문자열을 검색하거나 치환할때 사용
	let regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
	if(maxSize <= fileSize){
		alert("파일 사이즈 초과");
		return false;
	} 
	
	// 문자열에 정규식 패턴을 만족하는 값이 있으면 true, 없으면 false 리턴
	if(regex.test(fileName)){
		alert("해당 종류의 파일은 업로드 할 수 없습니다.")
		return false;
	}
	return true;
}

function fileuploadRes(map){
	if(map.result=='success'){
	divFileuploadRes.innerHTML=map.msg;		
	//게시글 등록
	} else{
		alert(map.msg);
	}
}
function getFileList(){
	//let bno = '${board.bno}';
	//if(bno){
		
	//}
	let bno = document.querySelector("#bno").value;
	fetch('/file/list/'+bno)
		.then(response=>response.json())
		.then(map => viewFileList(map));
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


function viewFileList(map){
	console.log(map);
	let content = '';
	if(map.list.length > 0){
	map.list.forEach(function(item,index){
		let savePath = encodeURIComponent(item.savePath);
		
		content += '<a href="/file/download?fileName='+savePath+'">'
				+ item.filename
				 +'</a>' 
				+ '<i onclick="attachFileDelete(this)" data-bno="'+item.bno+'" data-uuid="'+item.uuid+'" class="fa-solid fa-trash"></i>'
				+'<br>';
	})		
	} else{
		content = '등록된 파일이 없습니다.'
	}
	fileUpload.innerHTML = content;
}
</script>
<script src="https://kit.fontawesome.com/5a87685c31.js" crossorigin="anonymous"></script>
</head>
<body>
<!--res : ${param.msg }
	<h2>파일업로드</h2>
		<h2>파일선택</h2>
  -->
	<form method="post" action="/file/fileuploadAction" enctype="multipart/form-data" name="fileuploadForm">
		bno : <input type="text" name="bno" id="bno" value="141"><br>
		<input class="form-control" type="file" name="files" multiple="multiple"><br>
		<button type="submit">파일업로드</button>
	</form>
	res : ${param.msg }
	<div id="divFileuploadRes">
	
	</div>
	<h2>파일리스트 조회</h2>
	<button type="button" id="btnGetList">리스트 조회</button>
	<button type="button" id="btnfileupload">Fetch파일업로드</button>
	<div id="fileUpload"></div>
</body>
</html>