<%@ page language="java" pageEncoding="UTF-8"%>
<header>
    <div id="main-wrapper">
    
        <!-- top-social start here -->
        <div id="top-social">
            <a class="trigger" href="#"></a>
            <div class="social-panel">
                <ul>
                    <li><a href="#"><img src="${ctx }/images/socials/social10.gif" alt="" /></a></li>
                    <li><a href="#"><img src="${ctx }/images/socials/social32.gif" alt="" /></a></li>
                    <li><a href="#"><img src="${ctx }/images/socials/social9.gif" alt="" /></a></li>
                    <li><a href="#"><img src="${ctx }/images/socials/social15.gif" alt="" /></a></li>
                    <li><a href="#"><img src="${ctx }/images/socials/social25.gif" alt="" /></a></li>
                </ul>
            </div>
        </div>            
        <!-- top-social end here -->
        
        <!-- logo start here -->
        <div id="logo">
            <a href="${ctx }/"><img src="${ctx }/images/logo.png" alt="mainlogo" /></a>
        </div>
        <!-- logo end here -->
        
        <!-- mainmenu start here -->
        <nav id="mainmenu">
            <ul id="menu">
                <li><a href="${ctx }/">主页</a></li>
                <li class="dropdown"><a href="${ctx }/resource/list">资源分享</a>
                	<ul> 
		                <li><a href="${ctx }/resource/list/1">学术论文</a></li>
		                <li><a href="${ctx }/resource/list/2">语料资源</a></li>
		                <li><a href="${ctx }/resource/list/3">技术文档</a></li>
		                <li><a href="${ctx }/resource/list/4">开源项目</a></li>
	                </ul>
                </li>
                <li class="dropdown"><a href="#">开发者文档</a>
                	<ul> 
		                <li><a href="${ctx }/doc/">创建单页文档</a></li>
		                <li><a href="${ctx }/docs/">创建多页文档</a></li>
		                <li><a href="${ctx }/resource/list/3">查看我的文档</a></li>
	                </ul>
                </li>
                <li><a href="${ctx }/demo.jsp">演示平台</a></li>
                <li><a href="about.html">开发者们</a></li>
            </ul>
        </nav>
        <!-- mainmenu end here -->
        
    </div>
</header>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />