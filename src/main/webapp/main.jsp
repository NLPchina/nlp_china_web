<%@page language="java" pageEncoding="UTF-8"%>
<%@include file="/common/taglibs.jsp"%>

<!DOCTYPE html>
<!--[if lt IE 7]> <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang="en"> <![endif]-->
<!--[if IE 7]>    <html class="no-js lt-ie9 lt-ie8" lang="en"> <![endif]-->
<!--[if IE 8]>    <html class="no-js lt-ie9" lang="en"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang="cn"> <!--<![endif]-->

<head>
<%@include file="common/common.jsp"%>
<script src="${ctx}/js/camera.min.js"></script>
<script src="js/jquery.easing-1.3.min.js"></script>
<script>
$(document).ready(function() { 
    //Camera Jquery
    $('#camera-slide').camera({
        thumbnails: false,
        hover: false,
        pagination: false,
    });	  	
});
</script> 

<!-- IE Fix for HTML5 Tags -->
<!--[if lt IE 9]><script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
<![endif]-->
</head>
<body>
<!-- header start here -->
<%@include file="header.jsp"%>
<!-- header end here -->

<!-- slideshow start here -->
<section id="slideshow-wrapper">
    <div class="camera_wrap" id="camera-slide">
    
        <!-- slide 1 here -->
        <div data-src="images/slideshow/bg-slide1.jpg">
            <div class="caption-type1 moveFromLeft">
                <h1>欢迎来到NLPCN.ORG</h1>
                <p> NLPCN是一个非盈利的自然语言处理组织。我们遵循开放自由的理念，乐于分享，勤于开源，为为数不多的数据处理的开发者提供了一个资源共享,开源项目介绍,开发者展示的平台.</p>
                <a href="${ctx }/demo" class="button-slide medium gray">开源产品展示</a>
            </div>
            <div class="caption-type1 moveFromRight">
                <img src="images/slideshow/slide1.png" alt="" />
            </div>
        </div>
        
        <!-- slide 2 here -->
        <div data-src="images/slideshow/bg-slide2.jpg">
            <div class="caption-type2 moveFromTop">
                <h1>创建自己的技术文档,合作撰写文档</h1>
                <p>在这里你可以方便的管理,撰写自己的文档.采用流行的MarkDown格式.美观大方.可以把文档的编辑方式发给你信任的人.一起修改文档,无需登录,无需注册.永久保留.随时导出PDF,HTML等各种格式.</p>
            </div>
            <div class="caption-type2 moveFromBottom">
                <img src="images/slideshow/slide2.png" alt="" />
            </div>
        </div>
        
        <!-- slide 3 here -->
        <div data-src="images/slideshow/bg-slide3.jpg">
            <div class="caption-type3 moveFromLeft">
                <img src="images/slideshow/slide3.png" alt="" />
            </div>
            <div class="caption-type3 moveFromRight">
                <h1>开放的资源品台</h1>
                <p>学术论文,语料资源,技术文档,开源项目教程,精品资源大放送.服务与每一个NLP爱好者,还等什么加入我们分享资源,一起打造国内质量最高的自然语言处理资源平台.方便的资源整合分析.</p>
                <img src="images/slideshow/slide3a.png" alt="" class="html-badge" />
            </div>                
        </div>
        
        <!-- slide 4 here -->
        <div data-src="images/slideshow/bg-slide4.jpg">                
            <div class="caption-type4 moveFromBottom">
                <img src="images/slideshow/slide4.png" alt="" />
            </div>
        </div>   
    </div>
    <div id="slideshow-noscript"><h4>Hi, your javascript is off..!! for optimal results on this site please enable javascript in your browser</h4></div>
</section>
<!-- slideshow end here --> 

