<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script>
var megaregion = document.getElementById('megaregion').value;
</script>
<form>
<select class="form-select form-select-lg mb-3" id="megaregion" name="megaregion" aria-label=".form-select-lg example">
  <option value='' selected>시</option>
  <option value="gangwon">강원</option>
  <option value="gyeonggi">경기</option>
  <option value="gyeongsang">경상</option>
  <option value="busan">부산</option>
  <option value="incheon">인천</option>
  <option value="jeolla">전라</option>
  <option value="chungcheong">충청</option>
  <option value="jeju">제주</option>
</select>

<!-- 강원 -->
<select class="form-select form-select-lg mb-3" id="gan" name="gan" aria-label=".form-select-lg example">
  <option value="" selected>강원 전체</option>
  <option value="gan1">춘천·인제·철원</option>
  <option value="gan2">평창·정선·영월</option>
  <option value="gan3">속초·양양·고성</option>
  <option value="gan4">강릉</option>
  <option value="gan5">동해·삼척·태백</option>
  <option value="gan6">홍천·횡성·원주</option>
</select>

<!-- 경기 -->
<select class="form-select form-select-lg mb-3" id="gyeong" name="gyeong" aria-label=".form-select-lg example">
  <option value="" selected>경기 전체</option>
  <option value="gyeong1">가평·청평·양평</option>
  <option value="gyeong2">수원·화성</option>
  <option value="gyeong3">고양·파주·김포</option>
  <option value="gyeong4">의정부·포천·동두천</option>
  <option value="gyeong5">용인·동탄</option>
  <option value="gyeong6">오산·평택</option>
  <option value="gyeong7">남양주·구리·성남·분당</option>
  <option value="gyeong8">이천·광주·여주·하남</option>
  <option value="gyeong9">부천·광명·시흥·안산</option>
  <option value="gyeong10">안양·의왕·군포</option>
</select>

<!-- 부산 -->
<select class="form-select form-select-lg mb-3" id="busan" name="busan" aria-label=".form-select-lg example">
  <option value="" selected>부산 전체</option>
  <option value="busan1">해운대·마린시티</option>
  <option value="busan2">벡스코·센텀시티</option>
  <option value="busan3">송정·기장·정관</option>
  <option value="busan4">광안리·경성대</option>
  <option value="busan5">부산역</option>
  <option value="busan6">자갈치·남포동·영도</option>
  <option value="busan7">송도·다대포</option>
  <option value="busan8">서면·연산·범일</option>
  <option value="busan9">동래·온천·금정구</option>
  <option value="busan10">사상·강서·김해공항</option>
</select>

<!-- 인천 -->
<select class="form-select form-select-lg mb-3" id="incheon" name="incheon" aria-label=".form-select-lg example">
  <option value="" selected>인천 전체</option>
  <option value="incheon1">인천국제공항·강화·을왕리</option>
  <option value="incheon2">송도·소래포구</option>
  <option value="incheon3">영종도·월미도</option>
  <option value="incheon4">주안·간석·인천시청</option>
  <option value="incheon5">청라·계양·부평</option>
</select>

<!-- 경상  -->
<select class="form-select form-select-lg mb-3" id="gyeongsang" name="gyeongsang" aria-label=".form-select-lg example">
  <option value="" selected>경상 전체</option>
  <option value="gyeongsang1">경주</option>
  <option value="gyeongsang2">거제·통영</option>
  <option value="gyeongsang3">창원·마산·진해·김해·부곡</option>
  <option value="gyeongsang4">대구·구미·안동·문경</option>
  <option value="gyeongsang5">울산·양산</option>
  <option value="gyeongsang6">포항·영덕·울진·청송</option>
  <option value="gyeongsang7">남해·사천·하동·진주</option>
</select>
</form>

</body>
</html>