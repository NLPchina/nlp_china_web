<%@page language="java" pageEncoding="UTF-8"%>
<%@include file="/common/taglibs.jsp"%>
<!DOCTYPE HTML>
<html lang="en-US">
<head prefix="og: http://ogp.me/ns# book: http://ogp.me/ns/book#">

<meta charset="UTF-8">
<title>中国自然语言开源组织</title>
<meta content="text/html; charset=utf-8" http-equiv="Content-Type">
<meta name="robots" content="index, follow">
<meta name="author" content="RichardHightower">
<meta name="description"
	content="This books covers new ways to write Java services.">
<meta name="keywords" content="gitbook,github">
<meta name="generator" content="www.gitbook.io">


<meta property="og:title"
	content="Introduction | Reactive Java Programming">
<meta property="og:site_name" content="Reactive Java Programming">
<meta property="og:type" content="book">
<meta property="og:locale" content="en_US">

<meta property="book:author"
	content="https://github.com/RichardHightower">
<meta property="book:tag" content="GitBook">

<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">

<link rel="shortcut icon" href="${ctx}/images/favicon.ico" />
</head>
<body>


	<link rel="stylesheet" href="${ctx}/document/gitbook/style.css">

	<link rel="stylesheet" href="${ctx}/document/gitbook/style_icon.css">



	<div class="book" data-github="RichardHightower/reactive-java-book"
		data-level="0" data-basepath="." data-revision="1398441413760">
		<div class="book-header">
			<!-- Actions Left -->
			<!--
    <a href="https://github.com/RichardHightower/reactive-java-book" target="_blank" class="btn pull-left"><i class="fa fa-github-alt"></i></a>
    -->
			<a href="#" class="btn pull-left toggle-summary"><i
				class="fa fa-align-justify"></i></a>
			<!--
    <a href="#" class="btn pull-left toggle-search"><i class="fa fa-search"></i></a>
    -->
			<span id="font-settings-wrapper"> <a href="#"
				class="btn pull-left toggle-font-settings"><i class="fa fa-font"></i>
			</a>
				<div class="dropdown-menu font-settings">
					<div class="dropdown-caret">
						<span class="caret-outer"></span> <span class="caret-inner"></span>
					</div>

					<div class="btn-group btn-block">
						<button id="reduce-font-size" class="btn btn-default">A</button>
						<button id="enlarge-font-size" class="btn btn-default">A</button>
					</div>

					<ul class="list-group font-family-list">
						<li class="list-group-item" data-font="0">Serif</li>
						<li class="list-group-item" data-font="1">Sans</li>
					</ul>

					<div class="btn-group btn-group-xs btn-block color-theme-list">
						<button type="button" class="btn btn-default"
							id="color-theme-preview-0" data-theme="0">White</button>
						<button type="button" class="btn btn-default"
							id="color-theme-preview-1" data-theme="1">Sepia</button>
						<button type="button" class="btn btn-default"
							id="color-theme-preview-2" data-theme="2">Night</button>
					</div>
				</div>

			</span>

			<!-- Actions Right -->
			<a href="#" target="_blank" class="btn pull-right"
				data-sharing="google-plus" title="分享到新浪微博"><i class="icon-weibo"></i></a> <a
				href="#" target="_blank" class="btn pull-right"
				data-sharing="facebook" title="分享到腾讯微博"><i class="icon-tengxunweibo"></i></a> <a
				href="#" target="_blank" class="btn pull-right"
				data-sharing="twitter" title="分享到twitter"><i class="fa fa-twitter"></i></a>


			<!--<a href="https://github.com/RichardHightower/reactive-java-book/stargazers" target="_blank" class="btn pull-right count-star"><i class="fa fa-star-o"></i> Star (<span>-</span>)</a>
    <a href="https://github.com/RichardHightower/reactive-java-book/watchers" target="_blank" class="btn pull-right count-watch"><i class="fa fa-eye"></i> Watch (<span>-</span>)</a>
    -->

			<!-- Title -->
			<h1>
				<a href="${ctx }/"><img src="${ctx }/images/logo.png"
					height="100px" alt="mainlogo" /></a>
			</h1>
		</div>

		<div class="book-summary">

			<!--
    <div class="book-search">
        <input type="text" placeholder="Search" class="form-control" />
    </div>
    -->

			<ul class="summary">

				<li><a href="${user.url }"
					target="blank">About the author</a></li>
				<li><a
					href="${user.url }"
					target="blank"><img src="${user.profileImageUrl }"/></a></li>
				
				<li class="divider"></li>
				<c:if test="${ prepage==null }">
					<li style='background-color: white' data-level="0"
						data-path="/docs/${docMenu.id }"><a
						href="/docs/${docMenu.id }"> 文档首页</a></li>
				</c:if>
				<c:if test="${ prepage!=null }">
					<li data-level="0" data-path="/docs/${docMenu.id }"><a
						href="/docs/${docMenu.id }"> 文档首页</a></li>
				</c:if>

				${docMenu.html }

			</ul>
		</div>

		<div class="book-body">
			<div class="body-inner">
				<div class="page-wrapper" tabindex="-1">
					<div class="book-progress">
						<div class="bar">
							<div class="inner" style="width: 0%;min-width: ${progress}%;"></div>
						</div>

					</div>

					<div class="page-inner">

						<section class="normal" id="section-gitbook_3">

							${document.content}</section>

					</div>
				</div>
			</div>


			<c:if test="${ nextpage!=null}">
				<a href="/docs/${docMenu.id }/${nextpage}"
					class="navigation navigation-next"><i class="fa fa-angle-right"></i></a>
			</c:if>
			<c:if test="${ prepage!=null&& prepage!=-1 }">
				<a href="/docs/${docMenu.id }/${prepage}"
					class="navigation navigation-prev"><i class="fa fa-angle-left"></i></a>
			</c:if>
			<c:if test="${ prepage==-1 }">
				<a href="/docs/${docMenu.id }" class="navigation navigation-prev"><i
					class="fa fa-angle-left"></i></a>
			</c:if>
		</div>
	</div>



	<script src="https://cdnjs.cloudflare.com/ajax/libs/ace/1.1.3/ace.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/ace/1.1.3/mode-javascript.js"></script>
	<script src="${ctx}/document/gitbook/jsrepl/jsrepl.js"
		id="jsrepl-script"></script>
	<script src="${ctx}/document/gitbook/app.js"></script>



	<script
		src="${ctx}/document/gitbook/plugins/gitbook-plugin-mixpanel/plugin.js"></script>



	<script
		src="http://cdn.mathjax.org/mathjax/2.0-latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML"></script>



	<script
		src="${ctx}/document/gitbook/plugins/gitbook-plugin-mathjax/plugin.js"></script>


	<script>
require(["gitbook"], function(gitbook) {
    var config = {};
    gitbook.start(config);
});
</script>

</body>
</html>
