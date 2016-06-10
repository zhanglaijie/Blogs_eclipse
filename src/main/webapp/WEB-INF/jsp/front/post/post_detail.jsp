<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/taglib.jsp" %>
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
	.commit_content{
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
		<div class="row clearfix">
			<div class="col-md-12 column">
				<h3><c:out value="${post.title}"></c:out> </h3>			
				${post.content}
				<div style="padding: 10px 0;margin-bottom: 10px;margin-top: 10px;
				border: silver 1px dashed;font-size: 12px;width: 270px;text-align: center;">
					<button type="button" class="btn btn-default btn-info">好文要顶</button>
					<button type="button" class="btn btn-default btn-danger">关注我</button>
					<button type="button" class="btn btn-default btn-warning">收藏该文</button>
				</div>
				<div class="postDesc" style="color:#bcbcbc;">posted <fmt:formatDate value="${post.postdate}" pattern="yyyy-MM-dd HH:mm" /> 阅读(<c:out value="${post.read_count}"></c:out>) 评论(<c:out value="${post.comment_count}"></c:out>)  <!-- <a rel="nofollow">编辑</a> --></div>
					<iframe src="${ctx}/comment/list?postId=${post._id}" id="iframepage" frameborder="0" scrolling="no" 
					marginheight="0" marginwidth="0" onload='IFrameReSize("iframepage");IFrameReSizeWidth("iframepage");' width="700px"></iframe>
			</div> 
		</div>
	</div>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="${ctx}/validator/vendor/jquery/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="${ctx}/validator/vendor/bootstrap/js/bootstrap.min.js"></script>
  	<script type="text/javascript" src="${ctx}/validator/dist/js/bootstrapValidator.js"></script>
  	<script type="text/javascript">
  	function first()
  	{
  	     window.parent.location.href='${ctc}/userController/login.do';
  	}
  	
	//iframe高度自适应
	function IFrameReSize(iframename) {
		var pTar = document.getElementById(iframename);
		if (pTar) {  //ff
			if (pTar.contentDocument && pTar.contentDocument.body.offsetHeight) {
				pTar.height = pTar.contentDocument.body.offsetHeight;
				} //ie
				else if (pTar.Document && pTar.Document.body.scrollHeight) {
					pTar.height = pTar.Document.body.scrollHeight;
					}
		}
		}
	
	//iframe宽度自适应
	function IFrameReSizeWidth(iframename) {
		var pTar = document.getElementById(iframename);
		if (pTar) {  //ff
			if (pTar.contentDocument && pTar.contentDocument.body.offsetWidth) {
				pTar.width = pTar.contentDocument.body.offsetWidth;
				}  //ie
				else if (pTar.Document && pTar.Document.body.scrollWidth) {
					pTar.width = pTar.Document.body.scrollWidth;
					}
		}
	}
	function getPostListByCate(obj){
		$("#iframepage").attr("src","${ctx}/post/${user.blogaddress}?cateId="+obj);
	}
	function getPostListByTitle(){
		var title = $("#title").val();
		$("#iframepage").attr("src","${ctx}/post/${user.blogaddress}?title="+title);
	}
	</script>
  </body>
</html>