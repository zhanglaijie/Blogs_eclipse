<%@ page contentType="text/html;charset=utf-8"%>
<%@include file="/WEB-INF/jsp/taglib.jsp" %>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>新建文章</title>

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
		<div class="col-md-2 column left-nav">
			<%@include file="./common/left_nav.jsp" %>
	<!-- 左边导航结束 -->
		</div>
		<div class="col-md-10 column mycontent">
			<ul class="breadcrumb">
				<li>
					 <a href="#">编辑文章</a>
				</li>
			</ul>
			<form role="form" method="post" action="${ctx}/postsController/modifyPost.do">
				<div class="form-group" style="display:none;">
					<div>
						<input name="_id" value="${post._id}"/>
					</div>
				</div>
				<div class="form-group">
					 <label for="title" class="control-label">标题:</label>
					 <div>
					 	<input class="form-control" id="title" name="title" type="text" value="${post.title}"/>
					 </div>
				</div>
				<div class="form-group">
					 <label for="exampleInputPassword1"> 内容(CKeditor编辑器)</label>
					 <textarea id="editor" name="content">
						${post.content}
					 </textarea>
				</div>
				<div class="form-group">
					 <label for="exampleInputFile">File input</label><input id="exampleInputFile" type="file" />
					<p class="help-block">
						Example block-level help text here.
					</p>
				</div>
				<div class="checkbox">
					 <label><input type="checkbox" />Check me out</label>
				</div> <button type="submit" id="sub" class="btn btn-default">保存</button>
			</form>
		</div>
	</div>
</div>
     <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="${ctx}/validator/vendor/jquery/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="${ctx}/validator/vendor/bootstrap/js/bootstrap.min.js"></script>
  	<script type="text/javascript" src="${ctx}/validator/dist/js/bootstrapValidator.js"></script>
  	<script src="${ctx}/ckeditor/ckeditor.js"></script>
	<script src="${ctx}/ckeditor/samples/js/sample.js"></script>
  	<script type="text/javascript">
	  	$(document).ready(function() {
	  		initSample();
	  	});
  	</script>
  </body>
</html>