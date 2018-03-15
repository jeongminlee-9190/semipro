
$(document).ready(function(){

	$("#line_btn").click(function(){
		$("#line").slideToggle("slow");
	});

	$("#station_btn").click(function(){
		$("#station_1").slideToggle("slow");
	});
	
	/*var li = $("#line_wrap ul li").toArray();
	
	var color = $.makeArray($("#line_wrap ul li").map(function(){
	    return $("#line_wrap ul li span").css("background-color");
	}));
	
	$("#line_wrap ul li").hover(function(){
		//var arr = li[0].css("background-color",color[0])
		alert("Hello! I am an alert box!!" + color);
	});*/
	
});
