<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style media="screen">
  .category{text-align: center;}
</style>

<div class="category">
  <h1>카테고리</h1>
  <button class="category">식사</button>
  <button class="category">회식</button>
  <button class="category">데이트</button>
  <button class="category">파티</button>
</div>


<script type="text/javascript" src="jquery-3.3.1.js"></script>
<script type="text/javascript">
  var keywords = [];
  var keyword;
  var keywordsIndex;
  $("button").on("click",function(){
    keyword = $(this).text();
    keywordsIndex = keywords.includes(keyword);
    if(keywords.length<4 && keywordsIndex==false){
      keywords.push(keyword);
      $("#search").val(keywords);
    }else if(keywordsIndex==true){
      keywords.splice(keywords.indexOf(keyword),1);
      $("#search").val(keywords);
    }
  });
</script>
