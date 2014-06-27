<%@page language="java" pageEncoding="UTF-8"%>
<%@include file="/common/taglibs.jsp"%>
<!DOCTYPE html>
<!--[if lt IE 7]> <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang="en"> <![endif]-->
<!--[if IE 7]>    <html class="no-js lt-ie9 lt-ie8" lang="en"> <![endif]-->
<!--[if IE 8]>    <html class="no-js lt-ie9" lang="en"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang="en"> <!--<![endif]-->

<head>
<%@include file="/common/common.jsp"%>
<script src="http://tjs.sjs.sinajs.cn/open/api/js/wb.js" type="text/javascript" charset="utf-8"></script>
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
        
            <div class="blog-post">
                <div class="post-info">
            		<img src="${ctx}/images/file-ico/${obj.sysImg }.png" alt="blog-img" >
                    <div class="big-date"><fmt:formatDate value="${obj.publishTime}" pattern="dd"/></div>
                    <div class="small-month"><fmt:formatDate value="${obj.publishTime}" pattern="MM"/> <fmt:formatDate value="${obj.publishTime}" pattern="yyyy"/></div>
                    <ul>
                        <li class="author-icon"><a href="#">${obj.userInfo.name }</a></li>
                        <li class="tag-icon"><a href="${ctx }/resource/list/${category.id }">${obj.categoryStr }</a></li>
                    </ul>
                </div>
                <div class="post-content">            	                  
                    <h4><a href="#">${obj.title }</a></h4>
                    <p>${obj.summary }</p>
                     <div>
                     	<c:forEach items="${obj.tagList }" var="tagName">
		                    <a name="tag" class="button small blue" href="${ctx }/resource/list?">${tagName }</a>
	                    </c:forEach>
                    </div>
                </div>
                
	            <div align="justify" style="right: 0px; position: absolute;">
						<wb:share-button appkey="4bxSJI" addition="number" type="icon" default_text="${obj.summary }" ></wb:share-button>
				</div>
				
				<div style="float: right">
				</div>
            </div>
            <div>
            	
            	<script type="text/javascript">
					(function(){
					var url = "http://widget.weibo.com/distribution/comments.php?width=0&url=auto&skin=1&appkey=2598075234&iframskin=1&dpc=1";
					url = url.replace("url=auto", "url=" + encodeURIComponent(document.URL)); 
					document.write('<iframe id="WBCommentFrame" src="' + url + '" scrolling="no" frameborder="0" style="width:100%"></iframe>');
					})();
					</script>
					<script src="http://tjs.sjs.sinajs.cn/open/widget/js/widget/comment.js" type="text/javascript" charset="utf-8"></script>
					<script type="text/javascript">
					window.WBComment.init({
					    "id": "WBCommentFrame"
					});
				</script>
            
            </div>
            
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
                	<c:forEach var="category" items="${APP_CATEGORYS }">
	                    <li><a href="/resource/list/${category.id }">${category.name }</a></li>                    
                    </c:forEach>
                </ul>
            </aside>
            
            
            <aside>
            	<h5>Tag Cloud</h5>
                <div class="tag-cloud">
                	<c:forEach items="${APP_TAGS }" var="tag">
                    <a title="Link title" href="#">${tag.name }</a>
                    </c:forEach>                        
                </div>
            </aside>
        </div>
    </div>
</section>
<!-- maincontent end here -->

<script type="text/javascript">
	var style = ["white","blue","green","orange","red","gray"] ;
	var tags = document.getElementsByName("tag") ;
	var i = 0 ;
	for(i = 0 ; i<tags.length ;i++){
		tags[i].className = "button small "+style[i%style.length] ;
	}
	
	$(document).ready(function(){

		 $("p").each(function(){
			    var s=$(this).html();
			    var re = /((http|https):\/\/[\w.\/-]+)(?![^<]+>)/gi;
			    $(this).html(s.replace(re,"<a href='$1' target='_blank'>$1</a>"));
			  });

		});
</script>

<!-- footer start here -->
<%@include file="foot.jsp"%>
<!-- footer end here -->
</body>
</html>