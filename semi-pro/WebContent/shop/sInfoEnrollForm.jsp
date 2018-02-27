<%@page import="java.io.File"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<form action="SInfoEnrollServlet" method="get">
	<c:set var="dto" value="${login}"></c:set>
	<!-- sCode를 위한 사업자번호 뒤 7자리 가져오기 -->
	<c:set var="soLicense1" value="${dto.soLicense}"></c:set>
	<c:set var="soLicense" value="${fn:substring(soLicense1,3,10)}"></c:set>
	<!--  -->
	<input Type="hidden" name="soId" id="soId" value="${dto.soId}">
	<input Type="text" name="soLicense" id="soLicense" value="${soLicense}">

	<table>
		<tr>
			<td>상점 이름: </td>
			<td><input type="text" name="sName" id="sName" size="31" maxlength="20"> </td>
		</tr>
		
			<tr>
			<td>상점 전화: </td>
			<td><input type="text" name="sPhone1" id="sPhone1" size="3" maxlength="4"> -
			<input type="text" name="sPhone2" id="sPhone2" size="3" maxlength="4"> -
			<input type="text" name="sPhone3" id="sPhone3" size="3" maxlength="4"></td>
		</tr>
		<tr>
			<td>상점 주소: </td>
			<td><input type="text" name="post" id="sample6_postcode" size="5" placeholder="우편번호">
			<input type="text" name="sAddr1" id="sample6_address" placeholder="주소">
			<input type="button" onclick="sample6_execDaumPostcode()" value="주소 찾기"><br>
			<input type="text" name="sAddr2" id="sample6_address2" placeholder="상세 주소"></td>
		</tr>
		<tr>
			<td>카테고리: </td>
			<td><select id="sCategory" name="sCategory">
					<option value="c" selected="selected">카페</option>
					<option value="d">디저트</option>
					<option value="w">와인</option>
			</select>
			</td>
		</tr>
		<tr>
			<td colspan="2">
			<input type="submit" name="submit" value="등록">
			<input type="button" name="cancel" value="취소">
			</td>
		</tr>
	</table>
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


