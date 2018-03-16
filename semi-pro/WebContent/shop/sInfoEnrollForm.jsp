<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script type="text/javascript" src="//code.jquery.com/jquery-3.3.1.js"></script>
<script type="text/javascript">
	var gangnamgu=["선택","강남(2)","강남구청(7)","논현(7)","대청(3)","대치(3)","도곡(3)","매봉(3)","봉은사(9)","삼성(2)","삼성중앙(9)","선릉(2)","선정릉(9,분당)","수서(3)","신논현(9)","신사(3)","압구정(3)","언주(9)","역삼(2)","일원(3)","청담(7)","학동(7)","학여울(3)"];
	var gangdonggu=["선택","강동(5)","강동구청(8)","고덕(5)","굽은다리역(5)","길동(5)","둔촌동(5)","명일(5)","상일동(5)","암사역(8)","천호(5,8)"];
	var gangbukgu=["선택","수유(4)","미아(4)","미아사거리(4)"];
	var gangseogu=["선택","가양(9)","개화(9)","개화산(5)","공항시장(9)","김포공항(5,9)","까치산(5)","등촌(9)","마곡(5)","마곡나루(9)","발산(5)","방화(5)","송정(5)","신방화(9)","양천향교(9)","염창(9)","우장산(5)","증미(9)","화곡(5)"];
	var gwanakgu=["선택","낙성대(2)","봉천(2)","서울대입구(2)","신림(2)"];
	var qwangjingu=["선택","강변(2)","건대입구(2,7)","광나루(5)","구의(2)","군자(5,7)","뚝섬유원지(7)","아차산(5)","어린이대공원(7)", "중곡(7)"];
	var gurogu=["선택","구로디지털단지(2)","남구로(7)","대림(2,7)","도림천(2)","신도림(2)","온수(1,7)"];
	var geumcheongu=["선택","가산디지털단지(7)"];
	var nowongu=["선택","공릉(7)","노원(4,7)","당고개(4)","마들(7)","상계(4)","석계역(1,6)", "수락산(7)", "중계(7)", "태릉입구(6,7)","하계(7)","화랑대(6)"];
	var dobonggu=["선택","도봉산(1,7)","쌍문(4)","창동(4)"];
	var dongdaemoongu=["선택","신설동(1,2)","용두(2)", "장한평역(5)","제기동(1)","청량리(1)"];
	var dongjakgu=["선택","남성(7)","노들(9)","노량진(9)","동작(4,9)","보라매(7)","사당(2,4)","상도(7)","숭실대입구(7)","신대방(2)","신대방삼거리(7)","이수(7)","장승배기(7)","총신대(4,7)","흑석(9)"];
	var mapogu=["선택","공덕(5,6)","광흥창(6)","대흥(6)","디지털미디어시티(6)","마포(5)","마포구청(6)","망원(6)","상수(6)","신촌(2)","아현(2)","애오개(5)","양평(5)","월드컵경기장(6)","이대(2)","합정(2,6)","홍대입구(2)"];
	var seodaemungu=["선택","독립문(3)","무악재(3)","충정로(2,5)","홍제(3)"];
	var seochogu=["선택","고속터미널(3,7,9)","교대(2,3)","구반포(9)","남부터미널(3)","남태령(4)","내방(7)","반포(7)","방배(2)","사평(9)","서초(2)","신반포(9)","양재(3)","잠원(3)"];
	var seongdonggu=["선택","금호(3)","뚝섬(2)","상왕십리(2)","성수(2)","신답(2)","옥수(3)","왕십리(2)","용답(2)","한양대(2)"];
	var seongbukgu=["선택","고려대(6)","길음(4)","답십리(5)", "돌곶이(6)","마장(5)","보문(6)","상월곡(6)","성신여대입구(4)","신금호(5)","안암(6)","왕십리(5)","월곡(6)","한성대입구(4)","행당(5)"];
	var songpagu=["선택","가락시장(3,8)","개롱(5)","거여(5)","경찰병원(3)","마천(5)","문정(8)","몽촌토성(8)","방이(5)","복정(8)","석촌(8)","송파(8)","오금(3)","올림픽공원(5)","잠실(2,8)","잠실나루(2)","잠실새내(2)","장지(8)","종합운동장(2,9)"];
	var yangcheongu=["선택","목동(5)","신목동(9)","신정(5)","신정네거리(2)", "양천구청(2)","오목교(5)"];
	var yeongdeungpogu =["선택","국회의사당(9)","당산(2,9)","문래(2)","샛강(9)","선유도(9)","신길(5)","신풍(7)","여의나루(5)","여의도(5,9)","영등포구청(2,5)","영등포시장(5)"];
	var yongsangu=["선택","녹사평(6)","삼각지(4,6)","서울(4)","숙대입구(4)","신용산(4)","이촌(4)","이태원(6)","한강진(6)","효창공원앞(6)"];
	var eunpyeonggu=["선택","구산(6)","구파발(3)","녹번(3)","독바위(6)","불광(3,6)","새절(6)","역촌(6)","연신내(3,6)","응암(6)","증산(6)"];
	var jongnogu=["선택","경복궁(3)","광화문(5)","동대문(1,4)","동묘앞(1,6)","서대문(5)","안국(3)","종각(1)","종로3가(1,3,5)","종로5가(1)","창신(6)","혜화(4)"];
	var junggu=["선택","동대문역사문화공원(2,4,5)","동대입구(3)","명동(4)","버티고개(6)","서울(1)","시청(1,2)","신당(2,6)","약수(3,6)","을지로3가(2,3)","을지로4가(2,5)","을지로입구(2)","청구(5,6)","충무로(4)","회현(4)"];
	var jungnanggu=["선택","먹골(7)","면목(7)","봉화산(6)","사가정(7)","상봉(7)","용마산(7)","중화(7)"]; 
	var sSubway1,sSubway2;
	
	
	
	$(document).ready(function(){
		$("#sample6_address2").focus(function(){
			$('#sSubway1').empty();
			$('#sSubway2').empty();
			var address = $("#sample6_address").val();
			console.log(address);
			if(address.includes("강남구")){
				sSubway1="강남구";
				sSubway2=gangnamgu;
				var option = $("<option>"+sSubway1+"</option>");
	            $('#sSubway1').append(option);
	            for(var count = 0; count < sSubway2.length; count++){                
	                var option2 = $("<option>"+sSubway2[count]+"</option>");
	                $('#sSubway2').append(option2);
				}
			}else if(address.includes("강동구")){
				sSubway1="강동구";
				sSubway2=gangdonggu;
				var option = $("<option>"+sSubway1+"</option>");
	            $('#sSubway1').append(option);
	            for(var count = 0; count < sSubway2.length; count++){                
	                var option2 = $("<option>"+sSubway2[count]+"</option>");
	                $('#sSubway2').append(option2);
				}
			}else if(address.includes("강북구")){
				sSubway1="강북구";
				sSubway2=gangbukgu;
				var option = $("<option>"+sSubway1+"</option>");
	            $('#sSubway1').append(option);
	            for(var count = 0; count < sSubway2.length; count++){                
	                var option2 = $("<option>"+sSubway2[count]+"</option>");
	                $('#sSubway2').append(option2);
				}
			}else if(address.includes("강서구")){
				sSubway1="강서구";
				sSubway2=gangseogu;
				var option = $("<option>"+sSubway1+"</option>");
	            $('#sSubway1').append(option);
	            for(var count = 0; count < sSubway2.length; count++){                
	                var option2 = $("<option>"+sSubway2[count]+"</option>");
	                $('#sSubway2').append(option2);
				}
			}else if(address.includes("관악구")){
				sSubway1="관악구";
				sSubway2=gwanakgu;
				var option = $("<option>"+sSubway1+"</option>");
	            $('#sSubway1').append(option);
	            for(var count = 0; count < sSubway2.length; count++){                
	                var option2 = $("<option>"+sSubway2[count]+"</option>");
	                $('#sSubway2').append(option2);
				}
			}else if(address.includes("광진구")){
				sSubway1="광진구";
				sSubway2=qwangjingu;
				var option = $("<option>"+sSubway1+"</option>");
	            $('#sSubway1').append(option);
	            for(var count = 0; count < sSubway2.length; count++){                
	                var option2 = $("<option>"+sSubway2[count]+"</option>");
	                $('#sSubway2').append(option2);
				}
			}
			else if(address.includes("구로구")){
				sSubway1="구로구";
				sSubway2=gurogu;
				var option = $("<option>"+sSubway1+"</option>");
	            $('#sSubway1').append(option);
	            for(var count = 0; count < sSubway2.length; count++){                
	                var option2 = $("<option>"+sSubway2[count]+"</option>");
	                $('#sSubway2').append(option2);
				}
			}else if(address.includes("금천구")){
				sSubway1="금천구";
				sSubway2=geumcheongu;
				var option = $("<option>"+sSubway1+"</option>");
	            $('#sSubway1').append(option);
	            for(var count = 0; count < sSubway2.length; count++){                
	                var option2 = $("<option>"+sSubway2[count]+"</option>");
	                $('#sSubway2').append(option2);
				}
			}else if(address.includes("노원구")){
				sSubway1="노원구";
				sSubway2=nowongu;
				var option = $("<option>"+sSubway1+"</option>");
	            $('#sSubway1').append(option);
	            for(var count = 0; count < sSubway2.length; count++){                
	                var option2 = $("<option>"+sSubway2[count]+"</option>");
	                $('#sSubway2').append(option2);
				}
			}else if(address.includes("도봉구")){
				sSubway1="도봉구";
				sSubway2=dobonggu;
				var option = $("<option>"+sSubway1+"</option>");
	            $('#sSubway1').append(option);
	            for(var count = 0; count < sSubway2.length; count++){                
	                var option2 = $("<option>"+sSubway2[count]+"</option>");
	                $('#sSubway2').append(option2);
				}
			}else if(address.includes("동대문구")){
				sSubway1="동대문구";
				sSubway2=dongdaemoongu;
				var option = $("<option>"+sSubway1+"</option>");
	            $('#sSubway1').append(option);
	            for(var count = 0; count < sSubway2.length; count++){                
	                var option2 = $("<option>"+sSubway2[count]+"</option>");
	                $('#sSubway2').append(option2);
				}
			}else if(address.includes("동작구")){
				sSubway1="동작구";
				sSubway2=dongjakgu;
				var option = $("<option>"+sSubway1+"</option>");
	            $('#sSubway1').append(option);
	            for(var count = 0; count < sSubway2.length; count++){                
	                var option2 = $("<option>"+sSubway2[count]+"</option>");
	                $('#sSubway2').append(option2);
				}
			}else if(address.includes("마포구")){
				sSubway1="마포구";
				sSubway2=mapogu;
				var option = $("<option>"+sSubway1+"</option>");
	            $('#sSubway1').append(option);
	            for(var count = 0; count < sSubway2.length; count++){                
	                var option2 = $("<option>"+sSubway2[count]+"</option>");
	                $('#sSubway2').append(option2);
				}
			}else if(address.includes("서대문구")){
				sSubway1="서대문구";
				sSubway2=seodaemungu;
				var option = $("<option>"+sSubway1+"</option>");
	            $('#sSubway1').append(option);
	            for(var count = 0; count < sSubway2.length; count++){                
	                var option2 = $("<option>"+sSubway2[count]+"</option>");
	                $('#sSubway2').append(option2);
				}
			}else if(address.includes("서초구")){
				sSubway1="서초구";
				sSubway2=seochogu;
				var option = $("<option>"+sSubway1+"</option>");
	            $('#sSubway1').append(option);
	            for(var count = 0; count < sSubway2.length; count++){                
	                var option2 = $("<option>"+sSubway2[count]+"</option>");
	                $('#sSubway2').append(option2);
				}
			}else if(address.includes("성동구")){
				sSubway1="성동구";
				sSubway2=seongdonggu;
				var option = $("<option>"+sSubway1+"</option>");
	            $('#sSubway1').append(option);
	            for(var count = 0; count < sSubway2.length; count++){                
	                var option2 = $("<option>"+sSubway2[count]+"</option>");
	                $('#sSubway2').append(option2);
				}
			}else if(address.includes("성북구")){
				sSubway1="성북구";
				sSubway2=seongbukgu;
				var option = $("<option>"+sSubway1+"</option>");
	            $('#sSubway1').append(option);
	            for(var count = 0; count < sSubway2.length; count++){                
	                var option2 = $("<option>"+sSubway2[count]+"</option>");
	                $('#sSubway2').append(option2);
				}
			}else if(address.includes("송파구")){
				sSubway1="송파구";
				sSubway2=songpagu;
				var option = $("<option>"+sSubway1+"</option>");
	            $('#sSubway1').append(option);
	            for(var count = 0; count < sSubway2.length; count++){                
	                var option2 = $("<option>"+sSubway2[count]+"</option>");
	                $('#sSubway2').append(option2);
				}
			}else if(address.includes("양천구")){
				sSubway1="양천구";
				sSubway2=yangcheongu;
				var option = $("<option>"+sSubway1+"</option>");
	            $('#sSubway1').append(option);
	            for(var count = 0; count < sSubway2.length; count++){                
	                var option2 = $("<option>"+sSubway2[count]+"</option>");
	                $('#sSubway2').append(option2);
				}
			}else if(address.includes("영등포구")){
				sSubway1="영등포구";
				sSubway2=yeongdeungpogu;
				var option = $("<option>"+sSubway1+"</option>");
	            $('#sSubway1').append(option);
	            for(var count = 0; count < sSubway2.length; count++){                
	                var option2 = $("<option>"+sSubway2[count]+"</option>");
	                $('#sSubway2').append(option2);
				}
			}else if(address.includes("용산구")){
				sSubway1="용산구";
				sSubway2=yongsangu;
				var option = $("<option>"+sSubway1+"</option>");
	            $('#sSubway1').append(option);
	            for(var count = 0; count < sSubway2.length; count++){                
	                var option2 = $("<option>"+sSubway2[count]+"</option>");
	                $('#sSubway2').append(option2);
				}
			}else if(address.includes("은평구")){
				sSubway1="은평구";
				sSubway2=eunpyeonggu;
				var option = $("<option>"+sSubway1+"</option>");
	            $('#sSubway1').append(option);
	            for(var count = 0; count < sSubway2.length; count++){                
	                var option2 = $("<option>"+sSubway2[count]+"</option>");
	                $('#sSubway2').append(option2);
				}
			}
			else if(address.includes("종로구")){
				sSubway1="종로구";
				sSubway2=jongnogu;
				var option = $("<option>"+sSubway1+"</option>");
	            $('#sSubway1').append(option);
	            for(var count = 0; count < sSubway2.length; count++){                
	                var option2 = $("<option>"+sSubway2[count]+"</option>");
	                $('#sSubway2').append(option2);
				}
			}
			else if(address.includes("중구")){
				sSubway1="중구";
				sSubway2=junggu;
				var option = $("<option>"+sSubway1+"</option>");
	            $('#sSubway1').append(option);
	            for(var count = 0; count < sSubway2.length; count++){                
	                var option2 = $("<option>"+sSubway2[count]+"</option>");
	                $('#sSubway2').append(option2);
				}
			}else if(address.includes("중랑구")){
				sSubway1="중랑구";
				sSubway2=jungnanggu;
				var option = $("<option>"+sSubway1+"</option>");
	            $('#sSubway1').append(option);
	            for(var count = 0; count < sSubway2.length; count++){                
	                var option2 = $("<option>"+sSubway2[count]+"</option>");
	                $('#sSubway2').append(option2);
				}
			}
		});
		
		$("#sSubway2").on("change",function(event){
			console.log($("#sSubway2").val());
		});
	});

