$("#line").on("change",function(){
  var line = $("#line").val();
  var station;
  $.ajax({
    type : "get",
    url : "station/line.jsp",
    dataType : "json",
    success : function(data,status,xhr){
  	  //var x = JSON.parse(data);
  	 //var x = eval("("+data+")");
    var stationInfo = data[line];
    $("#station").empty();
    if(line != ""){
  	  $("#station").append("<option>역</option>");
       for(var i=0;i<stationInfo.length;i++){
    	   $("#station").append("<option>"+stationInfo[i]+"</option>");
         }
       }
    },
    error: function(e){
  	 console.log(e);
    }
  });
});
$("#station").on("change",function(){
  station = $("#station").val();
  $("#stationInfo").val(station);
  console.log(station);
});
