<%@ page contentType="text/html;charset=utf-8"%>
<%@include file="/WEB-INF/jsp/taglib.jsp" %>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>添加新随笔</title>

    <!-- Bootstrap -->
    <link rel="stylesheet" href="${ctx}/validator/vendor/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="${ctx}/validator/dist/css/bootstrapValidator.css"/>
	<link rel="stylesheet" href="${ctx}/css/common/common.css"/>
	<link rel="stylesheet" href="${ctx}/css/back/index.css"/>
	<!-- include summernote css/js-->
<link href="${ctx}/summernote/summernote.css" rel="stylesheet">
  </head>
  <body>
	<div class="container">
	<div class="row clearfix ">
		
			<ul class="breadcrumb">
				<li>
					 <a href="#">添加新随笔</a>
				</li>
			</ul>
			<form role="form">
				<div class="form-group">
					 <label for="title" class="control-label">标题:</label>
					 <div>
					 	<input class="form-control" id="title" name="title" type="text" />
					 </div>
				</div>
				<div class="form-group">
					 <label for="exampleInputPassword1"> 内容(Summernote编辑器)</label>
					 <div id="summernote"> </div>
				</div>
				<div class="form-group form-inline">
					<div class="col-md-6">
						选择分类
						<select name="categorieId" id="categorieId">
							<c:forEach items="${categorie.datas}" var="categorie" varStatus="status">
							<option value="${categorie._id}">
								${categorie.title}
							</option>
							</c:forEach>
						</select>
					</div>
						<div class="col-md-6">
							<label>是否发布</label><input type="checkbox" id="status" name="status"/>
						</div>
					</div>
					<div class="form-group">
						 <label for="tag" >Tag标签:</label>
						 <input style="width: 100%;" id="tag" name="tag" type="text" />
					</div>
					<div class="form-group">
						 <label for="excerpt" >摘要:</label>
						 <textarea style="width: 100%;" id="excerpt" name="excerpt"></textarea>
					</div>
					<div class="form-group form-inline">
						<div class="col-md-4">
							<button type="button" id="sub" class="btn btn-info">保存</button>
						</div>
						<div class="col-md-4">
							<button type="reset" id="sub" class="btn btn-warning">取消</button>
						</div>
					</div>
			</form>
	</div>
</div>
     <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="${ctx}/validator/vendor/jquery/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="${ctx}/validator/vendor/bootstrap/js/bootstrap.min.js"></script>
  	<script type="text/javascript" src="${ctx}/validator/dist/js/bootstrapValidator.js"></script>
  	<script src="${ctx}/summernote/summernote.js"></script>
  	<script type="text/javascript">
	  	$(document).ready(function() {
	  	 var d =  $('#summernote').summernote({
	  		  height: 500,                 // set editor height
	  		  minHeight: null,             // set minimum height of editor
	  		  maxHeight: null,             // set maximum height of editor
	  		  focus: false                  // set focus to editable area after initializing summernote
	  		});
	  	 
	  	 $("#sub").click(function(){
			var content = $('#summernote').summernote('code');
			var title =$('#title').val();
			var categorieId = $("#categorieId").val();
			var stus = $("#status").prop("checked");
			var status = 0;
			if(stus) status=1;
			var tag = $("#tag").val();
			var excerpt = $("#excerpt").val();
			if(!title.trim()){
				alert("标题不能为空");
				return;
			}
			$.ajax({
				type:"POST",
				url:"${ctx}/postsController/createPost.do",
				data:{'title':title,'content':content,'categorieId':categorieId,"status":status,"tag":tag,'excerpt':excerpt},
				dataType: 'json',
				success:function(msg){
					alert(msg.status);
					window.location.href="${ctx}/postsController/listPosts.do";
				}
			});
	  	 });
	  	});
  	</script>
  </body>
</html>