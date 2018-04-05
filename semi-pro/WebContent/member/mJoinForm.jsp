<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<div id="join_title">
	<p>SIGN UP</p>
</div>
	
<div id="join_content_wrapper">

	<form action="MJoinServlet" method="get" id="join_wrap">

		<div id="mId_wrap">
		 	<span class="join_title" ><strong>아이디 또는 이메일</strong></span>
		 	<input type="text" name="mId" id="mId" placeholder="zzz@naver.com" maxlength="30" class="join_text">
		 	<span id="result1"></span>
		</div> <!-- End : mId_wrap -->
		
		<div id="mPasswd_wrap">
			<span class="join_title" ><strong>비밀번호</strong></span>
			<input type="password" name="mPasswd" id="mPasswd" maxlength="16" class="join_text mPasswd">
		</div> <!-- End : mPasswd_wrap -->
		
		<div id="mRePasswd_wrap">
			<span class="join_title" ><strong>비밀번호 확인</strong></span>
	   	 	<input type="password" id="mPasswd2" maxlength="16" class="join_text mPasswd">
			<span id="result2"></span>
		</div> <!-- End : mPasswd_wrap -->
		
		<div id="mName_wrap">	
			<span class="join_title" ><strong>닉네임</strong></span>
			<input type="text" name="mName" id="mName" placeholder="홍길동" maxlength="10" class="join_text">
			<span id="result3"></span>
		</div> <!-- End : mName_wrap -->
		
		<div id="mPhone_wrap">
			<span class="join_title" ><strong>휴대전화</strong></span>
			<button type="button" id="mPhone1">
				<span id="m_number">010</span>
				<span id="mPhone_icon"><img src="images/mPhone_icon.png" title="check"></span>
			</button>
				- <input type="text" name="mPhone2" id="mPhone2" maxlength="4" >
				- <input type="text" name="mPhone3" id="mPhone3" maxlength="4" >
			<ul id="mPhone_number">
				<li>010</li>
				<li>011</li>
				<li>016</li>
				<li>017</li>
				<li>018</li>
				<li>019</li>
			</ul>
		
		</div> <!-- End : mPhone_wrap -->
		
		<div id="mBirth_wrap">
			<span class="join_title" ><strong>출생년도</strong></span>
			<input type="text" name="mBirth" id="mBirth" placeholder="1900" maxlength="4" class="join_text">
			<span>* 입력하지 않을 경우 일부 카테고리 이용에<br>&nbsp;&nbsp;
					제한이 될 수 있습니다.</span>
		</div> <!-- End : mBirth_wrap -->
		
		<div id="mSMS_wrap">	
			<span class="join_title" ><strong>이벤트 수신동의</strong></span>
			
			<input type="checkbox" name="mSMS1" id="mSMS1">
			<label for="mSMS1"></label>
			<span class="mSMS_t">이메일 수신동의</span>
			
			<input type="checkbox" name="mSMS2" id="mSMS2">
			<label for="mSMS2"></label>
			<span class="mSMS_t">SMS 수신동의</span>
		</div> <!-- End : mSMS_wrap -->
		
		<div id="mAgree_wrap">
		
			<p id="mAgree_title"><strong>이용약관<em>(필수)</em></strong></p>
			
			<div>
				<!-- 이용약관 -->
				<input type="checkbox" name="mAgree1" id="mAgree1">
				<label for="mAgree1"></label>
				<span class="mAgree_t">이용약관</span>
				<button class="mAgree_btn" >내용보기</button>
				<div class="mAgree_about">
					<h4>제 1조 (목적)</h4>
					<span>이 약관은 ㈜갬성갱단 (이하 "회사"라 합니다)가 운영하는 인터넷 사이트 갬성갱단에서 상점이 서비스를 이용하기 위해, 
					갬성갱딘 사이트 (이하 "상점 사이트"라 합니다)를 이용함에 있어 "회사"와 “개인”간의 권리·의무 및 책임사항을 규정함을 목적으로 합니다.</span>
					<h4>제 2조 (약관의 명시와 개정)</h4>
					<dl>
						<dt>1.</dt>
						<dd>"회사"는 이 약관의 내용을 "개인"이 쉽게 알 수 있도록 "상점 사이트"의 전면에 게시합니다.</dd>
						<dt>2.</dt>
						<dd>"회사"가 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행약관과 함께 "회사"의 초기화면에 그 적용일자 30일 이전부터 적용일자 전일까지 공지합니다.</dd>
					</dl>
				</div>
			</div>
			
			<div>
				<!-- 개인정보 수집 및 이용에 대한 안내 -->
				<input type="checkbox" name="mAgree2" id="mAgree2">
				<label for="mAgree2"></label>
				<span class="mAgree_t">개인정보 취급방침</span>
				<button class="mAgree_btn">내용보기</button>
				<div class="mAgree_about">
					<h4>1. 개인정보의 수집 항목 및 수집 방법</h4>
					<dl>
						<dt>(1)</dt>
						<dd>회사는 회원가입 및 각종 서비스의 제공을 위해 아래와 같이 개인정보를 수집∙이용합니다.</dd>
						<dd>
							<table border="1" cellspacing="0" cellpadding="0" summary="개인정보 수집 및 이용에 관한 안내">
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
			</div>
			
			<div id="mAgree_all">
				<input type="checkbox" name="mAgree2" id="mAgree3">
				<label for="mAgree3"></label>
				<span class="mAgree_t">전체동의</span>
			</div>

		</div> <!-- End : mAgree_wrap -->
		
		<div class="joinComplete">
				<input type="submit" value="가입하기" class="btn_submit">
				<a href="index.jsp"><input type="button" value="취소하기" class="btn_cancel"></a>
		</div> <!-- End : joinComplete -->
		
	</form> <!-- End : form -->
	
</div> <!-- End : joinWrapper -->
