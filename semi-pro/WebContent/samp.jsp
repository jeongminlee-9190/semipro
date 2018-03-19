<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
var hobby0 = new Array("-선택-","");
var hobby1 = new Array("수석","보석","향수","우표","골동품","음반","전화카드","화폐");
var hobby2 = new Array("헹글라이딩","패러글라이딩","스카이다이빙","스쿠버다이빙","수상스키","카누/카약","래프팅(급류타기)","하이킹","사냥","번지점프","캠핑","등산","승마","스키","스노우보드","연날리기","R/C","낚시","서바이벌게임","드라이브");
var hobby3 = new Array("독서","영화/연극","사진","미술","악기연주","음악감상");
var hobby4 = new Array("골프", "농구", "댄스", "무예", "배구", "수영", "스노우보드", "승마", "스쿼시", "스키", "야구", "에어로빅","조깅","족구","테니스","헬스","카누/카약","축구");
var hobby5 = new Array("공예","사진","그림","문예","모형/프라모델","인형만들기");
var hobby6 = new Array("바둑","장기","체스","오델로","오목","컴퓨터 게임","서바이벌게임","카드");
var hobby7 = new Array("서예","수예/자수","꽃꽂이","요리","인형만들기","다도(차)","수족관","모형/프라모델","댄스","인터넷서핑");
var hobby8 = new Array("애완동물","분재","유머","천체관측","댄스","마술","아마추어 무선","로켓","운세/심리","원예","R/C","쇼핑","단전호흡","요요","요가","헬스");

function hobbychange(item){
    var temp, i=0, j=0;
    var ccount, cselect;

    temp = document.signform.hobby;

    for (i=(temp.options.length-1) ; i>0 ; i--){ temp.options[i] = null; }
    eval('ccount = hobby' + item + '.length');
    for (j=0 ; j<ccount ; j++) {
        eval('cselect = hobby' + item + '[' + j + '];');
        temp.options[j]= new Option(cselect,cselect); 
    }
    temp.options[0].selected=true;
    return true;
}
</script>
</head>
<body>
<form name=signform>

<table cellpadding=1>
<tr>
	<td>1차</td>
	<td>2차</td>
</tr>
<tr>
	<td>
		<select name=bighobby onChange=javascript:hobbychange(document.signform.bighobby.options.selectedIndex);>
			<option selected value="">-선택-</option>
			<option value=수집>수집</option>
			<option value=야외/레져>야외/레져</option>
			<option value=문화생활>문화생활</option>
			<option value=스포츠>스포츠</option>
			<option value=창작>창작</option>
			<option value=게임>게임</option>
			<option value=실내활동>실내활동</option>
			<option value=기타>기타</option>
		</select>
	</td>
	<td>
		<select name=hobby size=1>
			<option selected value="">-선택-</option>
			<option value=""></option>
		</select>
	</td>
</tr>
</table>
</form>
</body>
</html>





