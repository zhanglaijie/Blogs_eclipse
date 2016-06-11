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
		<div class="col-md-2 column" style="background-color:#E9EFF3; height: 600px;">
			<div style="text-align: center;">
			    <input type="file" id="file" accept="image/*" name="file" multiple="multiple" style="display: none;" onchange="uploadImage();"/>
				<a href="javascript:void(0)" onclick="clickInput();">
					<img alt="140x140" style="width:160px;height:160px;margin-top:40px;" src="${ctx}${user.album}" class="img-circle" />
				</a>
				<h2><c:out value="${user.nicename}" default="末设置用户名"/></h2>
				<h3><a>@<c:out value="${user.username}"/></a></h3>
				<a type="button" class="btn btn-default btn-lg" style="margin-top:20px;" href="${ctx}/userController/logout.do">sign out</a>
			</div>
			<!-- 
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
			</ul> -->
	<!-- 导航结束 -->
		</div>
		<div class="col-md-10 column mycontent" style="background-color: rgb(243, 246, 248);">
			<div class="jumbotron well" 
			style="background-color:#FFF;margin-left: 100px;margin-top: 50px;">
			
					<div class="tabbable" id="tabs-547795">
						<ul class="nav nav-tabs">
							<li class="active">
								 <a href="#panel-l1" data-toggle="tab">个人信息</a>
							</li>
							<li>
								 <a id="myfollowed" href="#panel-l2" onclick="" data-toggle="tab">我的订阅</a>
							</li>
							<li>
								 <a href="#panel-l2" data-toggle="tab">我的粉丝</a>
							</li>
							<li>
								 <a href="#panel-l2" data-toggle="tab">账户设置</a>
							</li>
							<li >
								 <a href="#panel-l2" data-toggle="tab">安全</a>
							</li>
						</ul>
						<div class="tab-content">
							<div class="tab-pane active" id="panel-l1">
								<p>&nbsp;</p>
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
										<button type="submit" id="sub" class="btn btn-default"  onclick="window.history.back(-1);">返回</button>
									</form>
							</div>
							<div class="tab-pane" id="panel-l2">
									<iframe id="menuFrame" name="menuFrame"  style="overflow:hidden;" 
										scrolling="yes" frameborder="no" width="100%" height="100%"></iframe>
							</div>
							<div class="tab-pane" id="panel-l3">
								 <table class="table table-bordered table-hover table-condensed" style="margin-top: 25px">
										<thead>
											<tr>
												<th>
													序号
												</th>
												<th>
													用户
												</th>
												<th>
													邮箱
												</th>
												<th>
													订阅时间
												</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>
													1
												</td>
												<td>
													方铁
												</td>
												<td>
													fangtie@qq.com
												</td>
												<td>
													02/04/2012
												</td>
											</tr>
											<tr class="success">
												<td>
													2
												</td>
												<td>
													SSK
												</td>
												<td>
													ssk@qq.com
												</td>
												<td>
													01/04/2012
												</td>
											</tr>
											<tr class="warning">
												<td>
													3
												</td>
												<td>
													周鑫
												</td>
												<td>
													zhouxin@qq.com
												</td>
												<td>
													03/04/2012
												</td>
											</tr>
											<tr class="error">
												<td>
													4
												</td>
												<td>
													蓝冰
												</td>
												<td>
													lanbing@qq.com
												</td>
												<td>
													02/04/2012
												</td>
											</tr>
										</tbody>
									</table>
							</div>
							<div class="tab-pane" id="panel-l4">
								<form role="form" method="post"
									action="${ctx}/postsController/modifyPost.do">
									<div class="form-group" style="display: none;">
										<div>
											<input name="_id" value="${post._id}" />
										</div>
									</div>
									<div class="form-group">
										<label for="title" class="control-label">用户名:</label>
										<div>
											<input class="form-control" id="title" name="title" type="text"
												value="${post.title}" />
										</div>
									</div>
									<div class="form-group">
										<label for="title" class="control-label">邮箱名称:</label>
										<div>
											<input class="form-control" id="title" name="title" type="text"
												value="${post.title}" />
										</div>
									</div>
							
									<button type="submit" id="sub" class="btn btn-default">保存</button>
								</form>
							</div>
							<div class="tab-pane" id="panel-l5">
								<p>
									Howdy, I'm in Section 5.
								</p>
							</div>
							<div class="tab-pane" id="panel-l6">
								<p>
									Howdy, I'm in Section 6.
								</p>
							</div>
							<div class="tab-pane" id="panel-l7">
								<p>
									Howdy, I'm in Section 7.
								</p>
							</div>
						</div>
					</div>
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
 		
 		$("#myfollowed").click(function(){
			$("#menuFrame").attr("src","${ctx}/userController/myfollowed");
		})
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
		
		//iframe高度自适应

		function IFrameReSize(iframename) {
			var pTar = document.getElementById(iframename);
			if (pTar) {  //ff
				if (pTar.contentDocument && pTar.contentDocument.body.offsetHeight) {
					pTar.height = pTar.contentDocument.body.offsetHeight;
					} //ie
					else if (pTar.Document && pTar.Document.body.scrollHeight) {
						pTar.height = pTar.Document.body.scrollHeight;
						}
			}
			}
		
		//iframe宽度自适应
		function IFrameReSizeWidth(iframename) {
			var pTar = document.getElementById(iframename);
			if (pTar) {  //ff
				if (pTar.contentDocument && pTar.contentDocument.body.offsetWidth) {
					pTar.width = pTar.contentDocument.body.offsetWidth;
					}  //ie
					else if (pTar.Document && pTar.Document.body.scrollWidth) {
						pTar.width = pTar.Document.body.scrollWidth;
						}
			}
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