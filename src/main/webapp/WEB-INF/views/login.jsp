<%@page import="java.math.BigInteger"%>
<%@page import="java.security.SecureRandom"%>
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	window.addEventListener('load', function(){
		
		btnSigninView.addEventListener('click', function(){
          signupForm.style.display='none';
          signinForm.style.display='';
        })
        
        btnSignupView.addEventListener('click', function(){
          signupForm.style.display='';
          signinForm.style.display='none';
        })
        
		btnLogin.addEventListener('click', function(e){
			//기본이벤트 제거
			e.preventDefault();
			//파라메터 수집
			let obj={
					id : document.querySelector('#id').value,
					pw : document.querySelector('#pw').value,
					
			}
			console.log(obj);
			
		//요청
		fetchPost("/loginAction", obj, loginCheck);
		})
		
		
		signUpid.addEventListener('blur', function(){
			if(!signUpid.value){
				signupMsg.innerHTML='아이디를 입력해주세요';
				return;
			}
			let obj = {
					id : signUpid.value
			};
			console.log("아이디체크 : "+obj);
			fetchPost('/idCheck', obj, idCheck	)
			})
			



		pwCheck.addEventListener('blur', function(){
				if(!signUppw.value){
					signupMsg.innerHTML='비밀번호를 입력해주세요';
					return;
				}
				if(!pwCheck.value){
					signupMsg.innerHTML='비밀번호 확인을 입력해주세요';
					return;
				}
					// 비밀번호 체크 -> 안갔다와도됌
					if(signUppw.value == pwCheck.value){
						pwCheckRes.value='1';
						signupMsg.innerHTML='비밀번호가 일치합니다';
						console.log(signUppw.value);
						console.log(pwCheck.value);
					} else{
						signupMsg.innerHTML='비밀번호가 일치하지 않습니다';
						signUppw.focus();
						pwCheck.value='';
						signUppw.value='';
						
					}
				})
			
			btnSignin.addEventListener('click',function(e){
				
				// 이벤트 초기화
				e.preventDefault();
				let id = signUpid.value;
				let pw = signUppw.value;
				let name = signUpname.value;
				
				if(idCheckRes.value!=1){
					signupMsg.innerHTML='아이디 중복체크를 해주세요 ';
					signUpid.focus();
					return;
				}
				if(pwCheckRes.value!=1){
					signupMsg.innerHTML='비밀번호가 일치하는지 확인해주세요 ';
					pwCheck.focus();
					return;
				}
				
				let obj = {
						id:id, pw:pw, name:name
				}
				
				if(!id){
					signupMsg.innerHTML='아이디를 입력해주세요';
					return;
				}
				if(!pw){
					signupMsg.innerHTML='비밀번호를 입력해주세요';
					return;
				}
				if(!name){
					signupMsg.innerHTML='이름을 입력해주세요';
					return;
				}
				fetchPost('/register', obj, (map)=>{
											if(map.result='success'){
												location.href='/login?msg='+map.msg;
												
											} else{
												signupMsg.innerHTML=map.msg;
											}
				});
			})
		})

	
	function loginCheck(map){		
		
		console.log(map);
		if(map.result=='success'){
			// 로그인 성공 -> 리스트로 이동
			console.log('success');
				location.href=map.url;
			} else{
			// 로그인 실패 -> 메세지 처리
			console.log('fail');
			msg.innerHTML=map.msg;
			}

	}
	
	function idCheck(map){
		if(map.result=='success'){
			// 사용가능
			idCheckRes.value='1';
			signUpname.focus();
		} else{
			// 사용 불가능
			signUpid.focus();
			signUpid.value='';
		}
			signupMsg.innerHTML = map.msg;
	}
	
	
	//function kakaologin(){
		//window.open(
		//"https://kauth.kakao.com/oauth/authorize?response_type=code&client_id=12058067f10f2a5ed33132f900363ed0&redirect_uri=http://localhost:8080/login",
        //"카카오로그인창",
        //"width=500,height=500,left=250,top=250"
		//)
		
	//}
</script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script type="text/javascript" src="../resources/js/common.js"></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js"charset="utf-8"></script>
 <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<link href="../resources/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Playfair&#43;Display:700,900&amp;display=swap" rel="stylesheet">
