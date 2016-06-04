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
						 <a href="#panel-l2" data-toggle="tab">关注的人</a>
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
					        <div class="avatar_list">
					        	<ul>
					        		<li>
					        			<div class="avatar_pic">
					        				<a href="/u/leiOOlei">
					        					<img src="http://pic.cnblogs.com/face/u201693.jpg" title="leiOOlei">
					        				</a>
					        			</div>
					        			<div class="avatar_name">
					        				<a href="/u/leiOOlei/" title="leiOOlei">
					        					leiOOle
					        				</a>
					        			</div>
					        		</li>
					        		<li>
					        			<div class="avatar_pic">
					        				<a href="/u/leiOOlei">
					        					<img src="http://pic.cnblogs.com/face/u201693.jpg" title="leiOOlei">
					        				</a>
					        			</div>
					        			<div class="avatar_name">
					        				<a href="/u/leiOOlei/" title="leiOOlei">
					        					leiOOle
					        				</a>
					        			</div>
					        		</li>
					        	</ul>
					        	</div>
					    </div>
					</div>
					<div class="tab-pane" id="panel-l3">
						<p>
							Howdy, I'm in Section 3.
						</p>
					</div>
					<div class="tab-pane" id="panel-l4">
						<p>
							Howdy, I'm in Section 4.
						</p>
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