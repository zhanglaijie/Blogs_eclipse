<%@ page contentType="text/html;charset=utf-8"%>
<%@include file="/WEB-INF/jsp/taglib.jsp" %>
<div class="jumbotron well" 
			style="background-color:#FFF;margin-left: 100px;margin-top: 50px;">
			
					<div class="tabbable" id="tabs-547795">
				<ul class="nav nav-tabs">
					<li class="active">
						 <a href="#panel-l1" data-toggle="tab">个人信息</a>
					</li>
					<li>
						 <a href="#panel-l2" data-toggle="tab">我的订阅</a>
					</li>
					<li>
						 <a href="#panel-l3" data-toggle="tab">我的粉丝</a>
					</li>
					<li>
						 <a href="#panel-l4" data-toggle="tab">账户设置</a>
					</li>
					<li >
						 <a href="#panel-l5" data-toggle="tab">安全</a>
					</li>
					<li>
						 <a href="#panel-l6" data-toggle="tab">随笔管理</a>
					</li>
				</ul>
				<div class="tab-content">
					<div class="tab-pane active" id="panel-l1">
						<p>&nbsp;</p>
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
								<button type="submit" id="sub" class="btn btn-default"  onclick="window.history.back(-1);">返回</button>
							</form>
					</div>
					<div class="tab-pane" id="panel-l2">
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
					<div class="tab-pane" id="panel-l3">
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
									<tr class="warning">
										<td>
											3
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
									<tr class="error">
										<td>
											4
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
								</tbody>
							</table>
					</div>
					<div class="tab-pane" id="panel-l4">
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
					<div class="tab-pane" id="panel-l5">
						<p>
							Howdy, I'm in Section 5.
						</p>
					</div>
					<div class="tab-pane" id="panel-l6">
						<p>
							Howdy, I'm in Section 6.
						</p>
					</div>
					<div class="tab-pane" id="panel-l7">
						<p>
							Howdy, I'm in Section 7.
						</p>
					</div>
				</div>
			</div>
	</div>