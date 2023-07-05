<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<nav aria-label="...">
  <ul class="pagination justify-content-center">
    <li class="page-item disabled">
      <a class="page-link" href="/board/list?pageNo=${pageDto.prev }" tabindex="-1" aria-disabled="true">Previous</a>
    </li>
   	<c:forEach begin="${pageDto.startNo }" end="${pageDto.endNo }" var="i">
    <li class="page-item"><a class="page-link" href="/board/list?pageNo=${i }">${i }</a></li>
   	</c:forEach>
    <li class="page-item">
      <a class="page-link" href="/board/list?pageNo=${pageDto.next }">Next</a>
    </li>
  </ul>
</nav>
</body>
</html>