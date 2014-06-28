<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>NLPChina</title>
<meta name="description" content="">

<meta name="viewport" content="width=device-width">

<link rel="stylesheet" href="${ctx }/admin/css/bootstrap.css">
<link rel="stylesheet" href="${ctx }/admin/css/style.css">
</head>
<body>
<div class="topbar clearfix">
	<div class="container-fluid">
		<a href="#" class='company'>NLPChina 后台管理</a>
		<ul class='mini'>
		<li class='dropdown dropdown-noclose supportContainer'>
				<a href="${ctx }/" class='dropdown-toggle'>
					<img src="${ctx }/admin/img/icons/fugue/star.png" alt="">
					返回首页
				</a>
			</li>
			<li class='dropdown dropdown-noclose supportContainer'>
				<a href="${ctx }/admin/resource/list" class='dropdown-toggle' target="iframepage">
					<img src="${ctx }/admin/img/icons/fugue/book-question.png" alt="">
					资源管理
				</a>
			</li>
			<li class='dropdown pendingContainer'>
				<a href="${ctx}/docs/single-list/" class='dropdown-toggle' target="iframepage">
					<img src="${ctx }/admin/img/icons/fugue/document-task.png" alt="">
					文档管理
				</a>
			</li>
			<c:if test="${ sessionScope.userInfo.userType==2 }">
				<li><a href="${ctx }/admin/user/list" target="iframepage">
						<img src="${ctx }/admin/img/icons/fugue/gear.png" alt=""> 用户管理
				</a></li>
			</c:if>
			<li>
				<a href="${ctx }/login_out" target="_self">
					<img src="${ctx }/admin/img/icons/fugue/control-power.png" alt="">
					退出${userInfo.name }
				</a>
			</li>
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