<link href="../resources/css/signin.css" rel="stylesheet">
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
 <style>

      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }

      .b-example-divider {
        height: 3rem;
        background-color: rgba(0, 0, 0, .1);
        border: solid rgba(0, 0, 0, .15);
        border-width: 1px 0;
        box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em rgba(0, 0, 0, .15);
      }
      .b-example-vr {
        flex-shrink: 0;
        width: 1.5rem;
        height: 100vh;
      }

      .bi {
        vertical-align: -.125em;
        fill: currentColor;
      }

      .nav-scroller {
        position: relative;
        z-index: 2;
        height: 2.75rem;
        overflow-y: hidden;
      }

      .nav-scroller .nav {
        display: flex;
        flex-wrap: nowrap;
        padding-bottom: 1rem;
        margin-top: -1px;
        overflow-x: auto;
        text-align: center;
        white-space: nowrap;
        -webkit-overflow-scrolling: touch;
      }
 </style>
</head>
   
<body class="text-center" style="background-color: rgb(214, 236, 245);">
<main class="form-signin w-100 m-auto">

<!-- 회원가입 폼 -->
<c:if test="${userId eq null }">
  <form name='signupForm' style='display: none' >

    <img class="mb-4" src="../resources/img/heart.gif" alt="" width="300" height="200">
    <h1 class="h3 mb-3 fw-normal">Please sign in</h1>
  	<div id="signupMsg"></div>
    <div class="form-floating">
      <input type="text" class="form-control" id="signUpid">
      <label for="id">Id</label>
    </div>
    <div class="form-floating">
      <input type="text" class="form-control" id="signUpname">
      <label for="signUpname">Name</label>
    </div>
        <div class="form-floating">
      <input type="password" class="form-control" id="signUppw" >
      <label for="signUppw">Password</label>
    </div>
    <div class="form-floating">
      <input type="password" class="form-control" id="pwCheck">
      <label for="pwCheck">PasswordCheck</label>
    </div>
    <div class="checkbox mb-3">
      <label>
        <input type="checkbox" value="remember-me"> Remember me
      </label>
    </div>
    <button class="w-100 btn btn-lg btn-primary" type="submit" id='btnSignin'>회원가입</button>
    <p class="mt-5 mb-3 text-muted">&copy; 2017–2022</p>
  <input type="text" value="0" id="idCheckRes">
  <input type="text" value="0" id="pwCheckRes">
  </form>
  
  
  <!-- 로그인 폼 -->
  <form name='signinForm' >
    <img class="mb-4" src="../resources/img/driver.jpg" alt="" width="200" height="200">
    <h1 class="h3 mb-3 fw-normal">Please sign in</h1>
  <div id="msg">${param.msg }</div>
    <div class="form-floating">
      <input type="text" class="form-control" id="id" name="id" value="admin">
      <label for="id">Email address</label>
    </div>
    <div class="form-floating">
      <input type="password" class="form-control" id="pw" name="pw" value="1234">
      <label for="pw">Password</label>
    </div>
    <div class="checkbox mb-3">
      <label>
        <input type="checkbox" value="remember-me"> Remember me
      </label>
    </div>
    <button class="btn btn-lg btn-primary" style="width: 150px; height:40px;" type="submit" id='btnLogin'>로그인</button>



    <a href="https://kauth.kakao.com/oauth/authorize?response_type=code&client_id=12058067f10f2a5ed33132f900363ed0&redirect_uri=http://localhost:8080/kakaologin"><img src="../resources/img/login.png" width=150px height=40px"></a>
    <a href="https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=O3lTbRxuA6EiKIrybIJk&redirect_uri=http://localhost:8080/naverlogin&state=test"><img src="../resources/img/naverlogin.png" width=150px height=40px"></a>
    <%
    String clientId = "9VJWkFye8SCONJDsevSS";//애플리케이션 클라이언트 아이디값";
    String redirectURI = URLEncoder.encode("http://localhost:8080/login/naver_callback", "UTF-8");
    SecureRandom random = new SecureRandom();
    String state = new BigInteger(130, random).toString();
    String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
    apiURL += "&client_id=" + clientId;
    apiURL += "&redirect_uri=" + redirectURI;
    apiURL += "&state=" + state;
    session.setAttribute("state", state);
 %>
  <a href="<%=apiURL%>"><img height="50" src="http://static.nid.naver.com/oauth/small_g_in.PNG"/></a>
    <p class="mt-5 mb-3 text-muted">&copy; 2017–2022</p>
  </form>
  	
  <button id='btnSignupView'>회원가입</button>
  <button id='btnSigninView'>로그인</button>
  
</c:if>
</main>

<c:if test="${userId ne null }">
<c:redirect url="http://localhost:8080/board/list"/>
</c:if>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>    
</body>
