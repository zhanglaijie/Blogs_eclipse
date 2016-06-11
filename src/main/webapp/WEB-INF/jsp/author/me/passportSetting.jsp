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
	<link rel="stylesheet" href="${ctx}/css/common/common.css"/>
	<link rel="stylesheet" href="${ctx}/css/back/index.css"/>
  </head>
  <body>
	<div class="container">
		<form role="form" method="post"
			action="${ctx}/userController/modifyInfo2.do">
			<div class="form-group">
				<label for="title" class="control-label">用户名:</label>
				<div>
					<input class="form-control" id="username" name="username" type="text"
						value="${username}" />
				</div>
			</div>
			<div class="form-group">
				<label for="title" class="control-label">邮箱名称:</label>
				<div>
					<input class="form-control" id="email" name="email" type="text"
						value="${email}" />
				</div>
			</div>
	
			<button type="submit" id="sub" class="btn btn-default">保存</button>
		</form>
	</div>
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="${ctx}/validator/vendor/jquery/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="${ctx}/validator/vendor/bootstrap/js/bootstrap.min.js"></script>
  	<script type="text/javascript" src="${ctx}/validator/dist/js/bootstrapValidator.js"></script>
 </body>
 </html>