<!-- featured client start here -->
<section id="featured-wrapper">
    <div id="featured-logo-list">
        <div class="row">
            <div class="two columns mobile-two mobile-view">
                <h6 class="featured-client">featured clients :</h6>
            </div>
            <div class="two columns mobile-two mobile-view">
                <img src="images/sample-images/client1.png" alt="client-image" />
            </div>
            <div class="two columns mobile-two mobile-view">
                <img src="images/sample-images/client2.png" alt="client-image" />
            </div>
            <div class="two columns mobile-two mobile-view">
                <img src="images/sample-images/client3.png" alt="client-image" />
            </div>
            <div class="two columns mobile-two mobile-view">
                <img src="images/sample-images/client4.png" alt="client-image" />
            </div>
            <div class="two columns mobile-two mobile-view">
                <img src="images/sample-images/client5.png" alt="client-image" />
            </div>
        </div>
    </div>
</section>
<!-- featured client end here -->

<!-- maincontent start here -->
<section id="content-wrapper">
    <div class="row">
        <div class="three columns mobile-two">
            <h5>语料资源分享 &raquo;</h5>
            <div class="link-url">
                <a href="${ctx }/resource/list/2" target="_self">
                    <img src="images/sample-images/front-img1.jpg" alt="" class="fade" />
                </a>
            </div>
        </div>
        <div class="three columns mobile-two">
            <h5>制作技术文档 &raquo;</h5>
            <div class="link-url">
                <a href="${ctx }/resource/list/2" target="_self">
                    <img src="images/sample-images/front-img2.jpg" alt="" class="fade" />
                </a>
            </div>
        </div>
        <div class="three columns mobile-two">
            <h5>开源项目展示 &raquo;</h5>
            <div class="link-url">
                <a href="${ctx }/resource/list/4" target="_self">
                    <img src="images/sample-images/front-img3.jpg" alt="" class="fade" />
                </a>
            </div>
        </div>
        <div class="three columns mobile-two">
            <h5>有趣的开发者们 &raquo;</h5>
            <div class="link-url">
                <a href="javascript:alert('开发中...')" >
                    <img src="images/sample-images/front-img4.jpg" alt="" class="fade" />
                </a>
            </div>
        </div>
    </div>
    
    <div id="featured-wrapper2">
        <div class="row front-feature-icon">
            <div class="four columns mobile-one">
                <img src="images/sample-images/front-icon1.png" alt="" class="img-center" />
                <h5>关于&nbsp;&nbsp;NLPCN</h5>
                <p align="left">&nbsp;&nbsp;&nbsp;&nbsp;NLPCN是一个非盈利的自然语言处理组织。我们遵循开放自由的理念，乐于分享，勤于开源，为为数不多的数据处理的开发者提供了一个资源共享,开源项目介绍,开发者展示的平台.</p>
            </div>
            <div class="four columns mobile-one">
                <img src="images/sample-images/front-icon2.png" alt="" class="img-center" />
                <h5>在这里你能获得什么</h5>
                <p align="left">&nbsp;&nbsp;&nbsp;&nbsp;靠谱的第一手资源,靠谱的开源项目,方便快捷的个人文档建立平台.本网站的初衷是以人为本,以资源和开源项目的分享为目标.分享展示自然语言处理的一些成果</p>
            </div>
            <div class="four columns mobile-one">
                <img src="images/sample-images/front-icon3.png" alt="" class="img-center" />
                <h5>加入我们</h5>
                <p align="left">&nbsp;&nbsp;&nbsp;&nbsp;首先这是一个松散的组织,但是为了组织更好的发展我们希望加入者至少能在资源或者项目上有所贡献,同时我们愿意为每一个开发者研究者,提供一个分享展示的平台。</p>
            </div>
        </div>
    </div>
    
    <div class="row">
        <div class="twelve columns">
            <div class="featured-box">
                <div class="nine columns">
                    <h5>捐赠者的权利:获得更好的技术支持,对捐赠的机构给予增加友情链接广告等方式的宣传</h5>
                    <p>为什么需要捐赠?首先NLPCN一个非盈利性的组织,但是一些优秀的源项目的展示需要硬件成本,所以我们希望能通过这种方来获得您的支持.</p>
                </div>
                <div class="three columns">
                    <a href="${ctx }/donate" class="button medium gray arrow-icon">&nbsp;&nbsp;捐&nbsp;&nbsp;&nbsp;赠&nbsp;&nbsp;</a>
                </div>
                <div class="clear"></div>
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