<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   

<input type="hidden" value="${sinfo}">
<!-- 레벨이 0인 경우 메뉴를 클릭하면 다른페이지로 -->
<br>
<div class="wrapper">
	<div class="shopEnroll">
		<span>상점 등록</span><hr><br>
		<c:if test="${empty sinfo.sCode && empty sinfo.sImage}">	
			<div class="shopbasicInfoform">
				<h3>1단계</h3>
				<span class="shopbasicinfo">상점 기본정보</span><br><br>
				<a href="SInfoEnrollFormServlet"><input type="button" class="btn_enroll"value="등록"></a><br><br>
			</div>
			<div class="shopimageInfoform">
				<h3>2단계</h3>
				<span class="shopimageinfo">상점 사진정보</span><br><br>
				<p class="shopdeletewarn">기본정보 먼저 등록해주세요.</p>
			</div>
		</c:if>
		<c:if test="${!empty sinfo.sCode && empty sinfo.sImage}">
  			<div class="shopbasicInfoform">
  				<h3>1단계</h3>
				<span class="shopbasicinfo">상점 기본정보</span><br><br>
				<span>등록 완료</span>
			</div>
			<div class="shopimageInfoform">
				<h3>2단계</h3>
				<span class="shopimageinfo">상점 사진정보</span><br><br>
				<a href="SImageUploadFormServlet"><input type="button" class="btn_enroll"value="등록"></a><br><br>
			</div>
		</c:if>
		
		<c:if test="${!empty sinfo.sCode && !empty sinfo.sImage}">
			<div class="shopbasicInfoform">
  				<h3>1단계</h3>
				<span class="shopbasicinfo">상점 기본정보</span><br><br>
				<span>등록 완료</span>
			</div>
			<div class="shopimageInfoform">
				<h3>2단계</h3>
				<span class="shopimageinfo">상점 사진정보</span><br><br>
				<span>등록 완료</span>
			</div>
		</c:if>
	</div>
	
	
	<div class="shopView">
		<span>상점 확인</span><hr><br>
		<p>등록한 기본정보와 사진을 </p>
		<p>확인할 수 있으며,</p>
		<p>개인회원에게 보여지는 화면을</p>
		<p>확인할 수 있습니다.</p>
		<br>
		<c:if test="${!empty sinfo.sCode && !empty sinfo.sImage}">
			<a href="SViewServlet"><input type="button" class="btn_enroll"value="상점 확인"></a><br><br>
		</c:if>
		<c:if test="${empty sinfo.sCode && !empty sinfo.sImage}">
			<p class="shopdeletewarn">기본 정보를 등록해주세요.</p>
		</c:if>
		<c:if test="${!empty sinfo.sCode && empty sinfo.sImage}">
			<p class="shopdeletewarn">사진 정보를 등록해주세요.</p>
		</c:if>
		<c:if test="${empty sinfo.sCode && empty sinfo.sImage}">
			<p class="shopdeletewarn">기본정보와 사진 정보를</p>
			<p class="shopdeletewarn">등록해주세요.</p>
		</c:if>
	</div>
	
	<div class="shopModify">
		<span>상점 수정</span><hr><br>
		<p>등록한 기본정보와 사진을 </p>
		<p>수정할 수 있습니다.</p>
		<br>
		<c:if test="${!empty sinfo.sCode && empty sinfo.sImage}">
			<a href="SViewServlet"><input type="button" class="btn_enroll"value="기본정보 수정"></a><br><br>
			<p class="shopdeletewarn">사진 정보를 등록해주세요.</p>
		</c:if>
		<c:if test="${empty sinfo.sCode && empty sinfo.sImage}">
			<p class="shopdeletewarn">기본 정보를 등록해주세요.</p>
			<p class="shopdeletewarn">사진 정보를 등록해주세요.</p>
		</c:if>
		<c:if test="${!empty sinfo.sCode && !empty sinfo.sImage}">
			<a href="SViewServlet"><input type="button" class="btn_enroll"value="기본정보 수정"></a><br><br>
			<a href="SViewServlet"><input type="button" class="btn_enroll"value="사진정보 수정"></a>
		</c:if>
		
	</div>
	
	<div class="shopDeleteform">
		<span class="shopdelete">상점 삭제</span><hr><br>
		<p class="shopdeletewarn">삭제하면 복원되지 않습니다.<p>
		<br>
		<c:if test="${(!empty sinfo.sCode && !empty sinfo.sImage) ||(empty sinfo.sCode && !empty sinfo.sImage) ||(!empty sinfo.sCode && empty sinfo.sImage)}">
			<a href="SDeletionServlet"><input type="button" class="btn_enroll"value="상점 삭제"></a><br><br>
		</c:if>
		<c:if test="${empty sinfo.sCode && empty sinfo.sImage}">
			<p class="shopdeletewarn">삭제할 정보가 없습니다.</p>
		</c:if>
	</div>	
</div>
