$(document).ready(function() {
  // ------ ONLY FOR DEMONSTRATION ------- //
	function layout(){
		if($.cookie('fixed') == 'true'){
			$('.container-fluid').removeClass('container-fluid').addClass('container');
		} else {
			$('.container').removeClass('container').addClass('container-fluid');
		}
	}
	layout();
	$('.set-fixed').click(function(e){
		e.preventDefault();
		$.cookie('fixed', 'true');
		layout();
	});
	$('.set-liquid').click(function(e){
		e.preventDefault();
		$.cookie('fixed', 'false');
		layout();
	});
	$(".expand_custom a").click(function(e){
		e.preventDefault();
		e.stopPropagation();
		var el = $(this).parents('li');
		el.find('.custom .expand_custom').html('<img src="img/preload.gif" alt="">');
		setTimeout(function() {
		  el.find('.custom .expand_custom').parent().hide();
		  el.find('.custom-hidden').removeClass('custom-hidden');
		}, 500);
	});
	$('.progress-preview').each(function(){
		var el = $(this);
		function up(){
			var width = el.find('.bar').width();
			var parentWidth = el.width();
			var percent = Math.round((100*width/parentWidth));
			var plus = Math.round(Math.random() * 10);
			var newPercent = percent + plus;
			if(newPercent > 100){
				newPercent = 0;
			}
		  	el.find('.bar').width(newPercent+"%").html(newPercent+"%");
		  	setTimeout(up, 1500);
		}
		up();
	});
	$(".style-toggler").click(function(e){
		if($('.style-switcher').position().left < -1){
			$(this).animate({
				left:'+=211'
			});
			$('.style-switcher').animate({
				left:'-1px'
			},400);
		} else {
			$(this).animate({
					left:'-=211'
				});
				$('.style-switcher').animate({
					left:'-230px'
				},400);
			}
	});
	var $style = $(".style-toggler");
	var $styleswitcher = $('.style-switcher');
	$(window).scroll(function(){
		$style.stop().animate({
			top:$(window).scrollTop()+100
		},200);
		$styleswitcher.stop().animate({
			top:$(window).scrollTop()+100
		},200);
	});
	$(".style-switcher .color a").click(function(e){
		$('link').last().attr('href', "css/"+this.className+".css");
	});
	$(".style-switcher .pattern a").click(function(e){
		$('body').removeClass().addClass($(this).attr("class"));
	});
	$("input[type=submit], button[type=submit]").click(function(e){
		if(!$(this).parents('form').hasClass("wizard")){
			$.jGrowl("Form was submitted and saved to database.");
		}
	});
	if($('.flot').length > 0){
	  	var sin = [], cos = [], tmp = [];
		for (var i = 0; i < 16; i += 0.5) {
			sin.push([i, Math.sin(i)]);
			cos.push([i, Math.cos(i)]);
		}

		var options = {
			series: {
				lines: { show: true },
				points: { show: true }
			},
			grid: {
				hoverable: true,
				clickable: true
			},
			yaxis: { min: -1.1, max: 1.1 },
			colors: [ '#2872bd', '#666666', '#feb900', '#128902', '#c6c12f']
		};
		var options2 = {
			series: {
				pie: { 
					show: true,
					radius: 1,
					label: {
						show: true,
						radius: 1,
						formatter: function(label, series){
							return '<div style="font-size:12px;text-align:center;padding:2px;color:white;font-weight:bold">'+label+'<br/>'+Math.round(series.percent)+'%</div>';
						},
						background: { opacity: 0.8 }
					}
				}
			},
			legend:{
				show:false
			},
			grid: {
				hoverable: true,
				clickable: true
			},
			colors: [ '#2872bd', '#666666', '#feb900', '#128902', '#c6c12f']
		};

		if($('.flot.flot-line').length > 0){
			$.plot($(".flot.flot-line"), [ {label: "Active guests", data: sin}, {label: "Active members", data: cos} ] , options);
		}

		if($(".flot-pie").length > 0){
			$.plot($(".flot-pie"), [ {label: "Active guests", data: 5}, {label: "Active members", data: 10},{label: "Label #3", data: 3},{label: "Label #4", data: 7} ] , options2);
		}
		var d1 = [];
		for (var i = 0; i <= 10; i += 1)
			d1.push([i, parseInt(Math.random() * 30)]);

		var d2 = [];
		for (var i = 0; i <= 10; i += 1)
			d2.push([i, parseInt(Math.random() * 30)]);

		var d3 = [];
		for (var i = 0; i <= 10; i += 1)
			d3.push([i, parseInt(Math.random() * 30)]);

		var ds = new Array();

		ds.push({
			data:d1,
			bars: {
				show: true, 
				barWidth: 0.2, 
				order: 1,
				lineWidth : 2
			}
		});
		ds.push({
			data:d2,
			bars: {
				show: true, 
				barWidth: 0.2, 
				order: 2
			}
		});
		ds.push({
			data:d3,
			bars: {
				show: true, 
				barWidth: 0.2, 
				order: 3
			}
		});

		if($('.flot-bar').length > 0){
			$.plot($(".flot-bar"), ds, {grid: {
				hoverable: true,
				clickable: true
			},colors: [ '#2872bd', '#666666', '#feb900', '#128902', '#c6c12f']});
		}

		if($('.flot-live').length > 0){
			$(function () {
				var data = [], totalPoints = 300;
				function getRandomData() {
					if (data.length > 0)
						data = data.slice(1);

					while (data.length < totalPoints) {
						var prev = data.length > 0 ? data[data.length - 1] : 50;
						var y = prev + Math.random() * 10 - 5;
						if (y < 0)
							y = 0;
						if (y > 100)
							y = 100;
						data.push(y);
					}

					var res = [];
					for (var i = 0; i < data.length; ++i)
						res.push([i, data[i]])
					return res;
				}

				var updateInterval = 30;


				var options = {
				series: { shadowSize: 0 },
				yaxis: { min: 0, max: 100 },
				xaxis: { show: false }
				};
				var plot = $.plot($(".flot-live"), [ getRandomData() ], options);

				function update() {
					plot.setData([ getRandomData() ]);
					plot.draw();

					setTimeout(update, updateInterval);
				}

				update();
			});
		}
	}
	// ------ END ONLY FOR DEMONSTRATION ------- //
});