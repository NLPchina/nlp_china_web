<%@page language="java" pageEncoding="UTF-8"%>
<%@include file="/common/taglibs.jsp"%>
<!DOCTYPE html>
<!--[if lt IE 7]> <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang="en"> <![endif]-->
<!--[if IE 7]>    <html class="no-js lt-ie9 lt-ie8" lang="en"> <![endif]-->
<!--[if IE 8]>    <html class="no-js lt-ie9" lang="en"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang="cn"> <!--<![endif]-->

<head>
		
	<!-- ////////////////////////////////// -->
	<!-- //      Stylesheets Files       // -->
	<!-- ////////////////////////////////// -->
	<link rel="stylesheet" href="${ctx}/css/framework.css" />
	<link rel="stylesheet" href="${ctx}/css/style.css" />
	<link rel="stylesheet" href="${ctx}/css/noscript.css" media="screen,all" id="noscript" />
	  
	<!-- ////////////////////////////////// -->
	<!-- //     Google Webfont Files     // -->
	<!-- ////////////////////////////////// -->
	<link rel="stylesheet" href="${ctx}/css/family.css" />
	
	<!-- ////////////////////////////////// -->
	<!-- //        Favicon Files         // -->
	<!-- ////////////////////////////////// -->
	<link rel="shortcut icon" href="${ctx}/images/favicon.ico" />
	
	<!-- ////////////////////////////////// -->
	<!-- //      Javascript Files        // -->
	<!-- ////////////////////////////////// -->
	<script src="${ctx}/js/jquery.min.js"></script>
	<script src="${ctx}/js/tooltip.js"></script>
	<script src="${ctx}/js/dropdown.js"></script>
	<script src="${ctx}/js/tinynav.min.js"></script>
	<script src="${ctx}/js/camera.min.js"></script>
	<script src="${ctx}/js/jquery.fancybox.js?v=2.0.6"></script>
	<script src="${ctx}/js/jquery.fancybox-media.js?v=1.0.3"></script>
	<script src="${ctx}/js/jquery.ui.totop.min.js"></script>
	<script src="${ctx}/js/ddaccordion.js"></script>
	<script src="${ctx}/js/jquery.twitter.js"></script>
	<script src="${ctx}/js/jflickrfeed.min.js"></script>
	<script src="${ctx}/js/faq-functions.js"></script>
	<script src="${ctx}/js/theme-functions.js"></script>
	 
	
	<title>中国自然语言开源组织</title>
	<link rel="stylesheet" href="http://cdn.bootcss.com/twitter-bootstrap/3.0.3/css/bootstrap.min.css">
	<script src="http://cdn.bootcss.com/jquery/1.10.2/jquery.min.js"></script>
	<script src="http://cdn.bootcss.com/twitter-bootstrap/3.0.3/js/bootstrap.min.js"></script>
	
	<script src="${ctx}/document/js/marked.js"></script>
	<script src="${ctx}/document/js/highlight.pack.js"></script>
	<link href="${ctx}/document/css/hightlight.css" media="all" rel="stylesheet" type="text/css">
	<link href="${ctx}/document/css/github.css" media="all" rel="stylesheet" type="text/css">
	
	
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
	
		.affix{
			top: 10px;
		}
		
		a:VISITED {
			font-size: 200px; 
		}
		
	</style>
</head>
<body  data-spy="scroll" data-target="#sideBar">
<!-- header start here -->
<%@include file="/header.jsp"%>
<!-- header end here -->

<!-- breadcrumb start here -->
<section id="breadcrumb-wrapper">
    <div id="breadcrumb-content">
        <ul>
        	<li><a href="/">首页</a></li>
            <li><a href="#">多文档查看</a></li>
        </ul>
    </div>
</section>
<!-- breadcrumb end here -->


<!-- maincontent start here -->
<section id="content-wrapper">   
    
    <div style=" width: 100%" >
      <div class="col-md-2">
        <div  class="list-group" id="sideBar" data-offset-top="230" data-spy="affix" style="width: 166px;" >
         	<a class="list-group-item" href='/docs/${docMenu.id }'>文档首页</a>
			${docMenu.html }
		</div>
      </div>
      <div class="col-md-10">
      		<article id="content" class="markdown-body entry-content" itemprop="mainContentOfPage" id="out" style="padding-left: 8px;">
      		<!-- 
			<iframe src="${ctx }/document/view.jsp" name="docEditor" id="docEditor" width="100%" height="500px;" frameborder="no" border="0" marginwidth="0" marginheight="0" scrolling="no" onLoad="iFrameHeight()"></iframe>
			-->
			<textarea style="display: none;" id="document.content" name="document.content">${document.content}</textarea>
			 
			</article>
      </div>
    </div>
</section>
<!-- maincontent end here -->

<script>
  	$(document).ready(function(){
		$("#content").html(marked(document.getElementById('document.content').value));
		hljs.initHighlighting();
	});
  </script>
</body>
</html>