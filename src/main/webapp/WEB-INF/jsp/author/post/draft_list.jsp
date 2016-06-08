<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<%@ page contentType="text/html;charset=utf-8"%>
<%@include file="/WEB-INF/jsp/taglib.jsp" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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
<table class="table mytable">
	<thead>
		<tr>
			<th>标题</th>
			<th>评论数</th>
			<th>阅读数</th>
			<th>操作</th>
			<th>操作</th>
			<th>操作</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${postPage.datas}" var="post" varStatus="status">
		<tr>
			<td><c:out value="${post.title}" />（<fmt:formatDate value="${post.postdate}" pattern="yyyy-MM-dd HH:mm" />）</td>
			
			<td><c:out value="${post.read_count}" /></td>
			<td><c:out value="${post.comment_count}" /></td>
			<td><a href="${ctx}/postsController/modifyPostNavigation.do?_id=${post._id}">编辑</a></td>
			<td><a href="${ctx}/postsController/changeStatus?_id=${post._id}&pageNo=${postPage.pageNo}&status=1">发布</a></td>
			<td><a href="${ctx}/postsController/deletePost.do?_id=${post._id}&pageNo=${postPage.pageNo}">删除</a></td>
		</tr>
		</c:forEach>
	</tbody>
</table>
<ul class="pagination mypage">
	
	<li><a href="${ctx}/postsController/listDrafts.do?pageNo=1">首页</a></li>

	<c:choose>
		<c:when test="${postPage.pageNo!= '1'}">
			<li><a href="${ctx}/postsController/listDrafts.do?pageNo=<c:out value="${postPage.pageNo-1}"/>">上一页</a></li>
		</c:when>
		<c:when test="${postPage.pageNo== '1'}">
			<!-- <li class="disabled"><a>上一页</a></li> -->	
		</c:when>
	</c:choose>
	<c:choose>
		<c:when test="${postPage.pageNo-4>='1'}">
			<li><a href="${ctx}/postsController/listDrafts.do?pageNo=<c:out value="${postPage.pageNo-4}"/>">
				<c:out value="${postPage.pageNo-4}"/></a></li>
		</c:when>
	</c:choose>
	<c:choose>
		<c:when test="${postPage.pageNo-3>='1'}">
			<li><a href="${ctx}/postsController/listDrafts.do?pageNo=<c:out value="${postPage.pageNo-3}"/>">
				<c:out value="${postPage.pageNo-3}"/></a></li>
		</c:when>
	</c:choose>
	<c:choose>
		<c:when test="${postPage.pageNo-2>='1'}">
			<li><a href="${ctx}/postsController/listDrafts.do?pageNo=<c:out value="${postPage.pageNo-2}"/>">
				<c:out value="${postPage.pageNo-2}"/></a></li>
		</c:when>
	</c:choose>
	<c:choose>
		<c:when test="${postPage.pageNo-1>='1'}">
			<li><a href="${ctx}/postsController/listDrafts.do?pageNo=<c:out value="${postPage.pageNo-1}"/>">
				<c:out value="${postPage.pageNo-1}"/></a></li>
		</c:when>
	</c:choose>
	<li class="active"><a href="${ctx}/postsController/listDrafts.do?pageNo=<c:out value="${postPage.pageNo}"/>">
		<c:out value="${postPage.pageNo}"/></a></li>
		
	<c:choose>
		<c:when test="${postPage.pageNo+1<=postPage.totalPage}">
			<li><a href="${ctx}/postsController/listDrafts.do?pageNo=<c:out value="${postPage.pageNo+1}"/>">
				<c:out value="${postPage.pageNo+1}"/></a></li>
		</c:when>
	</c:choose>
	<c:choose>
		<c:when test="${postPage.pageNo+2<=postPage.totalPage}">
			<li><a href="${ctx}/postsController/listDrafts.do?pageNo=<c:out value="${postPage.pageNo+2}"/>">
				<c:out value="${postPage.pageNo+2}"/></a></li>
		</c:when>
	</c:choose>	
	<c:choose>
		<c:when test="${postPage.pageNo+3<=postPage.totalPage}">
			<li><a href="${ctx}/postsController/listDrafts.do?pageNo=<c:out value="${postPage.pageNo+3}"/>">
				<c:out value="${postPage.pageNo+3}"/></a></li>
		</c:when>
	</c:choose>	
	<c:choose>
		<c:when test="${postPage.pageNo+4<=postPage.totalPage}">
			<li><a href="${ctx}/postsController/listDrafts.do?pageNo=<c:out value="${postPage.pageNo+4}"/>">
				<c:out value="${postPage.pageNo+4}"/></a></li>
		</c:when>
	</c:choose>	
	<c:choose>	
		<c:when test="${postPage.pageNo != postPage.totalPage}">
				<li><a href="${ctx}/postsController/listDrafts.do?pageNo=<c:out value="${postPage.pageNo+1}"/>">下一页</a></li>
		</c:when>
		<c:when test="${postPage.pageNo == postPage.totalPage}">
				<!-- <li class="disabled"><a>下一页</a></li> -->
		</c:when>
	</c:choose>
	
	<li><a href="${ctx}/postsController/listDrafts.do?pageNo=<c:out value="${postPage.totalPage}"/>">尾页</a></li>
</ul>
</div>
     <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="${ctx}/validator/vendor/jquery/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="${ctx}/validator/vendor/bootstrap/js/bootstrap.min.js"></script>
  	<script type="text/javascript" src="${ctx}/validator/dist/js/bootstrapValidator.js"></script>
  	<script type="text/javascript">
  	$(function(){
  		$(".draft").click(function(){
  			alert('href="${ctx}/postsController/listDrafts.do"');
  		});
  	})
  	</script>
  </body>
</html>