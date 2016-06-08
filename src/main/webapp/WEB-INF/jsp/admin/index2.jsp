<%@ page contentType="text/html;charset=utf-8"%>
<%@include file="/WEB-INF/jsp/taglib.jsp" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>壹博客后台管理系统</title>

<link rel="stylesheet" href="${ctx}/css/index.css" type="text/css" media="screen">

<script type="text/javascript" src="${ctx}/js/jquery.js"></script>
<script type="text/javascript" src="${ctx}/js/tendina.js"></script>
<script type="text/javascript" src="${ctx}/js/common.js"></script>
<script type="text/javascript">
$(function(){
	$("#userlist").click(function(){
		$("#menuFrame").attr("src","${ctx}/admin/userList");
	}
	);
	$("#createSensitive").click(function(){
		$("#menuFrame").attr("src","${ctx}/admin/sensitive/listNavigation");
	}
	);
	
});
</script>
</head>
<body>
    <!--顶部-->
    <div class="layout_top_header">
            <div style="float: left"><span style="font-size: 16px;line-height: 45px;padding-left: 20px;color: #8d8d8d">壹博客后台管理系统</span></div>
              <div id="ad_setting" class="ad_setting">
              <a class="ad_setting_a" href="javascript:;">
                    <i class="icon-user glyph-icon" style="font-size: 20px"></i>
                    <span><c:out value="${nickname}"></c:out> </span>
                    <i class="icon-chevron-down glyph-icon"></i>
                </a>
                <ul class="dropdown-menu-uu" style="display: none" id="ad_setting_ul">
                  <!--   <li class="ad_setting_ul_li"> <a href="javascript:;"><i class="icon-user glyph-icon"></i> 个人中心 </a> </li>
                    <li class="ad_setting_ul_li"> <a href="javascript:;"><i class="icon-cog glyph-icon"></i> 设置 </a> </li> -->
                    <li class="ad_setting_ul_li"> <a href="${ctx}/userController/logout.do"><i class="icon-signout glyph-icon"></i> <span class="font-bold">退出</span> </a> </li>
                </ul>
            </div>
    </div>
    <!--顶部结束-->
    <!--菜单-->
    <div class="layout_left_menu">
        <ul class="tendina" id="menu">
            <li class="childUlLi">
                <a href="#" target="menuFrame"> <i class="glyph-icon icon-home"></i>用户管理</a>
                <ul>
                    <li><a id="userlist"><i class="glyph-icon icon-chevron-right"></i>用户列表</a></li>
<!--                     <li><a href="#"><i class="glyph-icon icon-chevron-right"></i>展示商品管理</a></li>
                    <li><a href="#"><i class="glyph-icon icon-chevron-right"></i>数据管理</a></li> -->
                </ul>
            </li>
            <li class="childUlLi">
                <a href="#" target="menuFrame"> <i class="glyph-icon icon-reorder"></i>敏感词管理</a>
                <ul >
                    <li><a id="createSensitive"><i class="glyph-icon icon-chevron-right"></i>敏感词列表</a></li>
                </ul>
            </li>
            <li class="childUlLi">
                <a href="#"> <i class="glyph-icon  icon-location-arrow"></i>订阅管理</a>
                <ul style="display: none;">
                    <li><a href="#" target="menuFrame"><i class="glyph-icon icon-chevron-right"></i>平台菜单</a></li>
                    <li><a href="#" target="menuFrame"><i class="glyph-icon icon-chevron-right"></i>运行商菜单</a></li>
                    <li><a href="#" target="menuFrame"><i class="glyph-icon icon-chevron-right"></i>服务站菜单</a></li>
                    <li><a href="#" target="menuFrame"><i class="glyph-icon icon-chevron-right"></i>商家菜单</a></li>
                </ul>
            </li>
        </ul>
    </div>
    <!--菜单-->
    <div id="layout_right_content" class="layout_right_content">
        <div class="route_bg">
            <a href="#">主页</a><i class="glyph-icon icon-chevron-right"></i>
            <a href="#">菜单管理</a>
        </div>
        <div class="mian_content">
            <div id="page_content">
                <iframe id="menuFrame" name="menuFrame" src="${ctx}/admin/userList" style="overflow:visible;" scrolling="yes" frameborder="no" height="100%" width="100%"></iframe>
            </div>
        </div>
    </div>
    <div class="layout_footer">
        <p>Copyright © 2016 - 壹博客</p>
    </div>
</body></html>