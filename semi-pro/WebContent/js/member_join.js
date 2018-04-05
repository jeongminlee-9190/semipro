
//mPhone select
$(document).ready(function(){
	
	var mId = $("#mId");
	var mPasswd = $("#mPasswd");
	var mPasswd2 = $("#mPasswd2");
	var mName = $("#mName");
	var mBirth = $("#mBirth");
	
	console.log(mName.val());
	
	$(".btn_submit").on("click",function(){
		
		// 정규식 - 이메일 유효성 검사
	    var regEmail = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
	    // 정규식 -전화번호 유효성 검사
	    var regPhone = /^((01[1|6|7|8|9])[1-9]+[0-9]{6,7})|(010[1-9][0-9]{7})$/;
		
	    //아이디 입력 체크
		if(!mId.val()){
			alert("아이디를 입력하세요");
			mId.focus();
			return false;
		} else { 
			if(!regEmail.test(mId.val())) { 
				alert("이메일 주소가 유효하지 않습니다"); 
				mId.focus();
				return false;
			} 
		} 
		
		// 비밀번호 입력 체크
		if(!$(".mPasswd").val()){
			alert("비밀번호를 입력하세요");
			mPasswd.focus();
			return false;
		}
		
		// 비밀번호 영문, 숫자 2종 이상 혼용
		var chk = 0;
		if(mPasswd.val().search(/[0-9]/g) != -1 ) chk ++;
		if(mPasswd.val().search(/[a-z]/ig)  != -1 ) chk ++;
		if(chk < 2){ 
			alert("비밀번호는 숫자, 영문 두가지이상 혼용하여야 합니다.");
			mPasswd.focus();
			return false;
		}
		
		// 비밀번호 길이
		if(!/^[a-zA-Z0-9]{6,15}$/.test(mPasswd.val())){ 
			alert("비밀번호는 숫자, 영문 조합으로 6~15자리를 사용해야 합니다."); 
			mPasswd.focus();
			return false;
		}
		
		// 비밀번호 동일한 문자/숫자 4이상, 연속된 문자
		if(/(\w)\1\1\1/.test(mPasswd.val()) || isContinuedValue(mPasswd.val())){
			alert("비밀번호에 4자 이상의 연속 또는 반복 문자 및 숫자를 사용하실 수 없습니다."); 
			mPasswd.focus();
			return false;
		}
		
		// 출생년도 입력 체크
		if(!mBirth.val()){
			alert("닉네임 입력하세요");
			mBirth.focus();
			return false;
		}
		
	});
	
	
	////비밀번호 재입력 일치 여부	
	$(".mPasswd").on("keyup",function(){
		
		if (mPasswd.val() != mPasswd2.val()) {
			$("#result2").text('').html("비밀번호 불일치").css("color","red");
			return false;
		} else {
			$("#result2").text('').html("비밀번호 일치").css("color","blue");
		}
		
	});
	
	//휴대전화 클릭시 슬라이드
	$("#mPhone1").on("click",function(){
		$("#mPhone_number").slideToggle("fast");
		$(this).css("border-bottom","none");
	});
	
	//휴대전화 번호 클릭시 해당 값 상단으로 출력
	$("#mPhone_number li").on("click",function(){
		
		var n = $(this).text();
		$("#mPhone1 #m_number").text(n);
		$("#mPhone1").css("border-bottom","1px solid #e0e0e0");
		$("#mPhone_number").slideUp("fast");
		
	});
	
	//휴대전화 번호 hover시 컬러 변경
	$("#mPhone_number li").mouseover(function(){
		$(this).css("background-color","#e0e0e0");
	});
	
	$("#mPhone_number li").mouseout(function(){
		$(this).css("background-color","#fff");
	});
	
});


/*idCheck*/
//요청용
/*var xmlRequest;
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

end of idCheck
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
}*/
/* 유효성 체크*/
/*function formCheck(e){
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
	 비밀번호 체크  
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
	
	 닉네임 체크 
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
}*/
	

	  