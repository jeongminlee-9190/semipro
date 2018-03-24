<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script type="text/javascript" src="//code.jquery.com/jquery-3.3.1.js"></script>

<script>
/*idCheck*/
//요청용
	/* var xmlRequest;
	function idCheck(id){
		xmlRequest=new XMLHttpRequest();
  		xmlRequest.onreadystatechange=x;	
  		// MemberIdCheckServlet에 요청
  		xmlRequest.open("get","SoIdCheckServlet?soId="+id, true);
  		xmlRequest.send(null); // null은 get일때
  	
  		console.log(id.length);
		if(id.length<5 || id.length>10){
			document.querySelector("#result1").innerText="아이디는 4자 이상 10자 이하여야 합니다.";
		}else{
			document.querySelector("#result1").innerText="";
		}
 	 }//end req
	// 응답용
	function x(){
  		if(xmlRequest.readyState==4 && xmlRequest.status == 200){
  			var time = xmlRequest.responseText;
  			document.querySelector("#result1").innerText=time;
  		} //end if
	}//end response() */
/*end of idCheck*/
 	$(document).ready(function(){
 		$("#passwd").keyup(function(){
 			var re_pw = /^[a-z0-9]{8,10}$/; // 비밀번호 검사식
 			var mesg = "비밀번호 사용 가능";
 			if(re_pw.test($("#passwd").val())!=true){
 				mesg ="비밀번호는 8자 이상 10자 이하여야 하며, 특수문자는 사용 불가합니다.";
 			}
 			$("#result2").text(mesg); 
 		});
 		$("#passwd2").keyup(function(){
 			var mesg = "비밀번호 일치";
 			if($("#passwd").val()!=$("#passwd2").val()){
 				mesg="비밀번호 불일치";
 			}
 			$("#result2").text(mesg);
 		});
 		
 		$("#SoAddForm").submit(function(e){
 			var re_phone1=/^[0-9]{3,4}$/;
 			var re_phone2=/^[0-9]{4,4}$/;
 			var re_phone3=/^[0-9]{4,4}$/;
 			var re_license=/^[0-9]{10,10}$/;
 			var re_email=/^([\w\.-]+)@([a-z\d\.-]+)\.([a-z\.]{2,6})$/;
 			var re_pw = /^[a-z0-9]{8,10}$/; // 비밀번호 검사식
 			var mesg=null;
 			if(re_email.test($("#soId").val()) != true){
 				alert("아이디는 이메일 형식으로 입력해주세요.");
 				$("#soId").focus;
 				e.preventDefault();
 			}
 			
 			/* 비밀번호 체크  */
 			if(re_pw.test($("#passwd").val()) != true){
 				alert("유효한 비밀번호를 입력해주세요.");
 				$("#passwd").focus;
 				e.preventDefault();
 			}

 			if($("#passwd").val()!=$("#passwd2").val()){
 				alert("비밀번호가 일치하지 않습니다. 다시 입력해주세요.");
 				$("#passwd2").focus;
 				e.preventDefault();
 			}
 			
 
 			/* 이름 체크 */
 			if($("#soName").val().length==0){
 				alert("이름을 입력하세요.");
 				$("#soName").focus;
 				e.preventDefault();
 			}
 			
 			
 			/* 전화번호 체크 */
 			if(re_phone1.test($("#soPhone1").val())!= true){
				alert('유효한 전화번호를 입력하세요');
				$("#soPhone1").focus();
				e.preventDefault();
			}
			if(re_phone2.test($("#soPhone2").val())!= true){
				alert('유효한 전화번호를 입력하세요');
				$("#soPhone2").focus();
				e.preventDefault();
			}
			if(re_phone3.test($("#soPhone3").val())!= true){
				alert('유효한 전화번호를 입력하세요');
				$("#soPhone3").focus();
				e.preventDefault();
			}	
			
			if(re_license.test($("#soLicense").val())!= true){
				alert('유효한 사업자 번호를 입력하세요. 10자리&하이픈제거');
				$("#soLicense").focus();
				e.preventDefault();
			}
			
			if($("#sample6_address").val().length==0){
				alert('기본 주소를 입력하세요');
				$("#sample6_address").focus();
				e.preventDefault();
			}
			
			if($("#sample6_address2").val().length==0){
				alert('상세 주소를 입력하세요');
				$("#sample6_address2").focus();
				e.preventDefault();
			}
 		});
 	});
  </script>
  
