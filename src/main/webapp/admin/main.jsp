<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>NLPChina</title>
<meta name="description" content="">

<meta name="viewport" content="width=device-width">

<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/style.css">
</head>
<body>
<div class="topbar clearfix">
	<div class="container-fluid">
		<a href="dashboard.html" class='company'>NLPChina 后台管理</a>
		<ul class='mini'>
			<li class='dropdown dropdown-noclose supportContainer'>
				<a href="${ctx }/admin/resource/list" class='dropdown-toggle' target="iframepage">
					<img src="img/icons/fugue/book-question.png" alt="">
					资源管理
				</a>
			</li>
			<li class='dropdown pendingContainer'>
				<a href="http://ansjsun.github.io/ansj_seg/" class='dropdown-toggle' target="iframepage">
					<img src="img/icons/fugue/document-task.png" alt="">
					文档管理
				</a>
			</li>
			<li class='dropdown messageContainer' target="iframepage">
				<a href="#" class='dropdown-toggle' data-toggle='dropdown'>
					<img src="img/icons/fugue/balloons-white.png" alt="">
					访谈管理
				</a>
			</li>
			<li>
				<a href="${ctx }/admin/user/list" target="iframepage">
					<img src="img/icons/fugue/gear.png" alt="">
					用户管理
				</a>
			</li>
			<c:if test="${userInfo!=null }" >
			<li>
				<a href="${ctx }/login_out" target="_self">
					<img src="img/icons/fugue/control-power.png" alt="">
					退出${userInfo.name }
				</a>
			</li>
			</c:if>
			<c:if test="${userInfo==null }">
			<li>
				<a href="https://api.weibo.com/oauth2/authorize?client_id=2598075234&response_type=code&redirect_uri=http://www.nlpcn.org/sinaWeibo/login" target="iframepage">
					<img src="img/icons/fugue/control-power.png" alt="">
					微博登陆
				</a>
			</li>
             </c:if>
		</ul>
	</div>
</div>
<div class="breadcrumbs">
	<div class="container-fluid">
		<ul class="bread pull-left">
			<li>
				<a href="dashboard.html"><i class="icon-home icon-white"></i></a>
			</li>
		</ul>
	</div>
</div>


<div class="main">
		<iframe src="${ctx }/admin/resource/list" id="iframepage" name="iframepage" frameBorder=0 scrolling=no width="100%" height="800px;" onLoad="iFrameHeight()" ></iframe>
</div>
</body>

<script type="text/javascript" language="javascript">   
	function iFrameHeight() {   
		var ifm= document.getElementById("iframepage");   
		var subWeb = document.frames ? document.frames["iframepage"].document : ifm.contentDocument;   
		if(ifm != null && subWeb != null) {
		   ifm.height = subWeb.body.scrollHeight;
		}   
	}   
</script>
</html>