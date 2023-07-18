<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://t1.kakaocdn.net/kakao_js_sdk/2.3.0/kakao.min.js" integrity="sha384-70k0rrouSYPWJt7q9rSTKpiTfX6USlMYjZUtr1Du+9o4cGvhPAWxngdtVZDdErlh" crossorigin="anonymous"></script>
  <script>
    // SDK를 초기화 합니다. 사용할 앱의 JavaScript 키를 설정해야 합니다.
    Kakao.init('b4793f7e09cabda709895d2261a8c2af');

    // SDK 초기화 여부를 판단합니다.
    console.log(Kakao.isInitialized());
    
    <script>
    function loginWithKakao() {
      Kakao.Auth.authorize({
        redirectUri: "http://localhost:8080/kakaoLogin"
      });
    }
  </script>
</head>
<body>
 <p id="loginBtn"><a id="kakao-login-btn" href="javascript:loginWithKakao()"><img src="../resources/img/login.png" alt="로그인버튼"/></a></p>
</body>
</html>
