<%@page language="java" pageEncoding="UTF-8"%>
<%@include file="/common/taglibs.jsp"%>
<!DOCTYPE html>
<!--[if lt IE 7]> <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang="en"> <![endif]-->
<!--[if IE 7]>    <html class="no-js lt-ie9 lt-ie8" lang="en"> <![endif]-->
<!--[if IE 8]>    <html class="no-js lt-ie9" lang="en"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang="cn"> <!--<![endif]-->

<head>
	<%@include file="common/common.jsp"%>
	<link rel="stylesheet" href="${ctx }/css/bootstrap.css">
	<link rel="stylesheet" href="${ctx }/css/wordstyle.css">
	<script src="${ctx }/js/jquery.min.js"></script>
	<script src="${ctx }/js/bootstrap.js"></script>
	<script src="${ctx }/js/jquery.awesomeCloud-0.2.min.js"></script>
	<script src="${ctx }/js/Chart.js"></script>

	<style type="text/css">

		a:link,a:visited,a:active {
			text-decoration:none;
		}

		.panel_main { background: #eee; border: solid 1px #ddd; margin: 0 0 22px 0; padding: 20px 25px 20px 25px; position:relative; }

		.panel { padding: 0px; }


		#demo-page .col-xs-9 .chunk .words .v, #demo-page .col-xs-9 .chunk .words .vd, #demo-page .col-xs-9 .chunk .words .vn, #demo-page .col-xs-9 .chunk .words .vshi, #demo-page .col-xs-9 .chunk .words .vyou, #demo-page .col-xs-9 .chunk .words .vf, #demo-page .col-xs-9 .chunk .words .vx, #demo-page .col-xs-9 .chunk .words .vi, #demo-page .col-xs-9 .chunk .words .vl, #demo-page .col-xs-9 .chunk .words .vg, #demo-page .col-xs-9 .chunk .word-mean .v, #demo-page .col-xs-9 .chunk .word-mean .vd, #demo-page .col-xs-9 .chunk .word-mean .vn, #demo-page .col-xs-9 .chunk .word-mean .vshi, #demo-page .col-xs-9 .chunk .word-mean .vyou, #demo-page .col-xs-9 .chunk .word-mean .vf, #demo-page .col-xs-9 .chunk .word-mean .vx, #demo-page .col-xs-9 .chunk .word-mean .vi, #demo-page .col-xs-9 .chunk .word-mean .vl, #demo-page .col-xs-9 .chunk .word-mean .vg

		.dl {
			display: block;
			-webkit-margin-before: 1em;
			-webkit-margin-after: 1em;
			-webkit-margin-start: 0px;
			-webkit-margin-end: 0px;
		}

		.wordcloud {
			height: 3in;
			margin: 0.2in auto;
			padding: 0;
			page-break-after: always;
			page-break-inside: avoid;
			width: 8.5in;
		}

		.affix{
			top: 10px;
		}

		a:VISITED {
			font-size: 200px;
		}

	</style>
</head>
<body  data-spy="scroll" data-target="#sideBar" >
<!-- header start here -->
<%@include file="header.jsp"%>
<!-- header end here -->

<!-- breadcrumb start here -->
<section id="breadcrumb-wrapper">
    <div id="breadcrumb-content">
        <ul>
        	<li><a href="/">首页</a></li>
            <li><a href="#">DEMO演示</a></li>
        </ul>
    </div>
</section>
<!-- breadcrumb end here -->


<!-- maincontent start here -->
<section id="content-wrapper" >

    <div class="divider"></div>

    <div style=" width: 100%" >
      <div class="col-md-2">
        <div  class="list-group" id="sideBar" data-offset-top="230" data-spy="affix" style="width: 166px;" >
          <a href="#" class="list-group-item">导航条</a>
		  <a href="#keyWords" class="list-group-item">关键词提取</a>
		  <a href="#nlpResult" class="list-group-item">中文分词</a>
		  <a href="#summaryStr" class="list-group-item">摘要&高亮</a>
		  <a href="#jianfanpin" class="list-group-item">简繁体&拼音</a>
		  <a href="#parseRelation" class="list-group-item">依存句法</a>
		</div>
      </div>
      <div class="col-md-10" role="main" id="main">

      	<div class=" well" >
			<ul class="pen">
	        	<li>单文本分析</li>
	        </ul>
	        <form method="post">
			<textarea id="content" name="content" class="input">语言是人类区别其他动物的本质特性。在所有生物中，只有人类才具有语言能力。人类的多种智能都与语言有着密切的关系。人类的逻辑思维以语言为形式，人类的绝大部分知识也是以语言文字的形式记载和流传下来的。因而，它也是人工智能的一个重要，甚至核心部分。
用自然语言与计算机进行通信，这是人们长期以来所追求的。因为它既有明显的实际意义，同时也有重要的理论意义：人们可以用自己最习惯的语言来使用计算机，而无需再花大量的时间和精力去学习不很自然和习惯的各种计算机语言；人们也可通过它进一步了解人类的语言能力和智能的机制。</textarea>
			<div  style="text-align:right;padding: 6px;">
			<button type="button" class="btn btn-primary btn-lg" id="reload_content">提交文本</button>
			</div>
			</form>
	    </div>
	    
		<div class="panel panel-default" id="keyWords">
			 <div class="panel-heading">关键词提取</div>
			 <div class="panel-body wordcloud" id="wordcloud">
				
			 </div>
			 <div class="panel-heading text-right">
					<a href="http://ansjsun.github.io/ansj_seg/" target="_blank"><button type="button" class="btn btn-info btn-xs">相关文档</button></a>
					<a href="http://weibo.com/ansjsun" target="_blank"><button type="button" class="btn btn-warning btn-xs">联系作者</button></a>
					<a href="https://github.com/ansjsun/ansj_seg" target="_blank"><button type="button" class="btn btn-success btn-xs">项目主页</button></a>
			 </div>
		</div>


		<!-- Nav tabs -->
		<div class="panel panel-default" id="nlpResult">
			<ul class="nav nav-tabs">
			  <li class="active"><a href="#nlp_seg" data-toggle="tab">NLP分词</a></li>
			  <li><a href="#to_seg" data-toggle="tab">精准分词</a></li>
			  <li><a href="#dic_seg" data-toggle="tab">词典优先分词</a></li>
			  <li><a href="#index_seg" data-toggle="tab">索引分词</a></li>
			  <li><a href="#base_seg" data-toggle="tab">细颗粒度分词</a></li>
			</ul>

			<!-- Tab panes -->
			<div class="tab-content">
			  <div class="tab-pane active" id="nlp_seg">
				 <div class="panel-body">
				 	<dl style="line-height: 32px;" id="nlp_seg_result"></dl>
				 </div>
			  </div>
			  <div class="tab-pane" id="to_seg">
			  	 <div class="panel-body">
				 	<dl style="line-height: 32px;" id="to_seg_result">
				 	</dl>
				 </div>
			  </div>
			  <div class="tab-pane" id="dic_seg">
				 <div class="panel-body">
				 	<dl style="line-height: 32px;" id="dic_seg_result"></dl>
				 </div>
			  </div>
			  <div class="tab-pane" id="index_seg">
				  <div class="panel-body">
				 	<dl style="line-height: 32px;" id="index_seg_result"></dl>
				  </div>
			  </div>
			  <div class="tab-pane" id="base_seg">
			  	   <div class="panel-body">
				 		<dl style="line-height: 32px;" id="base_seg_result"></dl>
					</div>
			  </div>
			</div>
			<div class="panel-heading text-right">
					<a href="http://ansjsun.github.io/ansj_seg/" target="_blank"><button type="button" class="btn btn-info btn-xs">相关文档</button></a>
					<a href="http://weibo.com/ansjsun" target="_blank"><button type="button" class="btn btn-warning btn-xs">联系作者</button></a>
					<a href="https://github.com/ansjsun/ansj_seg" target="_blank"><button type="button" class="btn btn-success btn-xs">项目主页</button></a>
			 </div>
		</div>

		<div class="panel panel-default" id="summaryStr">
			 <div class="panel-heading">摘要&高亮</div>
			 <div class="panel-body">
			 <pre style="font-size: 20px;" id="summaryStr_result"></pre>
			  </div>
			  <div class="panel-heading text-right">
					<a href="http://ansjsun.github.io/ansj_seg/" target="_blank"><button type="button" class="btn btn-info btn-xs">相关文档</button></a>
					<a href="http://weibo.com/ansjsun" target="_blank"><button type="button" class="btn btn-warning btn-xs">联系作者</button></a>
					<a href="https://github.com/ansjsun/ansj_seg" target="_blank"><button type="button" class="btn btn-success btn-xs">项目主页</button></a>
			 </div>
		</div>

		<div class="panel panel-default" id="jianfanpin" >
			 <ul class="nav nav-tabs">
			  <li class="active"><a href="#jian" data-toggle="tab">繁体中文</a></li>
			  <li><a href="#fan" data-toggle="tab">简体中文</a></li>
			  <li><a href="#pin" data-toggle="tab">汉语拼音</a></li>
			</ul>

			<!-- Tab panes -->
			<div class="tab-content">
			  <div class="tab-pane active" id="jian">
				 <div class="panel-body">
			 		<pre style="font-size: 20px;" id="j2f_result">{{fanStr }}</pre>
			     </div>
			  </div>
			  <div class="tab-pane" id="fan">
			  	 <div class="panel-body">
			 		<pre style="font-size: 20px;" id="f2j_result">{{jianStr }}</pre>
			     </div>
			  </div>
			  <div class="tab-pane" id="pin">
				 <div class="panel-body">
			 		<pre style="font-size: 20px;" id="pinyin_result">{{pinStr }}</pre>
			     </div>
			  </div>
			</div>
			<div class="panel-heading text-right">
					<a href="https://github.com/NLPchina/nlp-lang" target="_blank"><button type="button" class="btn btn-success btn-xs">项目主页</button></a>
			 </div>
		</div>

	
		<div class="panel panel-default" id="parseRelation">
			<div class="panel-heading">依存句法</div>
			<div>
				<iframe src=""  width="100%" height="500px;" frameborder="0" id="prFrame" name="prFrame"></iframe>
			</div>
			<div class="panel-heading text-right">
					<a href="https://github.com/milkcat/MilkCat" target="_blank"><button type="button" class="btn btn-info btn-xs">相关文档</button></a>
					<a href="http://weibo.com/u/2605372777" target="_blank"><button type="button" class="btn btn-warning btn-xs">联系作者</button></a>
					<a href="https://github.com/milkcat/MilkCat" target="_blank"><button type="button" class="btn btn-success btn-xs">项目主页</button></a>
			 </div>
		</div>


      </div>
    </div>
</section>


<!-- footer start here -->
<%@include file="foot.jsp"%>
<!-- footer end here -->

<form action="http://milkcat.io/tree2svg?ct=svg" METHOD=POST id="syntactic" target="prFrame" onsubmit="setContent()">
	<textarea name="q" style="width:0px;height:0px;" id="milkcat"></textarea>
</form>

<!-- maincontent end here -->
<script type="text/javascript">


function setContent(){
	var text = $("#content").val() ;
	$("#milkcat").val(text) ;
}


function init(){
	
	var text = $("#content").val() ;
	
	
	$.post('http://www.nlpcn.org:9999/api/SegApi/toSeg',{content: text},function(result){
		$("#to_seg_result").empty() ;
		result.obj.forEach(function(term){
			$("#to_seg_result").append('<dd class="word_'+term.natureStr+' word_width">'+term.name+'</dd>\n');			
		});
	});
	
	$.post('http://www.nlpcn.org:9999/api/SegApi/nlpSeg',{content: text},function(result){
		$("#nlp_seg_result").empty() ;
		result.obj.forEach(function(term){
			$("#nlp_seg_result").append('<dd class="word_'+term.natureStr+' word_width">'+term.name+'</dd>\n');			
		});
	});
	
	$.post('http://www.nlpcn.org:9999/api/SegApi/indexSeg',{content: text},function(result){
		$("#index_seg_result").empty() ;
		result.obj.forEach(function(term){
			$("#index_seg_result").append('<dd class="word_'+term.natureStr+' word_width">'+term.name+'</dd>\n');			
		});
	});
	
	$.post('http://www.nlpcn.org:9999/api/SegApi/baseSeg',{content: text},function(result){
		$("#base_seg_result").empty() ;
		result.obj.forEach(function(term){
			$("#base_seg_result").append('<dd class="word_'+term.natureStr+' word_width">'+term.name+'</dd>\n');			
		});
	});
	
	$.post('http://www.nlpcn.org:9999/api/SegApi/dicSeg',{content: text},function(result){
		$("#dic_seg_result").empty() ;
		result.obj.forEach(function(term){
			$("#dic_seg_result").append('<dd class="word_'+term.natureStr+' word_width">'+term.name+'</dd>\n');			
		});
	});
	
	
	$.post('http://www.nlpcn.org:9999/api/KeywordsApi/keyword',{content: text},function(result){
		$("#wordcloud").empty() ;
	    result.obj.forEach(function(term , index){
	    	console.log(term) ;
	    	$("#wordcloud").append('<span data-weight="'+(30-index<10?10:30-index)+'">'+term.name+'</span>');	
	    });
	    
	    $("#wordcloud").awesomeCloud({
    		"size" : {
    			"grid" : 6,
    			"normalize" : false
    		},
    		"options" : {
    			"color" : "random-dark",
    			"rotationRatio" : 0.3,
    			"printMultiplier" : 1,
    			"sort" : "highest"
    		},
    		"shape" : "square"
    	});
	});
	

	$.post('http://www.nlpcn.org:9999/api/NlplangApi/j2f',{content: text},function(result){
		$("#j2f_result").empty() ;
	    $("#j2f_result").html(result.obj);
	});
	
	$.post('http://www.nlpcn.org:9999/api/NlplangApi/f2j',{content: text},function(result){
		$("#f2j_result").empty() ;
	    $("#f2j_result").html(result.obj);
	});


	$.post('http://www.nlpcn.org:9999/api/NlplangApi/pinyin',{content: text},function(result){
		$("#pinyin_result").empty() ;
	    $("#pinyin_result").html(result.obj);
	});
	
	$.post('http://www.nlpcn.org:9999/api/KeywordsApi/summary',{content: text},function(result){
		$("#summaryStr_result").empty() ;
	    $("#summaryStr_result").html(result.obj);
	});
	
	
	$('#syntactic').submit() ;
}



$(document).ready(function(){
	init();
	
	$('#reload_content').click(function(){
		init() ;
	});
});

//收集所有的div top
var div_top_arr = new Array();

$(".panel-default").each(function(index,element){
	var obj = [element.id,$(element).offset().top];
	div_top_arr.push(obj) ;
}) ;


var active = null ;
var oldActive = null ;

$(window).scroll(function() {
	oldActive = active ;
	 $.each(div_top_arr, function(index,value) {
		 active = value[0] ;
		 if($(window).scrollTop()<value[1]){
			 return false;
		 }
	 });

	 if(active==oldActive){
		 return false ;
	 }

	 console.log(active+"   "+oldActive)

	 $("[href='#"+active+"']").addClass("active") ;
	 $("[href='#"+oldActive+"']").removeClass("active") ;
});
</script>
<!-- footer start here -->
<!-- footer end here -->
</body>
</html>
