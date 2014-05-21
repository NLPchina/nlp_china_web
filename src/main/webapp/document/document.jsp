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
	<link rel="stylesheet" href="http://cdn.bootcss.com/twitter-bootstrap/3.0.3/css/bootstrap.min.css">
	<script src="http://cdn.bootcss.com/jquery/1.10.2/jquery.min.js"></script>
	<script src="http://cdn.bootcss.com/twitter-bootstrap/3.0.3/js/bootstrap.min.js"></script>
	 <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="http://cdn.bootcss.com/html5shiv/3.7.0/html5shiv.min.js"></script>
      <script src="http://cdn.bootcss.com/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
	<script src="${ctx}/document/codemirror/lib/codemirror.js"></script>
	<link rel="stylesheet" href="${ctx}/document/codemirror/lib/codemirror.css">
	
	<style type="text/css">
		.CodeMirror{
	      font-size: 12px;
     	  line-height: 3.0em
	    }
	</style>
    
</head>
<body>
    <div class="navbar navbar-fixed-top navbar-inverse" role="navigation">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">项目名称</a>
        </div>
        <!--  -->
        <div class="collapse navbar-collapse">
          <ul class="nav navbar-nav">
          	<c:if test="${canEditor }">
          	<li><a id="editer_menuBnt" >编辑导航栏</a></li>
          	</c:if>
            <li><a href="#">下载PDF</a></li>
          </ul>
          
          <ul class="nav navbar-nav navbar-right">
          	<c:if test="${canEditor }">
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown">编辑模式 <b class="caret"></b></a>
              <ul class="dropdown-menu">
                  <li><a href="#" id="editBtn">编辑模式</a></li>
          		  <li><a href="#" id="previewBtn">预览模式</a></li>
           		  <li><a href="#" id="fullscreenBtn">分屏编辑</a></li>
              </ul>
            </li>
            <li><a href="#" id="saveDocumentBnt">保存文档</a></li>
          </ul>
          </c:if>
          <span class="icon-bar"></span>
      </div><!-- /.container -->
	</div>
	
	
    <div class="container">
		<div id="menu_div" class="nav-collapse">
			<ul id="menu">
				${docMenu.html }
			</ul>
			<div id="menu_editor" style="background-color: white; display: none;" >
			<form action="${ctx }/doc_menu/save/" method="post">
			<textarea id="menueditor" name="docMenu.content">${docMenu.content}</textarea>
			<input type="hidden" name="docMenu.id" value="${docMenu.id }"/>
			<button type="submit" id="save_menuBnt" class="btn btn-default"  style="width: 98% ; ">保存导航栏</button>
			</form>
			</div>
		</div>
		
		<div class="main" id="main_div">
			<iframe src="${ctx }/document/editor.jsp" name="docEditor" id="docEditor" width="100%" height="100%" frameborder="no" border="0" marginwidth="0" marginheight="0" scrolling="no" allowtransparency="yes"></iframe>
			<form action="${ctx }/doc/save/" id="doc_save_form" method="post">
			<textarea rows="0" cols="0" id="document.content" name="document.content">${document.content}</textarea>
			<input type="hidden" id="document.id" name="document.id" value="${document.id }"/>
			<c:if test="${canEditor }">
				<!-- 如果网页是可编辑的,那么隐藏域带上编辑代码 -->
				<input type="hidden" id="document.extractingCode" name="document.extractingCode" value="${docMenu.extractingCode }"/>
			</c:if>
			<input type="hidden" id="document.menu_id" name="document.menu_id" value="${document.menuId }"/>
			</form>
		</div>
	</div> <!-- /container -->

	<script>
		/* previewBtn.onclick = function () {
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
		 */

		editer_menuBnt.onclick = function () {
			$('#menu').css("display","none") ;
			$('#menu_editor').css("display","block") ;
			var editor = CodeMirror.fromTextArea(document.getElementById('menueditor'), {
				mode: 'gfm',
			    lineNumbers: true,
			    matchBrackets: true,
			    lineWrapping: false,
			    theme: 'xq-dark'
			});
		}
		//保存文档
		saveDocumentBnt.onclick = function () {
			var value = window.frames["docEditor"].document.getElementById('code').value ;
			document.getElementById("document.content").innerText = value ;
			$("#doc_save_form").submit() ;
		}

		<c:if test="${canEditor }">
			//如果是不可编辑状态那么直接显示
			
		</c:if>
	</script>
</body>
</html>