</script>


<form action="SInfoEnrollServlet" method="get">
	<div class="wrapper">
		<div class="sEnroll_title">
			<span class="title">상점 기본 정보 등록</span>  <span class="stress"> *상점은 한 곳만 등록 가능합니다.</span>
		</div>
		<c:set var="dto" value="${login}"></c:set>
		<!-- sCode를 위한 사업자번호 뒤 7자리 가져오기 -->
		<c:set var="soLicense1" value="${dto.soLicense}"></c:set>
		<c:set var="soLicense" value="${fn:substring(soLicense1,3,10)}"></c:set>
		<!--  -->
		<input Type="hidden" name="soId" id="soId" value="${dto.soId}">
		<input Type="hidden" name="soLicense" id="soLicense" value="${soLicense}">
		<div class="sEnroll_tbl1">
			<table>
				<tr>
					<th>상점 이름 </th>
					<td><input type="text" name="sName" id="sName" size="31" maxlength="20"> </td>
				</tr>
				<tr>
					<th>상점 전화 </th>
					<td><input type="text" name="sPhone1" id="sPhone1" size="3" maxlength="4"> -
					<input type="text" name="sPhone2" id="sPhone2" size="3" maxlength="4"> -
					<input type="text" name="sPhone3" id="sPhone3" size="3" maxlength="4"></td>
				</tr>
				<tr>
					<th rowspan="3">상점 주소 </th>
					<td><input type="text" name="post" id="sample6_postcode" size="5" placeholder="우편번호">
					<input type="button" onclick="sample6_execDaumPostcode()" value="주소 찾기"><br>
				</tr>
				
				<tr>
					<td><input type="text" name="sAddr1" id="sample6_address" placeholder="주소" size="31"></td>				
				</tr>
				<tr>
					<td><input type="text" name="sAddr2" id="sample6_address2" placeholder="(예) 1층 갬성갱단" size="31"></td>
				</tr>
				<tr>
					<th>지하철역 </th>
					<td><select id="sSubway1" name="sSubway1">
							
						</select>
						
						<select id="sSubway2" name="sSubway2">
						
						</select>
					</td>
				</tr>
				<tr>
					<th>카테고리 </th>
					<td><select id="sCategory" name="sCategory">
							<option value="c" selected="selected">카페</option>
							<option value="d">디저트</option>
							<option value="w">와인</option>
						</select>
					</td>
				</tr>
				<tr>
					<th rowspan="3">영업시간<br>(00:00~24:00) </th><!-- 컬럼명: sBusinesshours  -->
					<td>평일: <input type="text" name="sWeekday" id="sWeekday" size="20" maxlength="20" placeholder="(예)08:00~23:00"></td>	
				</tr>
				<tr>
					<td>주말: <input type="text" name="sWeekend" id="sWeekend" size="20" maxlength="20" placeholder="(예)08:00~23:00"></td>
				</tr>
				<tr>
					<td>휴무: <input type="text" name="sDayOff" id="sDayOff" size="20" maxlength="20" placeholder="(예)둘째주 월요일  "></td>
				</tr>
				
				<tr>
					<th>주차</th>
					<td><input type="radio" name="sParkinglot" id="sParkinglot" value="Y" checked="checked">예
					<input type="radio" name="sParkinglot" id="sParkinglot" value="N">아니오</td>
				</tr>
				<tr>
					<th>테라스</th>
					<td><input type="radio" name="sTerrace" id="sTerrace" value="Y" checked="checked">예
					<input type="radio" name="sTerrace" id="sTerrace" value="N">아니오</td>
				</tr>
			</table>
		</div>
		
		<div class="sEnroll_tbl2">
			<table>
				<tr>
					<th rowspan="13">메뉴판</th>
					<td>메뉴 카테고리1 <input type="text" name="sMenuCategory1" id="sMenuCategory1" size="11" maxlength="10" placeholder="(예) 음료, 와인 "></td>
				</tr>
				
				<tr>			
					<td>메뉴1) 이름: <input type="text" name="sC1Menu1" id="sC1Menu1" size="11" maxlength="10">
							   설명: <input type="text" name="sC1Menu1_info" id="sC1Menu1_info" size="35" maxlength="20" placeholder="20자 내 간단한 설명">
					                     가격: <input type="text" name="sC1Price1" id="sC1Price1" size="4" maxlength="6" placeholder="10,000">원</td>
				</tr>
				<tr>
					<td>메뉴2) 이름: <input type="text" name="sC1Menu2" id="sC1Menu2" size="11" maxlength="10">
							   설명: <input type="text" name="sC1Menu2_info" id="sC1Menu2_info" size="35" maxlength="20" placeholder="20자 내 간단한 설명">
					                     가격: <input type="text" name="sC1Price2" id="sC1Price2" size="4" maxlength="6" placeholder="10,000">원</td>
				</tr>
				<tr>
					<td>메뉴3) 이름: <input type="text" name="sC1Menu3" id="sC1Menu3" size="11" maxlength="10">
							   설명: <input type="text" name="sC1Menu3_info" id="sC1Menu3_info" size="35" maxlength="20" placeholder="20자 내 간단한 설명">
					                     가격: <input type="text" name="sC1Price3" id="sC1Price3" size="4" maxlength="6" placeholder="10,000">원</td>
				</tr>
					<td><br>메뉴 카테고리2 <input type="text" name="sMenuCategory2" id="sMenuCategory2" size="11" maxlength="10" placeholder="(예) 디저트,사이드"></td>
				<tr>
					<td>메뉴1) 이름: <input type="text" name="sC2Menu1" id="sC2Menu1" size="11" maxlength="10">
					                      설명: <input type="text" name="sC2Menu1_info" id="sC2Menu1_info" size="35" maxlength="20" placeholder="20자 내 간단한 설명">
					                     가격: <input type="text" name="sC2Price1" id="sC2Price1" size="4" maxlength="6" placeholder="10,000">원</td>
				</tr>
				
				<tr>
					<td>메뉴2) 이름: <input type="text" name="sC2Menu2" id="sC2Menu2" size="11" maxlength="10">
							   설명: <input type="text" name="sC2Menu2_info" id="sC2Menu2_info" size="35" maxlength="20" placeholder="20자 내 간단한 설명">
					                     가격: <input type="text" name="sC2Price2" id="sC2Price2" size="4" maxlength="6" placeholder="10,000">원</td>
				</tr>
				<tr>
					<td>메뉴3) 이름: <input type="text" name="sC2Menu3" id="sC2Menu3" size="11" maxlength="10">
						             설명: <input type="text" name="sC2Menu3_info" id="sC2Menu3_info" size="35" maxlength="20" placeholder="20자 내 간단한 설명">
					                     가격: <input type="text" name="sC2Price3" id="sC2Price3" size="4" maxlength="6" placeholder="10,000">원</td>
				</tr>
			</table>
		</div>
	</div>
	<div class="complete">
		<input type="submit" name="submit" class="btn_submit" value="등록">
		<a href="sManagement.jsp"><input type="button" name="cancel" class="btn_cancel" value="취소"></a>
	</div>	
</form>


<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;

                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('sample6_address').value = fullAddr;

                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('sample6_address2').focus();
            }
        }).open();
    }
</script>


