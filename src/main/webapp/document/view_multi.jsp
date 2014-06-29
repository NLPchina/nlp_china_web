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
	<link rel="stylesheet" href="${ctx }/document/css/bootstrap.css">
	<script src="${ctx }/document/js/bootstrap.min.js"></script>
	
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
		
		
		a:VISITED {
			font-size: 200px; 
		}
		
	</style>
</head>
<body >
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
<section>   
    
    <div style="padding:50px;" >
      <div class="col-md-3">
        <ul  class="nav nav-pills nav-stacked ;white-space:nowrap;"  >
         	<li><a href='/docs/${docMenu.id }'>文档首页</a></li>
			${docMenu.html }
		</ul>
      </div>
      <div class="col-md-9">
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