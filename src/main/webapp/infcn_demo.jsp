<%@page language="java" pageEncoding="UTF-8"%>
<%@include file="/common/taglibs.jsp"%>
<!DOCTYPE html>
<!--[if lt IE 7]> <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang="en"> <![endif]-->
<!--[if IE 7]>    <html class="no-js lt-ie9 lt-ie8" lang="en"> <![endif]-->
<!--[if IE 8]>    <html class="no-js lt-ie9" lang="en"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang="cn"> <!--<![endif]-->

<head>
	<%@include file="common/infcn_common.jsp"%>
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
	<title>北京英富森软件股份有限公司_自然语言DEMO</title>
</head>
<body  data-spy="scroll" data-target="#sideBar">
<!-- header start here -->
<%@include file="infcn_header.jsp"%>
<!-- header end here -->

<!-- breadcrumb start here -->
<section id="breadcrumb-wrapper">
    <div id="breadcrumb-content">
        <ul>
            <li><a href="#">DEMO演示</a></li>
        </ul>
    </div>
</section>
<!-- breadcrumb end here -->


<!-- maincontent start here -->
<section id="content-wrapper">

    <div class="divider"></div>

    <div style=" width: 100%" >
      <div class="col-md-2">
        <div  class="list-group" id="sideBar" data-offset-top="230" data-spy="affix" style="width: 166px;" >
          <a href="#" class="list-group-item">导航条</a>
		  <a href="#keyWords" class="list-group-item">关键词提取</a>
		  <a href="#nlpResult" class="list-group-item">中文分词</a>
		  <a href="#summaryStr" class="list-group-item">摘要&高亮</a>
		  <a href="#jianfanpin" class="list-group-item">简繁体&拼音</a>
		  <a href="#parseRelation" class="list-group-item">依存文法</a>
		</div>
      </div>
      <div class="col-md-10" role="main" id="main">

      	<div class=" well" >
			<ul class="pen">
	        	<li>单文本分析</li>
	        </ul>
	        <form  action="${ctx }/" method="post">
			<textarea id="content" name="content" class="input">${content }</textarea>
			<div  style="text-align:right;padding: 6px;">
			<button type="submit" class="btn btn-primary btn-lg">提交文本</button>
			</div>
			</form>
	    </div>

		<div class="panel panel-default" id="keyWords">
			 <div class="panel-heading">关键词提取</div>
			 <div class="panel-body wordcloud" id="wordcloud" >
			 	<c:forEach items="${keyWords }" var="keyWord" varStatus="status">
				<span data-weight="${30-status.index<10?10:30-status.index}">${keyWord.name }</span>
			 	</c:forEach>
			 </div>
			 
		</div>


		<!-- Nav tabs -->
		<div class="panel panel-default" id="nlpResult">
			<ul class="nav nav-tabs">
			  <li class="active"><a href="#nlp_seg" data-toggle="tab">NLP分词</a></li>
			  <li><a href="#to_seg" data-toggle="tab">精准分词</a></li>
			  <li><a href="#index_seg" data-toggle="tab">索引分词</a></li>
			  <li><a href="#min_seg" data-toggle="tab">细颗粒度分词</a></li>
			</ul>

			<!-- Tab panes -->
			<div class="tab-content">
			  <div class="tab-pane active" id="nlp_seg">
				 <div class="panel-body">
				 	<dl style="line-height: 32px;">
			 		<c:forEach items="${nlpResult }" var="word">
			 			<dd class="word_${word[1] } word_width">${word[0] }</dd>
			 		</c:forEach>
			 		</dl>
				 </div>
			  </div>
			  <div class="tab-pane" id="to_seg">
			  	 <div class="panel-body">
				 	<dl style="line-height: 32px;">
			 		<c:forEach items="${toResult }" var="word">
			 			<dd class="word_${word[1] } word_width">${word[0] }</dd>
			 		</c:forEach>
			 		</dl>
				  </div>
			  </div>
			  <div class="tab-pane" id="index_seg">
				  <div class="panel-body">
				 	<dl style="line-height: 32px;">
				 		<c:forEach items="${indexResult }" var="word">
				 			<dd class="word_${word[1] } word_width">${word[0] }</dd>
				 		</c:forEach>
			 		</dl>
				  </div>
			  </div>
			  <div class="tab-pane" id="min_seg">
			  	   <div class="panel-body">
				 		<dl style="line-height: 32px;">
				 		<c:forEach items="${nlpMinResult }" var="word">
				 			<dd class="word_${word[1] } word_width">${word[0] }</dd>
				 		</c:forEach>
				 		</dl>
					</div>
			  </div>
			</div>
			
		</div>

		<div class="panel panel-default" id="summaryStr">
			 <div class="panel-heading">摘要&高亮</div>
			 <div class="panel-body">
			 <pre style="font-size: 20px;">${summaryStr }</pre>
			  </div>
			
		</div>

		<div class="panel panel-default" id="jianfanpin">
			 <ul class="nav nav-tabs">
			  <li class="active"><a href="#jian" data-toggle="tab">繁体中文</a></li>
			  <li><a href="#fan" data-toggle="tab">简体中文</a></li>
			  <li><a href="#pin" data-toggle="tab">汉语拼音</a></li>
			</ul>

			<!-- Tab panes -->
			<div class="tab-content">
			  <div class="tab-pane active" id="jian">
				 <div class="panel-body">
			 		<pre style="font-size: 20px;">${fanStr }</pre>
			     </div>
			  </div>
			  <div class="tab-pane" id="fan">
			  	 <div class="panel-body">
			 		<pre style="font-size: 20px;">${jianStr }</pre>
			     </div>
			  </div>
			  <div class="tab-pane" id="pin">
				 <div class="panel-body">
			 		<pre style="font-size: 12px;">${pinStr }</pre>
			     </div>
			  </div>
			</div>
			
		</div>




		<div class="panel panel-default" id="parseRelation">
			<div class="panel-heading">依存文法</div>
			<div>
					<iframe src=""  width="100%" height="500px;" frameborder="0" id="prFrame" name="prFrame"></iframe>
				</div>
		</div>


      </div>
    </div>
</section>


<!-- footer start here -->
<%@include file="infcn_foot.jsp"%>
<!-- footer end here -->

<form action="http://www.nlpcn.org/syntactic/" METHOD=POST id="syntactic" target="prFrame">
	<textarea name="content" style="width:0px;height:0px;">${content }</textarea>
</form>

<!-- maincontent end here -->
<script type="text/javascript">

document.getElementById("syntactic").submit() ;

$(document).ready(function(){

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

	var pieData = [
					{
						value: 30,
						color:"#F38630"
					},
					{
						value : 50,
						color : "#E0E4CC"
					},
					{
						value : 100,
						color : "#69D2E7"
					}

				];

	var myPie = new Chart(document.getElementById("pieChartCanvas").getContext("2d")).Pie(pieData);


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
