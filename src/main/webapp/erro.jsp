<%@page language="java" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<!--[if lt IE 7]> <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang="en"> <![endif]-->
<!--[if IE 7]>    <html class="no-js lt-ie9 lt-ie8" lang="en"> <![endif]-->
<!--[if IE 8]>    <html class="no-js lt-ie9" lang="en"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang="cn"> <!--<![endif]-->

<head>
<%@include file="common/common.jsp"%>
</head>
<body>
<!-- header start here -->
<%@include file="header.jsp"%>
<!-- header end here -->

<!-- pagetitle start here -->
<section id="pagetitle-wrapper">
    <div class="pagetitle-content">    
    	<h2>你的帐号未登录</h2>   
    </div>
</section>
<!-- pagetitle end here --> 


<!-- maincontent start here -->
<section id="content-wrapper">   
    <div class="row">
        <div class="eight columns centered">
            
            <div id="error-wrapper">                	
                <div class="panel error-mobile">
                    <div class="four columns">
                        <img src="${ctx }/images/404-img.png" alt="error" class="error-img" />
                    </div>
                    <div class="eight columns">
                        <h1>error</h1>
                        <h4>您的账号未登录</h4>
                        <div class="clear"></div>
                        <div class="divider"></div> 
                        <li><a href="${ctx }/sinaWeibo/login">马上登陆</a></li>
                	<!-- <li><a href="https://api.weibo.com/oauth2/authorize?client_id=2598075234&response_type=code&redirect_uri=http://www.nlpcn.org/sinaWeibo/login">微博登陆</a></li> -->
                    </div>
                    <div class="clear"></div>
                </div>
            </div>
                            
        </div>        
    </div>
</section>
<!-- maincontent end here -->

<!-- footer start here -->
<%@include file="foot.jsp"%>
<!-- footer end here -->
</body>
</html>