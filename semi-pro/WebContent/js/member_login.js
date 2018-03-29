$(document).ready(function(){
	
	$("#mLogin").on("click",function(e){
		
		var mId = $("#mId").val().length;
		var mPasswd = $("#mPasswd").val().length;
		var both = mId + mPasswd;
		
		if( mId == 0 && mPasswd > 0){
			e.preventDefault();
			$("#mId").focus();
			alert("아이디 또는 이메일을 입력해주세요.");
		} else if( mId > 0 && mPasswd == 0){
			e.preventDefault();
			$("#mPasswd").focus();
			alert("비밀번호를 입력해주세요.");
		} 
		
		if( both == 0 ){
			e.preventDefault();
			$("#mId").focus();
			alert("필수 입력 입니다.");
		} 
		
	});
	
});