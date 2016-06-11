<%@ page contentType="text/html;charset=utf-8"%>
<%@include file="/WEB-INF/jsp/taglib.jsp" %>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>博客签名</title>

    <!-- Bootstrap -->
    <link rel="stylesheet" href="${ctx}/validator/vendor/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="${ctx}/validator/dist/css/bootstrapValidator.css"/>
	<link rel="stylesheet" href="${ctx}/css/common/common.css"/>
	<link rel="stylesheet" href="${ctx}/css/back/index.css"/>
  </head>
  <body>
	<div class="container" style="margin-top: 50px;">
	<div class="row clearfix ">
		
			<ul class="breadcrumb">
				<li>
					 <a href="#">博客签名</a>
				</li>
			</ul>
			<form role="form" action="${ctx}/userController/editblogsign" method="post">
				<div class="form-group">
					 <label for="title" class="control-label">签名:</label>
					 <div>
					 	<input class="form-control" id="description" name=description type="text" value="${sign}"/>
					 </div>
				</div>
					<div class="form-group form-inline">
						<div class="col-md-4">
							<button type="submit"  class="btn btn-info">保存</button>
						</div>
						<div class="col-md-4">
							<button type="reset"  class="btn btn-warning">取消</button>
						</div>
					</div>
			</form>
	</div>
</div>
     <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="${ctx}/validator/vendor/jquery/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="${ctx}/validator/vendor/bootstrap/js/bootstrap.min.js"></script>
  	<script type="text/javascript" src="${ctx}/validator/dist/js/bootstrapValidator.js"></script>	
  </body>
</html>