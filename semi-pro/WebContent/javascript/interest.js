  var sCode = '${shop.sCode}';
  var interest = $("#interest"+sCode).val();
  	$("body").on("click","#interest"+sCode,function(){
      console.log(interest);
       $.ajax({
        type : "post",
        url : "InterestServlet",
        data : {
          mId : '${login.mId}',
          sCode : '${shop.sCode}'
        },
        dataType : "text",
        success : function(data,status,xhr){
          if(data="1"){
            $("#star"+sCode).replaceWith("<span>★</span>");
          }
        }
      })
  	})
