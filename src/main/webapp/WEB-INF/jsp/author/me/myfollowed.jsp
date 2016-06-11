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
	<div>
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
			<tr class="error">
				<td>
					3
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
			<tr class="warning">
				<td>
					4
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
		</tbody>
	</table>
</div>
</div>
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="${ctx}/validator/vendor/jquery/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="${ctx}/validator/vendor/bootstrap/js/bootstrap.min.js"></script>
  	<script type="text/javascript" src="${ctx}/validator/dist/js/bootstrapValidator.js"></script>
 </body>
 </html>