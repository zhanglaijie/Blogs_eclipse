<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/taglib.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<!DOCTYPE HTML>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>壹博客登陆系统</title>
    <!-- Bootstrap -->
    <link rel="stylesheet" href="${ctx}/validator/vendor/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="${ctx}/validator/dist/css/bootstrapValidator.css"/>
	<link rel="stylesheet" href="${ctx}/css/front/frontIndex.css"/>
	<style type="text/css">
	#blog-comments-placeholder{
		padding: 20px;
	    border: 1px solid #dedede;
	    padding-top: 0;
	    margin-top: 20px;
	    background: #fff;
	}
	.comment_content{
		width: 450px;
	    height: 300px;
	    font-size: 13px;
	    border: 1px solid #ccc;
	}
	.feedbackCon {
		    border: 1px dashed #dedede;
		    padding: 10px;
		    margin: 10px 0;
		}
	</style>
  </head>
  <body>
	<div class="container" style="margin: 0px;">
		<div id="blog-comments-placeholder">
				<h4>评论列表</h4>
				<c:forEach items="${commentList}" var="comment" varStatus="status">
				<div class="feedbackItem">
					<div class="feedbackListSubtitle">
						<div class="feedbackManage">
						</div>
						<B>#${status.index + 1}楼</B>
						<span class="comment_date"><fmt:formatDate value="${comment.createDate}" pattern="yyyy-MM-dd HH:mm" /></span>
						<a id="a_comment_author" href="${ctx}/${comment.user.blogaddress}" target="_blank">
							<c:out value="${comment.user.nicename}"></c:out>
						</a>
					</div>
					<div class="feedbackCon">
						<div id="comment_body" class="blog_comment_body">
						<c:out value="${comment.content}"></c:out>
						</div>
					</div>
				</div>
				</c:forEach>
			</div>
			<c:choose>
				<c:when test="${nickname == 'anonymousUser'}">
					<div class="alert alert-dismissable alert-warning" style="margin-top:20px;">
						<h4>
							注意!
						</h4> <strong>Warning!</strong> 注册用户登录后才能发表评论，请 <a onclick="first();">登录 或 注册</a>. 
					</div>
				</c:when>
				<c:when test="${nickname != 'anonymousUser'}">
				<form class="form-horizontal" role="form" method="post" action="${ctx}/comment/create">
					<div id="blog-comments-placeholder" style="margin-top:20px;">
						<div style="width:100%;"><h4>发表评论</h4><label for="nickname">昵称:</label><input id="nickname" name="nickname" value="${nickname}" disabled="disabled"/></div>
						<input name="postId" value="${postId}" type="hidden"/>
						<textarea class="comment_content" style="margin-top:20px;" name="content" id="content"></textarea>
						<div class="form-group" style="margin-top:20px;">
							<div class="col-sm-offset-6 col-sm-6">
								 <button type="submit" class="btn btn-default">提交评论</button>
								  <button type="button" class="btn btn-link" onclick="logout();">退出登陆</button>
							</div>
						</div>
					</div>
				</form>
				</c:when>
			</c:choose>	
	</div> 
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="${ctx}/validator/vendor/jquery/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="${ctx}/validator/vendor/bootstrap/js/bootstrap.min.js"></script>
  	<script type="text/javascript" src="${ctx}/validator/dist/js/bootstrapValidator.js"></script>
  	<script type="text/javascript">
  	function first()
  	{
  	     window.parent.parent.location.href='${ctc}/userController/login.do';
  	}
  	function logout()
  	{
  	     window.parent.parent.location.href='${ctc}/userController/logout.do';
  	}
  	</script>
  </body>
</html>