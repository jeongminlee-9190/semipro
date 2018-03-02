<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<style>
	@import url("http://fonts.googleapis.com/earlyaccess/nanumgothic.css");
	body { font-family:"Nanum Gothic"; }
	.welcome{
		margin-top: 50px;
		font-size: 20px;
		text-align: center;
		color: grey;
	}
	
	/* 회원정보 입력 테이블*/
	.jointable {
		position: fixed;
		top:70px;
		margin-top:50px;
		height:700px;
		width: 500px;
		left:10%;
	}
	th{
		width: 150px;
	}
	input{
		height:30px;
		margin-top: 5px;
	}
	#result1,#result2{
		font-size:10px;
		color: red;
	}
	.btn_addr{
		border: 1px solid #99e6ff;
		background-color: white;
	
	}
	
	/* 회원가입 완료, 취소 테이블  */
	.joincomplete{
		margin-left: auto;
        margin-right: auto;
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

	/* 약관  */
	.term{
		position: fixed;
		margin-top:20px;
		left:50%;
	}
	.term_headline{
		
	}
	.term_stress{
		color:red;	
	}
	.bx_term_agree {
		position: fixed;
		border:1px solid #ccc;
		height:157px;
		left:50%;
		overflow:hidden;
		overflow-y:scroll;
		margin-top:20px;
		color:#666;
	}
	
</style>

<script>
/*idCheck*/
//요청용
	var xmlRequest;
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
	}//end response()
/*end of idCheck*/
  	function pwCheck1(pw){
		var mesg = null;
		if(pw.length<8 || pw.length>10){
			 mesg="비밀번호는 8자 이상 10자 이하여야 합니다.";
		}
		document.querySelector("#result2").innerText=mesg;
	}
	
	function pwCheck2(pw){
		var passwd1 = document.querySelector("#passwd").value;
		console.log(passwd1);
		var mesg = "비밀번호 일치";
		  if(passwd1 != pw){
			 mesg = "비밀번호 불일치";
		  }
		  document.querySelector("#result2").innerText=mesg;
	}
/* 유효성 체크*/
	function formCheck(e){
		var soId = document.querySelector("#soId").value;
		if(soId.length==0){
			alert("아이디를 입력하세요");
			document.querySelector("#soId").focus();
			e.preventDefault();
		}
		if(soId.includes("@")==false||soId.includes(".")==false){
			alert("아이디가 이메일 형식이 아닙니다. 다시 입력해주세요.");
			document.querySelector("#soId").focus();
			e.preventDefault();
		}
		/* 비밀번호 체크  */
		var passwd = document.querySelector("#passwd").value;
		if(passwd.length==0){
			alert("비밀번호를 입력하세요");
			document.querySelector("#passwd").focus();
			e.preventDefault();
		}
		var passwd2 = document.querySelector("#passwd2").value;
		if(passwd2.length==0){
			alert("비밀번호를 입력하세요");
			document.querySelector("#passwd2").focus();
			e.preventDefault();
		}
		if(passwd!=passwd2){
			alert("비밀번호가 일치하지 않습니다. 다시 입력해주세요.");
			document.querySelector("#passwd2").focus();
			e.preventDefault();
		}
		if(passwd.length<8 || passwd.length>10){
			alert("비밀번호는 8자 이상 10자 이하여야 합니다.");
			document.querySelector("#passwd2").focus();
			e.preventDefault();
		}
		
		/* 이름 체크 */
		var soName = document.querySelector("#soName").value;
		if(soName.length==0){
			alert("이름을 입력하세요");
			document.querySelector("#soName").focus();
			e.preventDefault();
		}
		var soPhone1 = document.querySelector("#soPhone1").value;
		if(soPhone1.length==0){
			alert("전화번호를 입력하세요");
			document.querySelector("#soPhone1").focus();
			e.preventDefault();
		}
		var soPhone2 = document.querySelector("#soPhone2").value;
		if(soPhone2.length==0){
			alert("전화번호를 입력하세요");
			document.querySelector("#soPhone2").focus();
			e.preventDefault();
		}
		var soPhone3 = document.querySelector("#soPhone3").value;
		if(soPhone3.length==0){
			alert("전화번호를 입력하세요");
			document.querySelector("#soPhone3").focus();
			e.preventDefault();
		}
		var soLicense = document.querySelector("#soLicense").value;
		if(soLicense.length==0){
			alert("사업자번호를 입력하세요");
			document.querySelector("#soLicense").focus();
			e.preventDefault();
		}
		var sample6_address = document.querySelector("#sample6_address").value;
		if(sample6_address.length==0){
			alert("주소를 입력하세요");
			document.querySelector("#sample6_address").focus();
			e.preventDefault();
		}
		var sample6_address = document.querySelector("#sample6_address2").value;
		if(sample6_address.length==0){
			alert("주소를 입력하세요");
			document.querySelector("#sample6_address2").focus();
			e.preventDefault();
		}
	}
	  
  </script>
<div class="welcome">
	<span>갬성갱단에서 상점을 등록하고 홍보할 수 있어요!</span>
</div>

<form action="SoAddServlet" method="get" onsubmit="formCheck(event)">
<div class="jointable">
	<h2 style="text-align:center">회원 정보 입력</h2>
	<table>
		<tr>
			 <th>아이디</th>
			 <td><input type="text" name="soId" id="soId" placeholder="(예)zzz@naver.com" onkeyup="idCheck(this.value)" maxlength="30"size="32px">
				<span id="result1"></span></td>
		</tr>
		
		<tr>
			<th>비밀번호</th>
			<td><input type="password" name="soPasswd" id="passwd" placeholder="비밀번호" maxlength="10" size="13" onkeyup="pwCheck1(this.value)">
			    <input type="password" id="passwd2" placeholder="비밀번호 재입력" maxlength="10" size="13" onkeyup="pwCheck2(this.value)">
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
			<td>
			<input type="text" name="post" id="sample6_postcode" size="5" placeholder="우편번호"><br>
			<input type="text" name="soAddr1" id="sample6_address" placeholder="사업자 등록증 상의 주소" size="40px">
			<input type="button" class="btn_addr" onclick="sample6_execDaumPostcode()" value="주소 찾기"><br>
			<input type="text" name="soAddr2" id="sample6_address2" placeholder="상세 주소" size="52px"></td>
		</tr>
	</table>
	<table class="joincomplete">
		<tr>
			<th colspan="2"><input type="submit" value="회원가입하기" class="btn_submit">
			<a href="index_shopowner.jsp"><input type="button" value="취소" class="btn_cancel"></a></th>
		</tr>
	</table>
</div>


<div class="term">
	<span class="term_headline">이용약관<em class="term_stress">(필수)</em></span>
</div>
<div class="bx_term_agree">
	<span class="term_headline">이용약관<em class="term_tress">(필수)</em></span>
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
