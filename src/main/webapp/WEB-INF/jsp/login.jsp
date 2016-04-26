<%@ page contentType="text/html;charset=utf-8"%>
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
	<link rel="stylesheet" href="${ctx}/css/login.css">
  </head>
  <body>
	<div class="container">
		<div class="login">
		<h1><a href="${ctx}/postsController/listPosts.do">壹博客</a></h1>
		</div>
	<div class="row clearfix login-position">
		<div class="col-md-4 column">
			
		</div>
		<div class="col-md-4 column login-color">
			<div class="tabbable" id="tabs-803249">
				<ul class="nav nav-tabs">
					<li class="active">
						 <a href="#panel-92846" data-toggle="tab">登陆</a>
					</li>
					<li>
						 <a href="#panel-556995" data-toggle="tab">注册</a>
					</li>
				</ul>
				<div class="tab-content">
					<div class="tab-pane active" id="panel-92846">
						<form id="login-form" action="${ctx}/j_spring_security_check" method="post" class="form-horizontal" role="form">
							<div class="form-group">
								 <label for="j_username" class="col-sm-3 control-label">
									<span class="glyphicon glyphicon-user"></span> 用户
								 </label>
								<div class="col-sm-9">
									<input id="j_username" name="j_username" class="form-control" placeholder="邮箱" id="inputEmail3" type="text" />
								</div>
							</div>
							<div class="form-group">
								 <label for="j_password" class="col-sm-3 control-label">
								 <span class="glyphicon glyphicon-lock"></span>
								 密码</label>
								<div class="col-sm-9">
									<input class="form-control" id="j_password" name="j_password" placeholder="密码" type="password" />
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-offset-2 col-sm-10">
										<label><div id="login-error">${error}</div></label>
									<div class="checkbox">
										 <label><input type="checkbox" />Remember me</label>
									</div>
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-offset-2 col-sm-10">
									  
									 <button type="submit"  class="btn btn-primary">登陆</button>
									 <button type="reset" id="loginReset" class="btn btn-info">取消</button>
									 
									 <a id="modal-657474" href="#modal-container-657474" 
									 role="button" class="btn" data-toggle="modal">找回密码</a>
								</div>
							</div>
						</form>
					</div>
					<div class="tab-pane" id="panel-556995">
						<form id="register-form" class="form-horizontal" role="form" action="${ctx}/user/register" method="post">
							<div class="form-group">
								 <label for="inputEmail3" class="col-sm-4 control-label">
								 <span class="glyphicon glyphicon-envelope"></span>邮箱地址</label>
								<div class="col-sm-8">
									<input class="form-control" id="email" name="email" type="email" />
								</div>
							</div>
							<div class="form-group">
								 <label for="inputPassword3" class="col-sm-4 control-label">
								 <span class="glyphicon glyphicon-lock"></span>用户密码
								 </label>
								<div class="col-sm-8">
									<input class="form-control" id="password" name="password" type="password" />
								</div>
							</div>
							<div class="form-group">
								 <label for="inputEmail3" class="col-sm-4 control-label">
								 <span class="glyphicon glyphicon-check"></span>重复密码</label>
								<div class="col-sm-8">
									<input class="form-control" id="confirmPassword" name="confirmPassword" type="password" />
								</div>
							</div>
							<div class="form-group">
								 <label for="inputPassword3" class="col-sm-4 control-label">
								 <span class="glyphicon glyphicon-pencil"></span>博客名称</label>
								<div class="col-sm-8">
									<input class="form-control" name="blogname" id="blogname" type="text" />
								</div>
							</div>
							<div class="form-group">
								 <label for="inputEmail3" class="col-sm-4 control-label" 
								 ><span class="glyphicon glyphicon-home"></span>博客地址</label>
								<div class="col-sm-8">
									http://laijie.top/
									<input  class="form-control blogsaddress" id="blogaddress" name="blogaddress" type="text" />
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-offset-2 col-sm-10">
									<input type="hidden" name="action" value="register"/>
									 <button id="validateBtn" type="submit" class="btn btn-primary">注册</button>
									 <button id="resetBtn" type="reset" class="btn btn-info">取消</button>
								</div>
							</div>
							
						</form>
					</div>
				</div>
			</div>
			
		</div>
		<div class="col-md-4 column">
		</div>
	</div>
	
	<!-- 弹出窗口 start -->
	<div class="modal fade" id="modal-container-657474" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
				<form id="email-form" action="${ctx}/user/tofindPasswdByEmail.do" method="post"
					class="form-horizontal" role="form">
					<div class="modal-content" style="width: 350px;">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">×</button>
							<h4 class="modal-title" id="myModalLabel">找回密码</h4>
						</div>
						<div class="modal-body emailout">
							<div class="form-group">

								<div class="row">
									<div class="col-md-12 column">

										<div class="form-group">
											<label for="inputEmail3" class="col-sm-4 control-label">
												<span class="glyphicon glyphicon-envelope"></span> 邮箱地址</label>
											<div class="col-sm-8">
												<input class="form-control" id="backemail" name="backemail"
													type="email" />
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="modal-footer">
							<button type="submit" class="btn btn-primary">发送</button>
							<button type="button" id="resetBak" class="btn btn-default"
								data-dismiss="modal">关闭</button>

						</div>
					</div>
				</form>
			</div>
	</div>
	<!-- end -->
</div>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="${ctx}/validator/vendor/jquery/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="${ctx}/validator/vendor/bootstrap/js/bootstrap.min.js"></script>
  	<script type="text/javascript" src="${ctx}/validator/dist/js/bootstrapValidator.js"></script>
  	<script type="text/javascript" src="${ctx}/js/login.js"></script>
  </body>
</html>
