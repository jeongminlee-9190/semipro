
$(document).ready(function(){
	
/*	var xmlRequest;
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
*/	
	var mId = $("#mId");
	var mPasswd = $("#mPasswd");
	var mPasswd2 = $("#mPasswd2");
	var mName = $("#mName");
	var m_number = $("#m_number");
	var mPhone2 = $("#mPhone2");
	var mPhone3 = $("#mPhone3");
	var mBirth = $("#mBirth");
	var mAgree_btn1 = $("#mAgree_btn1");
	var mAgree_btn2 = $("#mAgree_btn2");
	var mAgree1 = $("input:checkbox[id='mAgree1']");
	var mAgree2 = $("input:checkbox[id='mAgree2']");
	var mAgreeAll = $("input:checkbox[id='mAgreeAll']");
	
	$(".btn_submit").on("click",function(){
		
		// 정규식 - 아이디 유효성 검사
	    var regEmail = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
		
	    //아이디 입력 체크
		if(!mId.val()){
			alert("아이디를 입력하세요.");
			mId.focus();
			return false;
		} else { 
			if(!regEmail.test(mId.val())) { 
				alert("이메일 주소가 유효하지 않습니다."); 
				mId.focus();
				return false;
			} 
		} 

		// 비밀번호 입력 체크
		if(!$(".mPasswd").val()){
			alert("비밀번호를 입력하세요.");
			mPasswd.focus();
			return false;
		}
		
		if(mPasswd.val() != mPasswd2.val()){
			alert("입력한 두 개의 비밀번호가 서로  일치하지 않습니다.");
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
		if(/(\w)\1\1\1/.test(mPasswd.val())){
			alert("비밀번호에 4자 이상의 연속 또는 반복 문자 및 숫자를 사용하실 수 없습니다."); 
			mPasswd.focus();
			return false;
		}
		
		// 닉네임 입력 체크
		if(!mName.val()){
			alert("닉네임을 입력하세요.");
			mName.focus();
			return false;
		}
		
		// 정규식 - 전화번호 번호 정규식
	    var regExp2 = /^\d{3,4}$/;
	    var regExp3 = /^\d{4}$/;
	    // 정규식 - 전화번호 유효성 검사
	    var regPhone = /^((01[1|6|7|8|9])[1-9]+[0-9]{6,7})|(010[1-9][0-9]{7})$/;
	    
		//휴대전화2 입력 체크
		if(!mPhone2.val()){
			alert("휴대전화번호를 입력해 주세요.");
			mPhone2.focus();
			return false;
		}
		
		//휴대전화2 입력 체크
		if(!mPhone3.val()){
			alert("휴대전화번호를 입력해 주세요.");
			mPhone3.focus();
			return false;
		}
		
		//휴대전화2 길이
		if(!regExp2.test(mPhone2.val())){
			alert("총 핸드폰 자리수는 3글자이거나, 4자여야 합니다.");
			mPhone2.focus();
			return false;
		}
		
		//휴대전화2 길이
		if(!regExp3.test(mPhone3.val())){
			alert("총 핸드폰 자리수는 4자여야 합니다.");
			mPhone3.focus();
			return false;
		}
		
		// 출생년도 자리수를 안적었을 때 submit 되기
        if(!mBirth.val()) {
            return true;
        }
        
		// 출생년도 숫자외의 문자 입력 또는 자리수가 맞지않을때
        if(!/^([0-9]{4})$/.test(mBirth.val())) {
        	alert("올바른 출생년도가 아닙니다."); 
        	mBirth.focus();
            return false;
        }
        
        //이용약관 동의 여부 체크
        if(!mAgree1.is(":checked")){
        	alert("이용약관에 동의하지 않으셨습니다. 이용약관에 동의하셔야 등록할 수 있습니다."); 
        	mAgree1.focus();
            return false;
        }
        
        //개인정보 취급방침 동의 여부 체크
        if(!mAgree2.is(":checked")){
        	alert("개인정보 취급방침에 동의하지 않으셨습니다. 개인정보 취급방침에 동의하셔야 등록할 수 있습니다."); 
        	mAgree2.focus();
            return false;
        }

 
	});
	
	// 아이디 중복 체크 실시간 
	var checkAjaxSetTimeout;
    $("#mId").keyup(function(){
        clearTimeout(checkAjaxSetTimeout);
        checkAjaxSetTimeout = setTimeout(function(){
	        if ( $("#mId").val().length > 6) {
	            var mId = $(this).val();
	            // ajax 실행
	            $.ajax({
	                type : 'POST',
	                url : '/mJoinForm',
	                data:
	                {
	                	"mId": mId
	                },
	                success : function(data){
	                    console.log(data);
	                    if ($.trim(data) == 0) {
	                        $("#result1").text('').html("사용 가능한 아이디 입니다.");
	                    } else {
	                        $("#result1").text('').html("사용 불가능한 아이디 입니다.");
	                    }
	                }
	            }); // end ajax
	        } // if
        },1000); //end setTimeout
    }); // end keyup
	
	//비밀번호 재입력 일치 여부	
	$(".mPasswd").on("keyup",function(e){
		
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
	
	//출생년도 나이 제한 두기 
	$(mBirth).on("keyup",function(){
		if(mBirth.val() >= 2000){
			$("#result4").text('').html("카테고리 이용 불가한 나이 입니다.").css("color","red");
			return false;
		} else if(!mBirth.val()){
			$("#result4").text('').html("");
		} else if(!/^([0-9]{4})$/.test(mBirth.val())){
			$("#result4").text('').html("올바른 출생년도가 아닙니다.").css("color","red");
		} else {
			$("#result4").text('').html("사용가능 합니다.").css("color","blue");
		}
	});
	
	//이용약관 내용 보기
	$(mAgree_btn1).on("click",function(e){
		$("#mAgree_about1").slideToggle("fast");
		e.preventDefault();
	});
	
	//이용약관 내용 보기
	$(mAgree_btn2).on("click",function(e){
		$("#mAgree_about2").slideToggle("fast");
		e.preventDefault();
	});
	
	//이용약관 전체 동의
	$(mAgreeAll).on("click",function(){
		
		if(mAgreeAll.is(":checked")){
			//전체 선택하기
			mAgree1.prop('checked', true) ;
			mAgree1.attr('checked', true) ;
			mAgree2.prop('checked', true) ;
			mAgree2.attr('checked', true) ;
		} else {
			//전체 해제하기
			mAgree1.prop('checked', false) ;
			mAgree1.attr('checked', false) ;
			mAgree2.prop('checked', false) ;
			mAgree2.attr('checked', false) ;
		}
		
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

}*/
	

	  