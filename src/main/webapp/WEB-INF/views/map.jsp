<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<head>
    <meta charset="utf-8">
    <title>여러개 마커 표시하기</title>
    
</head>
<body>


<div id="map" style="width:100%;height:350px;"></div>

	
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b4793f7e09cabda709895d2261a8c2af"></script>
<script>


//현재 위치 가져오기
var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
    mapOption = { 
        center: new kakao.maps.LatLng(33.47371025, 126.645997), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
 



var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다


//Controller에서 넘겨준 list값(longitude, latitude) 반복문 통해서 값을 latlng에 넣어줌
var positions = [
<c:forEach items="${lists }" var="list">
    { 
        latlng: new kakao.maps.LatLng(${list.longitude }, ${list.latitude })
    },
</c:forEach>
];

var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
    
for (var i = 0; i < positions.length; i ++) {
    
    // 마커 이미지의 이미지 크기 입니다
    var imageSize = new kakao.maps.Size(24, 35); 
    
    // 마커 이미지를 생성합니다    
    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
    
    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({
        map: map, // 마커를 표시할 지도
        position: positions[i].latlng, // 마커를 표시할 위치
       // title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
        image : markerImage // 마커 이미지 
    });
}


</script>

<div class="list-group w-auto">
    <a onclick="requestAction('/board/view', ${vo.bno})" href="#" class="list-group-item list-group-item-action d-flex gap-3 py-3" aria-current="true">
      <img src="https://github.com/twbs.png" alt="twbs" width="32" height="32" class="rounded-circle flex-shrink-0">
      <div class="d-flex gap-2 w-100 justify-content-between">
        <div>
          <h6 class="mb-0">제목</h6>
          <p class="mb-0 opacity-75">작성자</p>
        <small class="opacity-50 text-nowrap">조회수</small>
        </div>
        <small class="opacity-50 text-nowrap">등록일</small>
      </div>
    </a>
    <c:forEach items="${lists }" var="vo">
    <a href="#" class="list-group-item list-group-item-action d-flex gap-3 py-3" aria-current="true">
      <img src="https://github.com/twbs.png" alt="twbs" width="32" height="32" class="rounded-circle flex-shrink-0">
      <div class="d-flex gap-2 w-100 justify-content-between">
        <div>
          <h6 class="mb-0">${vo.p_Id }</h6>
          
        <small class="opacity-50 text-nowrap">${vo.openHour }</small>
        </div>
        <small class="opacity-50 text-nowrap">${vo.ParkYN }</small>
      </div>
    </a>
    </c:forEach>

 
  </div>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>    
</html>