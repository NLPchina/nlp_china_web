$(document).ready(function() {
  	if($('.error').length > 0){
  		$(".error").fitText(0.4);
  		$(".desc").fitText(8, {minFontSize: '16px'});
  	}
  	$('.toggle-social').click(function(e){
  		if($('.login.social').is(":visible")){
	  		$('.social-shadow-hider').animate({
	  			marginTop:'-=100px'
	  		});
	  		$(this).parent().animate({
	  			marginTop:'-=100px',
	  			marginLeft:'-=157px',
	  			width:'205px'
	  		});
			$('.login.social').slideUp(400,function(e){
				$('.toggle-social').html('Sign in with social network <b class="caret"></b>');
			});
  		} else {
  			$(this).html('<b class="caret caret-up"></b>');
	  		$('.social-shadow-hider').animate({
	  			marginTop:'+=100px'
	  		});
	  		$(this).parent().animate({
	  			marginTop:'+=100px',
	  			marginLeft:'+=157px',
	  			width:'48px'
	  		});
			$('.login.social').slideDown();
  		}
	});
	if($('.validate').length > 0){
		$('.validate').validate({
			errorPlacement:function(error, element){
		 			element.parent().parent().append(error);
	 		},
	 		// Bootstrap style error highlight
	 		highlight: function(label, a) {
		    	$(label).closest('.control-group').removeClass('error success').addClass('error');
		    },
		     success: function(label) {
		    	label.addClass('valid').closest('.control-group').removeClass('error success').addClass('success');
		    }
		});
	}
});

$(window).resize(function(){
	console.log($(window).height());
});