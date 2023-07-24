console.log('reply.js==============');
//get방식 요청	
function fetchGet(url, callback){
		try{
			fetch(url)
			// 요청결과 문자열을 javascript 객체로 반환
			.then(response => response.json())
			// 반환받은 오브젝트 이용하여 화면에 출력
			.then(map => callback(map));
		}  catch(e){
			console.log('fetchGet',e);
		}
		
	}
function fetchPost(url, obj, callback){
	try{
		fetch(url
				,{
				  method:'post'
				, headers : {'Content-Type' : 'application/json'}
				, body : JSON.stringify(obj)
				})
		// 4. 응답처리	
		.then(response => response.json())
			.then(map => callback(map));
	} catch(e){
		console.log('fetchPost',e);
	}
}

// 댓글 조회 및 출력
function getReplyList(page){
	
	/**
	 * falsy : false, 0, "", NaN, undefined, null
	 * 
	 * falsy 한값 이외의 값이 들어있으면 true를 반환
	 */
	if(!page){
		page = 1;
	}
	page = document.querySelector('#pageNo').value;
	
	
	let bno = document.querySelector('#bno').value;
	console.log('bno');
	console.log('/reply/list/'+bno+'/'+page);
	console.log(`/reply/list/${bno}/${page}`);
	
	//url : 요청 경로 
	//callback : 응답결과로 실행시킬 함수
	fetchGet(`/reply/list/${bno}/${page}`,replyView)
}

function replyView(map){
	let list = map.list;
	let pageDto = map.pageDto;

	console.log(list);
	// div 초기화
	replyDiv.innerHTML=''
		 +      '<form class="row g-3 align-items-center" name="searchForm">'			
		 +	'<fieldset>'
		 +		'<span class="bunch">'
		 +			'<input type="hidden" name="lbrry_seq_no" value="">'
		 +			'<label for="dateFrom">작성일</label>'
		 +			'<input type="text" id="dateFrom" title="조회시작 작성일" name="dateFrom" value="" size="7" maxlength="8" class="datePicker hasDatepicker"> ~ '
		 +			'<input type="text" id="dateTo" title="조회종료 작성일" name="dateTo" value="" size="7" maxlength="8" class="datePicker hasDatepicker">'
		 +		'</span>'
		 +		'<input type="submit" class="btnType8" title="검색" value="검색">'
		 +	'</fieldset>'
		+ '</form>'
	+'총 <strong>'+pageDto.total+'</strong>건, <strong>'+pageDto.startNo+'</strong>/'+pageDto.endNo+'페이지';
	// 답글을 DIV에 출력
	//document.querySelector("reply0").innerHTML = '';


	replyDiv.innerHTML += '';
	let replyBlock =''
		+ '<p></p>'
	 +'<table class="table text-break text-center">'
	 +'	 <colgroup>              '
	 +'	 <col style="width:8%">  '
	 +'	 <col style="width:30%"> '
	 +'	 <col style="width:10%"> '
	 +'	 <col style="width:10%"> '
	 +'	 </colgroup>'
	 +'<thead class="bg-secondary text-white">     '
	 +'<tr>'
	 +'<th scope="col">No.</th>'
	 +'<th scope="col">댓글내용</th>'
	 +'<th scope="col">작성자</th>'
	 +'<th scope="col">작성일</th>'
	 +'</tr>'
	 +'</thead>'
	 +'<tbody>';
	list.forEach((reply) => {
	replyBlock += ''
	 +'<tr id="tr'+reply.rno+'" data-value= "'+ reply.reply+'">'
	 +'<td>'+reply.rno+'</td>'
	 +'<th scope="row" class="text-start">'
	    + '<p><a href="#"  onclick="replyDView('+reply.rno+')">' + reply.reply + '</a></p>';
	    if(replyer.value==reply.replyer){ 
	    	replyBlock+= ''

	    + '<p><i class="fa-regular fa-trash-can" onclick="replyDelete('+reply.rno+')"></i></p>';
	    }

	    replyBlock+='</th><td>'+ reply.replyer+'</td>'
	 +'<td>'+ reply.updateDate+'</td>'
	 +'</tr>'                                        
	}); 
	replyBlock += ''
		 +'</tbody>'
		+'</table>';
	replyDiv.innerHTML += replyBlock;
	let pageBlock='';
	//페이지 블럭 생성
	pageBlock += '<input type="hidden" name="page" id="page"> '
		 + '<nav aria-label="...">'
		  +'<ul class="pagination justify-content-center">';
		  
		  if(pageDto.prev){
			  pageBlock += '<li class="page-item" onclick="getReplyList('+ (pageDto.startNo-1) +')">'
			      +'<a class="page-link">Previous</a>'
				    +'</li>';
		  };
		  
   
 	 for(i=pageDto.startNo; i<=pageDto.endNo; i++){
 		 	let activeStr = (pageDto.cri.pageNo==i)?'active':'';
 		 	pageBlock += '<li class="page-item bg-white text-dark'+activeStr+'" onclick="getReplyList('+i+')">'
    		+'<a class="page-link bg-white text-dark" href="#">'+i+'</a></li>';		    	
		    } 
 	if(pageDto.next){
 		pageBlock += '<li class="page-item" onclick="getReplyList('+ (pageDto.endNo+1) +')">'
		      +'<a class="page-link" href="#" >Next</a>'
		    +'</li>';
 	}
 	pageBlock += '</ul>'
		+'</nav>';
		replyDiv.innerHTML += pageBlock;
}

