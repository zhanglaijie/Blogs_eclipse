<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/taglib.jsp" %>
<!DOCTYPE HTML>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>壹博客登陆系统</title>
    <!-- Bootstrap -->
    <link rel="stylesheet" href="${ctx}/validator/vendor/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="${ctx}/validator/dist/css/bootstrapValidator.css"/>
	<link rel="stylesheet" href="${ctx}/css/front/frontIndex.css"/>
  </head>
  <body>
	<div class="container" style="margin: 0px;">
		<div class="row clearfix">
			<div class="col-md-12 column">
				<h3><c:out value="${post.title}"></c:out> </h3>			
				${post.content}
				<div style="padding: 10px 0;margin-bottom: 10px;margin-top: 10px;
				border: silver 1px dashed;font-size: 12px;width: 270px;text-align: center;">
					<button type="button" class="btn btn-default btn-info">好文要顶</button>
					<button type="button" class="btn btn-default btn-danger">关注我</button>
					<button type="button" class="btn btn-default btn-warning">收藏该文</button>
				</div>
					<div class="postDesc" style="color:#bcbcbc;">posted <fmt:formatDate value="${post.postdate}" pattern="yyyy-MM-dd HH:mm" /> 阅读(<c:out value="${post.read_count}"></c:out>) 评论(0)  <!-- <a rel="nofollow">编辑</a> --></div>
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