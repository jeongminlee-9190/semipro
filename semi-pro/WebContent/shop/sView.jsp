<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  

<style>
	#map{
		border: 1px solid grey;
		position: absolute;
		top: 700px;
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
		left: 15%;
		color: white;	
	}
	.sbasicInfo_tbl1{
		position: absolute;
		border-top: 1px solid white;
		top: 50%;
		left: 15%;
		color: white;
	}
	.sbasicInfo_tbl1 td{
		width: 150px;
		text-align: center;
		
	}
	
	.sbasicInfo_tbl2{
		position: absolute;
		top: 150px;
		left: 15%;
	}
	.sbasicInfo_tbl2 td{
		padding: 10px 0px 10px 0px;
	}
	
	.sMenu_tbl{
		position: absolute;
		top: 40%;
		left: 5%;
		width: 70%;
		color: white;
		border: 1px solid white;
	}
	.imageView{
		position: absolute;
		top: 10px;
		left: 0%;
	}
	.image1,.image2,.image3,.image4,.image5{
		width:130px;
		height:130px;
	}
	
	.btn_sMenuView{
		background-color: #FA8072;
		border: 1px solid white;
		font-size: 15px;
		font-weight: bold;
		color: white;
		padding: 5px 5px 5px 5px;
	}
	
	.setDiv {
        padding-top: 100px;
        text-align: center;
    }
    
    .mask {
        position:absolute;
        left:0;
        top:0;
        z-index:9999;
        background-color:white;
        display:none;
    }
    .window {
        display: none;
        background-color: #000;
        width: 700px;
        height: 500px;
        z-index:99000;
        text-align: left;
    }

</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<script type="text/javascript">
    function wrapWindowByMask(){
        // 화면의 높이와 너비를 변수로 만듭니다.
        var maskHeight = $(document).height();
        var maskWidth = $(window).width();
 
        // 마스크의 높이와 너비를 화면의 높이와 너비 변수로 설정합니다.
        $('.mask').css({'width':maskWidth,'height':maskHeight});
 
        // fade 애니메이션 : 1초 동안 검게 됐다가 80%의 불투명으로 변합니다.
        $('.mask').fadeIn(1000);
        $('.mask').fadeTo("slow",0.8);
 
        // 레이어 팝업을 가운데로 띄우기 위해 화면의 높이와 너비의 가운데 값과 스크롤 값을 더하여 변수로 만듭니다.
        var left = ( $(window).scrollLeft() + ( $(window).width() - $('.window').width()) / 2 );
        var top = ( $(window).scrollTop() + ( $(window).height() - $('.window').height()) / 2 );
 
        // css 스타일을 변경합니다.
        $('.window').css({'left':left,'top':top, 'position':'absolute'});
 
        // 레이어 팝업을 띄웁니다.
        $('.window').show();
    }
 
    $(document).ready(function(){
        // showMask를 클릭시 작동하며 검은 마스크 배경과 레이어 팝업을 띄웁니다.
        $('.showMask').click(function(e){
            // preventDefault는 href의 링크 기본 행동을 막는 기능입니다.
            e.preventDefault();
            wrapWindowByMask();
        });
 
        // 닫기(close)를 눌렀을 때 작동합니다.
        $('.window .close').click(function (e) {
            e.preventDefault();
            $('.mask, .window').hide();
        });
 
        // 뒤 검은 마스크를 클릭시에도 모두 제거하도록 처리합니다.
        $('.mask').click(function () {
            $(this).hide();
            $('.window').hide();
        });
    });
</script>

