<%@ page contentType="text/html;charset=utf-8"%>
<%@include file="/WEB-INF/jsp/taglib.jsp" %>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>保存成功</title>

    <!-- Bootstrap -->
    <link rel="stylesheet" href="${ctx}/validator/vendor/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="${ctx}/validator/dist/css/bootstrapValidator.css"/>
	<link rel="stylesheet" href="${ctx}/css/common/common.css"/>
	<link rel="stylesheet" href="${ctx}/css/back/index.css"/>
	<link rel="stylesheet" href="${ctx}/ckeditor/sample/css/samples.css">
	<link rel="stylesheet" href="${ctx}/ckeditor/sample/toolbarconfigurator/lib/codemirror/neo.css">

  </head>
  <body>
	<div class="container">
	<%@include file="./common/navbar.jsp" %>
	<!-- 顶部导航结束 -->
	<div class="row clearfix from-top">
		<div class="col-md-1 column left-nav">
			<%@include file="./common/left_nav.jsp" %>
	<!-- 左边导航结束 -->
		</div>
		<div class="col-md-11 column mycontent">
			<ul class="breadcrumb">
				<li>
					 <a href="#">保存成功</a>
				</li>
			</ul>
			<div class="jumbotron">
				<h4>
					<!-- 前端显示的文章详情 -->
					随笔标题:<a class="btn btn-link btn-large" href="#">
					<c:out value="${post.title}"></c:out></a>
				</h4>
				<p>
					 <a class="btn btn-link btn-large" href="#">» 立即查看</a>
				</p>
				<p>
					 <a class="btn btn-link btn-large" 
					 href="${ctx}/postsController/modifyPostNavigation.do?_id=${post._id}">» 继续编辑</a>
				</p>
				<p>
					 <a class="btn btn-link btn-large" href="#">» 后台首页</a>
				</p>
				<p>
					 <a class="btn btn-link btn-large" href="#">» 博客首页</a>
				</p>
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