<div class="joinWrapper">
	<form action="SoJoin" method="POST" id="SoAddForm">
		<div class="join_tbl">
		<!--  <span class="welcome">갬성갱단에서 상점을 등록하고 홍보할 수 있어요!</span>-->
			<h2 style="text-align:center">회원 정보 입력</h2>
			<table>
				<tr>
					 <th>아이디</th>
					 <td><input type="text" name="soId" id="soId" placeholder="(예)zzz@naver.com" maxlength="30"size="32px">
					 <span id="result1"></span></td>
				</tr>
			
				<tr>
					<th>비밀번호</th>
					<td><input type="password" name="soPasswd" id="passwd" placeholder="영어+숫자  8~10자리" maxlength="10" size="13">
				   	 <input type="password" id="passwd2" placeholder="비밀번호 재입력" maxlength="10" size="13"><br>
						<span id="result2"></span></td>
				</tr>
		
				<tr>
					<th>이름</th>
					<td><input type="text" name="soName" id="soName" placeholder="(예)홍길동" size="20" maxlength="20"></td>
				</tr>
		
				<tr>
					<th>휴대전화</th>
					<td><input type="text" name="soPhone1" id="soPhone1" size="3" maxlength="3" placeholder="010">-
						<input type="text" name="soPhone2" id="soPhone2" size="4" maxlength="4" placeholder="휴대전화">-
						<input type="text" name="soPhone3" id="soPhone3" size="4" maxlength="4" placeholder="휴대전화">			
					</td>
				</tr>	
					
				<tr>
					<th>사업자번호</th>
					<td><input type="text" name="soLicense" id="soLicense" placeholder="- 하이픈 없이 숫자 10자리만 기재" maxlength="10" size="30"></td>
				</tr>
			
				<tr>
					<th>주소</th>
					<td><input type="text" name="soPost" id="sample6_postcode" size="5" placeholder="우편번호">
					<input type="button" class="btn_addr" onclick="sample6_execDaumPostcode()" value="주소 찾기"><br>
					<input type="text" name="soAddr1" id="sample6_address" placeholder="사업자 등록증 상의 주소" size="40px"><br>
					
					<input type="text" name="soAddr2" id="sample6_address2" placeholder="상세 주소" size="40px"></td>
				</tr>
			</table>
		
			<table class="joincomplete">
				<tr>
					<th colspan="2"><input type="submit" value="모두 동의하고 회원가입하기" class="btn_submit">
					<a href="index_shopowner"><input type="button" value="취소" class="btn_cancel"></a></th>
				</tr>
			</table>
		</div>

	<!-- 이용약관 -->
		<div class="term_1">
			<span class="term_headline">이용약관<em class="term_stress">(필수)</em></span>
		</div>
		<div class="bx_term_agree_1">
			<h4>제 1조 (목적)</h4>
			<span class="term_text">이 약관은 ㈜갬성갱단 (이하 "회사"라 합니다)가 운영하는 인터넷 사이트 갬성갱단에서 상점이 서비스를 이용하기 위해, 
			상점 관리 사이트 (이하 "상점 사이트"라 합니다)를 이용함에 있어 "회사"와 “상점”간의 권리·의무 및 책임사항을 규정함을 목적으로 합니다.</span>
			<h4>제 2조 (약관의 명시와 개정)</h4>
			<dl>
				<dt>1.</dt>
				<dd>"회사"는 이 약관의 내용을 "상점"이 쉽게 알 수 있도록 "상점 사이트"의 전면에 게시합니다.</dd>
				<dt>2.</dt>
				<dd>"회사"가 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행약관과 함께 "회사"의 초기화면에 그 적용일자 30일 이전부터 적용일자 전일까지 공지합니다.</dd>
			</dl>
		</div>

	<!-- 고객 개인정보 관리 약정서 -->
		<div class="term_2">
			<span class="term_headline">고객 개인정보 관리 약정서<em class="term_stress">(필수)</em></span>
		</div>
		<div class="bx_term_agree_2">
			<h4>제 1조 (목적)</h4>
			<span class="term_text">“상점”은 ‘상점 사이트’ 이용에 따라 취득한 ‘갬성갱단’ ‘고객’의 개인정보 취급에 있어 지켜야 할 의무 사항을 다음과 같이 정하기로 합의 합니다.</span>
			<h4>1. 기술적∙ 관리적 보호 조치</h4>
			<span class="term_text">“상점”은 ‘갬성갱단’서비스 이용을 통해 취득한 ‘고객’의 개인정보를 취급함에 있어서 개인정보가 
			분실ㆍ도난ㆍ누출ㆍ변조 또는 훼손되지 않고 안전성을 확보하기 위하여 아래 각호의 기술적∙ 관리적 보호 대책을 강구 합니다.</span>
		</div>
		
	<!-- 개인정보 수집 및 이용에 대한 안내 -->
		<div class="term_3">
			<span class="term_headline">개인정보 수집 및 이용에 대한 안내<em class="term_stress">(필수)</em></span>
		</div>
		<div class="bx_term_agree_3">
			<h4>1. 개인정보의 수집 항목 및 수집 방법</h4>
				<dl>
					<dt>(1)</dt>
					<dd>회사는 회원가입 및 각종 서비스의 제공을 위해 아래와 같이 개인정보를 수집∙이용합니다.</dd>
					<dd class="full_width">
					<table class="agree_tbl" cellspacing="0" cellpadding="0" summary="개인정보 수집 및 이용에 관한 안내">
						<colgroup>
							<col width="15%">
							<col width="15%">
							<col width="70%">
						</colgroup>
						<thead>
							<tr>
								<th scope="col"><strong>서비스</strong></th>
								<th scope="col" colspan="2"><strong>수집항목</strong></th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td rowspan="2">상점 관리</td>
								<td>필수</td>
								<td>아이디(이메일), 비밀번호, 대표자명, 휴대전화 번호, 사업자등록번호, 사업장주소</td>
							</tr>
						</tbody>
					</table>
				</dd>
			</dl>
		</div>
	</form>
</div>






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
