<%@page language="java" pageEncoding="UTF-8"%>
<%@include file="/common/taglibs.jsp"%>
<!DOCTYPE html>
<!--[if lt IE 7]> <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang="en"> <![endif]-->
<!--[if IE 7]>    <html class="no-js lt-ie9 lt-ie8" lang="en"> <![endif]-->
<!--[if IE 8]>    <html class="no-js lt-ie9" lang="en"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang="cn"> <!--<![endif]-->

<head>
	<%@include file="/common/common.jsp"%>
	<link rel="stylesheet" href="http://cdn.bootcss.com/twitter-bootstrap/3.0.3/css/bootstrap.min.css">
	<link rel="stylesheet" href="${ctx }/css/wordstyle.css">
	<script src="http://cdn.bootcss.com/jquery/1.10.2/jquery.min.js"></script>
	<script src="http://cdn.bootcss.com/twitter-bootstrap/3.0.3/js/bootstrap.min.js"></script>
	<script src="${ctx }/document/js/bootbox.min.js"></script>
	
</head>
<body  data-spy="scroll" data-target="#sideBar">
<!-- header start here -->
<%@include file="/header.jsp"%>
<!-- header end here -->

<!-- breadcrumb start here -->
<section id="breadcrumb-wrapper">
	<div id="breadcrumb-content">
        <ul>
        	<li><a href="/">首页</a></li>
            <li><a href="#">单文档编辑</a></li>
            <li><a href="#" id="saveDocumentBnt">保存文档</a></li>
            <c:if test="${document.id!=null}">
            <li><a href="#" id="editorUrl">编辑地址</a></li>
            <li><a href="#" id="viewUrl">阅读地址</a></li>
          	</c:if>
        </ul>
    </div>
</section>
<!-- breadcrumb end here -->


<!-- maincontent start here -->
<div style="height:100%;" id="main">
	<iframe src="${ctx }/document/editor.jsp" name="docEditor" id="docEditor" width="100%"  height="80%"  frameborder="no" border="0" marginwidth="0" marginheight="0" scrolling="no" allowtransparency="yes"></iframe>
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
		
	</script>
</body>
</html>