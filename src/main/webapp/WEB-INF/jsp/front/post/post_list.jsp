<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/taglib.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
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
		<div class="container" >
		<c:forEach items="${postPage.datas}" var="post" varStatus="status">
			<h3>
				<c:out value="${post.title}"></c:out>
			</h3>
			<p>
				摘要: <c:out value="${post.excerpt}"></c:out>
				 <a class="btn btn-link" href="${ctx}/${name}/p/detail.htm?id=${post._id}">文章详情»</a>
			</p>
			<div class="postDesc" style="color:#bcbcbc;">posted <fmt:formatDate value="${post.postdate}" pattern="yyyy-MM-dd HH:mm" /> 阅读(<c:out value="${post.read_count}"></c:out>) 评论(0)  <!-- <a rel="nofollow">编辑</a> --></div>
			<div style="clear: both; margin-bottom: 20px;"></div>
			<div style="border-top: 1px dashed #169fe6;"></div>
		</c:forEach>
		<ul class="pagination mypage">

			<li><a href="${ctx}/post/${name}?pageNo=1">首页</a></li>
		
			<c:choose>
				<c:when test="${postPage.pageNo!= '1'}">
					<li><a href="${ctx}/post/${name}?pageNo=<c:out value="${postPage.pageNo-1}"/>">上一页</a></li>
				</c:when>
				<c:when test="${postPage.pageNo== '1'}">
					<!-- <li class="disabled"><a>上一页</a></li> -->	
				</c:when>
			</c:choose>
			<c:choose>
				<c:when test="${postPage.pageNo-4>='1'}">
					<li><a href="${ctx}/post/${name}?pageNo=<c:out value="${postPage.pageNo-4}"/>">
						<c:out value="${postPage.pageNo-4}"/></a></li>
				</c:when>
			</c:choose>
			<c:choose>
				<c:when test="${postPage.pageNo-3>='1'}">
					<li><a href="${ctx}/post/${name}?pageNo=<c:out value="${postPage.pageNo-3}"/>">
						<c:out value="${postPage.pageNo-3}"/></a></li>
				</c:when>
			</c:choose>
			<c:choose>
				<c:when test="${postPage.pageNo-2>='1'}">
					<li><a href="${ctx}/post/${name}?pageNo=<c:out value="${postPage.pageNo-2}"/>">
						<c:out value="${postPage.pageNo-2}"/></a></li>
				</c:when>
			</c:choose>
			<c:choose>
				<c:when test="${postPage.pageNo-1>='1'}">
					<li><a href="${ctx}/post/${name}?pageNo=<c:out value="${postPage.pageNo-1}"/>">
						<c:out value="${postPage.pageNo-1}"/></a></li>
				</c:when>
			</c:choose>
			<li class="active"><a href="${ctx}/post/${name}?pageNo=<c:out value="${postPage.pageNo}"/>">
				<c:out value="${postPage.pageNo}"/></a></li>
				
			<c:choose>
				<c:when test="${postPage.pageNo+1<=postPage.totalPage}">
					<li><a href="${ctx}/post/${name}?pageNo=<c:out value="${postPage.pageNo+1}"/>">
						<c:out value="${postPage.pageNo+1}"/></a></li>
				</c:when>
			</c:choose>
			<c:choose>
				<c:when test="${postPage.pageNo+2<=postPage.totalPage}">
					<li><a href="${ctx}/post/${name}?pageNo=<c:out value="${postPage.pageNo+2}"/>">
						<c:out value="${postPage.pageNo+2}"/></a></li>
				</c:when>
			</c:choose>	
			<c:choose>
				<c:when test="${postPage.pageNo+3<=postPage.totalPage}">
					<li><a href="${ctx}/post/${name}?pageNo=<c:out value="${postPage.pageNo+3}"/>">
						<c:out value="${postPage.pageNo+3}"/></a></li>
				</c:when>
			</c:choose>	
			<c:choose>
				<c:when test="${postPage.pageNo+4<=postPage.totalPage}">
					<li><a href="${ctx}/post/${name}?pageNo=<c:out value="${postPage.pageNo+4}"/>">
						<c:out value="${postPage.pageNo+4}"/></a></li>
				</c:when>
			</c:choose>	
			<c:choose>	
				<c:when test="${postPage.pageNo != postPage.totalPage}">
						<li><a href="${ctx}/post/${name}?pageNo=<c:out value="${postPage.pageNo+1}"/>">下一页</a></li>
				</c:when>
				<c:when test="${postPage.pageNo == postPage.totalPage}">
						<!-- <li class="disabled"><a>下一页</a></li> -->
				</c:when>
			</c:choose>
			
			<li><a href="${ctx}/post/${name}?pageNo=<c:out value="${postPage.totalPage}"/>">尾页</a></li>
		</ul>
	</div>		
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="${ctx}/validator/vendor/jquery/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="${ctx}/validator/vendor/bootstrap/js/bootstrap.min.js"></script>
  	<script type="text/javascript" src="${ctx}/validator/dist/js/bootstrapValidator.js"></script>
  </body>
</html>