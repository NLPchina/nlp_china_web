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
    <div id="thelist" class="uploader-list"></div>
    <div class="btns">
        <div id="picker" class="webuploader-container"><div class="webuploader-pick">选择文件</div><div 

id="rt_rt_18rpcbhf81i7712lr19ev1m9d1sqb1" style="position: absolute; top: 0px; left: 0px; bottom: auto; right: auto; overflow: 

hidden; width: 88px; height: 34px;"><input type="file" multiple="multiple" style="position: absolute; clip: rect(1px 1px 1px 

1px);"><label style="opacity: 0; width: 100%; height: 100%; display: block; cursor: pointer; background: rgb(255, 255, 

255);"></label></div></div>
        <button id="ctlBtn" class="btn btn-default">开始上传</button>
    </div>
</div>
<script type="text/javascript">
    // 添加全局站点信息
    var BASE_URL = '/webuploader';
    </script>
    <script type="text/javascript" src="${ctx }/admin/dist/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="${ctx }/admin/dist/bootstrap.min.js"></script>
    <script type="text/javascript" src="${ctx }/admin/dist/global.js"></script>
    
        <script type="text/javascript" src="${ctx }/admin/dist/webuploader.js"></script>
    
        <script type="text/javascript" src="${ctx }/admin/dist/getting-started.js"></script>
    
    <script type="text/javascript">
    var _bdhmProtocol = (("https:" == document.location.protocol) ? " https://" : " http://");
    document.write(unescape("%3Cscript src='" + _bdhmProtocol + "hm.baidu.com/h.js%3F67c4841095cbee8275705e1f6224a3c7' 

type='text/javascript'%3E%3C/script%3E"));
    </script><script src="${ctx }/admin/dist/h.js" type="text/javascript"></script>
    
    
</body></html>