<c:set var="sdto" value="${sinfo}"></c:set>
<c:set var="saddr" value="${sinfo.sAddr}"></c:set>
<c:set var="simage" value="${simageinfo}"></c:set>

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
				<td>후기</td>
				<td></td>
				<td></td>
				<td><input type="button" class="btn_sMenuView" id="btn_sMenuView" value="메뉴"></td>
			</tr>
			<tr>
				<td></td>
				<td>${sdto.sLike}</td>
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
			</tr>
			<tr>
				<td>(상점 전화)</td>
				<td>${sdto.sPhone}<br></td> 
			</tr>
			
			<tr>
				<td>(테라스)${sdto.sTerrace}</td>
				<td>(주차)${sdto.sParkinglot}<br></td> 
			</tr>
			<tr>
				<td>(영업시간)</td>
				<td>${fn: split(sdto.sBusinesshours,"/")[0]}&nbsp;${fn: split(sdto.sBusinesshours,"/")[1]}~${fn: split(sdto.sBusinesshours,"/")[2]}<br></td> 
			</tr>
		</table>
		
		
		
		
		<!--  
		
		-->
		<div class="setDiv">
    		<a href="#" class="showMask"><input type="button" class="btn_sMenuView" id="btn_sMenuView" value="메뉴"></a>
 			<div class="mask"></div>
    		<div class="window">
       			<input type="button" href="#" class="close" value="X"/>
       			
       			<div class="imageView">
					<img class="image1" src="upload/${fn: split(simage.fileName,'/')[0]}">
					<img class="image2" src="upload/${fn: split(simage.fileName,'/')[1]}">
					<img class="image3" src="upload/${fn: split(simage.fileName,'/')[2]}">
					<img class="image4" src="upload/${fn: split(simage.fileName,'/')[3]}">
					<img class="image5" src="upload/${fn: split(simage.fileName,'/')[4]}">
				</div>
       			
       			
       			
       			<c:set var="sMenuCategory1" value="${fn: split(sdto.sMenu1,'/')[0]}"></c:set>
				<c:set var="sC1Menu1" value="${fn: split(sdto.sMenu1,'/')[1]}"></c:set>
				<c:set var="sC1Menu2" value="${fn: split(sdto.sMenu1,'/')[2]}"></c:set>
				<c:set var="sC1Menu3" value="${fn: split(sdto.sMenu1,'/')[3]}"></c:set>
				
				<c:set var="sMenuCategory2" value="${fn: split(sdto.sMenu2,'/')[0]}"></c:set>
				<c:set var="sC2Menu1" value="${fn: split(sdto.sMenu2,'/')[1]}"></c:set>
				<c:set var="sC2Menu2" value="${fn: split(sdto.sMenu2,'/')[2]}"></c:set>
				<c:set var="sC2Menu3" value="${fn: split(sdto.sMenu2,'/')[3]}"></c:set>
       			
       			<table class="sMenu_tbl">
       				<colgroup>
       					<col width="25%"></col>
       					<col width="40%"></col>
       					<col width="10%"></col>
       				</colgroup>
			
					<tr><!-- 메뉴1 카테고리 -->
						<td align="left" colspan="3">-${sMenuCategory1}-</td>
					</tr>
				
					<tr>
						<td scope="col">${fn: split(sC1Menu1,':')[0]}</td>
						<td scope="col">${fn: split(sC1Menu1,':')[1]}</td>
						<td scope="col">${fn: split(sC1Menu1,':')[2]}원</td>
					</tr>
				
					<tr>
						<td scope="col">${fn: split(sC1Menu2,':')[0]}</td>
						<td scope="col">${fn: split(sC1Menu2,':')[1]}</td>
						<td scope="col">${fn: split(sC1Menu2,':')[2]}원</td>
					</tr>
					<tr>
						<td scope="col">${fn: split(sC1Menu3,':')[0]}</td>
						<td scope="col">${fn: split(sC1Menu3,':')[1]}</td>
						<td scope="col">${fn: split(sC1Menu3,':')[2]}원</td>
					</tr>
				
					<tr><!-- 메뉴2카테고리 -->
						<td align="left" colspan="3"><br>-${sMenuCategory2}-</td>
					</tr>
				
					<tr>
						<td scope="col">${fn: split(sC2Menu1,':')[0]}</td>
						<td scope="col">${fn: split(sC2Menu1,':')[1]}</td>
						<td scope="col">${fn: split(sC2Menu1,':')[2]}원</td>
					</tr>
				
					<tr>
						<td scope="col">${fn: split(sC2Menu2,':')[0]}</td>
						<td scope="col">${fn: split(sC2Menu2,':')[1]}</td>
						<td scope="col">${fn: split(sC2Menu2,':')[2]}원</td>
					</tr>
					<tr>
						<td scope="col">${fn: split(sC2Menu3,':')[0]}</td>
						<td scope="col">${fn: split(sC2Menu3,':')[1]}</td>
						<td scope="col">${fn: split(sC2Menu3,':')[2]}원</td>
					</tr>
				</table>
       			
    		</div>
		</div>



</div> <!--end of wrapper -->






