<%@page language="java" pageEncoding="UTF-8"%>
<%@include file="/common/taglibs.jsp"%>
<!DOCTYPE html>
<!--[if lt IE 7]> <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang="en"> <![endif]-->
<!--[if IE 7]>    <html class="no-js lt-ie9 lt-ie8" lang="en"> <![endif]-->
<!--[if IE 8]>    <html class="no-js lt-ie9" lang="en"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang="en"> <!--<![endif]-->

<head>
<%@include file="/common/common.jsp"%>
</head>
<body>

<!-- header start here -->
<%@include file="/header.jsp"%>
<!-- header end here -->
<!-- breadcrumb start here -->
<section id="breadcrumb-wrapper">
    <div id="breadcrumb-content">
        <ul>
        	<li><a href="${ctx }/">首页</a></li>
            <li><a href="#">精品分享</a></li>
        </ul>
    </div>
</section>
<!-- breadcrumb end here -->

<!-- maincontent start here -->
<section id="content-wrapper">   
    <div class="row">
        <div class="eight columns">   
        
        <c:forEach items="${all }" var="resource">
            <div class="blog-post">
                <div class="post-info">
            		<img src="${ctx}/images/file-ico/pdf.png" alt="blog-img" >
                    <div class="big-date">01</div>
                    <div class="small-month">Aug 2012</div>
                    <ul>
                        <li class="author-icon"><a href="#">${resource.author }</a></li>
                    </ul>
                </div>
                <div class="post-content">            	                  
                    <h4><a href="single.html">${resource.title }</a></h4>
                    <p>${resource.summary }</p>
                     <div>
	                    <a class="button small blue" href="#">自然语言处理</a>
	                    <a class="button small green" href="#">机器学习</a>
	                    <a class="button small orange" href="#">中文分词</a>
	                    <a class="button small gray" href="#">文本分类</a>
	                    <a class="button small red" href="#">机器翻译</a>
                    </div>
                </div>     
            </div>
            </c:forEach>  
            
            <!-- begin of pagination -->
            <div class="blog-pagination">
                <div class="pages blogpages">
                    <span class="pageof">Page 1 of 3</span><a href="#" class="current">1</a><a href="#">2</a><a href="#">3</a><a href="#">&raquo;</a>
                </div>
            </div>
            <!-- end of pagination -->            
        </div>
                
        <div class="four columns">
        	<aside>
            	<form id="search" action="#" method="get" />
                    <fieldset class="search-fieldset">
                        <input type="text" id="search-form" value="Search here..." onblur="if (this.value == ''){this.value = 'Search here...'; }" onfocus="if (this.value == 'Search here...') {this.value = ''; }" />
                        <button type="submit" value="Submit">Submit</button>
                    </fieldset>      						
                </form>
            </aside>
        
        	<aside>
                <h5>Categories</h5>
                <ul class="sidebar-list">
                    <li><a href="#">学术论文</a></li>                    
                    <li><a href="#">语料资源</a></li>                                
                    <li><a href="#">技术文档</a></li>
                    <li><a href="#">开源项目</a></li>
                </ul>
            </aside>
            
            
            <aside>
            	<h5>Tag Cloud</h5>
                <div class="tag-cloud">
                	<c:forEach items="${tags }" var="tag">
                    <a title="Link title" href="#">${tag.name }</a>
                    </c:forEach>                        
                </div>
            </aside>
        </div>
    </div>
</section>
<!-- maincontent end here -->

<!-- footer start here -->
<%@include file="foot.jsp"%>
<!-- footer end here -->
</body>
</html>