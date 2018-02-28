<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<style>
	img{
		border: 1px solid grey;
		position: fixed;
		top: 20%;
		left: 0%;
		width:350px;
		height:350px:
	}
	.sInfo{
		border: 1px solid grey;
		position: fixed;
		top: 25%;
		left:37%;
	}
	.review{
		border: 1px solid grey;
		position: fixed;
		top: 25%;
		left:75%;
	}
	#map{
		border: 1px solid grey;
		position: fixed;
		top: 150px;
		left:100px;
	}
</style>

<c:set var="sdto" value="${sinfo}"></c:set>
<c:set var="saddr" value="${sinfo.sAddr}"></c:set>

<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=ip9MzYUcGqHV9etI8TeJ&submodules=geocoder"></script>
    <input Type="text" value="${saddr}" id="sAddr">
    <div id="map" style="width:500px;height:300px;"></div>
    <script>
      var map = new naver.maps.Map('map');
      var myaddress = document.getElementById("sAddr").value;// 도로명 주소나 지번 주소만 가능 (건물명 불가!!!!)
      console.log(myaddress);
      naver.maps.Service.geocode({address: myaddress}, function(status, response) {
          if (status !== naver.maps.Service.Status.OK) {
              return alert(myaddress + '의 검색 결과가 없거나 기타 네트워크 에러');
          }
          var result = response.result;
          // 검색 결과 갯수: result.total
          // 첫번째 결과 결과 주소: result.items[0].address
          // 첫번째 검색 결과 좌표: result.items[0].point.y, result.items[0].point.x
          var myaddr = new naver.maps.Point(result.items[0].point.x, result.items[0].point.y);
          map.setCenter(myaddr); // 검색된 좌표로 지도 이동
          // 마커 표시
          var marker = new naver.maps.Marker({
            position: myaddr,
            map: map
          });
          // 마커 클릭 이벤트 처리
          naver.maps.Event.addListener(marker, "click", function(e) {
            if (infowindow.getMap()) {
                infowindow.close();
            } else {
                infowindow.open(map, marker);
            }
          });
          // 마크 클릭시 인포윈도우 오픈
          var infowindow = new naver.maps.InfoWindow({
              content: '<h4> [네이버 개발자센터]</h4><a href="https://developers.naver.com" target="_blank"><img src="https://developers.naver.com/inc/devcenter/images/nd_img.png"></a>'
          });
      });
      </script>








<div class="sImg">
	<img src="upload/${sinfo.sImage1}">
</div>



<div class="sInfo">
	<table>
		<br><br><br>
		<tr>
			<td>상점 상호:</td>
			<td>${sdto.sName}<br></td>
			<td></td> 
		</tr>
		<tr>
			<td>상점 전화:</td>
			<td>${sdto.sPhone}<br></td> 
			<td></td>
		</tr>
		<tr>
			<td>상점 주소:</td>
			<td>${sdto.sAddr}<br></td> 
			<td></td>
		</tr>
		<tr>
			<td colspan="2"><a href="SMapViewServlet" target="_blank">
			<input type="button" value="지도" name="mapview" id="mapview" ></a></td>
			<td></td>
			<td></td>
		</tr>
	</table>
</div>


<div class="review">
	<h4>평가</h4>
	단콤:...<br>
	짠맛:...<br>
	신맛:...<br>
</div>