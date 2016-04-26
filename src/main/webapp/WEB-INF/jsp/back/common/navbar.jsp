<%@ page contentType="text/html;charset=utf-8"%>
<%@include file="/WEB-INF/jsp/taglib.jsp" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<div class="row clearfix">
		<div class="col-md-12 column">
			<nav class="navbar mynav navbar-fixed-top" role="navigation">
				<div class="navbar-header">
					 <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
						<span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button> <a class="navbar-brand" href="${ctx}/postsController/listPosts.do">壹博客</a>
				</div>
				
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav">
						<li class="active">
							 <a href="#">Link</a>
						</li>
						<li>
							 <a href="#">Link</a>
						</li>
						<li class="dropdown">
							 <a href="#" class="dropdown-toggle" data-toggle="dropdown">Dropdown<strong class="caret"></strong></a>
							<ul class="dropdown-menu">
								<li>
									 <a href="#">Action</a>
								</li>
								<li>
									 <a href="#">Another action</a>
								</li>
								<li>
									 <a href="#">Something else here</a>
								</li>
								<li class="divider">
								</li>
								<li>
									 <a href="#">Separated link</a>
								</li>
								<li class="divider">
								</li>
								<li>
									 <a href="#">One more separated link</a>
								</li>
							</ul>
						</li>
					</ul>
					<form class="navbar-form navbar-left" role="search">
						<div class="form-group">
							<input type="text" class="form-control" />
						</div> <button type="submit" class="btn btn-default">Submit</button>
					</form>
					<ul class="nav navbar-nav navbar-right">
						<li class="dropdown">
							 <a href="#" class="dropdown-toggle" data-toggle="dropdown">
								 <sec:authentication property="name"></sec:authentication>
								 <strong class="caret"></strong>
							 </a>
							<ul class="dropdown-menu">
								<li>
									 <a href="${ctx}/userController/about_me.do">个人中心</a>
								</li>
								<li>
									 <a href="#">账号设置</a>
								</li>
								<li>
									 <a href="#">意见反馈</a>
								</li>
								<li class="divider">
								</li>
								<li>
									 <a href="${ctx}/userController/logout.do">退出</a>
								</li>
							</ul>
						</li>
						<li>
							 <a class="myblog" href="${ctx}/${user.blogaddress}">我的博客</a>
						</li>
						<li>
							 &nbsp;&nbsp;&nbsp;&nbsp;
							 &nbsp;&nbsp;&nbsp;&nbsp;
						</li>
					</ul>
				</div>
				
			</nav>
		</div>
	</div>