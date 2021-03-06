<!doctype html>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
<meta charset="utf-8">
<%@ include file="/WEB-INF/page/web/include/head.jsp"%>
<title>支付</title>
<script type="text/javascript">
	$(function(){ 
		
		var msg = '${msg}';
		if(msg!=''){
			alert(msg);
		}
		
	});
</script>
</head>

<body style="background:#f7f7f7;">
<div class="toplogo">
	<div class="logo-img">
		<img src="${rc.contextPath}/statics/web/images/logo.png">
    </div>
</div>
<a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=1023468189&site=qq&menu=yes"><div class="consults"><img src="${rc.contextPath}/statics/web/images/zixun.png"></div></a>
<form id="formId" action="${rc.contextPath}/web/pay/generateOrder" method="post">
	<input type="hidden" name="productSign" value="${productSign}">
	<input type="hidden" name="userName" value="${sessionScope.user.username}">
	<input type="hidden" name="payWay" value="zhifubao">
	<input type="hidden" name="count" value="1">
</form>
<form id="wechatFormId" action="${rc.contextPath}/web/pay/generateOrder" method="post">
	<input type="hidden" name="productSign" value="${productSign}">
	<input type="hidden" name="userName" value="${sessionScope.user.username}">
	<input type="hidden" name="payWay" value="weixin">
	<input type="hidden" name="count" value="1">
</form>
<div class="orderbox">
	<div class="orderbox-title"><h2>订单详情</h2></div>
    <div class="account-number">
    	<h2>充值账户：<span>${sessionScope.user.username}</span></h2>
        <h3>应付金额：<span>${product.price }</span></h3>
        <div class="clearfix"></div>
    </div>
</div>
    <div class="order-content">
    	<div class="order-content-title"><h2>请选择支付方式</h2><span>${product.content }</span></div>
        <div class="payment-options">
        	<div class="alipay cur" type="alipay">
            	<img title="影盾官网，影盾，影盾软件,影盾插件,影盾加速器，影盾浏览器插件，影盾chrome浏览器插件,代理,windows代理，mac代理，代理软件,时光隧道,蓝灯(Lartrn),Green加速器,壁虎漫步,出锅。加速器插件,加速器，科学上网,Chrome插件，浏览器插件，chrome浏览器插件,科学上网,科学上网插件,加速器软件,访问Google、访问Facebook、访问YouTube,访问Twitter。" src="${rc.contextPath}/statics/web/images/pay01.png">
                <img title="影盾官网，影盾，影盾软件,影盾插件,影盾加速器，影盾浏览器插件，影盾chrome浏览器插件,代理,windows代理，mac代理，代理软件,时光隧道,蓝灯(Lartrn),Green加速器,壁虎漫步,出锅。加速器插件,加速器，科学上网,Chrome插件，浏览器插件，chrome浏览器插件,科学上网,科学上网插件,加速器软件,访问Google、访问Facebook、访问YouTube,访问Twitter。" src="${rc.contextPath}/statics/web/images/pay02.png">
            </div>
            
            <div class="alipay" type="wechat">
            	<img src="${rc.contextPath}/statics/web/images/pay03.png">
                <img src="${rc.contextPath}/statics/web/images/pay04.png">
            </div>
            
            <div class="clearfix"></div>
        </div>
        <div class="order-button"><p>确认支付</p></div>
    </div>
<script>
	$(".payment-options .alipay").click(function(){
		$(".payment-options .alipay").removeClass("cur");
		$(this).addClass("cur");
	})
	$(function(){ 
		
		var productSign = '${productSign}';
		
		$(".order-button").on("click",function(){
			if("alipay"==$(".cur").attr("type")){
				$("#formId").submit();
			}else{
				$("#wechatFormId").submit();
			}
		})
	});
</script>
</body>
</html>
