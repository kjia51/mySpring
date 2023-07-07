<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function go(page){
		searchForm.pageNo.value=page;
		searchForm.submit();
	}
</script>
</head>
<body>

<nav aria-label="Page navigation example">
  <ul class="pagination justify-content-center">
    <li class="page-item ${pageDto.prev?'':'disabled' }">
      <a class="page-link" onclick="go(1)">first</a>
    </li>
    <li class="page-item ${pageDto.prev?'':'disabled' }">
      <a class="page-link" onclick="go('${pageDto.startNo-1 }')">Previous</a>
    </li>

    <c:forEach begin="${pageDto.startNo }" end="${pageDto.endNo }" var="i">
    <li class="page-item"><a class="page-link ${pageDto.cri.pageNo==i ? 'active' : ''}" onclick="go('${i }')">${i }</a></li>
    </c:forEach>
 
    <li class="page-item ${pageDto.next?'':'disabled' }">
      <a class="page-link" onclick="go('${pageDto.endNo+1 }')">Next</a>
    </li>
    <li class="page-item ${pageDto.next?'':'disabled' }">
      <a class="page-link" onclick="go('${pageDto.realEnd }')">End</a>
    </li>
  </ul>
</nav>
</body>
</html>