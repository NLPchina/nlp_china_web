<%@page language="java" pageEncoding="UTF-8"%>
<%@include file="/common/taglibs.jsp"%>
<!doctype html>
<html lang="en"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>
            快速开始 - Web Uploader
        </title>

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
    <link rel="shortcut icon" href="http://gmuteam.github.io/webuploader/images/favicon.ico">
    <link rel="stylesheet" type="text/css" href="${ctx }/admin/dist/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="${ctx }/admin/dist/bootstrap-theme.min.css">
    <link rel="stylesheet" type="text/css" href="${ctx }/admin/dist/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="${ctx }/admin/dist/syntax.css">
    <link rel="stylesheet" type="text/css" href="${ctx }/admin/dist/style.css">
    
    <link rel="stylesheet" type="text/css" href="${ctx }/admin/dist/webuploader.css">
    
<style type="text/css"></style></head>

<body>

<div id="uploader" class="wu-example">
    <!--用来存放文件信息-->
    <div id="thelist" class="uploader-list"></div>
    <div class="btns">
        <div id="picker">选择文件</div>
        <button id="ctlBtn" class="btn btn-default">开始上传</button>
    </div>
</div>
	<script type="text/javascript">
	    // 添加全局站点信息
	    var BASE_URL = '${ctx}/admin';
    </script>
    <script type="text/javascript" src="${ctx }/admin/dist/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="${ctx }/admin/dist/bootstrap.min.js"></script>
    
    <script type="text/javascript" src="${ctx }/admin/dist/webuploader.js"></script>

    <script type="text/javascript" src="${ctx }/admin/dist/getting-started.js"></script>
    
    
</body></html>