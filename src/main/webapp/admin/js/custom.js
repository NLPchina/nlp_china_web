$(window).resize(function() {
	// chosen resize bug
	"use strict";
	$('.chzn-container').each(function() {
		$(this).css('width', $('.chzn-container').parent().width()+'px');
		$(".chzn-drop").css('width', ($('.chzn-container').parent().width()-2)+'px');
		$(".chzn-search input").css('width', ($('.chzn-container').parent().width()-37)+'px');
	});
});
$(document).ready(function() {
	"use strict";
	// ------ DO NOT CHANGE ------- //
	$(".flot-bar,.flot-pie,.flot,.flot-multi").bind("plothover", function (event, pos, item) {
		if (item) {
			var y;
			if(event.currentTarget.className === 'flot flot-bar'){
				y = Math.round(item.datapoint[1]);
			} else if(event.currentTarget.className === 'flot flot-pie') {
				y = Math.round(item.datapoint[0])+"%";
			} else if(event.currentTarget.className === 'flot flot-line'){
				y = (Math.round(item.datapoint[1] * 1000)/1000);
			} else {
				y = (Math.round(item.datapoint[1]*1000)/1000)+"€";
			}
			$("#tooltip").remove();
			showTooltip(pos.pageX, pos.pageY,"Value = "+y);
		}
		else {
			$("#tooltip").remove();         
		}
	});

	function showTooltip(x, y, contents) {
		$('<div id="tooltip">' + contents + '</div>').css( {
			top: y + 5,
			left: x + 10
		}).appendTo("body").show();
	}
	$('.deleteRow').click(function(e){
		e.preventDefault();
		$(this).parents('tr').fadeOut();
	});

	$(".animateRow").click(function(e){
		e.preventDefault();
		var el = $(this).parents('tr');
		var target = $($(this).data('target'));
		var defaultColor = target.find('a.dropdown-toggle').css('color');
		var titleindex = parseInt($(this).data('title'), 10)-1;
		var userindex = parseInt($(this).data('user'), 10)-1;
		var dateindex = parseInt($(this).data('date'), 10)-1;
		var title = el.find('td:eq('+titleindex+')').html();
		var user = el.find('td:eq('+userindex+') a').html();
		var userContent = el.find('td:eq('+userindex+') a').data('content');
		var date = el.find('td:eq('+dateindex+')').html();
		el.css({
			position:'absolute',
			left:el.position().left,
			top:el.position().top
		});
		el.animate({
			left:target.position().left,
			top:target.position().top,
			width:target.width(),
			height:target.height()
		}, 1000, function(){
			el.hide();
			var value = parseInt(target.find('a.dropdown-toggle .label').html(), 10);
			if(isNaN(value)){
				value = 0;
			}
			target.find('a.dropdown-toggle .label').html(value+1);
			if(target.find('.label').is(":hidden")){
				target.find('.label').show();
			}
			target.find('a.dropdown-toggle').stop().animate({
				backgroundColor:target.find('a.dropdown-toggle .label').css('backgroundColor'),
				color:'#fff'
			},300, function(){
				target.find('a.dropdown-toggle').animate({
				backgroundColor:target.css('background-color'),
				color:defaultColor
			}, 200, function(){
				target.find('a.dropdown-toggle').css('background-color', '').css('color', '');
			});
			});
		});
		target.find('.dropdown-menu').append('<li class="custom"><div class="title">'+title+'<span>'+date+' by <a href="#" class="pover" data-title="'+user+'" data-content="'+userContent+'">'+user+'</a></span></div><div class="action"><div class="btn-group"><a href="#" class="tip btn btn-mini" title="Show order"><img src="img/icons/fugue/magnifier.png" alt=""></a><a href="#" class="tip btn btn-mini" title="Delete order"><img src="img/icons/fugue/cross.png" alt=""></a></div></div></li>');
		$(".pover").popover();$(".tip").tooltip();
	});
	$(".mini > li > a").hover(function(e){
	e.stopPropagation();
	if(!$(this).parent().hasClass("open")){
		$(this).find(".label").stop().animate({
			top: '-10px'
		},200, function(){
			$(this).stop().animate({top: '-6px'},100);
		});
	}
	}, function(){});


	$('.main-nav > li.active > a').click(function(e){
		if($(window).width() <= 767){
			e.preventDefault();
			if($(this).hasClass('open') && (!$(this).hasClass('toggle-collapsed'))){
				$(this).removeClass('open');
				$(this).parents('.main-nav').find('li').each(function(){
					$(this).find('.collapsed-nav').addClass('closed');
					$(this).hide();
				});
				$(this).parent().show();
				$(this).parent().removeClass('open');
			} else {
				if($(this).hasClass('toggle-collapsed')){
					$(this).parent().addClass('open');
				}
				if($(this).hasClass("open")){
					$(this).parents('.main-nav').find('li').not('.active').each(function(){
						$(this).find('.collapsed-nav').addClass('closed');
						$(this).hide();
					});
					$(this).removeClass("open");
				} else {
					$(this).addClass('open');
					$(this).parents('.main-nav').find('li').show();
				}
			}
		}
	});

	$('.toggle-collapsed').each(function(){
		if($(this).hasClass('on-hover')){
			$(this).click(function(e){e.preventDefault();});
			$(this).parent().hover(function(){
				$(this).addClass("open");
				$(this).find('.collapsed-nav').slideDown();
				$(this).find('img').attr("src", 'img/toggle-subnav-up-white.png');
			}, function(){
				$(this).removeClass("open");
				$(this).find('.collapsed-nav').slideUp();
				$(this).find('img').attr("src", 'img/toggle-subnav-down.png');
			});
		} else {
			$(this).click(function(e){
				e.preventDefault();
				if($(this).parent().find('.collapsed-nav').is(":visible")){
					$(this).parent().removeClass("open");
					$(this).parent().find('.collapsed-nav').slideUp();
					$(this).find('img').attr("src", 'img/toggle-subnav-down.png');
				} else {
					$(this).parent().addClass("open");
					$(this).parent().find('.collapsed-nav').slideDown();
					$(this).find('img').attr("src", 'img/toggle-subnav-up-white.png');
				}
			});
		}
	});

	$('.collapsed-nav li a').hover(function(){
		if(!$(this).parent().hasClass('active')){
			$(this).stop().animate({
				marginLeft: '5px'
			}, 300);
		}
	}, function(){
	$(this).stop().animate({
			marginLeft: '0'
		}, 100);
	});
	$('a.preview').live('mouseover mouseout mousemove click',function(e){
			if(e.type === 'mouseover'){
				$('body').append('<div id="image_preview"><img src="'+$(this).attr('href')+'" width="150"></div>');
				$("#image_preview").fadeIn();
			} else if(e.type === 'mouseout') {
				$("#image_preview").remove();
			} else if(e.type === 'mousemove'){
				$("#image_preview").css({
					top:e.pageY+10+"px",
					left:e.pageX+10+"px"
				});
			} else if(e.type === 'click'){
				$("#image_preview").remove();
			}
		});

	$('.sel_all').click(function(){
		$(this).parents('table').find('.selectable-checkbox').attr('checked', this.checked);
	});
	// ------ END DO NOT CHANGE ------- //

	// ------ PLUGINS ------- //
	// - CALENDAR
	var date = new Date();
	var d = date.getDate();
	var m = date.getMonth();
	var y = date.getFullYear();

	if($('.calendar').length > 0){
		$('.calendar').fullCalendar({
			header: {
				left: 'prev,next,today',
				center: 'title',
				right: 'month,agendaWeek,agendaDay'
			},
			buttonText:{
				today:'Jump to current day'
			},
			editable: true,
			events: [
			{
				title: 'All Day Event',
				start: new Date(y, m, 1)
			},
			{
				title: 'Long Event',
				start: new Date(y, m, d-5),
				end: new Date(y, m, d-2)
			},
			{
				id: 999,
				title: 'Repeating Event',
				start: new Date(y, m, d-3, 16, 0),
				allDay: false
			},
			{
				id: 999,
				title: 'Repeating Event',
				start: new Date(y, m, d+4, 16, 0),
				allDay: false
			},
			{
				title: 'Meeting',
				start: new Date(y, m, d, 10, 30),
				allDay: false
			},
			{
				title: 'Lunch',
				start: new Date(y, m, d, 12, 0),
				end: new Date(y, m, d, 14, 0),
				allDay: false
			},
			{
				title: 'Birthday Party',
				start: new Date(y, m, d+1, 19, 0),
				end: new Date(y, m, d+1, 22, 30),
				allDay: false
			},
			{
				title: 'Click for Google',
				start: new Date(y, m, 28),
				end: new Date(y, m, 29),
				url: '../../google.com/default.htm'
			}
			]
		});
	}

	// - dataTables
	if($('.dataTable').length > 0){
		$('.dataTable').each(function(){
			var opt = {
				"sPaginationType": "bootstrap",
					"oLanguage":{
						"sSearch": "",
						"sLengthMenu": "Limit: _MENU_"
					}
			};
			if($(this).hasClass("dataTable-noheader")){
				opt.bFilter = false;
				opt.bLengthChange = false;
			}
			if($(this).hasClass("dataTable-nofooter")){
				opt.bInfo = false;
				opt.bPaginate = false;
			}
			if($(this).hasClass("dataTable-nosort")){
				var column = $(this).data('nosort');
				opt.aoColumnDefs =  [
					{ 'bSortable': false, 'aTargets': [ column ] }
				];
			}
			if($(this).hasClass('dataTable-tools')){
				opt.sDom= 'T<"clear">lfrtip';
				opt.oTableTools = {
					"sSwfPath": "js/tableTools/swf/copy_csv_xls_pdf.swf"
				};
			}
			$(this).dataTable(opt);
			$('.dataTables_filter input').attr("placeholder", "Search here...");
			$('.dataTables_length select').attr("class", "uniform");
		});
	}
	// - validation
	if($('.validate').length > 0){
		$('.validate').validate({
			errorPlacement:function(error, element){
					element.parents('.controls').append(error);
			},
			highlight: function(label) {
				$(label).closest('.control-group').removeClass('error success').addClass('error');
			},
			success: function(label) {
				label.addClass('valid').closest('.control-group').removeClass('error success').addClass('success');
			}
		});
	}
	// - wizard
	if($(".wizard").length > 0){
		$(".wizard").formwizard({ 
				formPluginEnabled: true,
				validationEnabled: true,
				focusFirstInput : false,
				validationOptions: {
				highlight: function(label) {
					$(label).closest('.control-group').addClass('error');
				},
				success: function(label) {
					label.addClass('valid').closest('.control-group').addClass('success');
				}
				},
				formOptions :{
					success: function(){
					},
					beforeSubmit: function(){
						$('#myModal').modal('show');
					},
				dataType: 'json',
				resetForm: true
			}	
		});
	}
	// - tooltips
	$(".tip").tooltip();
	// - popover
	$(".pover").popover();
	$(".pover").click(function(e){
		e.preventDefault();
		if($(this).data('trigger') === "manual"){
			$(this).popover('toggle');
		}
	});
	$(".table-has-pover").live('mouseenter', function(){
		$('.pover').popover();
	});
	// - growl-like notification
	if($('.opengrowl').length > 0){
		$(".opengrowl").click(function(e){
			e.preventDefault();
			var content = $(this).data('content');
			if($(this).hasClass("hasheader")){
				var head = $(this).data('header');
				$.jGrowl(content, { header: head });
			} else {
				$.jGrowl(content);
			}
		});
	}
	// - fancybox
	if($('.fancy').length > 0){
		$('.fancy').live('mouseenter',function(){
			$('.fancy').fancybox();
		});
	}
	// - quickstats
	if($('.small-chart').length > 0){
		$('.small-chart').each(function(){
			var color = "#" + $(this).data('color');
			var stroke = "#" + $(this).data('stroke');
			var type = $(this).data('type');
			$(this).peity(type, {
				colour: color,
				colours: ['#dddddd', color],
				diameter: 32,
				strokeColour: stroke,
				width: 60,
				height:32
			});
		});
	}
	// - counter
	if($('.counter').length > 0){
		$('.counter').each(function(){
			var max = $(this).data('max');
			if(!max){
				max = 100;	
			} 
			$(this).textareaCount({
				'maxCharacterSize': max,
				'displayFormat' : 'Characters left: #left'
			});
		});
	}
	// - uniform
	if($('.uniform').length > 0){
		$('.uniform').uniform({
			radioClass: 'uniRadio'
		});
	}
	// - chosen
	if($('.cho').length > 0){
		$(".cho").chosen({no_results_text: "No results matched"});
	}
	// - cleditor
	if($('.cleditor').length > 0){
		$(".cleditor").cleditor({width:'auto'});
	}
	// - spinner
	if($('.spinner').length > 0){
		$('.spinner').spinner();
	}
	// - timepicker
	if($('.timepicker').length > 0){
		$('.timepicker').timepicker({
			defaultTime: 'current',
			minuteStep: 1,
			disableFocus: true,
			template: 'dropdown'
		});
	}
	// - tagsinput
	if($(".tagsinput").length > 0){
		$('.tagsinput').tagsInput({width:'auto', height:'auto'});
	}
	// - plupload
	if($('.plupload').length > 0){
		$('.plupload').pluploadQueue({
			runtimes : 'html5,gears,flash,silverlight,browserplus',
			url : 'js/plupload/upload.php',
			max_file_size : '10mb',
			chunk_size : '1mb',
			unique_names : true,
			resize : {width : 320, height : 240, quality : 90},
			filters : [
				{title : "Image files", extensions : "jpg,gif,png"},
				{title : "Zip files", extensions : "zip"}
			],
			flash_swf_url : 'js/plupload/plupload.flash.swf',
			silverlight_xap_url : 'js/plupload/plupload.silverlight.xap'
		});
		$(".plupload_header").remove();
		$(".plupload_progress_container").addClass("progress").addClass('progress-striped');
		$(".plupload_progress_bar").addClass("bar");
		$(".plupload_button").each(function(){
			if($(this).hasClass("plupload_add")){
				$(this).attr("class", 'btn btn-primary pl_add btn-small');
			} else {
				$(this).attr("class", 'btn btn-success pl_start btn-small');
			}
		});
	}
	// - datepicker
	if($('.datepick').length > 0){
		$('.datepick').datepicker();	
	}
	// - masked inputs
	if($('.mask_date').length > 0){
		$(".mask_date").inputmask("9999/99/99");	
	}
	if($('.mask_phone').length > 0){
		$(".mask_phone").inputmask("(999) 999-9999");
	}
	if($('.mask_serialNumber').length > 0){
		$(".mask_serialNumber").inputmask("9999-9999-99");	
	}
	if($('.mask_productNumber').length > 0){
		$(".mask_productNumber").inputmask("AAA-9999-A");	
	}
	// - slider
	if($('.slider').length > 0){
		$(".slider").each(function(){
			var orient = $(this).data('orientation');
			var min = $(this).data('min');
			var max = $(this).data('max');
			var step = $(this).data('step');
			var range = $(this).data('range');
			var rangestart = $(this).data('rangestart');
			var rangestop = $(this).data('rangestop');


			if(orient === ""){
				orient = "horizontal";
			}

			var el = $(this);

			if(range !== undefined){
				$(this).find('.slide').slider({
					range:true,
					values:[rangestart, rangestop],
					orientation: orient,
					min: min,
					max: max,
					step: step,
					slide: function( event, ui ) {
						el.parent().find('.amount').html( ui.values[0]+" - "+ui.values[1] );
					}
				});
				$( this ).find('.amount').html( $(this).parent().find('.slide').slider( "values",0 )+" - "+$(this).parent().find('.slide').slider( "values",1 ) );
			} else {
				$(this).find('.slide').slider({
					orientation: orient,
					min: min,
					max: max,
					step: step,
					slide: function( event, ui ) {
						el.parent().find('.amount').html( ui.value );
					}
				});
				$( this ).find('.amount').html( $(this).parent().find('.slide').slider( "value" ) );
			}

		});
	}
});