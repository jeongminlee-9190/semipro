<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<style>
.imageView{
		position: absolute;
		margin-top:80px;
		margin-left:5%;
	}
	.image1,.image2,.image3,.image4,.image5{
		width:180px;
		height:180px;
	}
	.sImageUpdate_tbl td{
		width: 190px;
	}

</style>
<c:set var="sdto" value="${sinfo}"></c:set>
<form action="SImageUpdateServlet" method="post" enctype="multipart/form-data">
	<div class="imageView">
	<input type="text" name="sUpdate" value="sImage">
		<table class="sImageUpdate_tbl">
			<tr>
				<td><img class="image1" src="upload/${fn: split(sdto.sImage,'/')[0]}"></td>
				<td><img class="image2" src="upload/${fn: split(sdto.sImage,'/')[1]}"></td>
				<td><img class="image3" src="upload/${fn: split(sdto.sImage,'/')[2]}"></td>
				<td><img class="image4" src="upload/${fn: split(sdto.sImage,'/')[3]}"></td>
				<td><img class="image5" src="upload/${fn: split(sdto.sImage,'/')[4]}"></td>
			</tr>
			<tr>
				<td><input type="file" name="sImage1" id="sImage1"></td>
				<td><input type="file" name="sImage2" id="sImage2"></td>
				<td><input type="file" name="sImage3" id="sImage3"></td>
				<td><input type="file" name="sImage4" id="sImage4"></td>
				<td><input type="file" name="sImage5" id="sImage5"></td>
			</tr>
			<tr>
				<td colspan="5" align="center"><input type="submit" class="btn_submit" value="수정"></td>
			</tr>
		</table>	
	</div>
</form>