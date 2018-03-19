
$(document).ready(function(){
	
	//button 클릭후 메뉴 보이기
	$("#line_btn").click(function(){
		$("#line").slideToggle("fast");
	});

	$("#station_btn").click(function(){
		$("#station_1").slideToggle("fast");
	});
	
	//메뉴 bg color 변경
	//호선
	$("#line_wrap ul li").mouseover(function(){
		
		var color_change = $(this).find("span").css("background-color");
	
		$(this).css({"background-color":color_change,"color":color_change});
		$(this).find("span").css("background-color","#ffffff");

	});
	
	$("#line_wrap ul li").mouseout(function(){
		
		var color = $(this).css("background-color");
	
		$(this).css({"background-color":"#ffffff","color":"#ffffff"});
		$(this).find("span").css("background-color",color);

	});
	
	//역
	$("#station_wrap ul li").mouseover(function(){
		
		var color_change = $(this).css("color");
	
		$(this).css({"background-color":color_change,"color":"#ffffff"});

	});
	
	$("#station_wrap ul li").mouseout(function(){
		
		var color = $(this).css("background-color");
	
		$(this).css({"background-color":"#ffffff","color":color});

	});
	
	
	//역 클릭 후 선택되기
	$("#line_wrap ul li").click(function(idx){
		
		var color_change = $(this).css("background-color");
		
		var li = $(this);
		$("#line_btn").html(function(){
		    return "<span>" + $(li).find("span").text() + "</span>";
		}) ;
		
		$("#line_btn").css({"background-color":color_change,"color":color_change});
		$("#line_btn").find("span").css({"background-color":"#fff","display":"inline-block",
										 "padding":"5px 10px","border-radius":"100px",
										 "font-family":"gotham_Bold", 
										 "font-style":"normal","font-weight":"normal","font-size":"21px"})
		
		//1호선 css 따로 수정
		if( $(li).find("span").text() == 1 ){
			$("#line_btn").find("span").css({"background-color":"#fff","display":"inline-block",
											 "padding":"5px 13px","border-radius":"100px",
											 "font-family":"gotham_Bold", 
											 "font-style":"normal","font-weight":"normal","font-size":"21px"})
		}
		
		//한글부분 수정
		if( $(li).index() >= 9 ){
			$("#line_btn").find("span").css({"background-color":"#fff","display":"inline-block",
											 "padding":"2px 11px 6px 11px","border-radius":"25px",
											 "font-size":"18px","font-weight":"900", "font-weight":"900",
											 "font-family":"'Open Sans', sans-serif"})
		}
		console.log($(li).index());
		$("#line").slideUp("fast");
		
	});
	
});
