<%@page language="java" pageEncoding="UTF-8"%>
<%@include file="/common/taglibs.jsp"%>
<!DOCTYPE html>
<html lang="cn">
<head>
<meta charset="utf-8">
<title>NLPChina 在线文档工具</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<!--[if lte IE 8]><link rel="stylesheet" href="${ctx }/document/css/responsive-nav.css"><![endif]-->
	<!--[if gt IE 8]><!-->
	<link rel="stylesheet" href="${ctx }/document/css/view_styles.css">
	
	<!--<![endif]-->
	<script src="${ctx }/js/jquery.min.js"></script>
	 <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="http://cdn.bootcss.com/html5shiv/3.7.0/html5shiv.min.js"></script>
      <script src="http://cdn.bootcss.com/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
	
	<style type="text/css">
		.CodeMirror{
	      font-size: 12px;
     	  line-height: 3.0em
	    }
	    
	    
		.main {
		  padding-left: 4em;
		  padding-top: 2em ;
	    }
	    
		<c:if test="${docMenu==null}">    
		@media screen and (min-width: 76em) {
		  .nav-collapse { width: 0em }
		  .main { width: auto; left: 0em }
		}
		</c:if>
		
		<c:if test="${docMenu!=null}">    
		@media screen and (min-width: 76em) {
		  .nav-collapse { width: 18em }
		  .main { width: auto; left: 18em }
		}
		</c:if>
	</style>
    
</head>
<body>
	
    <div class="container">
    	<!--多文档编辑-->
		<div id="menu_div" class="nav-collapse">
			<ul id="menu">
				<li class='active'><a href='/docs/${docMenu.id }'>文档首页</a></li>
				${docMenu.html }
			</ul>
		</div>
		
		<div class="main" id="main_div">
			<iframe src="${ctx }/document/view.jsp" name="docEditor" id="docEditor" width="100%" height="100%" frameborder="no" border="0" marginwidth="0" marginheight="0" scrolling="no" allowtransparency="yes"></iframe>
			<textarea style="display: none;" id="document.content" name="document.content">${document.content}</textarea>
		</div>
	</div> <!-- /container -->
	
	<script type="text/javascript">
		
		$(document).ready(function(){
			$("#docEditor").load(function(){
				var mainheight = $(this).contents().find("body").height()+30;
				$(this).height(mainheight);
			}); 
		}) ;
	</script>
</body>
</html>
