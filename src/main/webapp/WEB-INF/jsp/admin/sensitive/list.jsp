<%@ page contentType="text/html;charset=utf-8"%>
<%@include file="/WEB-INF/jsp/taglib.jsp" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>敏感词管理</title>

<script type="text/javascript" src="${ctx}/js/jquery.js"></script>

<link rel="stylesheet" href="${ctx}/css/add.css" type="text/css" media="screen">
<link rel="stylesheet" href="${ctx}/css/bootstrap.css" type="text/css" media="screen">
<script type="text/javascript">
$(function(){
	$("#create").click(function(){
		var keyword =$('#keyword').val();
		if(!keyword.trim()){
			alert("输入不能为空~~~");
		}
		$.ajax({
			type:"POST",
			url:"${ctx}/admin/sensitive/create",
			data:{'keyword':keyword},
			dataType: 'json',
			success:function(msg){
				if(msg.status=="success"){
					alert("添加成功~~~");
					window.location.href="${ctx}/admin/sensitive/listNavigation";
				}else alert(msg.status); 
			}
		});
	});
	
	$("#search").click(function(){
		var keyword =$('#keyword').val();
		if(!keyword.trim()){
			alert("输入不能为空~~~");
		}else window.location.href="${ctx}/admin/sensitive/listNavigation?keyword="+keyword;
	});
});
function deleteOne(obj){
	 var result = confirm('是否删除~~~');  
	    if(result){  
	    	window.location='${ctx}/admin/sensitive/delete?id='+obj; 
	    }
};
</script>
</head>
	<body>
		<div class="container">
			<div class="row clearfix">
				<div class="col-md-12 column">
					<form class="form-horizontal" role="form">
						<div class="form-group">
							<div class="col-sm-3">
								<input type="text" class="form-control" id="keyword" />
							</div>
							<div class="col-sm-3">
								 <button id="create" type="button" class="btn btn-default">添加</button>
								 &nbsp;&nbsp;&nbsp;&nbsp;
								 <button id="search" type="button" class="btn btn-default">查找</button>
							</div>
							<div class="col-sm-3">
							</div>
							<div class="col-sm-3">
								
							</div>
						</div>
						
					</form>
					<table class="table">
						<thead>
							<tr>
								<th>
									序号
								</th>
								<th>
									敏感词
								</th>
								<th>
									创建时间
								</th>
								<th>
									操作
								</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${pageSw.datas}" var="sw" varStatus="status">
							<tr>
								<td>
									<c:out value="${status.index + 1}"></c:out>
								</td>
								<td>
									<c:out value="${sw.word}"></c:out>
								</td>
								<td>
									<fmt:formatDate value="${sw.createTime}" pattern="yyyy-MM-dd HH:mm" />
								</td>
								<td>
									<button type="button" id="deleteOne" class="btn btn-default btn-danger  btn-sm" 
								onclick="deleteOne('${sw._id}');">删除</button>
								</td>
							</tr>
						
							</c:forEach>
						</tbody>
					</table>
					<ul class="pagination mypage">
							
							<li><a href="${ctx}/admin/sensitive/listNavigation?pageNo=1">首页</a></li>
						
							<c:choose>
								<c:when test="${pageSw.pageNo!= '1'}">
									<li><a href="${ctx}/admin/sensitive/listNavigation?pageNo=<c:out value="${pageSw.pageNo-1}"/>">上一页</a></li>
								</c:when>
								<c:when test="${pageSw.pageNo== '1'}">
									<!-- <li class="disabled"><a>上一页</a></li> -->	
								</c:when>
							</c:choose>
							<c:choose>
								<c:when test="${pageSw.pageNo-4>='1'}">
									<li><a href="${ctx}/admin/sensitive/listNavigation?pageNo=<c:out value="${pageSw.pageNo-4}"/>">
										<c:out value="${pageSw.pageNo-4}"/></a></li>
								</c:when>
							</c:choose>
							<c:choose>
								<c:when test="${pageSw.pageNo-3>='1'}">
									<li><a href="${ctx}/admin/sensitive/listNavigation?pageNo=<c:out value="${pageSw.pageNo-3}"/>">
										<c:out value="${pageSw.pageNo-3}"/></a></li>
								</c:when>
							</c:choose>
							<c:choose>
								<c:when test="${pageSw.pageNo-2>='1'}">
									<li><a href="${ctx}/admin/sensitive/listNavigation?pageNo=<c:out value="${pageSw.pageNo-2}"/>">
										<c:out value="${pageSw.pageNo-2}"/></a></li>
								</c:when>
							</c:choose>
							<c:choose>
								<c:when test="${pageSw.pageNo-1>='1'}">
									<li><a href="${ctx}/admin/sensitive/listNavigation?pageNo=<c:out value="${pageSw.pageNo-1}"/>">
										<c:out value="${pageSw.pageNo-1}"/></a></li>
								</c:when>
							</c:choose>
							<li class="active"><a href="${ctx}/admin/sensitive/listNavigation?pageNo=<c:out value="${pageSw.pageNo}"/>">
								<c:out value="${pageSw.pageNo}"/></a></li>
								
							<c:choose>
								<c:when test="${pageSw.pageNo+1<=pageSw.totalPage}">
									<li><a href="${ctx}/admin/sensitive/listNavigation?pageNo=<c:out value="${pageSw.pageNo+1}"/>">
										<c:out value="${pageSw.pageNo+1}"/></a></li>
								</c:when>
							</c:choose>
							<c:choose>
								<c:when test="${pageSw.pageNo+2<=pageSw.totalPage}">
									<li><a href="${ctx}/admin/sensitive/listNavigation?pageNo=<c:out value="${pageSw.pageNo+2}"/>">
										<c:out value="${pageSw.pageNo+2}"/></a></li>
								</c:when>
							</c:choose>	
							<c:choose>
								<c:when test="${pageSw.pageNo+3<=pageSw.totalPage}">
									<li><a href="${ctx}/admin/sensitive/listNavigation?pageNo=<c:out value="${pageSw.pageNo+3}"/>">
										<c:out value="${pageSw.pageNo+3}"/></a></li>
								</c:when>
							</c:choose>	
							<c:choose>
								<c:when test="${pageSw.pageNo+4<=pageSw.totalPage}">
									<li><a href="${ctx}/admin/sensitive/listNavigation?pageNo=<c:out value="${pageSw.pageNo+4}"/>">
										<c:out value="${pageSw.pageNo+4}"/></a></li>
								</c:when>
							</c:choose>	
							<c:choose>	
								<c:when test="${pageSw.pageNo != pageSw.totalPage}">
										<li><a href="${ctx}/admin/sensitive/listNavigation?pageNo=<c:out value="${pageSw.pageNo+1}"/>">下一页</a></li>
								</c:when>
								<c:when test="${pageSw.pageNo == pageSw.totalPage}">
										<!-- <li class="disabled"><a>下一页</a></li> -->
								</c:when>
							</c:choose>
							
							<li><a href="${ctx}/admin/sensitive/listNavigation?pageNo=<c:out value="${pageSw.totalPage}"/>">尾页</a></li>
							
						</ul>
				</div>
			</div>
		</div>
	</body>
</html>