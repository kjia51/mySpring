console.log('reply.js==============');
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