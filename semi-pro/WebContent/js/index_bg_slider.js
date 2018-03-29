$(document).ready(function(){
	
	var rolling_time = 4000;
    var effect_time = 2000;
 
    var $rolling_img = $("#main_bg_slider > li");
    $rolling_img.not(":first").hide();
 
    setInterval(rolling, rolling_time);
 
    function rolling()
    {
        $visible_img = $rolling_img.filter(":visible");
        $visible_img.fadeOut(effect_time);
 
        $next_img = $visible_img.next();
        if ($next_img.length === 0) {
            $next_img = $rolling_img.filter(":first");
        }
        $next_img.fadeIn(effect_time);
    }

});