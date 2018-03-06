<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!--
<style>
	@import url("http://fonts.googleapis.com/earlyaccess/nanumgothic.css");
	body { font-family:"Nanum Gothic"; }
	
	.jointable {
		position: fixed;
		top:70px;
		padding-top: 50px;
		border:1px solid grey;
		height:700px;
		left:30%
	}
	input{
		height:20px;
	}
	#result1,#result2{
		font-size:10px;
		color: red;
	}
	.submitbtn {
		border: 1px solid lightgrey;
		background-color: lightgrey;
		padding:5px;
		height:20px;
		
	}
	
	.cancelbtn{
		border: 1px solid grey;
		background-color: grey;
		padding:5px;
		color: white;
	}
</style>
  -->
<script>
/*idCheck*/
//요청용
	var xmlRequest;
	function idCheck(id){
		xmlRequest=new XMLHttpRequest();
  		xmlRequest.onreadystatechange=x;	
  		// MemberIdCheckServlet에 요청
  		xmlRequest.open("get","SoIdCheckServlet?oId="+id, true);
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
	}//end response()
/*end of idCheck*/
  
  	function pwCheck1(pw){
		var mesg = null;
		if(pw.length<10){
			 mesg="비밀번호는 8자 이상 10자 이하여야 합니다.";
		}
		document.querySelector("#result2").innerText=mesg;
	}
	
	function pwCheck2(pw){
		var passwd1 = document.querySelector("#passwd").value;
		console.log(passwd1);
		var mesg = "비번일치";
		  if(passwd1 != pw){
			 mesg = "비번 불일치";
		  }
		  document.querySelector("#result2").innerText=mesg;
	}
 	
	
	  
  </script>


<form action="SoAddServlet" method="get" onsubmit="formCheck(event)">
<div class="jointable">
	<table>
		<tr>
			 <th>아이디</th>
			 <td><input type="text" name="oId" id="oId" placeholder="(예시)zzz@naver.com" onkeyup="idCheck(this.value)">
				<span id="result1"></span></td>
		</tr>
		
		<tr>
			<th>비밀번호</th>
			<td><input type="password" name="oPasswd" id="passwd" placeholder="비밀번호" maxlength="10" size="12" onkeyup="pwCheck1(this.value)">
			    <input type="password" id="oPasswd2" placeholder="비밀번호 재입력" maxlength="10" size="12" onkeyup="pwCheck2(this.value)">
				<span id="result2"></span></td>
		</tr>
		
		<tr>
			<th>사업주 이름</th>
			<td><input type="text" name="oName" id="oName" placeholder="이름"></td>
		</tr>
		
		<tr>
			<th>사업주 휴대전화</th>
			<td><input type="text" name="oPhone1" id="oPhone1" size="3" maxlength="3" placeholder="010">-
				<input type="text" name="oPhone2" id="oPhone2"size="4" maxlength="4" placeholder="휴대전화">-
				<input type="text" name="oPhone3" id="oPhone3" size="4" maxlength="4" placeholder="휴대전화">			
			</td>
		</tr>
		
		<tr>
			<th>상점 이름</th>
			<td><input type="text" name="sName" placeholder="상점이름"></td>
		</tr>

		<tr>
			<th>상점 전화번호</th>
			<td><input type="text" name="sPhone1" size="4" maxlength="4" placeholder="상점전화">-
				<input type="text" name="sPhone2" size="4" maxlength="4" placeholder="상점전화">-
				<input type="text" name="sPhone3" size="4" maxlength="4" placeholder="상점전화">			
			</td>
		</tr>
		
		<tr>
			<th>사업자번호</th>
			<td><input type="text" name="sLicense" placeholder="- 하이픈 없이 숫자 10자리만 기재" maxlength="10"></td>
		</tr>
		
		<tr>
			<th>주소</th>
			<td>
			<input type="text" name="post" id="sample6_postcode" size="5" placeholder="우편번호">
			<input type="text" name="sAddr1" id="sample6_address" placeholder="사업자 등록증 상의 주소">
			<input type="button" onclick="sample6_execDaumPostcode()" value="주소 찾기"><br>
			<input type="text" name="sAddr2" id="sample6_address2" placeholder="상세 주소"></td>
		</tr>
	</table>
	<table>
		<tr align="center">
			<th align="center"><input type="submit" value="동의하고 회원가입하기" class="submitbtn">
			<a href="index_shopowner.jsp"><input type="button" value="취소" class="cancelbtn"></a></th>
		</tr>
	</table>
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
