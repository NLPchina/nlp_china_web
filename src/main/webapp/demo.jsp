<%@page language="java" pageEncoding="UTF-8"%>
<%@include file="/common/taglibs.jsp"%>
<!DOCTYPE html>
<!--[if lt IE 7]> <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang="en"> <![endif]-->
<!--[if IE 7]>    <html class="no-js lt-ie9 lt-ie8" lang="en"> <![endif]-->
<!--[if IE 8]>    <html class="no-js lt-ie9" lang="en"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang="cn"> <!--<![endif]-->

<head>
	<%@include file="common/common.jsp"%>
	<link rel="stylesheet" href="http://cdn.bootcss.com/twitter-bootstrap/3.0.3/css/bootstrap.min.css">
	<script src="http://cdn.bootcss.com/jquery/1.10.2/jquery.min.js"></script>
	<script src="http://cdn.bootcss.com/twitter-bootstrap/3.0.3/js/bootstrap.min.js"></script>
	<script src="http://indyarmy.com/awesomeCloud/jquery.awesomeCloud-0.2.min.js"></script>
	
	<style type="text/css">
		
		a:link,a:visited,a:active {
			text-decoration:none;
		}
		
		.panel_main { background: #eee; border: solid 1px #ddd; margin: 0 0 22px 0; padding: 20px 25px 20px 25px; position:relative; }
		
		.panel { padding: 0px; }
		
		
		#demo-page .col-xs-9 .chunk .words .v, #demo-page .col-xs-9 .chunk .words .vd, #demo-page .col-xs-9 .chunk .words .vn, #demo-page .col-xs-9 .chunk .words .vshi, #demo-page .col-xs-9 .chunk .words .vyou, #demo-page .col-xs-9 .chunk .words .vf, #demo-page .col-xs-9 .chunk .words .vx, #demo-page .col-xs-9 .chunk .words .vi, #demo-page .col-xs-9 .chunk .words .vl, #demo-page .col-xs-9 .chunk .words .vg, #demo-page .col-xs-9 .chunk .word-mean .v, #demo-page .col-xs-9 .chunk .word-mean .vd, #demo-page .col-xs-9 .chunk .word-mean .vn, #demo-page .col-xs-9 .chunk .word-mean .vshi, #demo-page .col-xs-9 .chunk .word-mean .vyou, #demo-page .col-xs-9 .chunk .word-mean .vf, #demo-page .col-xs-9 .chunk .word-mean .vx, #demo-page .col-xs-9 .chunk .word-mean .vi, #demo-page .col-xs-9 .chunk .word-mean .vl, #demo-page .col-xs-9 .chunk .word-mean .vg
		
		.dl {
			margin-top: 0;
			margin-bottom: 20px;
		}
	
		.wordcloud {
			height: 3in;
			margin: 0.2in auto;
			padding: 0;
			page-break-after: always;
			page-break-inside: avoid;
			width: 7in;
		}
	</style>
</head>
<body>
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
<section id="content-wrapper">   
    
    <div class="divider"></div>
    
    <div style=" width: 100%" >
      <div class="col-md-2">
      <!--  -->
        <div class="list-group" data-spy="affix" >
          <a href="#" class="list-group-item active">导航条</a>
		  <a href="#" class="list-group-item">关键词提取</a>
		  <a href="#" class="list-group-item">NLP分词</a>
		  <a href="#" class="list-group-item">摘要&高亮</a>
		  <a href="#" class="list-group-item">文本分类</a>
		  <a href="#" class="list-group-item">情感分析</a>
		  <a href="#" class="list-group-item">语义联想</a>
		  <a href="#jzfc" class="list-group-item">精准分词</a>
		  <a href="#" class="list-group-item">索引分词</a>
		  <a href="#" class="list-group-item">细粒度分词</a>
		  <a class="list-group-item">依存文法(待续)</a>
		</div>
      </div>
      <div class="col-md-10" role="main">
      
      	<div class=" well" >
			<ul class="pen">
	        	<li>单文本分析</li>                           
	        </ul>
			<textarea id="txt-analysis" class="input">${content }</textarea>
			<div  style="text-align:right;padding: 6px;">
			<button type="button" class="btn btn-primary btn-lg ">提交文本</button>
			</div>
	    </div>
	    
		<div class="panel panel-default">
			 <div class="panel-heading">关键词提取</div>
			 <div class="panel-body wordcloud" id="wordcloud" >
			 	<c:forEach items="${keyWords }" var="keyWord" varStatus="status">
				<span data-weight="${30-status.index<10?10:30-status.index}">${keyWord.name }</span>			 	
			 	</c:forEach>
			 </div>
		</div>
		
		<div class="panel panel-default">
		
			 <div class="panel-heading">NLP分词</div>
			 <div class="panel-body">
			 		<c:forEach items="${nlpResult }" var="word">
			 			${word[0] }
			 		</c:forEach>
			  </div>
		</div>
		
		<div class="panel panel-default">
			 <div class="panel-heading">摘要&高亮</div>
			 <div class="panel-body">
			 		Orange Data for Development is an open data challenge, 
			  </div>
		</div>
		
		
		<div class="panel panel-default">
			 <div class="panel-heading">文本分类</div>
			 <div class="panel-body">
			 		Orange Data for Development is an open data challenge, 
			  </div>
		</div>
		
		
		<div class="panel panel-default">
			 <div class="panel-heading">情感分析</div>
			 <div class="panel-body">
			 		Orange Data for Development is an open data challenge, 
			  </div>
		</div>
		
		
		<div class="panel panel-default" id="jzfc">
			 <div class="panel-heading">精准分词</div>
			 <div class="panel-body">
			 		Orange Data for Development is an open data challenge, 
			  </div>
		</div>
		
		<div class="panel panel-default">
			 <div class="panel-heading">索引分词</div>
			 <div class="panel-body">
			 		Orange Data for Development is an open data challenge, 
			  </div>
		</div>
		
		<div class="panel panel-default">
			 <div class="panel-heading">语义联想</div>
			 <div class="panel-body">
			 		Orange Data for Development is an open data challenge, 
			  </div>
		</div>
		
		<div class="panel panel-default">
			 <div class="panel-heading">细粒度分词</div>
			 <div class="panel-body">
			 		Orange Data for Development is an open data challenge, 
			  </div>
		</div>
		
		
		<div class="panel panel-default">
			 <div class="panel-heading">关键词提取</div>
			 <div class="panel-body">
			 		Orange Data for Development is an open data challenge, 
			  </div>
		</div>
		
		<div class="panel panel-default">
			 <div class="panel-heading">关键词提取</div>
			 <div class="panel-body">
			 		Orange Data for Development is an open data challenge, 
			  </div>
		</div>
      </div>
    </div>
</section>
<!-- maincontent end here -->
<script type="text/javascript">

$(document).ready(function(){
	$("#wordcloud").awesomeCloud({
		"size" : {
			"grid" : 12,
		},
		"options" : {
			"color" : "random-dark",
			"rotationRatio" : 0.3,
			"printMultiplier" : 3,
			"sort" : "random"
		},
		"font" : "'Times New Roman', Times, serif",
		"shape" : "square"
	});
	
	$('#myAffix').affix({
	    offset: {
	      top: 100
	    , bottom: function () {
	        return (this.bottom = $('.bs-footer').outerHeight(true))
	      }
	    }
	  })
});
</script>
<!-- footer start here -->
<!-- footer end here -->
</body>
</html>