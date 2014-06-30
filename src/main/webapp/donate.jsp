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
            <li><a href="#">爱心捐赠</a></li>
        </ul>
    </div>
</section>
<!-- breadcrumb end here -->

<!-- maincontent start here -->
<section id="content-wrapper">
	<div class="row">
    	<div class="twelve columns serv-center">
            <h1>为什么需要捐赠?</h1>
            <div align="left">
            <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;首先感谢您进入这个页面，我们构建这个网站的初衷，是希望能给更多的自然语言及其学习的同学和公司提供帮助。<br/>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;虽然目前的我们完全可以承担起网站的运营成本，但是我们发现很多很优秀的资源，和开源项目无法得到更好的展示和推广，这之间的原因无外乎是：1.缺乏一个平台进行良好的宣传 2.硬件成本偏高  。本着开源自由的精神，我们想把这些美好的东西，展示给大家，但是这些展示需要更多的硬件成本。所以希望能通过这个页面，大家可以完全自愿的给予我们一定的鼓励，这些鼓励是我们不断创新，提供更好资源的动力。<br/>
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;我们同时也希望以其他方式给捐赠者一些力所能及的帮助。比如，宣传上：通过网站增加友情链接，招聘需求等方式。技术上：我们组织内部对您提供技术支持等方式。来回报每一位捐赠者。<br/>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;这些捐赠的钱，用来增加硬件成本，我们不会从里面克扣一分一毫来做与网站初衷无关的事情。我们更希望，得到一些企业，或者从本站中获得帮助的人的捐赠，如果你是学生党，那谨慎处理。</p>
            </div>
        </div>
    </div>
    
    <div class="row">
    	<div class="twelve columns">
        	<div class="divider"></div>
        </div>
    </div>
       
    <div class="row">
        <div class="six columns">
            <h5>捐赠方式一（网银汇款）</h5>
            <img src="images/sample-images/services-icon1.png" alt="" class="img-left serv-mobile" />
            <div class="serv-desc">
            <p>大家可以通过网银直接汇款到我本人的账户中，这些钱将会100%用来运营本站。同时希望在每一位捐赠之后与我联系。我会把捐赠内容加入到网站下方记录中，这样可以做到收支公开透明！</p>
            	<h6 class="title-blue">汇款方式</h6>
                <ul class="check">
                    <li>开户银行: 中国银行-北京市海淀区知春路支行</li>
                    <li>银行帐号: 6013-8201-0000-3751-917</li>
                    <li>收款人：孙健</li>
                </ul>
                 <h6 class="title-blue">联系方式</h6>
                <ul class="check">
                    <li>邮件: ansj-sun@163.com</li>
                    <li>微博：<a href="http://weibo.com/ansjsun/" target="_blank">http://weibo.com/ansjsun/</a></li>
                    <li>QQ: 5144694</li>
                </ul>
            </div>
        </div>
        <div class="six columns">
            <h5>捐赠方式二（支付宝二维码付款）</h5>
            <img src="images/sample-images/services-icon2.png" alt="" class="img-left serv-mobile" />
            <div class="serv-desc">
            <p>如果你有支付宝，可以直接使用小额付款。如果你有手机支付宝，请打开支付宝App，使用“扫一扫”付款.</p>
            <div>
            	<img src="${ctx }/images/ansj_pay.png"/>
            </div>
            </div>
        </div>
        <div class="six columns">
            <div class="table-red">
			    <h5>捐赠记录</h5>
			    <table class="table" >
			        <thead>
			                <tr>
			                    <th>捐赠者</th>
			                    <th>捐赠时间</th>
			                    <th>捐赠说明</th>
			                    <th>捐赠金额</th>
			                </tr>
			            </thead>
			            <tbody>
			            	<tr>
			                    <td>胡建</td>
			                    <td>2014年06月26日</td>
			                    <td>组织内部人员</td>
			                    <td>300￥</td>
			                </tr>
			            	<tr class="odd">
			                    <td>蔡晴</td>
			                    <td>2014年06月26日</td>
			                    <td>友情赞助</td>
			                    <td>100￥</td>
			                </tr>
			            	<tr>
			                    <td>刘少博</td>
			                    <td>2014年06月26日</td>
			                    <td>组织内部人员</td>
			                    <td>30￥</td>
			                </tr>
			            	<tr class="odd">
			                    <td>牟晓峰</td>
			                    <td>2014年06月26日</td>
			                    <td>组织内部人员</td>
			                    <td>100￥</td>
			                </tr>
			                <tr>
			                    <td>骡子</td>
			                    <td>2014年06月26日</td>
			                    <td>组织内部人员</td>
			                    <td>150￥</td>
			                </tr>
			                <tr class="odd">
			                    <td>多啦A梦</td>
			                    <td>2014年06月26日</td>
			                    <td>友情赞助</td>
			                    <td>20￥</td>
			                </tr>    
			                <tr>
			                    <td>Ansj</td>
			                    <td>2014年04月26日</td>
			                    <td>组织内部人员</td>
			                    <td>200￥</td>
			                </tr>  
			                <tr class="odd">
			                    <td colspan="3">捐赠合计：</td>
			                    <td>900￥</td>
			                </tr> 
			            </tbody>
			    </table>
			 </div>
        </div>        
        <div class="six columns">
            <div class="table-blue">
			    <h5>支出记录</h5>
			    <table class="table" >
			        <thead>
			                <tr>
			                    <th>支出理由</th>
			                    <th>支出时间</th>
			                    <th>支出金额</th>
			                </tr>
			            </thead>
			            <tbody>
			            	<tr>
			                    <td>充值用来购买VPS服务器</td>
			                    <td>2014年06月26日</td>
			                    <td>100￥</td>
			                </tr>
			                <tr class="odd">
			                    <td>充值用来购买VPS服务器</td>
			                    <td>2014年06月26日</td>
			                    <td>200￥</td>
			                </tr>
			                <tr>
			                    <td>充值用来购买VPS服务器</td>
			                    <td>2014年04月26日</td>
			                    <td>200￥</td>
			                </tr>
			                
			                <tr class="odd">
			                    <td>充值用来购买nlpcn.org域名</td>
			                    <td>2014年02月26日</td>
			                    <td>60￥</td>
			                </tr>
			                
			                <tr>
			                    <td colspan="2">支出合计：</td>
			                    <td>560￥</td>
			                </tr>      
			            </tbody>
			    </table>
			 </div>
        </div>
    </div>    
    
    <div class="row">
    	<div class="twelve columns">
        	<h5>特别感谢</h5>
        </div>
    	<div class="twelve columns">
        	<ul class="client-box">
        		<li><img src="images/sample-images/client1.png" alt="" /></li>
                <li><img src="images/sample-images/client2.png" alt="" /></li>
                <li><img src="images/sample-images/client3.png" alt="" /></li>
                <li><img src="images/sample-images/client4.png" alt="" /></li>
                <li><img src="images/sample-images/client5.png" alt="" /></li>
                <li><img src="images/sample-images/client6.png" alt="" /></li>
            </ul>
        </div>
    </div>
</section>
<!-- maincontent end here -->


<!-- footer start here -->
<%@include file="foot.jsp"%>
<!-- footer end here -->
</body>
</html>