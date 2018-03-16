
$(document).ready(function(){

	$("#line_btn").click(function(){
		$("#line").slideToggle("slow");
	});

	$("#station_btn").click(function(){
		$("#station_1").slideToggle("slow");
	});

	/*$("#line_wrap ul li").hover(function(){
		$("#line_wrap ul li").each(function(idx) {
			var color_change = $("#line_wrap ul li span").css("background-color");
			var bg_idx = $(this).index();
			if(idx == bg_idx){
				$(this).css({"background-color":color_change,"color":color_change});
				$(this).find("span").css("background-color","#ffffff");
			}
			return idx != bg_idx;
		});
	});*/
	
	$("#line_wrap ul li").hover(function(){
		var color_change = $("#line_wrap ul li span").css("background-color");

		$(this).css({"background-color":color_change,"color":color_change});
		$(this).find("span").css("background-color","#ffffff");
		
	});
	
});
