
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

// 버튼이 생성되고 나서 이벤트 부여하기 위해 / 페이지가 다 그려지고 나서 실행하고 싶을 때
window.onload = function(){
	// 리스트 조회 및 출력
	// 서버에 댓글 리스트 요청
	getList(1);
	btnWrite.addEventListener('click', function(){
		
		// 1. 서버에 전달할 파라메터 수집
		let bno = document.querySelector('#bno').value;
		let reply = document.querySelector('#reply').value;
		let replyer = document.querySelector('#replyer').value;

		
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

//1. 서버에 댓글리스트 요청
function getList(){
	let bno = document.querySelector("#bno").value;
	let page = document.querySelector("#page").value;
	
	//url 요청 결과를 받아옵니다
	fetch('/reply/list/'+ bno + '/' + page )
	// response.json() : 요청결과를 js object 형식으로 반환 // 객체로 파싱
	.then(response => response.json())
	// 반환받은 오브젝트 이용하여 화면에 출력
	.then(map => replyView(map));
	
	//fetchGet('/reply/list/'+ bno + '/' + page , replyView);
		
}
function getPage(page){
	document.querySelector("#page").value =page;
	getList();
}
// 리스트 화면에 출력
function replyView(map){
	
	let list = map.list;
	let pageDto = map.pageDto;
	// 콘솔창에 리스트 출력
	console.log(list);
	console.log(pageDto);
	console.log(pageDto.startNo);
	console.log(pageDto.endNo);
	
	// div 초기화
	replyDiv.innerHTML=''
	+'총 <strong>'+pageDto.total+'</strong>건, <strong>'+pageDto.startNo+'</strong>/'+pageDto.endNo+'페이지';
	// 답글을 DIV에 출력
	//document.querySelector("reply0").innerHTML = '';


	replyDiv.innerHTML += ''
	 +'<table class="table">'
	 +'	 <colgroup>              '
	 +'	 <col style="width:5%">  '
	 +'	 <col style="width:30%"> '
	 +'	 <col style="width:15%"> '
	 +'	 <col style="width:20%"> '
	 +'	 <col style="width:10%"> '
	 +'	 </colgroup>'
	 +'<thead>     '
	 +'<tr>'
	 +'<th scope="col">No.</th>'
	 +'<th scope="col">댓글내용</th>'
	 +'<th scope="col">작성자</th>'
	 +'<th scope="col">작성일</th>'
	 +'<th scope="col">조회수</th>'
	 +'</tr>'
	 +'</thead>'
	 +'</table>';
	let replyBlock='<table class="table">'
		 +'	 <colgroup>              '
		 +'	 <col style="width:5%">  '
		 +'	 <col style="width:30%"> '
		 +'	 <col style="width:15%"> '
		 +'	 <col style="width:20%"> '
		 +'	 <col style="width:10%"> '
		 +'	 </colgroup><thead>     '
		 +'<tbody class="table-group-divider">';
	list.forEach((reply, index) => {
	replyBlock += ''
	 +'<tr>'
	 +'<td>'+index+'</td>'
	 +'<th scope="row">'+ reply.reply+'</th>'
	 +'<td>'+ reply.replyer+'</td>'
	 +'<td>'+ reply.replyDate+'</td>'
	 +'<td>'+ reply.visitcount+'</td>'
	 +'</tr>'                                        
	}); 
	replyBlock += ''
		 +'</tbody>'
		+'</table>';
	replyDiv.innerHTML += replyBlock;
	
	
	let pageBlock='';
	//페이지 블럭 생성
	pageBlock += '<nav aria-label="...">'
		  +'<ul class="pagination justify-content-center">';
		  
		  if(pageDto.prev){
			  pageBlock += '<li class="page-item" onclick="getPage('+ (pageDto.startNo-1) +')">'
			      +'<a class="page-link">Previous</a>'
				    +'</li>';
		  };
		  
   
 	 for(i=pageDto.startNo; i<=pageDto.endNo; i++){
 		 	let activeStr = (pageDto.cri.pageNo==i)?'active':'';
 		 	pageBlock += '<li class="page-item'+activeStr+'" onclick="getPage('+i+')">'
    		+'<a class="page-link" href="#">'+i+'</a></li>';		    	
		    } 
 	if(pageDto.next){
 		pageBlock += '<li class="page-item" onclick="getPage('+ (pageDto.endNo+1) +')">'
		      +'<a class="page-link" href="#">Next</a>'
		    +'</li>';
 	}
 	pageBlock += '</ul>'
		+'</nav>';
		replyDiv.innerHTML += pageBlock;

}
//수정화면 보여주기
function replyEdit(index, rno){
	let editbox = document.querySelector("#reply"+index);
	let replyTxt = editbox.dataset.value;
	editbox.innerHTML=''
	      + '<div class="input-group mb-3">'
	      +'<input type="text" id="editReply'+rno+'" value="'+replyTxt+'" class="form-control" placeholder="Recipients username" aria-label="Recipients username" aria-describedby="basic-addon2">' 
		  +'<span class="input-group-text" id="btnWrite" onclick="replyEditAction('+rno+')">수정하기</span>'
		  +'</div>';
}

function replyEditAction(rno){
	// 1. 서버에 전달할 파라메터 수집
	let reply = document.querySelector('#editReply'+rno).value;

	// 2. 전송할 데이터를 javascript객체로 생성
	let replyObj = {
			//이름 : 값
			rno:rno,
			reply:reply
	};
	// 3. 객체를 json타입으로 변환
	// json.parse : object로 변환
	let replyJson = JSON.stringify(replyObj);

	fetch('/reply/editAction'
			,{method:'post'
			, headers : {'Content-Type' : 'application/json'}
			, body : replyJson})
	// 4. 응답처리	
	.then(response => response.json())
		.then(map => replyWritesRes(map));
}




function replayDelete(rno){
	fetch('/reply/delete/'+rno)
	// response.json() : 요청결과를 js object 형식으로 반환
	.then(response => response.json())
	// 반환받은 오브젝트 이용하여 화면에 출력
	.then(map => replyWritesRes(map));
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
	

	
</script></head>
<body>
<h3>댓글달기</h3>
<input type="hidden" name="bno" id="bno" value="50">  
<input type="hidden" name="page" id="page" value="1">  

<div class="input-group mb-3">
	<input type="text" id="reply" class="form-control" placeholder="댓글" aria-label="Recipient's username" aria-describedby="basic-addon2">
	<input type="text" id="replyer" class="form-control" placeholder="작성자" aria-label="Recipient's username" aria-describedby="basic-addon2">
	  <input type="file" class="form-control" id="inputGroupFile02">
	  <label class="input-group-text" for="inputGroupFile02">파일첨부</label>
  <span class="input-group-text" id="btnWrite">댓글작성</span>
</div>
<div id="replyDiv" ></div>
</body>
</html>