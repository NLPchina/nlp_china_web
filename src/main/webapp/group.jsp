<%@page language="java" pageEncoding="UTF-8"%>
<%@include file="/common/taglibs.jsp"%>

<!DOCTYPE html>
<!--[if lt IE 7]> <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang="en"> <![endif]-->
<!--[if IE 7]>    <html class="no-js lt-ie9 lt-ie8" lang="en"> <![endif]-->
<!--[if IE 8]>    <html class="no-js lt-ie9" lang="en"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang="cn"> <!--<![endif]-->

<head>
<%@include file="common/common.jsp"%>

<!-- IE Fix for HTML5 Tags -->
<!--[if lt IE 9]><script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
<![endif]-->
</head>
<body>
<!-- header start here -->
<%@include file="header.jsp"%>
<!-- header end here -->


<!-- breadcrumb start here -->
<section id="breadcrumb-wrapper">
    <div id="breadcrumb-content">
        <ul>
        	<li><a href="${ctx }/">主页</a></li>
            <li><a href="#">组织成员</a></li>
        </ul>
    </div>
</section>
<!-- breadcrumb end here -->

<!-- maincontent start here -->
<section id="content-wrapper">
	<div class="row">
        <div class="four columns">
            <h5>关于我们?</h5>
            <p>汇集行业精英,乐于协助分享,提供技术支持!</p>
        </div>
        <div class="four columns philosophy">
            <h5>我们的理念</h5>
            <blockquote>  
            	<p>赋予程序生命,赋予资源开放,赋予交流平等,赋予理想翅膀</p>
                <cite>NLPCN.ORG</cite>
             </blockquote>
        </div>
        <div class="four columns">
        	<div class="panel">
                <p>如果你和我们一样,如果你乐于分享那么还等什么赶快假如我们吧!</p>
                <a href="#" class="button medium gray">加入我们</a>
                <div class="clear"></div>
            </div>
        </div>
    </div>
    
    <div class="row">
    	<div class="twelve columns">
        	<div class="divider"></div>
        </div>
    </div>
    
    <div class="row">
    	<div class="twelve columns">
        	<h5>Meet our Team</h5>
        </div>
        
        <c:forEach items="${obj }" var="user">
    	<div class="three columns mobile-two">
        	<div class="team-wrap">
            	<img src="${user.avatarLarge }" width="100%" style="height: 220px;" class="img-border" />
                <h5>${user.name }</h5>
                <p class="small-text">${user.userType==1?"组织会员":"网站管理员" }</p>
            </div>        	
        	<p>${user.description }</p>
            <ul class="team-socials">
                <li><a href="#" title="facebook" class="tooltip"><img src="images/socials/social10.gif" alt="" /></a></li>
                <li><a href="#" title="flickr" class="tooltip"><img src="images/socials/social12.gif" alt="" /></a></li>
                <li><a href="#" title="pinterest" class="tooltip"><img src="images/socials/social23.gif" alt="" /></a></li>
                <li><a href="#" title="skype" class="tooltip"><img src="images/socials/social27.gif" alt="" /></a></li>
                <li><a href="#" title="twitter" class="tooltip"><img src="images/socials/social32.gif" alt="" /></a></li>
            </ul>
        </div>
        </c:forEach>
    </div>
    
</section>
<!-- maincontent end here -->


<!-- footer start here -->
<%@include file="foot.jsp"%>
<!-- footer end here -->
</body>
</html>