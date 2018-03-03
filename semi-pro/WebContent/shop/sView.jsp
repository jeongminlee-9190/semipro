<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<style>

	#map{
		border: 1px solid grey;
		position: absolute;
		top: 500px;
		left: 20%;
	}
	.sbasicInfo{
		position: absolute;
		top: 0px;
		padding: 10px 0px 10px 0px;
		left: 0px;
		height: 100px;
		background-color: #FA8072;
		width: 100%;
	}
	.sName{
		position: absolute;
		font-size: 30px;
		font-weight: bold;
		left: 20%;
		color: white;	
	}
	.sbasicInfo_tbl1{
		position: absolute;
		border-top: 1px solid white;
		top: 50%;
		left: 20%;
		color: white;
	}
	.sbasicInfo_tbl1 td{
		width: 150px;
		text-align: center;
		
	}
	
	.sbasicInfo_tbl2{
		position: absolute;
		top: 20%;
		left: 20%;
	}
	.sbasicInfo_tbl2 td{
		padding: 10px 0px 10px 0px;
	}
</style>


<c:set var="sdto" value="${sinfo}"></c:set>
<c:set var="saddr" value="${sinfo.sAddr}"></c:set>

<div class="wrapper">
	<!-- 네이버 지도 api -->
	<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=ip9MzYUcGqHV9etI8TeJ&submodules=geocoder"></script>
   	 <input Type="hidden" value="${saddr}" id="sAddr">
   	 <div id="map" style="width:900px;height:300px;"></div>
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

	<div class="sbasicInfo">
		<span class="sName">${sdto.sName}</span>
		<table class="sbasicInfo_tbl1">
			<tr>
				<td>${sdto.sCategory}</td>
				<td>좋아요</td>
				<td>싫어요</td>
				<td>후기</td>
				<td></td>
				<td></td>
				<td>♥</td>
			</tr>
			<tr>
				<td></td>
				<td>${sdto.sLike}</td>
				<td>${sdto.sHate}</td>
				<td>0</td>
				<td></td>
				<td></td>
				<td></td>	
			</tr>
		</table>
	</div>
		
		<table class="sbasicInfo_tbl2">
			<tr>
				<td>(상점 주소)</td>
				<td>${sdto.sAddr}<br></td> 
				<td></td>
			</tr>
			<tr>
				<td>(상점 전화)</td>
				<td>${sdto.sPhone}<br></td> 
				<td></td>
			</tr>
		</table>
		
	





<!-- 
<div class="sImg">
	<img src="upload/${sinfo.sImage1}">
</div>
 -->



</div>