<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<style>
	#result1,#result2{
		font-size:10px;
		color: red;
	}
	
	.jointable1{
		width: 520px;
		border: 1px solid lightgrey;
	}
	
	.jointable2 th{
		font-size: 12px;
	}
	
	#inner{
		border: 1px solid lightgrey;
		font-weight:normal;
		font-size:11px;
		line-height:23px;
	}
	
	.jointable3 th{
		font-size: 13px;
		border-bottom:0;
		height:25px;
		background-color:#f9f9f9;
		color:#999;
		font-weight:normal;
	}
	
	.jointable3 td{
		font-size: 12px;
		border:1px solid #e7e7e9;
		text-align:center;
	}

	.submitbtn {
		border: 1px solid lightgrey;
		background-color: lightgrey;
		padding:5px;
		
	}
	
	.cancelbtn{
		border: 1px solid grey;
		background-color: grey;
		padding:5px;
		color: white;
	}
</style>


<form action="MemberAddServlet" method="get">
	<div class="jointable1">
	<table>
		<tr>
			<td><input type="text" name="userid" placeholder="아이디" onkeyup="idCheck(this.value)" maxlength="10">
				<span id="result1"></span></td>
		</tr>
		
		<tr>
			<td><input type="password" name="passwd" id="passwd" placeholder="비밀번호" maxlength="10" size="12" onkeyup="pwCheck1(this.value)">
			    <input type="password" id="passwd2" placeholder="비밀번호 재입력" maxlength="10" size="12" onkeyup="pwCheck2(this.value)">
				<span id="result2"></span></td>
		</tr>
		
		<tr>
			<td><input type="text" name="username" placeholder="이름"></td>
		</tr>
		<tr>
			<td><select name="phone1">
					<option value="010">010</option>
					<option value="011">011</option>
				</select>-
				<input type="text" name="phone2" size="4" maxlength="4" placeholder="휴대전화">-
				<input type="text" name="phone3" size="4" maxlength="4" placeholder="휴대전화">			
			</td>
		</tr>
		<tr>
			<td><input type="text" name="email1" id="email1" placeholder="이메일">@<input type="text" name="email2" id="email2" placeholder="직접입력">
				<select name="email" onchange="emailSelect(this.value)">
					<option selected="selected" value="">직접입력</option>
					<option value="naver.com">naver.com</option>
					<option value="daum.net">daum.net</option>
					<option value="hanmail.net">hanmail.net</option>
					<option value="nate.com">nate.com</option>
					<option value="gmail.com">gmail.com</option>
				</select>
			</td>
		</tr>
	</table>
	
	<div class="jointable2">
		<table>
			<tr>
				<th>이용약관 동의<a href="#" onclick="window.open('memberTerm1.jsp')"><span id="inner">내용보기</span></a></th>
			</tr>
		</table>
	</div>
		
		
	<div class="jointable3">
		<table cellspacing="0" cellpadding="0" border="0" summary="이용약관 구분">
			<colgroup>
            	<col width="8%"><col width="30%"><col width="32%"><col width="23%">
       		</colgroup>
        	<tr>
				<th scope="col">구분</th>
            	<th scope="col">목적</th>
            	<th scope="col">항목</th>
            	<th scope="col">보유 및 이용기간</th>
        	</tr>
        	<tbody>
            	<tr>
                	<td>필수</td>
                	<td>이용자 식별, 서비스 이행</td>
                	<td>이름, 아이디, 비밀번호, 이메일</td>
                	<td>회원탈퇴 후 5일까지</td>
            	</tr>
        	</tbody>
     	</table>
    </div>
    <table>
		<tr align="center">
			<th align="center"><input type="submit" value="동의하고 회원가입하기" class="submitbtn">
			<a href="main.jsp"><input type="button" value="취소" class="cancelbtn"></a></th>
		</tr>
	</table>
	</div>	
</form>
	




<script>

	/*idCheck*/
	//요청용
	var xmlRequest;
	function idCheck(id){
		xmlRequest=new XMLHttpRequest();
	  	xmlRequest.onreadystatechange=x;	
	  	// MemberIdCheckServlet에 요청
	  	xmlRequest.open("get","MemberIdCheckServlet?userid="+id, true);
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
	
	
	function emailSelect(email){
		//id값이 email2인 input에 전달받은 값을 넣는다.
		document.querySelector("#email2").value=email;
	}
	
	
	function formCheck(e){
		  var username = document.querySelector("#username").value;
		  if(username.length == 0){
			  alert("이름 입력하세요")
			  document.querySelector("#username").focus();
			  e.preventDefault();
		  }else if(document.querySelector("#email1").value.length==0){
			  alert("email1 입력하세요")
			  document.querySelector("#email1").focus();
			  e.preventDefault();
		  }else if(document.querySelector("#phone2").value.length==0){
			  alert("휴대전화 번호를 입력하세요");
			  e.preventDefault();
		  }
	}//
	
</script>



