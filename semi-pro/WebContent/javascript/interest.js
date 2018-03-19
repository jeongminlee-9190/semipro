$(document).ready(function(){
    $.ajax({
     type : "post",
     url : "IsInterestServlet",
     dataType : "text",
     data : {
       mId : '${login.mId}',
       sCode : '${shop.sCode}'
     },
     success : function(data,status,xhr){
       console.log(data)
       if(data=="1"){
         $("#"+"${shop.sCode}").replaceWith("<span id='"+"${shop.sCode}"+"'>★</span>");
       }else if(data=="0"){
         $("#"+"${shop.sCode}").replaceWith("<span id='"+"${shop.sCode}"+"'>☆</span>");
       }
     }
   });
 });

$("body").on("click","#interest"+"${shop.sCode}",function(){
  if('${login.mId}'!=""){
    $.ajax({
      type : "post",
      url : "InterestServlet",
      dataType : "text",
      data : {
        mId : '${login.mId}',
        sCode : '${shop.sCode}'
      },
      success : function(data,status,xhr){
        console.log(data);
        if(data=="1"){
          $("#"+"${shop.sCode}").replaceWith("<span id='"+"${shop.sCode}"+"'>★</span>");
        }else if(data=="0"){
          $("#"+"${shop.sCode}").replaceWith("<span id='"+"${shop.sCode}"+"'>☆</span>");
        }
      }
    });
  }else{
    alert("로그인을 하세요")
  }
});
