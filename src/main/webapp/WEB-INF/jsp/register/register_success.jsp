<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="/WEB-INF/jsp/taglib.jsp"%>
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
  </head>
  <body style="background-color:#E9EFF3;">
			<div class="container">
				<div class="row clearfix">
					<div class="col-md-12 column">
						<h3>
						壹博客系统 OneBlogs
					</h3>
				</div>
			</div>
			<div class="row clearfix" >
				<div class="col-md-3 column">
				</div>
				<div class="col-md-6 column" style="margin-top: 120px;">
					<div class="jumbotron" style="background-color:#fff;border:1px solid #d4dfe7">
						<h3>
							请确认你的邮箱,只差一步你的邮箱注册就成功啦
						</h3>
						
						<p>
							 <a class="btn btn-warning btn-large" href="<c:out value="${mailurl}"></c:out>">完成注册</a>
						</p>
						<p>如果您看不到上方的按钮</p>
						<p>可点击下面的链接以完成注册，或复制到地址栏打开</p>
						<p><a href="<c:out value="${mailurl}"></c:out>"><c:out value="${mailurl}"></c:out></a></p>
					</div>
				</div>
				<div class="col-md-3 column">
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