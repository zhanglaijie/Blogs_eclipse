<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="/WEB-INF/jsp/taglib.jsp"%>
<!DOCTYPE HTML>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<title>壹博客登陆系统--找回密码</title>
<!-- Bootstrap -->
<link rel="stylesheet"
	href="${ctx}/validator/vendor/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${ctx}/validator/dist/css/bootstrapValidator.css" />
<link rel="stylesheet" href="${ctx}/css/common/common.css">
</head>
<body style="background-color:#E9EFF3;">
	<div class="container">
		<div class="login">
			<h1>
				<a href="${ctx}/postsController/listPosts.do">壹博客</a>
			</h1>
		</div>
		<div class="row clearfix">
			<div class="col-md-3 column"></div>
			<div class="col-md-6 column" style="margin-top: 120px;">
				<div class="jumbotron" style="background-color:#fff;border:1px solid #d4dfe7">
					<h3>重设密码</h3>
					<form id="input-passwd" action="${ctx}/user/savePasswd.do" class="form-horizontal" method="post" role="form">
						<div class="form-group">
						<label
								class="col-sm-4 control-label" for="password">
								<span class="glyphicon glyphicon-lock"></span>用户密码</label>
							<div class="col-sm-8">
								<input type="password" class="form-control"
									id="password" name="password" placeholder="请输入密码">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-4 control-label" for="confirmpassword">
								<span class="glyphicon glyphicon-lock"></span>确认密码</label>
							<div class="col-sm-8">
								<input type="password" class="form-control"
									id="confirmpassword" name="confirmpassword" placeholder="请再次输入密码">
							</div>
						</div>
						<div class="form-group" style="display:none;">
							<label class="col-sm-4 control-label" for="confirmpassword">
								<span class="glyphicon glyphicon-lock"></span>确认密码</label>
							<div class="col-sm-8">
								<input type="text" id="email" name="email" value="${user.email}" /> 
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-offset-4 col-sm-8">
								<button type="submit" class="btn btn-primary">确认修改</button>
								<button type="reset" id="pwdReset" class="btn btn-info">取消</button>
							</div>
						</div>
					</form>
				</div>
			</div>
			<div class="col-md-3 column"></div>
		</div>
	</div>
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="${ctx}/validator/vendor/jquery/jquery.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script
		src="${ctx}/validator/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript"
		src="${ctx}/validator/dist/js/bootstrapValidator.js"></script>
	<script type="text/javascript" src="${ctx}/js/findpasswd.js"></script>
</body>
</html>