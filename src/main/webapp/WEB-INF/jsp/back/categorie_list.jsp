<%@ page contentType="text/html;charset=utf-8"%>
<%@include file="/WEB-INF/jsp/taglib.jsp" %>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>壹博客-后台管理系统-分类编辑</title>

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
		<div class="col-md-1 column left-nav">
			<%@include file="./common/left_nav.jsp" %>
	<!-- 导航结束 -->
		</div>
		<div class="col-md-11 column mycontent">
			<ul class="breadcrumb">
				<li>
					 <a href="#">编辑分类</a>
				</li>
			</ul>
			<%@include file="./common/categories_list.jsp" %>
			<ul class="breadcrumb">
				<li>
					 <a href="#">添加新分类</a>
				</li>
			</ul>
			<div class="col-md-5 column">
			<form role="form" method="post" action="${ctx}/categorieController/create_categorie.do">
						
						<div class="form-group">
							 <label for="title" class="control-label">标题</label>
							 <div>
							 	<input class="form-control" id="title" name="title" type="text"/>
							 </div>
						</div>
						<div class="form-group">
							 <label for="title" class="control-label">可见性:</label>
							 <div>
							 	可见<input class="" id="visible" name="visible" type="radio" />
							 	不可见<input class="" id="visible" name="visible" type="radio" />
							 </div>
						</div>
						
						<div class="form-group">
							 <label for="title" class="control-label">描述:</label>
							 <div>
							 	<textarea class="form-control" id="description" name="description" type="text">
							 	
							 	</textarea>
							 </div>
						</div> 
						<button type="submit" id="sub" class="btn btn-default">保存</button>
					</form>
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