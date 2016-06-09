<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
								 <a href="#">首页</a>
							</li>
							<li>
								 <a href="${ctx}/postsController/createPostNavigation.do">新随笔</a>
							</li>
							<li>
								 <a href="#">联系</a>
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
						<c:forEach items="${postPage.datas}" var="post" varStatus="status">
							<h3>
								<c:out value="${post.title}"></c:out>
							</h3>
							<p>
								摘要: <c:out value="${post.excerpt}"></c:out>
								 <a class="btn btn-link" href="#">文章详情»</a>
							</p>
							<div class="postDesc" style="color:#bcbcbc;">posted @ 2016-03-22 15:04 Me 阅读(9) 评论(0)  <a rel="nofollow">编辑</a></div>
							<div style="clear: both; margin-bottom: 20px;"></div>
							<div style="border-top: 1px dashed #169fe6;"></div>
						</c:forEach>
						<ul class="pagination mypage">
	
							<li><a href="${ctx}/${user.blogaddress}?pageNo=1">首页</a></li>
						
							<c:choose>
								<c:when test="${postPage.pageNo!= '1'}">
									<li><a href="${ctx}/${user.blogaddress}?pageNo=<c:out value="${postPage.pageNo-1}"/>">上一页</a></li>
								</c:when>
								<c:when test="${postPage.pageNo== '1'}">
									<!-- <li class="disabled"><a>上一页</a></li> -->	
								</c:when>
							</c:choose>
							<c:choose>
								<c:when test="${postPage.pageNo-4>='1'}">
									<li><a href="${ctx}/${user.blogaddress}?pageNo=<c:out value="${postPage.pageNo-4}"/>">
										<c:out value="${postPage.pageNo-4}"/></a></li>
								</c:when>
							</c:choose>
							<c:choose>
								<c:when test="${postPage.pageNo-3>='1'}">
									<li><a href="${ctx}/${user.blogaddress}?pageNo=<c:out value="${postPage.pageNo-3}"/>">
										<c:out value="${postPage.pageNo-3}"/></a></li>
								</c:when>
							</c:choose>
							<c:choose>
								<c:when test="${postPage.pageNo-2>='1'}">
									<li><a href="${ctx}/${user.blogaddress}?pageNo=<c:out value="${postPage.pageNo-2}"/>">
										<c:out value="${postPage.pageNo-2}"/></a></li>
								</c:when>
							</c:choose>
							<c:choose>
								<c:when test="${postPage.pageNo-1>='1'}">
									<li><a href="${ctx}/${user.blogaddress}?pageNo=<c:out value="${postPage.pageNo-1}"/>">
										<c:out value="${postPage.pageNo-1}"/></a></li>
								</c:when>
							</c:choose>
							<li class="active"><a href="${ctx}/${user.blogaddress}?pageNo=<c:out value="${postPage.pageNo}"/>">
								<c:out value="${postPage.pageNo}"/></a></li>
								
							<c:choose>
								<c:when test="${postPage.pageNo+1<=postPage.totalPage}">
									<li><a href="${ctx}/${user.blogaddress}?pageNo=<c:out value="${postPage.pageNo+1}"/>">
										<c:out value="${postPage.pageNo+1}"/></a></li>
								</c:when>
							</c:choose>
							<c:choose>
								<c:when test="${postPage.pageNo+2<=postPage.totalPage}">
									<li><a href="${ctx}/${user.blogaddress}?pageNo=<c:out value="${postPage.pageNo+2}"/>">
										<c:out value="${postPage.pageNo+2}"/></a></li>
								</c:when>
							</c:choose>	
							<c:choose>
								<c:when test="${postPage.pageNo+3<=postPage.totalPage}">
									<li><a href="${ctx}/${user.blogaddress}?pageNo=<c:out value="${postPage.pageNo+3}"/>">
										<c:out value="${postPage.pageNo+3}"/></a></li>
								</c:when>
							</c:choose>	
							<c:choose>
								<c:when test="${postPage.pageNo+4<=postPage.totalPage}">
									<li><a href="${ctx}/${user.blogaddress}?pageNo=<c:out value="${postPage.pageNo+4}"/>">
										<c:out value="${postPage.pageNo+4}"/></a></li>
								</c:when>
							</c:choose>	
							<c:choose>	
								<c:when test="${postPage.pageNo != postPage.totalPage}">
										<li><a href="${ctx}/${user.blogaddress}?pageNo=<c:out value="${postPage.pageNo+1}"/>">下一页</a></li>
								</c:when>
								<c:when test="${postPage.pageNo == postPage.totalPage}">
										<!-- <li class="disabled"><a>下一页</a></li> -->
								</c:when>
							</c:choose>
							
							<li><a href="${ctx}/${user.blogaddress}?pageNo=<c:out value="${postPage.totalPage}"/>">尾页</a></li>
						</ul>
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
								<p>园龄：7个月</p>
								<p>关注：0人</p>
								<p>粉丝：2人</p>
							</div>
						</div>
						
						<div class="list-group" style="top: 30px; position: relative;">
							 <a href="#" class="list-group-item active">随笔分类</a>
							<c:forEach items="${cateList}" var="categories" varStatus="status">
								<div class="list-group-item">
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
  </body>
</html>