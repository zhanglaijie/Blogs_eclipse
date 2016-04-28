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
	<!-- 导航结束 -->
	<div class="row clearfix from-top">
		<div class="col-md-2 column" style="background-color:#E9EFF3;">
			<div style="text-align: center;">
			    <input type="file" id="file" accept="image/*" name="file" multiple="multiple" style="display: none;" onchange="uploadImage();"/>
				<a href="javascript:void(0)" onclick="clickInput();">
					<img alt="140x140" style="width:160px;height:160px;margin-top:40px;" src="${ctx}${user.album}" class="img-circle" />
				</a>
				<h2><c:out value="${user.nicename}" default="末设置用户名"/></h2>
				<h3><a>@<c:out value="${user.username}"/></a></h3>
				<a type="button" class="btn btn-default btn-lg" style="margin-top:20px;" href="${ctx}/userController/logout.do">sign out</a>
			</div>
			<ul class="nav nav-pills nav-stacked" style="margin-top: 30px;">
				<li id="profile">
					 <a href="${ctx}/userController/about_me.do">个人信息</a>
				</li>
				<li id="account_setting">
					 <a href="${ctx}/userController/account_settings.do">账户设置</a>
				</li>
				<li>
					 <a href="#">安全</a>
				</li>
				<li>
					 <a href="#">个人通知</a>
				</li>
				<li>
					 <a href="#">帮助反馈</a>
				</li>
			</ul>
	<!-- 导航结束 -->
		</div>
		<div class="col-md-10 column mycontent" style="background-color: rgb(243, 246, 248);">
			<%@include file="C_info.jsp" %>
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
 	<script type="text/javascript">
 	$(function(){
 		$(".mycontent").click(function(){
 			
 		});
 	});
 	</script>
  </body>
</html>