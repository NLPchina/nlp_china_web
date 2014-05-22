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
    	<h2>404</h2>   
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
                        <h1>error 404</h1>
                        <h4>${message }</h4>
                        <div class="clear"></div>
                        <div class="divider"></div> 
                        <p>We're sorry, but we can't find the page you were looking for. It's probably some thing we've done wrong but now we know about it we'll try to fix it. In the meantime, try returning to the homepage or search something below.</p>
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