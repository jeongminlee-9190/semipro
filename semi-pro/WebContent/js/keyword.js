$(document).ready(function(){
	
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
    }else if(keywordsIndex>=0){
      keywords.splice(keywordsIndex,1);
      $("#search").val(keywords);
    }

  });
  
});