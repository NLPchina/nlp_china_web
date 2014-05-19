<%@page language="java" pageEncoding="UTF-8"%>
<%@include file="/common/taglibs.jsp"%>

<!DOCTYPE html>
<!--[if lt IE 7]> <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang="en"> <![endif]-->
<!--[if IE 7]>    <html class="no-js lt-ie9 lt-ie8" lang="en"> <![endif]-->
<!--[if IE 8]>    <html class="no-js lt-ie9" lang="en"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang="cn"> <!--<![endif]-->

<head>
<%@include file="common/common.jsp"%>
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
                <h1>We build rock solid Responsive website</h1>
                <p>Used by thousands of creative freelancers and companies worldwide, Hyperion gives you everything you need to run your small business.</p>
                <a href="#" class="button-slide medium gray">Let's start something</a>
            </div>
            <div class="caption-type1 moveFromRight">
                <img src="images/slideshow/slide1.png" alt="" />
            </div>
        </div>
        
        <!-- slide 2 here -->
        <div data-src="images/slideshow/bg-slide2.jpg">
            <div class="caption-type2 moveFromTop">
                <h1>We build rock solid Responsive website</h1>
                <p>At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident similique sunt in culpa qui officia deserunt</p>
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
                <h1>Latest web technology</h1>
                <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium totam rem aperiam eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.</p>
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
            <div class="link-zoom">
                <a class="fancybox" href="images/portfolio-big/pf-big.jpg" title="Hyperion">
                    <img src="images/sample-images/front-img1.jpg" alt="" class="fade" />
                </a>
            </div>
        </div>
        <div class="three columns mobile-two">
            <h5>制作技术文档 &raquo;</h5>
            <div class="link-url">
                <a href="http://sc.chinaz.com" target="_self">
                    <img src="images/sample-images/front-img2.jpg" alt="" class="fade" />
                </a>
            </div>
        </div>
        <div class="three columns mobile-two">
            <h5>开源项目展示 &raquo;</h5>
            <div class="link-more">
                <a href="about.html">
                    <img src="images/sample-images/front-img3.jpg" alt="" class="fade" />
                </a>
            </div>
        </div>
        <div class="three columns mobile-two">
            <h5>有趣的开发者们 &raquo;</h5>
            <div class="link-video">
                <a class="fancybox" href="http://sc.chinaz.com" title="Hyperion Sample Video">
                    <img src="images/sample-images/front-img4.jpg" alt="" class="fade" />
                </a>
            </div>
        </div>
    </div>
    
    <div id="featured-wrapper2">
        <div class="row front-feature-icon">
            <div class="four columns mobile-one">
                <img src="images/sample-images/front-icon1.png" alt="" class="img-center" />
                <h5>We made Responsive design</h5>
                <p>&nbsp;&nbsp;&nbsp;&nbsp;NLP并不是计算机时代的延续，而是一场独立的技术革命。这些看似简单的语言统计程序，将成为蒸汽机与发电机一般的时代引擎，启动未来几十年的奇幻发明。”   “总有一天本网站将看起来滑稽老土，不值一提，但它曾见证淹没它的浪潮如何兴起，而新世界的技术怪物们，他们曾经到过这里。比如你。</p>
            </div>
            <div class="four columns mobile-one">
                <img src="images/sample-images/front-icon2.png" alt="" class="img-center" />
                <h5>Complete pack of business idea</h5>
                <p>Lorem ipsum dolor sit amet consectetur incididunt ut labore et dolore magna aliqua adipisicing elit seddo eiusmod tempor.</p>
            </div>
            <div class="four columns mobile-one">
                <img src="images/sample-images/front-icon3.png" alt="" class="img-center" />
                <h5>Simple, Efficient, and Low cost</h5>
                <p>Lorem ipsum dolor sit amet consectetur incididunt ut labore et dolore magna aliqua adipisicing elit seddo eiusmod tempor.</p>
            </div>
        </div>
    </div>
    
    <div class="row">
        <div class="twelve columns">
            <div class="featured-box">
                <div class="nine columns">
                    <h5>Are you ready to Grow your business with Hyperion HTML Template?</h5>
                    <p>Hyperion is a modern minimalist responsive HTML template created for business websites.</p>
                </div>
                <div class="three columns">
                    <a href="#" class="button medium gray arrow-icon">Try it free today</a>
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