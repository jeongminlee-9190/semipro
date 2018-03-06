<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style media="screen">
  .category{text-align: center;}
</style>

<div class="category">
  <h2>카테고리1</h2>
  <button>식사</button>
  <button>회식</button>
  <button>데이트</button>
  <button>파티</button>
</div>


<script type="text/javascript" src="jquery-3.3.1.js"></script>
<script type="text/javascript">
  var keywords = [];
  var keyword;
  var keywordsIndex;
  $("button").on("click",function(){
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
</script>