function replyWrite(){
	// bno, reply, replyer
	let bno = document.querySelector('#bno').value;
	let reply = document.querySelector('#reply').value;
	let replyer = document.querySelector('#replyer').value;
	let obj = {bno:bno, reply:reply, replyer:replyer};
	
	console.log('replyWrite :' +obj);
	fetchPost('/reply/insert', obj, replyRes );

	// url : 요청경로
	// obj : json 형식으로 전달할 데이터
	// callback : 콜백함수(응답결과를 받아서 처리할 함수)
}

// 등록 수정 삭제의 결과를 처리하는 함수 
function replyRes(map){
	// 성공 : 리스트 조회 및 출력
	// 실패 : 메세지 출력
	if(map.result == "success"){
		getReplyList();	
	} else{
		alert(map.message);
	}
}

// 답글 삭제하기
function replyDelete(rno){
	console.log('rno :'+rno );
	fetchGet('/reply/delete/'+rno, replyRes);
}

function replyEdit(rno){
	console.log('rno :'+rno );
	let tr = document.querySelector('#tr'+rno);
	let replyTxt =  tr.dataset.value;
	tr.innerHTML= ''
		  +'<td colspan="6">'
	      + '<div class="input-group">'
	      +'  <span class="input-group-text">'+rno+'</span>'
	      +'<input type="text" id="editReply'+rno+'" value="'+replyTxt+'" class="form-control" placeholder="Recipients username" aria-label="Recipients username">' 
		  +'<span class="input-group-text" id="btnWrite" onclick="replyEditAction('+rno+')">수정하기</span>'
		  +'</div>'
		  +'</td>';
//		   +'<td colspan="6">'
//           +'<div class="accordion" id="accordionExample">'
//           + ' <div class="accordion-item">'
//		   +  '  <h2 class="accordion-header" id="headingOne">'
//		   +   '   <button class="accordion-button bg-white text-dark" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">'
//		   +    rno +' 수정 중...'
//		   +     ' </button>'
//		   +    '</h2>'
//		   +    '<div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#accordionExample">'
//	       + '<div class="accordion-body input-group mb-3">'
//	       +'<input type="text" id="editReply'+rno+'" value="'+replyTxt+'"class="form-control" placeholder="Recipients username" aria-label="Recipients username" aria-describedby="basic-addon2">' 
//		   +'<span class="input-group-text" id="btnWrite" onclick="replyEditAction('+rno+')">수정하기</span>'
//		   +'</div>'
//		   +    '</div>'
//		   +  '</div>'
//		   +  '</div>'
// 		   + '</td>';
}
function replyDView(rno){
	console.log('rno :'+rno );
	let tr = document.querySelector('#tr'+rno);
	tr.innerHTML= ''
		   +'<td colspan="6">'
      +'<div class="accordion" id="accordionExample">'
      + ' <div class="accordion-item">'
	   +  '  <h2 class="accordion-header" id="headingOne">'
	   +   '   <button class="accordion-button bg-white text-dark" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">'
	   +    ' 수정 중...'
	   +     ' </button>'
	   +    '</h2>'
	   +    '<div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#accordionExample">'
      + '<div class="accordion-body input-group mb-3">'
      +'<input type="text" class="form-control" placeholder="Recipients username" aria-label="Recipients username" aria-describedby="basic-addon2">' 
	   +'<span class="input-group-text" id="btnWrite" >수정하기</span>'
	   +'</div>'
	   +    '</div>'
	   +  '</div>'
	   +  '</div>'
	   + '</td>';
	
	
}



function replyEditAction(rno){

	let reply = document.querySelector('#editReply'+rno).value;
	let obj = {rno:rno, reply:reply};
	fetchPost('/reply/editAction/', obj, replyRes);
}

function getPage(page){
	document.querySelector("#pageNo").value =page;
	getReplyList();
}










