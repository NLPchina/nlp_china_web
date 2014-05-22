<%@page language="java" pageEncoding="UTF-8"%>
<%@include file="/common/taglibs.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<title>Markdown Editor</title>
	<script src="${ctx }/js/jquery.min.js"></script>
	<script src="${ctx}/document/js/marked.js"></script>
	<script src="${ctx}/document/js/highlight.pack.js"></script>
	<link href="${ctx}/document/css/hightlight.css" media="all" rel="stylesheet" type="text/css">
	<link href="${ctx}/document/css/github.css" media="all" rel="stylesheet" type="text/css">
</head>
<body>
	<div class="only-with-full-nav"></div>
  	<article class="markdown-body entry-content" itemprop="mainContentOfPage" id="out">
  	</article>

  <script>
  	$(document).ready(function(){
		$("#out").html(marked(parent.window.document.getElementById('document.content').value));
		hljs.initHighlighting();
	});
  </script>
</body>
</html>
