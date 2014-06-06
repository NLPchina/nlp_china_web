<%@page language="java" pageEncoding="UTF-8"%>
<%@include file="/common/taglibs.jsp"%>
<!DOCTYPE html>
<!--[if lt IE 7]> <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang="en"> <![endif]-->
<!--[if IE 7]>    <html class="no-js lt-ie9 lt-ie8" lang="en"> <![endif]-->
<!--[if IE 8]>    <html class="no-js lt-ie9" lang="en"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang="cn"> <!--<![endif]-->

<head>
	<%@include file="/common/common.jsp"%>
	<script src="http://cdn.bootcss.com/jquery/1.10.2/jquery.min.js"></script>
	<script src="http://cdn.bootcss.com/twitter-bootstrap/3.0.3/js/bootstrap.min.js"></script>
	
	

	<script type="text/javascript" language="javascript">
	
		function iFrameHeight() {   
			var ifm= document.getElementById("docEditor");   
			var subWeb = document.frames ? document.frames["docEditor"].document : ifm.contentDocument;   
			if(ifm != null && subWeb != null) {
			   ifm.height = subWeb.body.scrollHeight;
			}   
		}   
	</script>
	
</head>
<body>
<!-- header start here -->
<%@include file="/header.jsp"%>
<!-- header end here -->

<!-- breadcrumb start here -->
<section id="breadcrumb-wrapper">
	<div id="breadcrumb-content">
        <ul>
        	<li><a href="/">首页</a></li>
            <li><a href="#">单文档查看</a></li>
        </ul>
    </div>
</section>
<!-- breadcrumb end here -->


<!-- maincontent start here -->
<section id="content-wrapper">
	<iframe src="${ctx }/document/view.jsp" name="docEditor" id="docEditor" width="100%" height="500px;" frameborder="no" border="0" marginwidth="0" marginheight="0" scrolling="no" allowtransparency="yes" onLoad="iFrameHeight()"></iframe>
	<textarea style="display: none;" id="document.content" name="document.content">${document.content}</textarea>
</section>
<!-- maincontent end here -->


<!-- footer start here -->
<%@include file="/foot.jsp"%>
<!-- footer end here -->
</body>
</html>