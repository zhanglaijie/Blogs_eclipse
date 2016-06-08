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
			<ul class="breadcrumb">
				<li>
					 <a href="#">编辑分类</a>
				</li>
			</ul>
				<table class="table ">
					<thead>
						<tr>
							<th>分类</th>
							<th>是否可见</th>
							<th>操作</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${page.datas}" var="categories" varStatus="status">
						<tr>
							<td><c:out value="${categories.title}" /></td>
							<td>
								<c:choose>
									<c:when test="${categories.visible == '1'}">不可见</c:when>
									<c:when test="${categories.visible == '0'}">可见</c:when>
								</c:choose>
							</td>
							<td><c:out value="${categories.description}" /></td>
						<%-- 	<td><a href="${ctx}/categorieController/to_edit_categorie?id=${categories._id}&pageNo=${page.pageNo}"">编辑</a></td> --%>
							<td><a href="${ctx}/categorieController/delete_categorie?id=${categories._id}">删除</a></td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
				<ul class="pagination ">
					<li><a href="${ctx}/categorieController/list_categorie.do?pageNo=1">首页</a></li>
				
					<c:choose>
						<c:when test="${page.pageNo!= '1'}">
							<li><a href="${ctx}/categorieController/list_categorie.do?pageNo=<c:out value="${page.pageNo-1}"/>">上一页</a></li>
						</c:when>
						<c:when test="${page.pageNo== '1'}">
							<!-- <li class="disabled"><a>上一页</a></li> -->	
						</c:when>
					</c:choose>
					<c:choose>
						<c:when test="${page.pageNo-4>='1'}">
							<li><a href="${ctx}/categorieController/list_categorie.do?pageNo=<c:out value="${page.pageNo-4}"/>">
								<c:out value="${page.pageNo-4}"/></a></li>
						</c:when>
					</c:choose>
					<c:choose>
						<c:when test="${page.pageNo-3>='1'}">
							<li><a href="${ctx}/categorieController/list_categorie.do?pageNo=<c:out value="${page.pageNo-3}"/>">
								<c:out value="${page.pageNo-3}"/></a></li>
						</c:when>
					</c:choose>
					<c:choose>
						<c:when test="${page.pageNo-2>='1'}">
							<li><a href="${ctx}/categorieController/list_categorie.do?pageNo=<c:out value="${page.pageNo-2}"/>">
								<c:out value="${page.pageNo-2}"/></a></li>
						</c:when>
					</c:choose>
					<c:choose>
						<c:when test="${page.pageNo-1>='1'}">
							<li><a href="${ctx}/categorieController/list_categorie.do?pageNo=<c:out value="${page.pageNo-1}"/>">
								<c:out value="${page.pageNo-1}"/></a></li>
						</c:when>
					</c:choose>
					<li class="active"><a href="${ctx}/categorieController/list_categorie.do?pageNo=<c:out value="${page.pageNo}"/>">
						<c:out value="${page.pageNo}"/></a></li>
						
					<c:choose>
						<c:when test="${page.pageNo+1<=page.totalPage}">
							<li><a href="${ctx}/categorieController/list_categorie.do?pageNo=<c:out value="${page.pageNo+1}"/>">
								<c:out value="${page.pageNo+1}"/></a></li>
						</c:when>
					</c:choose>
					<c:choose>
						<c:when test="${page.pageNo+2<=page.totalPage}">
							<li><a href="${ctx}/categorieController/list_categorie.do?pageNo=<c:out value="${page.pageNo+2}"/>">
								<c:out value="${page.pageNo+2}"/></a></li>
						</c:when>
					</c:choose>	
					<c:choose>
						<c:when test="${page.pageNo+3<=page.totalPage}">
							<li><a href="${ctx}/categorieController/list_categorie.do?pageNo=<c:out value="${page.pageNo+3}"/>">
								<c:out value="${page.pageNo+3}"/></a></li>
						</c:when>
					</c:choose>	
					<c:choose>
						<c:when test="${page.pageNo+4<=page.totalPage}">
							<li><a href="${ctx}/categorieController/list_categorie.do?pageNo=<c:out value="${page.pageNo+4}"/>">
								<c:out value="${page.pageNo+4}"/></a></li>
						</c:when>
					</c:choose>	
					<c:choose>	
						<c:when test="${page.pageNo != page.totalPage}">
								<li><a href="${ctx}/categorieController/list_categorie.do?pageNo=<c:out value="${page.pageNo+1}"/>">下一页</a></li>
						</c:when>
						<c:when test="${page.pageNo == page.totalPage}">
								<!-- <li class="disabled"><a>下一页</a></li> -->
						</c:when>
					</c:choose>
					
					<li><a href="${ctx}/categorieController/list_categorie.do?pageNo=<c:out value="${page.totalPage}"/>">尾页</a></li>
					
				</ul>
			<ul class="breadcrumb">
				<li>
					 <a href="#">添加新分类</a>
				</li>
			</ul>
		<form role="form" method="post" action="${ctx}/categorieController/create_categorie.do">
					
					<div class="form-group">
						 <label for="title" class="control-label">标题</label>
						 <div>
						 	<input class="form-control" id="title" name="title" type="text" value="${categories.title}"/>
						 </div>
					</div>
					<div class="form-group">
						 <label for="title" class="control-label">可见性:</label>
						 <div>
						 	<input id="visible" name="visible" checked="checked" value="0" type="radio" />可见
						 	<input id="visible" name="visible" value="1" type="radio" />不可见
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
     <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="${ctx}/validator/vendor/jquery/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="${ctx}/validator/vendor/bootstrap/js/bootstrap.min.js"></script>
  	<script type="text/javascript" src="${ctx}/validator/dist/js/bootstrapValidator.js"></script>
  </body>
</html>