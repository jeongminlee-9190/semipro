$(document).ready(function(){
	
	//키워드 검색창으로 올리기
	var keywords = [];
	var keyword;
	var keywordsIndex;
	$(".category ul li button").on("click",function(){
		
		keyword = $(this).text();
		keywordsIndex = keywords.indexOf(keyword);
		console.log(keywordsIndex);
		
		if(keywords.length < 4 && keywordsIndex==-1){
			keywords.push(keyword);
			$("#search").val(keywords);
			//카테고리 리트스 버튼 클릭 하면 컬러 바뀌기
			$(this).css({"background-color":"#ffa827", "color":"#fff"});
		}else if(keywordsIndex>=0){
			keywords.splice(keywordsIndex,1);
			$("#search").val(keywords);
			//카테고리 리트스 버튼 클릭 하면 원래 컬러로 돌아오기
			$(this).css({"background-color":"#fff", "color":"#ffa827"});
		}
	
	});
	  
	//카테고리 리스트 감추기
	$(".list").hide();
	
	//카테고리 버튼 누르면 보여지기
	$("#cate_btn01").on("click", function(){
		$("#category01 ul").slideToggle("slow");
		$(this).find("span").fadeToggle("slow");
	});
	$("#cate_btn02").on("click", function(){
		$("#category02 ul").slideToggle("slow");
		$(this).find("span").fadeToggle("slow");
	});
	$("#cate_btn03").on("click", function(){
		$("#category03 ul").slideToggle("slow");
		$(this).find("span").fadeToggle("slow");
	});
	
	//카테고리 리스트 버튼 color 변경
	$(".list li button").on("click", function(){
		//$(".list").slideUp("slow");
		//$(this).css({"background-color":"#ffa827", "color":"#fff"});
	});
  
});