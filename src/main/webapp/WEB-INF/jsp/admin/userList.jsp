<%@ page contentType="text/html;charset=utf-8"%>
<%@include file="/WEB-INF/jsp/taglib.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>后台模板</title>

<script type="text/javascript" src="${ctx}/js/jquery.js"></script>

<link rel="stylesheet" href="${ctx}/css/add.css" type="text/css" media="screen">
<link rel="stylesheet" href="${ctx}/css/bootstrap.css" type="text/css" media="screen">
</head>
<body>
	<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<table class="table table-condensed table-hover table-bordered">
				<thead>
					<tr>
						<th>
							博客名称
						</th>
						<th>
							博客地址
						</th>
						<th>
							邮件地址
						</th>
						<th>
							用户昵称
						</th>
						<th>
							状态
						</th>
						<th>
							注册时间
						</th>
						<th>
							操作
						</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${userList}" var="user" varStatus="status">
					<tr>
						<td>
							<c:out value="${user.blogname}"></c:out>
						</td>
						<td>
							<a href="${ctx}/${user.blogaddress}" target="_black"><c:out value="${user.blogaddress}"></c:out></a>
						</td>
						<td>
							<c:out value="${user.email}"></c:out>
						</td>
						<td>
							<c:out value="${user.nicename}"></c:out>
						</td>
						<td>
							<c:choose>
								<c:when test="${user.status == '2'}">关闭</c:when>
								<c:when test="${user.status == '1'}">正常</c:when>
								<c:when test="${user.status == '0'}">未激活</c:when>
							</c:choose>
						</td>
						<td>
							<fmt:formatDate value="${user.registerTime}" pattern="yyyy-MM-dd HH:mm" />
						</td>
						<td>
							<c:choose>
								<c:when test="${user.status == '2'}">
									<button type="button" class="btn btn-default btn-info btn-sm" 
									onclick="window.location='${ctx}/admin/changeStatus?status=1&id=${user._id}'">解封</button>
								</c:when>
								<c:when test="${user.status == '1'}"><button type="button" class="btn btn-default btn-warning  btn-sm" 
								onclick="window.location='${ctx}/admin/changeStatus?status=2&id=${user._id}'">封禁</button></c:when>
								<c:when test="${user.status == '0'}"><button type="button" id="deleteOne" class="btn btn-default btn-danger  btn-sm" 
								onclick="deleteOne('${user._id}');">删除</button></c:when>
							</c:choose>
						</td>
						
					</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>
<script type="text/javascript">

		function deleteOne(obj){
			 var result = confirm('是否删除该用户~~~');  
			    if(result){  
			    	window.location='${ctx}/admin/deleteUser?id='+obj; 
			    }
		};
</script>
</body>
</html>