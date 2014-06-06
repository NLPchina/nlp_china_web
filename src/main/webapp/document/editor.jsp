<%@page language="java" pageEncoding="UTF-8"%>
<%@include file="/common/taglibs.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<title>Markdown Editor</title>
	<script src="http://cdn.bootcss.com/jquery/1.10.2/jquery.min.js"></script>
	<script src="${ctx}/document/js/marked.js"></script>
	<script src="${ctx}/document/js/highlight.pack.js"></script>
	<link href="${ctx}/document/css/hightlight.css" media="all" rel="stylesheet" type="text/css">
	<link href="${ctx}/document/css/github.css" media="all" rel="stylesheet" type="text/css">
	<script src="${ctx}/document/codemirror/lib/codemirror.js"></script>
	<script src="${ctx}/document/codemirror/xml/xml.js"></script>
	<script src="${ctx}/document/codemirror/markdown/markdown.js"></script>
	<script src="${ctx}/document/codemirror/gfm/gfm.js"></script>
	<script src="${ctx}/document/codemirror/javascript/javascript.js"></script>
	<link rel="stylesheet" href="${ctx}/document/codemirror/lib/codemirror.css">
  <style>
    .CodeMirror pre{
      line-height: 20px;
    }
    #in, .CodeMirror{
      position: fixed;
      top: 0;
      left: 0;
      bottom: 0;
      width: 50%;
      overflow: auto;
      font-size: 15px;
      box-shadow: 0 2px 10px rgba(0,0,0,0.2);
    }
    .CodeMirror-scroll {
      height: 100%;
      min-height: 100%;
    }

    #out{
      position: fixed;
      top: 0;
      right: 0;
      left: 50%;
      bottom: 0;
      overflow: auto;
      padding: 10px;
      padding-left: 20px;
      color: #444;
      font-family:Georgia, Palatino, 'Palatino Linotype', Times, 'Times New Roman', serif;
      font-size: 16px;
      line-height: 1.5em
    }

    @media screen and (max-width: 1024px) {
      #in {
        display: none;
      }
      #out {
        left: 0;
        padding-left: 10px;
      }
    }

    .view #in {
      display: none;
    }
    .view #out {
      left: 0;
      padding-left: 10px;
    }
  </style>
</head>
<body>
  <div id="in"><form><textarea id="code">aaa</textarea></form></div>
  <div id="out" class="markdown-body entry-content" itemprop="mainContentOfPage" ></div>

  <script>
  
  	$('#code').val(parent.window.document.getElementById('document.content').value) ;
  

    function update(e){
      var val = e.getValue();
      setOutput(val);
    }

    function setOutput(val){

      val = val.replace(/<equation>((.*?\n)*?.*?)<\/equation>/ig, function(a, b){
        return '<img src="http://latex.codecogs.com/png.latex?' + encodeURIComponent(b) + '" />';
      });

      $('#code').val(val) ;

      document.getElementById('out').innerHTML = marked(val);
    }

    var editor = CodeMirror.fromTextArea(document.getElementById('code'), {
      mode: 'gfm',
      lineNumbers: true,
      matchBrackets: true,
      lineWrapping: true,
      theme: 'default',
      onChange: update
    });

   
    document.addEventListener('keydown', function(e){
      if(e.keyCode == 83 && (e.ctrlKey || e.metaKey)){
        e.preventDefault();
        save();
        return false;
      }
    })

    
     update(editor);
    
	
  </script>
</body>
</html>
