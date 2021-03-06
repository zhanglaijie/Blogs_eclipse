<%@ page contentType="text/html;charset=utf-8"%>
<%@include file="/WEB-INF/jsp/taglib.jsp" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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
		<div class="row clearfix">
		<div class="col-md-12 column">
			<nav class="navbar mynav navbar-fixed-top" role="navigation">
				<div class="navbar-header">
					 <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
						<span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button> <a class="navbar-brand" href="${ctx}/postsController/listPosts.do">壹博客</a>
				</div>
				
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav" style="display: none;">
						<li class="active">
							 <a href="#">Link</a>
						</li>
						<li>
							 <a href="#">Link</a>
						</li>
						<li class="dropdown">
							 <a href="#" class="dropdown-toggle" data-toggle="dropdown">Dropdown<strong class="caret"></strong></a>
							<ul class="dropdown-menu">
								<li>
									 <a href="#">Action</a>
								</li>
								<li>
									 <a href="#">Another action</a>
								</li>
								<li>
									 <a href="#">Something else here</a>
								</li>
								<li class="divider">
								</li>
								<li>
									 <a href="#">Separated link</a>
								</li>
								<li class="divider">
								</li>
								<li>
									 <a href="#">One more separated link</a>
								</li>
							</ul>
						</li>
					</ul>
					<form class="navbar-form navbar-left" role="search" style="display: none;">
						<div class="form-group">
							<input type="text" class="form-control" />
						</div> <button type="submit" class="btn btn-default">Submit</button>
					</form>
					<ul class="nav navbar-nav navbar-right">
						<li class="dropdown">
							 <a href="#" class="dropdown-toggle" data-toggle="dropdown">
								 <sec:authentication property="name"></sec:authentication>
								 <strong class="caret"></strong>
							 </a>
							<ul class="dropdown-menu">
								<li>
									 <a href="${ctx}/userController/about_me.do">个人中心</a>
								</li>
								<li>
									 <a href="#">账号设置</a>
								</li>
								<li>
									 <a href="#">意见反馈</a>
								</li>
								<li class="divider">
								</li>
								<li>
									 <a href="${ctx}/userController/logout.do">退出</a>
								</li>
							</ul>
						</li>
						<li>
							 <a class="myblog" href="${ctx}/${user.blogaddress}">我的博客</a>
						</li>
						<li>
							 &nbsp;&nbsp;&nbsp;&nbsp;
							 &nbsp;&nbsp;&nbsp;&nbsp;
						</li>
					</ul>
				</div>
				
			</nav>
		</div>
	</div>
	<!-- 导航结束 -->
	<div class="row clearfix from-top">
		<div class="col-md-2 column left-nav">
			<div class="panel panel-primary ">
				<div class="panel-heading">
					<h3 class="panel-title">
						操作
					</h3>
				</div>
					<div class="panel-body">
					<a href="${ctx}/postsController/listPosts.do">我的随笔</a>
				</div>
				<div class="panel-body">
					<a href="${ctx}/postsController/createPostNavigation.do">添加新随笔</a>
				</div>
				<div class="panel-body">
					<a class="draft">草稿箱</a>
				</div>
				<div class="panel-body">
					博客签名
				</div>
				<div class="panel-body">
					博客备份
				</div>
				<div class="panel-body">
					博客搬家
				</div>
				<div class="panel-body">
					<a href="${ctx}/categorieController/list_categorie.do">[编辑分类]</a>
				</div>
			</div>
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
						 <iframe id="menuFrame" name="menuFrame" src="${ctx}/postsController/listDrafts.do" style="overflow:visible;" scrolling="yes" frameborder="no" height="100%" width="100%"></iframe>
						<%-- <!--正文—左侧导航栏start-->
						<%@include file="./common/post_list.jsp" %> --%>
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
  	<script type="text/javascript">
  	$(function(){
  		$(".draft").click(function(){
  			alert('href="${ctx}/postsController/listDrafts.do"');
  		});
  	})
  	</script>
  </body>
</html>