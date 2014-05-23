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
	<link rel="stylesheet" href="${ctx }/document/css/bootstrap.min.css">
	<script src="${ctx }/js/jquery.min.js"></script>
	<script src="${ctx }/document/js/bootstrap.min.js"></script>
	<script src="${ctx }/document/js/bootbox.min.js"></script>
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
	    
		<c:if test="${obj=='single' || docMenu==null}">    
		@media screen and (min-width: 76em) {
		  .nav-collapse { width: 0em }
		  .main { width: auto; left: 0em }
		}
		</c:if>
		
		<c:if test="${obj=='multi' || docMenu!=null}">    
		@media screen and (min-width: 76em) {
		  .nav-collapse { width: 18em }
		  .main { width: auto; left: 18em }
		}
		</c:if>
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
          <a class="navbar-brand" href="${ctx}/docs/editor/${docMenu.id}?code=${docMenu.extractingCode}">文档首页</a>
        </div>
        <!--  -->
        <div class="collapse navbar-collapse">
          <ul class="nav navbar-nav">
          	<c:if test="${docMenu!=null || obj=='multi' }">
         	<li><a id="editer_menuBnt" >编辑导航栏</a></li>
          	</c:if>
          	<c:if test="${docMenu.id!=null || document.id!=null}">
            <li><a href="#" id="editorUrl">编辑地址</a></li>
            <li><a href="#" id="viewUrl">阅读地址</a></li>
          	</c:if>
          </ul>
          
          <ul class="nav navbar-nav navbar-right">
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown">编辑模式 <b class="caret"></b></a>
              <ul class="dropdown-menu">
          		  <li><a href="#" id="previewBtn">预览模式</a></li>
           		  <li><a href="#" id="splitScreenBtn">编辑模式</a></li>
              </ul>
            </li>
            <li><a href="#" id="saveDocumentBnt">保存文档</a></li>
          </ul>
          <span class="icon-bar"></span>
      </div><!-- /.container -->
	</div>
	
	
    <div class="container">
    	<!--多文档编辑-->
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
			<form action="#" id="doc_save_form" method="post">
			<textarea class="hidden" id="document.content" name="document.content">${document.content}</textarea>
			<input type="hidden" id="document.id" name="document.id" value="${document.id }"/>
			<input type="hidden" id="document.extractingCode" name="document.extractingCode" value="${docMenu.extractingCode }"/>
			<input type="hidden" id="document.menuId" name="document.menuId" value="${docMenu.id }"/>
			</form>
		</div>
	</div> <!-- /container -->


	<script>
		$("#previewBtn").click(function () {
			resetEditorPage() ;
			$('#main_div').css("padding-left","4em") ;
			$('#main_div').css("padding-top","2em") ;
			var docEditor = window.frames["docEditor"].document ;
			docEditor.getElementById("in").style.display="none" ;
			docEditor.getElementById("out").style.left="0%" ;
		}) ;
		
		$("#splitScreenBtn").click(function () {
			resetEditorPage() ;
			var docEditor = window.frames["docEditor"].document ;
			docEditor.getElementById("out").style.left="50%" ;
		}) ;
		
		function resetEditorPage(){
			$('#main_div').css("padding-left","0.0em") ;
			$('#main_div').css("padding-top","0.3em") ;
			var docEditor = window.frames["docEditor"].document ;
			docEditor.getElementById("in").style.display="block" ;
			docEditor.getElementById("out").style.display="block" ;
			docEditor.getElementById("out").style.left="50%" ;
		}
		
		
		var editor = null ;
		$("#editer_menuBnt").click(function () {
			$('#menu').css("display","none") ;
			$('#menu_editor').css("display","block") ;
			if(editor==null){
				 editor = CodeMirror.fromTextArea(document.getElementById('menueditor'), {
					mode: 'gfm',
				    lineNumbers: true,
				    matchBrackets: true,
				    lineWrapping: false,
				    theme: 'xq-dark'
				});
				 
			}
		}) ;
		
		//保存文档
		$("#saveDocumentBnt").click(function () {
			var value = window.frames["docEditor"].document.getElementById('code').value ;
			document.getElementById("document.content").innerHTML = value ;
			
			$.post("${ctx }/doc/save/", $("#doc_save_form").serialize(),
				function(data,status){
					bootbox.alert(data.msg,function(){
						if(status=="success" && data.type=="single"){
							location.href = "${ctx}/doc/editor/"+data.id+"?code="+data.code ;
						}
					});
					
				}
			,"json");
		});

		$(window).bind('beforeunload',function(){
			if(document.getElementById("document.content").value == window.frames["docEditor"].document.getElementById('code').value ){
				return null ;
			}
			return  "您当前的变更没有保留!";
		}); 
		
		<c:if test="${obj=='multi' && docMenu==null}">    
		$("#editer_menuBnt").trigger("click");
		</c:if>
		
		$("#editorUrl").click(function () {
			bootbox.alert("编辑地址为:<a href='#'>"+window.location.href+"</a></br> 这个地址有写入权限.请妥善保存,不要交给不可信的人!")
		});
		
		$("#viewUrl").click(function () {
			var url = window.location.href ;
			url = url.replace("/editor/","/").replace(/\?code=.+/,"") ;
			bootbox.alert("阅读地址为:<a href='"+url+"'>"+url+"</a></br> 这个地址只读权限,你可以交给任何人阅读!") ;
		});
		
	</script>
</body>
</html>
