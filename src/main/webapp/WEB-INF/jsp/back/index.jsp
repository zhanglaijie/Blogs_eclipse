<%@ page contentType="text/html;charset=utf-8"%>
<%@include file="/WEB-INF/jsp/taglib.jsp" %>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>壹博客-后台管理系统</title>

    <!-- Bootstrap -->
    <link rel="stylesheet" href="${ctx}/validator/vendor/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="${ctx}/validator/dist/css/bootstrapValidator.css"/>
	<link rel="stylesheet" href="${ctx}/css/common/common.css"/>
	<link rel="stylesheet" href="${ctx}/css/back/index.css"/>
  </head>
  <body>
	<div class="container">
	<%@include file="./common/navbar.jsp" %>
	<!-- 导航结束 -->
	<div class="row clearfix from-top">
		<div class="col-md-2 column left-nav">
			<%@include file="./common/left_nav.jsp" %>
	<!-- 导航结束 -->
		</div>
		<div class="col-md-10 column mycontent">
			<div class="tabbable" id="tabs-547795">
				<ul class="nav nav-tabs">
					<li class="active">
						 <a href="#panel-l1" data-toggle="tab">随笔管理</a>
					</li>
				</ul>
				<div class="tab-content">
					<div class="tab-pane active" id="panel-l1">
						<!--正文—左侧导航栏start-->
						<%@include file="./common/post_list.jsp" %>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
     <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="${ctx}/validator/vendor/jquery/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="${ctx}/validator/vendor/bootstrap/js/bootstrap.min.js"></script>
  	<script type="text/javascript" src="${ctx}/validator/dist/js/bootstrapValidator.js"></script>
  </body>
</html>