<%@ page language="java" pageEncoding="UTF-8"%>
<header>

    <div id="main-wrapper">
    
        <!-- top-social start here -->
        <div id="top-social">
           
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
                <li id="home" class="active"><a href="${ctx }/">主页</a></li>
                <li id="resource" class="dropdown"><a href="${ctx }/resource/list">资源分享</a>
                	<ul> 
		                <li><a href="${ctx }/resource/list/1">学术论文</a></li>
		                <li><a href="${ctx }/resource/list/2">语料资源</a></li>
		                <li><a href="${ctx }/resource/list/3">技术文档</a></li>
		                <li><a href="${ctx }/resource/list/4">开源项目</a></li>
		                <c:if test="${userInfo!=null }" >
		                <li><a href="${ctx }/resource/user-resource-list/${userInfo.id}">我的分享</a></li>
		                </c:if>
	                </ul>
                </li>
                <li id="document" class="dropdown"><a href="#">开发者文档</a>
                	<ul> 
		                <li><a href="${ctx }/doc/">创建单页文档</a></li>
		                <li><a href="${ctx }/docs/">创建多页文档</a></li>
		                <li><a href="${ctx }/resource/list/3">查看我的文档</a></li>
	                </ul>
                </li>
                <li id="demo"><a href="${ctx }/demo">演示平台</a></li>
                <li id="developer" ><a href="javascript:alert('开发中....')">开发者们</a></li>
                
                <c:if test="${userInfo==null }">
                	<!-- <li><a href="${ctx }/sinaWeibo/login">微博登陆</a></li> -->
                	<li><a href="https://api.weibo.com/oauth2/authorize?client_id=2598075234&response_type=code&redirect_uri=http://www.nlpcn.org/sinaWeibo/login">微博登陆</a></li>
                </c:if>
                <c:if test="${userInfo!=null }" >
                	<li><a href="${ctx }/admin/main.jsp">${userInfo.name }的管理平台</a></li>
                </c:if>
            </ul>
        </nav>
        <!-- mainmenu end here -->
    </div>
</header>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />