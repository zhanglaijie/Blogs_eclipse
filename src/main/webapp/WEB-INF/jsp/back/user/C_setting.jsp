<%@ page contentType="text/html;charset=utf-8"%>
<%@include file="/WEB-INF/jsp/taglib.jsp"%>
<div class="jumbotron well"
	style="background-color: #FFF; margin-left: 100px; margin-top: 50px;">
	<p>账号设置</p>
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