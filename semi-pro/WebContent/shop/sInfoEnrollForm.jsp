<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<style>
	span.stress{
		color: red;
		font-size: 10px;
	}
	span.title{
		font-size: 20px;
		font-weight: bold;
	}
	th{
		width: 150px;
		padding-top: 5px;
		padding-bottom: 5px;
	}
	td{
		width: 350px;
		padding-top: 5px;
		padding-bottom: 5px;
		padding-right: 10px;
	}
	.sEnroll_tbl2 th{
		width: 100px;
	}
	.sEnroll_tbl2 td{
		width: 670px;
	}
	.sEnroll_title{
		position: absolute;
		top: 0%;
		width: 100%;
		text-align: center;
	}
	.sEnroll_tbl1{
		position: absolute;
		margin-top: 40px;
		margin-left: 20px;
		width:100%;
	}
	.sEnroll_tbl2{
		position: absolute;
		padding-top: 40px;
		margin-left: 35%;
		width:100%;
	}
	#sample6_postcode,#sample6_address{
		margin-top: 2px;
		margin-bottom: 2px;
	}
	.complete{
		position: absolute;
		top: 90%;
		width:100%;
		text-align:center;
	}
	.btn_submit {
		border: 1px solid #99e6ff;
		background-color: #99e6ff;
		margin-top: 20px;
		height:35px;
		width: 300px;
		/*color: white;*/
	}
	
	.btn_cancel{
		border: 1px solid #99e6ff;
		background-color: white;
		margin-top: 10px;
		height:35px;
		width: 300px;
		/*color: white;*/
	}
</style>
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
					<td><input type="text" name="sAddr2" id="sample6_address2" placeholder="상세 주소" size="31"></td>
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



<!-- 
<form action="SImageUploadServlet" method="post" enctype="multipart/form-data">	
	<table>
		<tr>
			<td>메인 이미지: </td>
			<td><input type="file" name="sImage1" id="sImage1"><input type="button" value="업로드"></td>
		</tr>
		
		<tr>
			<td>상세 이미지: </td>
			<td><input type="file" name="sImage2" id="sImage2"><input type="button" value="업로드"></td>
		</tr>
		
		<tr>
			<td colspan="2"><input type="submit" value="등록">
			<a href="index_shopowner.jsp"><input type="button" value="취소"></a></td>
		</tr>
	</table>
</form>
 -->

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


