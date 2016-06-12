<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/taglib.jsp" %>
<!DOCTYPE HTML>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>${user.blogname}-壹博客</title>
    <!-- Bootstrap -->
    <link rel="stylesheet" href="${ctx}/validator/vendor/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="${ctx}/validator/dist/css/bootstrapValidator.css"/>
	<link rel="stylesheet" href="${ctx}/css/front/frontIndex.css"/>
  </head>
  <body>
			<div class="container" style="width:100%">
				<div class="row clearfix" style="background: url(${ctx}/image/body_bg.png) repeat-x scroll 0 0 #f0eef5;">
					<div class="col-md-2 column">
						<img alt="140x140" src="${ctx} ${user.album}" style="width:140px;height:140px; padding: 20px;"/>
					</div>
					<div class="col-md-4 column" style="color: #fff;">
						<h3>
							<c:out value="${user.blogname}"></c:out>
						</h3>
							<h4><c:out value="${user.blogsubname}"></c:out></h4>
					</div>
					<div class="col-md-1 column">
					</div>
					<div class="col-md-5 column" style="padding-top:138px">
						<ul class="nav nav-tabs">
							<li class="active">
								 <a href="${ctx}/${user.blogaddress}">首页</a>
							</li>
							<li>
								 <a href="${ctx}/postsController/createPostNavigation.do">新随笔</a>
							</li>
							<li>
								 <a href="${ctx}/forback/${user.blogaddress}">登陆</a>
							</li>
							<li>
								 <a href="#">订阅</a>
							</li>
							<li>
								 <a href="${ctx}/author/index">管理</a>
							</li>
						</ul>
					</div>
				</div>
				<div class="row clearfix " style="background-color:#f0eef5;">
					<div class="col-md-1 column">
					</div>
					<div class="col-md-7 column" style="border: 1px solid #169fe6;background-color: #fff; margin-top: 30px;">
						<iframe src="${ctx}/post/${user.blogaddress}" id="iframepage" frameborder="0" scrolling="no" 
						marginheight="0" marginwidth="0" onload='IFrameReSize("iframepage");IFrameReSizeWidth("iframepage");' width="700px"></iframe>
					</div>
					<div class="col-md-4 column">
						
						<div class="panel panel-primary" style="top: 30px; position: relative;">
							<div class="panel-heading">
								<h3 class="panel-title">
									公告
								</h3>
							</div>
							<div class="panel-body" >
								<p>昵称：<c:out value="${user.nicename}"/></p>
								<p>园龄：<c:out value="${old}"></c:out></p>
								<p>关注：<c:out value="${myfollowed}"></c:out>人</p>
								<p>粉丝：<c:out value="${followmed}"></c:out>人</p>
							</div>
						</div>
						<div class="panel panel-primary" style="top: 30px; position: relative;">
							<div class="panel-heading">
								<h3 class="panel-title">
									搜索
								</h3>
							</div>
							<div class="panel-body" >
								<div class="form-horizontal" >
									<div class="form-group">
										<div class="col-sm-7 col-sm-offset-1">
											<input type="text" class="form-control" id="title" name="title" placeholder="标题"/>
										</div>
										<div class="col-sm-2">
											 <button onclick="getPostListByTitle();" type="button" class="btn btn-default">给我搜</button>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="list-group" style="top: 30px; position: relative;">
							 <a href="#" class="list-group-item active">随笔分类</a>
							<c:forEach items="${cateList}" var="categories" varStatus="status">
								<div class="list-group-item" onclick="getPostListByCate('${categories._id}');">
								 	<span class="badge"><c:out value="${categories.count}"></c:out></span>
								 	<c:out value="${categories.title}"></c:out>
								</div>
							</c:forEach>
						</div>
						<!-- <ul class="nav nav-pills" style="top: 30px; position: relative;">
							<li class="active">
								 <a href="#"> <span class="badge pull-right">42</span> Home</a>
							</li>
							<li class="active">
								 <a href="#"> <span class="badge pull-right">42</span> Home</a>
							</li>
							<li>
								 <a href="#"> <span class="badge pull-right">42</span> Home</a>
							</li>
							<li>
								 <a href="#"> <span class="badge pull-right">42</span> Home</a>
							</li>
							<li>
								 <a href="#"> <span class="badge pull-right">42</span> Home</a>
							</li>
							<li>
								 <a href="#"> <span class="badge pull-right">16</span> More</a>
							</li>
						</ul> -->
					</div>
				</div>
			</div>
	<!-- <div id="footer">
        <a href="http://www.cnblogs.com/ContactUs.aspx">联系我们</a><a href="http://group.cnblogs.com/forum/public/">反馈问题</a>©2016<a href="http://www.cnblogs.com">博客园</a>/ 代码改变世界
    </div> -->
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="${ctx}/validator/vendor/jquery/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="${ctx}/validator/vendor/bootstrap/js/bootstrap.min.js"></script>
  	<script type="text/javascript" src="${ctx}/validator/dist/js/bootstrapValidator.js"></script>
  	<script type="text/javascript">   
	/* function iFrameHeight() {   
		var ifm= document.getElementById("iframepage");   
		var subWeb = document.frames ? document.frames["iframepage"].document : ifm.contentDocument;   
		if(ifm != null && subWeb != null) {
		   ifm.height = subWeb.body.scrollHeight;
		   ifm.width = subWeb.body.scrollWidth;
		}   
	}    */
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
	function getPostListByCate(obj){
		$("#iframepage").attr("src","${ctx}/post/${user.blogaddress}?cateId="+obj);
	}
	function getPostListByTitle(){
		var title = $("#title").val();
		$("#iframepage").attr("src","${ctx}/post/${user.blogaddress}?title="+title);
	}
	</script>
  </body>
</html>