<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<table class="table mytable">
	<thead>
		<tr>
			<th>标题</th>
			<th>发布状态</th>
			<th>评论数</th>
			<th>阅读数</th>
			<th>操作</th>
			<th>操作</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${postPage.datas}" var="post" varStatus="status">
		<tr>
			<td><c:out value="${post.title}" /></td>
			<td>
				<c:choose>
					<c:when test="${post.status == '1'}">无效</c:when>
					<c:when test="${post.status == '0'}">有效</c:when>
				</c:choose>
			</td>
			<td><c:out value="${post.read_count}" /></td>
			<td><c:out value="${post.comment_count}" /></td>
			<td><a href="${ctx}/postsController/modifyPostNavigation.do?_id=${post._id}">编辑</a></td>
			<td><a href="${ctx}/postsController/deletePost.do?_id=${post._id}&pageNo=${postPage.pageNo}">删除</a></td>
		</tr>
		</c:forEach>
	</tbody>
</table>
<ul class="pagination mypage">
	
	<li><a href="${ctx}/postsController/listPosts.do?pageNo=1">首页</a></li>

	<c:choose>
		<c:when test="${postPage.pageNo!= '1'}">
			<li><a href="${ctx}/postsController/listPosts.do?pageNo=<c:out value="${postPage.pageNo-1}"/>">上一页</a></li>
		</c:when>
		<c:when test="${postPage.pageNo== '1'}">
			<!-- <li class="disabled"><a>上一页</a></li> -->	
		</c:when>
	</c:choose>
	<c:choose>
		<c:when test="${postPage.pageNo-4>='1'}">
			<li><a href="${ctx}/postsController/listPosts.do?pageNo=<c:out value="${postPage.pageNo-4}"/>">
				<c:out value="${postPage.pageNo-4}"/></a></li>
		</c:when>
	</c:choose>
	<c:choose>
		<c:when test="${postPage.pageNo-3>='1'}">
			<li><a href="${ctx}/postsController/listPosts.do?pageNo=<c:out value="${postPage.pageNo-3}"/>">
				<c:out value="${postPage.pageNo-3}"/></a></li>
		</c:when>
	</c:choose>
	<c:choose>
		<c:when test="${postPage.pageNo-2>='1'}">
			<li><a href="${ctx}/postsController/listPosts.do?pageNo=<c:out value="${postPage.pageNo-2}"/>">
				<c:out value="${postPage.pageNo-2}"/></a></li>
		</c:when>
	</c:choose>
	<c:choose>
		<c:when test="${postPage.pageNo-1>='1'}">
			<li><a href="${ctx}/postsController/listPosts.do?pageNo=<c:out value="${postPage.pageNo-1}"/>">
				<c:out value="${postPage.pageNo-1}"/></a></li>
		</c:when>
	</c:choose>
	<li class="active"><a href="${ctx}/postsController/listPosts.do?pageNo=<c:out value="${postPage.pageNo}"/>">
		<c:out value="${postPage.pageNo}"/></a></li>
		
	<c:choose>
		<c:when test="${postPage.pageNo+1<=postPage.totalPage}">
			<li><a href="${ctx}/postsController/listPosts.do?pageNo=<c:out value="${postPage.pageNo+1}"/>">
				<c:out value="${postPage.pageNo+1}"/></a></li>
		</c:when>
	</c:choose>
	<c:choose>
		<c:when test="${postPage.pageNo+2<=postPage.totalPage}">
			<li><a href="${ctx}/postsController/listPosts.do?pageNo=<c:out value="${postPage.pageNo+2}"/>">
				<c:out value="${postPage.pageNo+2}"/></a></li>
		</c:when>
	</c:choose>	
	<c:choose>
		<c:when test="${postPage.pageNo+3<=postPage.totalPage}">
			<li><a href="${ctx}/postsController/listPosts.do?pageNo=<c:out value="${postPage.pageNo+3}"/>">
				<c:out value="${postPage.pageNo+3}"/></a></li>
		</c:when>
	</c:choose>	
	<c:choose>
		<c:when test="${postPage.pageNo+4<=postPage.totalPage}">
			<li><a href="${ctx}/postsController/listPosts.do?pageNo=<c:out value="${postPage.pageNo+4}"/>">
				<c:out value="${postPage.pageNo+4}"/></a></li>
		</c:when>
	</c:choose>	
	<c:choose>	
		<c:when test="${postPage.pageNo != postPage.totalPage}">
				<li><a href="${ctx}/postsController/listPosts.do?pageNo=<c:out value="${postPage.pageNo+1}"/>">下一页</a></li>
		</c:when>
		<c:when test="${postPage.pageNo == postPage.totalPage}">
				<!-- <li class="disabled"><a>下一页</a></li> -->
		</c:when>
	</c:choose>
	
	<li><a href="${ctx}/postsController/listPosts.do?pageNo=<c:out value="${postPage.totalPage}"/>">尾页</a></li>
	
</ul>