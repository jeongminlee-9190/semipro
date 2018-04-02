
//mPhone select
$(document).ready(function(){
	
	$("#mPhone1").on("click",function(){
		$("#mPhone_number").slideToggle("fast");
	});
	
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
	

	  