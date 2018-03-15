<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<script>
/*idCheck*/
//요청용
	var xmlRequest;
	function idCheck(id){
		xmlRequest=new XMLHttpRequest();
  		xmlRequest.onreadystatechange=x;	
  		// MemberIdCheckServlet에 요청
  		xmlRequest.open("get","MIdCheckServlet?mId="+id, true);
  		xmlRequest.send(null); // null은 get일때
 	 }
 	function mnameCheck(mname){
		xmlRequest=new XMLHttpRequest();
  		xmlRequest.onreadystatechange=y;	
  		// MemberIdCheckServlet에 요청
  		xmlRequest.open("get","MNameCheckServlet?mName="+mname, true);
  		xmlRequest.send(null); // null은 get일때
 	 }//end of req
	// 응답용
	function x(){
  		if(xmlRequest.readyState==4 && xmlRequest.status == 200){
  			var time = xmlRequest.responseText;
  			document.querySelector("#result1").innerText=time;
  		} //end of if
	}
	function y(){
  		if(xmlRequest.readyState==4 && xmlRequest.status == 200){
  			var time = xmlRequest.responseText;
  			document.querySelector("#result3").innerText=time;
  		} //end of if
	}//end of response()
	
/*end of idCheck*/
  	function pwCheck1(pw){
		var mesg = null;
		if(pw.length<8 || pw.length>10){
			 mesg="비밀번호는 8자 이상 10자 이하여야 합니다.";
		}
		document.querySelector("#result2").innerText=mesg;
	}
	
	function pwCheck2(pw){
		var passwd1 = document.querySelector("#mPasswd").value;
		console.log(passwd1);
		var mesg = "비밀번호 일치";
		  if(passwd1 != pw){
			 mesg = "비밀번호 불일치";
		  }
		  document.querySelector("#result2").innerText=mesg;
	}
/* 유효성 체크*/
	function formCheck(e){
		var mId = document.querySelector("#mId").value;
		if(mId.length==0){
			alert("아이디를 입력하세요");
			document.querySelector("#mId").focus();
			e.preventDefault();
		}
		if(mId.includes("@")==false||mId.includes(".")==false){
			alert("아이디가 이메일 형식이 아닙니다. 다시 입력해주세요.");
			document.querySelector("#mId").focus();
			e.preventDefault();
		}
		/* 비밀번호 체크  */
		var passwd = document.querySelector("#mPasswd").value;
		if(passwd.length==0){
			alert("비밀번호를 입력하세요");
			document.querySelector("#mPasswd").focus();
			e.preventDefault();
		}
		var passwd2 = document.querySelector("#mPasswd2").value;
		if(passwd2.length==0){
			alert("비밀번호를 입력하세요");
			document.querySelector("#mPasswd2").focus();
			e.preventDefault();
		}
		if(passwd!=passwd2){
			alert("비밀번호가 일치하지 않습니다. 다시 입력해주세요.");
			document.querySelector("#mPasswd2").focus();
			e.preventDefault();
		}
		if(passwd.length<8 || passwd.length>10){
			alert("비밀번호는 8자 이상 10자 이하여야 합니다.");
			document.querySelector("#mPasswd").focus();
			e.preventDefault();
		}
		
		/* 닉네임 체크 */
		var mName = document.querySelector("#mName").value;
		if(mName.length==0){
			alert("닉네임을 입력하세요");
			document.querySelector("#mName").focus();
			e.preventDefault();
		}
		var mPhone1 = document.querySelector("#mPhone1").value;
		if(mPhone1.length==0){
			alert("전화번호를 입력하세요");
			document.querySelector("#mPhone1").focus();
			e.preventDefault();
		}
		var mPhone2 = document.querySelector("#mPhone2").value;
		if(mPhone2.length==0){
			alert("전화번호를 입력하세요");
			document.querySelector("#mPhone2").focus();
			e.preventDefault();
		}
		var mPhone3 = document.querySelector("#mPhone3").value;
		if(mPhone3.length==0){
			alert("전화번호를 입력하세요");
			document.querySelector("#mPhone3").focus();
			e.preventDefault();
		}
	}
	  
  </script>
<div class="joinWrapper">
	<form action="MJoinServlet" method="get" onsubmit="formCheck(event)">
		<div class="join_tbl">
			<h2 style="text-align:center">회원 정보 입력</h2>
			<table>
				<tr>
				 	<th>아이디</th>
				 	<td><input type="text" name="mId" id="mId" placeholder="(예)zzz@naver.com" onkeyup="idCheck(this.value)" maxlength="30" size="32px">
				 	<span id="result1"></span></td>
				</tr>
		
				<tr>
					<th>비밀번호</th>
					<td><input type="password" name="mPasswd" id="mPasswd" placeholder="비밀번호" maxlength="10" size="13" onkeyup="pwCheck1(this.value)">
			   	 	<input type="password" id="mPasswd2" placeholder="비밀번호 재입력" maxlength="10" size="13" onkeyup="pwCheck2(this.value)">
					<span id="result2"></span></td>
				</tr>
		
				<tr>
					<th>닉네임</th>
					<td><input type="text" name="mName" id="mName" placeholder="(예)홍길동" size="20" onkeyup="mnameCheck(this.value)" maxlength="10">
					<span id="result3"></span></td>
				</tr>
		
				<tr>
					<th>휴대전화</th>
					<td><input type="text" name="mPhone1" id="mPhone1" size="3" maxlength="3" placeholder="010">-
						<input type="text" name="mPhone2" id="mPhone2" size="4" maxlength="4" placeholder="휴대전화">-
						<input type="text" name="mPhone3" id="mPhone3" size="4" maxlength="4" placeholder="휴대전화">			
					</td>
				</tr>
			
				<tr>
					<th>출생년도</th>
					<td>*입력하지 않을 경우 <br>일부 카테고리 이용이 제한이 될 수 있습니다.<br>
					<input type="text" name="mBirth" id="mBirth" placeholder="(예)1900" size="20" maxlength="4"></td>
				</tr>	
			</table>
		
			<table class="joincomplete">
				<tr>
					<th colspan="2"><input type="submit" value="모두 동의하고 회원가입하기" class="btn_submit">
					<a href="main.jsp"><input type="button" value="취소" class="btn_cancel"></a></th>
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
			갬성갱딘 사이트 (이하 "상점 사이트"라 합니다)를 이용함에 있어 "회사"와 “개인”간의 권리·의무 및 책임사항을 규정함을 목적으로 합니다.</span>
			<h4>제 2조 (약관의 명시와 개정)</h4>
			<dl>
				<dt>1.</dt>
				<dd>"회사"는 이 약관의 내용을 "개인"이 쉽게 알 수 있도록 "상점 사이트"의 전면에 게시합니다.</dd>
				<dt>2.</dt>
				<dd>"회사"가 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행약관과 함께 "회사"의 초기화면에 그 적용일자 30일 이전부터 적용일자 전일까지 공지합니다.</dd>
			</dl>
		</div>
	
<!-- 개인정보 수집 및 이용에 대한 안내 -->
		<div class="term_2">
			<span class="term_headline">개인정보 수집 및 이용에 대한 안내<em class="term_stress">(필수)</em></span>
		</div>
		<div class="bx_term_agree_2">
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
								<td rowspan="2">회원 관리</td>
								<td>필수</td>
								<td>아이디(이메일), 비밀번호, 휴대전화 번호, 출생년도</td>
							</tr>
						</tbody>
					</table>
				</dd>
			</dl>
		</div>
	</form>
</div>
