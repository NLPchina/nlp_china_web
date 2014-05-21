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
	<link rel="stylesheet" href="${ctx }/document/css/styles.css">
	<!--<![endif]-->
	<script src="${ctx }/document/js/epiceditor.min.js"></script>
	<link rel="stylesheet" href="http://cdn.bootcss.com/twitter-bootstrap/3.0.3/css/bootstrap.min.css">
	<script src="http://cdn.bootcss.com/jquery/1.10.2/jquery.min.js"></script>
	<script src="http://cdn.bootcss.com/twitter-bootstrap/3.0.3/js/bootstrap.min.js"></script>
	 <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="http://cdn.bootcss.com/html5shiv/3.7.0/html5shiv.min.js"></script>
      <script src="http://cdn.bootcss.com/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
</head>
<body>

	
    <div class="navbar navbar-fixed-top navbar-inverse" role="navigation">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">项目名称</a>
        </div>
        <div class="collapse navbar-collapse">
          <ul class="nav navbar-nav">
          	<li><a id="editer_menuBnt" >编辑导航栏</a></li>
            <li><a href="#">导出PDF</a></li>
            <li><a href="#">发布文档</a></li>
          </ul>
          
          <ul class="nav navbar-nav navbar-right">
            <li><a href="#" id="editBtn">编辑模式</a></li>
            <li><a href="#" id="fullscreenBtn">分屏编辑</a></li>
            <li><a href="#" id="previewBtn">预览模式</a></li>
          </ul>
      </div><!-- /.container -->
    </div><!-- /.navbar -->
	</div>

    <div class="container">
		<div role="navigation" id="menu_div" class="nav-collapse">
			<ul id="menu">
${docMenu.html }				
			</ul>
			<form action="${ctx }/doc_menu/save/" method="post">
			<div id="menueditor" style="display: none;"></div>
			<textarea id="menueditorTextarea" name="docMenu.content" style="display: none;">${docMenu.content}</textarea>
			<input type="hidden" name="docMenu.id" value="${docMenu.id }"/>
			<button type="submit" id="save_menuBnt" class="btn btn-default"  style="width: 98% ; display: none ;">保存导航栏</button>
			</form>
		</div>
		
		<div role="main" class="main" id="main_div">
			<div id="epiceditor">
				<textarea id="epiceditor">aaaa</textarea>
			</div>
		</div>
	</div> <!-- /container -->

	<script>
		var mainOpts = {
			container : 'epiceditor',
			textarea : null,
			basePath : '${ctx }/document/',
			clientSideStorage : true,
			localStorageName : 'epiceditor',
			useNativeFullscreen : false,
			parser : marked,
			file : {
				name : 'epiceditor',
				defaultContent : '',
				autoSave : 100
			},
			theme : {
				base : 'themes/base/epiceditor.css',
				preview : 'themes/preview/preview-light.css',
				editor : 'themes/editor/epic-light.css'
			},
			button : {
				preview : false,
				fullscreen : false,
				bar : "hide"
			},
			focusOnLoad : false,
			shortcut : {
				modifier : 18,
				fullscreen : 70,
				preview : 80
			},
			string : {
				togglePreview : 'Toggle Preview Mode',
				toggleEdit : 'Toggle Edit Mode',
				toggleFullscreen : 'Enter Fullscreen'
			},
			autogrow : true
		}
		var editor = new EpicEditor(mainOpts).load();
		
		
		var menuOpts = {
			container : 'menueditor',
			textarea : 'menueditorTextarea',
			basePath : '/document/',
			clientSideStorage : false,
			useNativeFullscreen : false,
			parser : marked,
			file : {
				name : 'epiceditor',
				defaultContent : '',
				autoSave : 100
			},
			theme : {
				base : 'themes/base/epiceditor.css',
				preview : 'themes/preview/preview-dark.css',
				editor : 'themes/editor/epic-dark.css'
			},
			button : {
				preview : false,
				fullscreen : false,
				bar : "hide"
			},
			focusOnLoad : false,
			shortcut : {
				modifier : 18,
				fullscreen : 70,
				preview : 80
			},
			string : {
				togglePreview : 'Toggle Preview Mode',
				toggleEdit : 'Toggle Edit Mode',
				toggleFullscreen : 'Enter Fullscreen'
			},
			autogrow : false
		}
		
		previewBtn.onclick = function () {
			$('#main_div').css("padding","3em 4em") ;		
			editor.preview();
		}
		
		editBtn.onclick = function(){
			$('#main_div').css("padding","0.1em 0.1em") ;
			editor.edit();
		}
		
		fullscreenBtn.onclick = function () {
			  if (!editor.is('loaded')) { return; }
			  
			  editor.enterFullscreen();
		}
		

		var menueditor = null ;
		
		editer_menuBnt.onclick = function () {
			$('#menu').css("display","none") ;
			$('#menueditor').css("display","block") ;
			$('#menueditor').height("500px") ;
			$('#save_menuBnt').css("display","block") ;	
			if(menueditor==null){
				menueditor = new EpicEditor(menuOpts).load();
			}
		}
		
		
		editor.getElement('editor').body.innerHTML
		
	</script>
</body>
</html>
