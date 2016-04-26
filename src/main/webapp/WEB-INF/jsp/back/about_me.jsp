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
		<div class="col-md-2 column" style="background-color:#E9EFF3;">
			<%@include file="./common/me_nav.jsp" %>
	<!-- 导航结束 -->
		</div>
		<div class="col-md-10 column mycontent" style="background-color: rgb(243, 246, 248);">
			<div class="jumbotron well" 
			style="background-color:#FFF;margin-left: 100px;margin-top: 50px;">
				<p>修改个人信息</p>
					<form role="form" method="post" action="${ctx}/userController/modifyInfo.do">
						<div class="form-group" style="display:none;">
							<div>
								<input id="_id" name="_id" value="${user._id}"/>
							</div>
						</div>
						<div class="form-group">
							 <label for="title" class="control-label">昵称:</label>
							 <div>
							 	<input class="form-control" id="nicename" name="nicename" type="text" value="${user.nicename}"/>
							 </div>
						</div>
						<div class="form-group">
							 <label for="title" class="control-label">博客名称:</label>
							 <div>
							 	<input class="form-control" id="blogname" name="blogname" type="text" value="${user.blogname}"/>
							 </div>
						</div>
						<div class="form-group">
							 <label for="title" class="control-label">博客子标题</label>
							 <div>
							 	<input class="form-control" id="blogsubname" name="blogsubname" type="text" value="${user.blogsubname}"/>
							 </div>
						</div>
						<div class="form-group">
							 <label for="title" class="control-label">个人签名:</label>
							 <div>
							 	<textarea class="form-control" id="description" name="description" type="text">
							 	${user.description}
							 	</textarea>
							 </div>
						</div> 
						<button type="submit" id="sub" class="btn btn-default">保存</button>
					</form>
			</div>
		</div>
	</div>
</div>
     <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="${ctx}/validator/vendor/jquery/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="${ctx}/validator/vendor/bootstrap/js/bootstrap.min.js"></script>
  	<script type="text/javascript" src="${ctx}/validator/dist/js/bootstrapValidator.js"></script>
  	<script type="text/javascript" src="${ctx}/js/ajaxfileupload.js"></script>
 	<script type="text/javascript">
 	$(function(){
 		$("#profile").addClass("active");
 		
 		
 	});
 	function clickInput(){
			$('#file').click();
		}
		function uploadImage(){
				var url_pb = "${ctx}/uploadFileController/ajaxupload.do";
		        $.ajaxFileUpload(
					{
						url:url_pb,
						dataType:'text',
						data:id=1,
						secureuri:false,
						fileElementId:['file'], 
						success: function (data)
						{
							window.location.href=("${ctx}/userController/about_me.do");
						}
					}
				);
			return false;
		}
 	</script>
  </body>
</html>