<%@page language="java" pageEncoding="UTF-8"%>
<%@include file="/common/taglibs.jsp"%>
<!DOCTYPE html>
<!--[if lt IE 7]> <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang="en"> <![endif]-->
<!--[if IE 7]>    <html class="no-js lt-ie9 lt-ie8" lang="en"> <![endif]-->
<!--[if IE 8]>    <html class="no-js lt-ie9" lang="en"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang="cn"> <!--<![endif]-->

<head>
	<%@include file="/common/common.jsp"%>
	<link rel="stylesheet" href="${ctx }/document/css/bootstrap.min.css">
	<script src="${ctx }/js/jquery.min.js"></script>
	<script src="${ctx }/document/js/bootstrap.min.js"></script>
	<script src="${ctx }/document/js/bootbox.min.js"></script>
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
<!-- header start here -->
<%@include file="/header.jsp"%>
<!-- header end here -->

<!-- breadcrumb start here -->
<section id="breadcrumb-wrapper">
	<div id="breadcrumb-content">
        <ul>
        	<li><a href="/">首页</a></li>
            <li><a href="#">多文档</a></li>
         	<li><a href="#" id="editer_menuBnt" >编辑导航栏</a></li>
            <li><a href="#" id="saveDocumentBnt">保存文档</a></li>
            <c:if test="${docMenu.id!=null}">
            <c:if test="${ sessionScope.userInfo.userType>0 }">
                 <li><a href="#" id="publishDocumentBnt">发布为资源</a></li>
            </c:if>
            <li><a href="#" id="editorUrl">编辑地址</a></li>
            <li><a href="#" id="viewUrl">阅读地址</a></li>
          	</c:if>
        </ul>
    </div>
</section>
<!-- breadcrumb end here -->


<!-- maincontent start here -->
<!--多文档编辑-->
<div id="menu_div" class="col-md-2">
	<!--多文档编辑-->
	<div id="menu_view" class="nav-collapse">
		<ul class="nav nav-pills nav-stacked">
			<li><a href='/docs/editor/${docMenu.id }?code=${docMenu.extractingCode}'>文档首页</a></li>
			${docMenu.html }
		</ul>
	</div>
	<div id="menu_editor" style="background-color: white; display: none;" >
		<form action="${ctx }/doc_menu/save/" method="post">
			<textarea id="menueditor" name="docMenu.content">${docMenu.content}</textarea>
			<input type="hidden" name="docMenu.id" value="${docMenu.id }"/>
			<button type="submit" id="save_menuBnt" class="btn btn-default"  style="width: 98% ; ">保存导航栏</button>
		</form>
	</div>
	
</div>

<div id="main_div" class="col-md-10" style="height:100%;">
	<iframe src="${ctx }/document/editor.jsp" name="docEditor" id="docEditor" width="100%" height="80%" frameborder="no" border="0" marginwidth="0" marginheight="0" scrolling="no" allowtransparency="yes"></iframe>
	<form action="#" id="doc_save_form" method="post">
	<textarea class="hidden" id="document.content" name="document.content">${document.content}</textarea>
	<input type="hidden" id="document.id" name="document.id" value="${document.id }"/>
	<input type="hidden" id="document.extractingCode" name="document.extractingCode" value="${docMenu.extractingCode }"/>
	<input type="hidden" id="document.menuId" name="document.menuId" value="${docMenu.id }"/>
	</form>
</div>

<!-- breadcrumb start here -->
<section id="breadcrumb-wrapper">
</section>
<!-- breadcrumb end here -->

<script>
	
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
		}else{
			return  "您当前的变更没有保留!";	
		}
		
	}); 
	
	$("#editorUrl").click(function () {
		bootbox.alert("编辑地址为:<a href='#'>"+window.location.href+"</a></br> 这个地址有写入权限.请妥善保存,不要交给不可信的人!")
	});
	
	$("#viewUrl").click(function () {
		var url = window.location.href ;
		url = url.replace("/editor/","/").replace(/\?code=.+/,"") ;
		bootbox.alert("阅读地址为:<a href='"+url+"'>"+url+"</a></br> 这个地址只读权限,你可以交给任何人阅读!") ;
	});
	
	
	var editor = null ;
	$("#editer_menuBnt").click(function () {
		$('#menu_view').css("display","none") ;
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
	
	
	//发布文档
	$("#publishDocumentBnt").click(function () {
		$.post("${ctx }/doc/publishmenu/${docMenu.id}",{},
			function(data,status){
			    if(data.sta=="1"){
			    	var str="文档发布成功！<br/>  <a href='${ctx }/admin/'>点此去往“资源管理”</a></br>";
			    	bootbox.alert(str);
			    }else{
			    	bootbox.alert(data.msg);
			    }
			}
		,"json");
	});
	
	<c:if test="${docMenu==null}">    
	$("#editer_menuBnt").trigger("click");
	</c:if>
	
</script>
</body>
</html>