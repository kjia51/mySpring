<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script type="text/javascript">
if(msg!=''){
	alert(msg);
	history.go(-1);
}

</script>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
        body {
		  min-height: 75rem;
		  padding-top: 4.5rem;
		}
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
<script type="text/javascript">
alert('${msg }');
</script>
</head>
<body>
<%@include file="../common/header.jsp" %>
<main class="container">

  <div class="bg-light p-5 rounded">
    <h1>게시판 만들기</h1>
    <p class="lead">부트스트랩을 이용한 게시판 만들기</p>
    <a class="btn btn-lg btn-primary" href="../components/navbar/" role="button">글쓰기 &raquo;</a>
  </div>
<table class="table">
	<c:if test="${sessionScope.adminYn eq 'Y'}">
	<tr>
		<td colspan="5" class="right">
		<!-- 어드민 계정인 경우 등록, 삭제 버튼을 출력 -->
		<button onclick="location.href='./write.book'">도서등록</button>
		<button onclick="deleteBook()">도서삭제</button>
		<button onclick="location.href='./userlist.user'">사용자목록</button>
		
		</td>
	</tr>
	</c:if>
  <thead>
    <tr>
      <th scope="col"></th>
      <th scope="col">번호</th>
      <th scope="col">제목</th>
      <th scope="col">저자</th>
      <th scope="col">글쓴이</th>
    </tr>
  </thead>
  	<c:if test="${empty list }" var="res">
		<td colspan="5" class="center">
			등록된 게시물이 없습니다.
		</td>
	</c:if>
  <tbody class="table-group-divider">
	<c:if test="${not res }">
			<c:forEach items="${list }" var="board" step="1">
		    <tr>
		      <th scope="row"><input type="checkbox" name="delNo" value="${book.bno }"></th>
		      <td>${board.bno }</td>
		      <td>${board.title }</td>
		      <td>${board.content }</td>
		      <td>${board.writer }</td>
		    </tr>
    		</c:forEach>
	</c:if>
			<tr>
			<td colspan="5" class="center">
				<!-- 페이지블록 -->
				<%@include file="../common/PageNavi.jsp" %>
			</td>	
		</tr>
  </tbody>
</table>

</main>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>    
</body>
</html>