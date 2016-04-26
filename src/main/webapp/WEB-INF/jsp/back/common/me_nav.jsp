<%@ page contentType="text/html;charset=utf-8"%>
<%@include file="/WEB-INF/jsp/taglib.jsp" %>
<div style="text-align: center;">
    <input type="file" id="file" accept="image/*" name="file" multiple="multiple" style="display: none;" onchange="uploadImage();"/>
	<a href="javascript:void(0)" onclick="clickInput();">
		<img alt="140x140" style="width:160px;height:160px;margin-top:40px;" src="${ctx}${user.album}" class="img-circle" />
	</a>
	<h2><c:out value="${user.nicename}" default="末设置用户名"/></h2>
	<h3><a>@<c:out value="${user.username}"/></a></h3>
	<a type="button" class="btn btn-default btn-lg" style="margin-top:20px;" href="${ctx}/userController/logout.do">sign out</a>
</div>
<ul class="nav nav-pills nav-stacked" style="margin-top: 30px;">
	<li id="profile">
		 <a href="${ctx}/userController/about_me.do">个人信息</a>
	</li>
	<li id="account_setting">
		 <a href="${ctx}/userController/account_settings.do">账户设置</a>
	</li>
	<li>
		 <a href="#">安全</a>
	</li>
	<li>
		 <a href="#">个人通知</a>
	</li>
	<li>
		 <a href="#">帮助反馈</a>
	</li>
</ul>