<%@ page contentType="text/html;charset=utf-8"%>
<%@include file="/WEB-INF/jsp/taglib.jsp" %>
<div class="jumbotron well" 
			style="background-color:#FFF;margin-left: 100px;margin-top: 50px;">
				<p>修改个人信息</p>
					<form role="form" method="post" action="${ctx}/userController/modifyInfo.do">
						<div class="form-group" style="display:none;">
							<div>
								<input id="_id" name="_id" value="${user._id}"/>
							</div>
						</div>
						<div class="form-group">
							 <label for="title" class="control-label">昵称:</label>
							 <div>
							 	<input class="form-control" id="nicename" name="nicename" type="text" value="${user.nicename}"/>
							 </div>
						</div>
						<div class="form-group">
							 <label for="title" class="control-label">博客名称:</label>
							 <div>
							 	<input class="form-control" id="blogname" name="blogname" type="text" value="${user.blogname}"/>
							 </div>
						</div>
						<div class="form-group">
							 <label for="title" class="control-label">博客子标题</label>
							 <div>
							 	<input class="form-control" id="blogsubname" name="blogsubname" type="text" value="${user.blogsubname}"/>
							 </div>
						</div>
						<div class="form-group">
							 <label for="title" class="control-label">个人签名:</label>
							 <div>
							 	<textarea class="form-control" id="description" name="description" type="text">
							 	${user.description}
							 	</textarea>
							 </div>
						</div> 
						<button type="submit" id="sub" class="btn btn-default">保存</button>
					</form>
			</div>