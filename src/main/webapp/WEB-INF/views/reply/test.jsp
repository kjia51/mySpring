
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://kit.fontawesome.com/5a87685c31.js" crossorigin="anonymous"></script>
<script type="text/javascript">

function getList(){
	let bno = document.querySelector("#bno").value;
	//url 요청 결과를 받아옵니다
	fetch('/reply/list/'+bno)
	// response.json() : 요청결과를 js object 형식으로 반환
	.then(response => response.json())
	// 반환받은 오브젝트 이용하여 화면에 출력
	.then(list => replyView(list));
		
}
// 리스트 화면에 출력
function replyView(list){
	
	// 콘솔창에 리스트 출력
	console.log(list)
	
	// div 초기화
	replyDiv.innerHTML='';
	// 답글을 DIV에 출력
	//document.querySelector("reply0").innerHTML = '';
	list.forEach((reply, index) => {
	replyDiv.innerHTML 
	+= '<figure id="reply' + index + '">'
	  +'	<blockquote class="blockquote">'
	   + '		<p>'+reply.reply
	   +'<i class="fa-solid fa-user-pen"></i>'
	   +'<i class="fa-solid fa-eraser" onclick="replayDelete('+reply.rno+')"></i>'
	   +'</p>'
	  + '	</blockquote>'
	  
	 + '	<figcaption class="blockquote-footer">'
	   +  reply.replyer
	   + '<cite title="Source Title">'+reply.replyDate+'</cite>'
	  + '	</figcaption>'
	+ '</figure>';
		
	});
}

function replayDelete(rno){
	fetch('/reply/delete/'+rno)
	// response.json() : 요청결과를 js object 형식으로 반환
	.then(response => response.json())
	// 반환받은 오브젝트 이용하여 화면에 출력
	.then(map => replyWritesRes(map));
}
	// 버튼이 생성되고 나서 이벤트 부여하기 위해 
	window.onload = function(){
		// 리스트 조회 및 출력
		// 서버에 댓글 리스트 요청
		getList();
		btnWrite.addEventListener('click', function(){
			
			// 1. 서버에 전달할 파라메터 수집
			let bno = document.querySelector('#bno').value;
			let reply = document.querySelector('#reply').value;
			let replyer = document.querySelector('#replyer').value;
			console.log('bno', bno);
			console.log('reply', reply);
			console.log('replyer', replyer);
			
			// 2. 전송할 데이터를 javascript객체로 생성
			let replyObj = {
					//이름 : 값
					bno:bno,
					reply:reply,
					replyer:replyer
			};
			// 3. 객체를 json타입으로 변환
			// json.parse : object로 변환
			let replyJson = JSON.stringify(replyObj);
			
			console.log("replyObj : "+replyObj);
			console.log("replyJson : "+replyJson);
			
			// 4. 서버에 요청
			fetch('/reply/insert'
					,{method:'post'
					, headers : {'Content-Type' : 'application/json'}
					, body : replyJson})
			// 4. 응답처리	
			.then(response => response.json())
				.then(map => replyWritesRes(map));
		});
	}
	
	function replyWritesRes(map){
		if(map.result == 'success'){
			//등록성공, 리스트 조회 및 출력
			getList();
		} else{
			//실패
			alert(map.message);
	}
	}
</script>
</head>
<body>
<h2>답글달기</h2>
<input type="text" name="bno" id="bno" value="50">  
<div class="input-group mb-3">
  <input type="text" id="reply"> 
  <input type="text" id="replyer"> 
  <span class="input-group-text" id="btnWrite">댓글작성</span>
</div>
<div id="replyDiv"></div>
<div><%@include file="pageNavi.jsp" %></div>
</body>
</html>