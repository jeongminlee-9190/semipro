
$(document).ready(function(){
	
	//지하펄 button 클릭후 메뉴 보이기
	//호선
	$("#line_btn").click(function(){
		$("#line").slideToggle("fast");
	});
	
	//역
	$("#station_btn").click(function(){
		$("#station_1").slideToggle("fast");
	});
	
	//지하철 리스트 hover시 background-color 변경
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
	
	
	//지하펄 리스트중 하나 클릭 후 상단(button)으로 선택되기
	//호선
	
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
			$("#line_btn").find("span").css({"padding":"5px 13px"})
		}
		
		//역 한글부분 수정
		if( $(li).index() >= 9 ){
			$("#line_btn").find("span").css({"padding":"4px 11px","border-radius":"25px",
											 "font-size":"18px","font-weight":"900",
											 "font-family":"'Open Sans', sans-serif"})
		}

		$("#line").slideUp("fast");
		
	});
	
	//역
	$("#station_wrap ul li").click(function(idx){
			
		var color_change = $(this).css("background-color");
		
		var li = $(this);
		$("#station_btn").html(function(){
		    return "<span>" + $(li).find("span").text() + "</span>";
		}) ;
		
		$("#station_btn").css({"background-color":color_change,"color":"#fff"});
		$("#station_btn").find("span").css({"font-size":"18px","font-weight":"900",
										 "padding-top":"15px","font-family":"'Open Sans', sans-serif"});
		
		$("#station_wrap ul").slideUp("fast");
	});
	
	//호선 클릭시 역 클릭 가능
	$("#line_wrap ul li").click(function(){ 
		
		var line_n = $(this).index()+1; 
		
		$("#station_btn").click(function(){
			
			if ( line_n >= 1 ){
				$("#station_wrap ul").show();
			} else if ($("#station_btn").text().length == empty){
				$("#station_wrap ul").hide();
				alert("역을 선택해 주세요.");
			}
			
			console.log($("#station_btn").text().length);

		});
		
		console.log("dd" + line_n);
		
	});
	/*$("#station_btn").click(function(){
		
		var line = $("#line_wrap ul li").index()*0;
		
		if( line == 0){
			$("#station_wrap ul").hide();
			alert("역을 선택해 주세요.");
			console.log("hello" + line);
		} else {
			$("#station_wrap ul").show();
		}

	});*/

});
