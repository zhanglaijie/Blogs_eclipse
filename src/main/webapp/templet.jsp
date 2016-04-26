<%@ page contentType="text/html;charset=utf-8"%>
<%@include file="/WEB-INF/jsp/taglib.jsp"%>
<!DOCTYPE HTML>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<title>壹博客登陆系统</title>
<!-- Bootstrap -->
<link rel="stylesheet"
	href="${ctx}/validator/vendor/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${ctx}/validator/dist/css/bootstrapValidator.css" />
<link rel="stylesheet" href="${ctx}/css/login.css">
</head>
<body>
	<div class="container">
		<div class="row clearfix">
			<div class="col-md-12 column">
				<ul class="breadcrumb">
					<li><a href="#">Home</a></li>
					<li><a href="#">Library</a></li>
					<li class="active">Data</li>
				</ul>
				<form role="form">
					<div class="form-group">
						<label for="exampleInputEmail1">Email address</label><input
							type="email" class="form-control" id="exampleInputEmail1" />
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">Password</label><input
							type="password" class="form-control" id="exampleInputPassword1" />
					</div>
					<button type="submit" class="btn btn-default">Submit</button>
				</form>
				<table class="table">
					<thead>
						<tr>
							<th>编号</th>
							<th>产品</th>
							<th>交付时间</th>
							<th>状态</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>1</td>
							<td>TB - Monthly</td>
							<td>01/04/2012</td>
							<td>Default</td>
						</tr>
						<tr class="success">
							<td>1</td>
							<td>TB - Monthly</td>
							<td>01/04/2012</td>
							<td>Approved</td>
						</tr>
						<tr class="error">
							<td>2</td>
							<td>TB - Monthly</td>
							<td>02/04/2012</td>
							<td>Declined</td>
						</tr>
						<tr class="warning">
							<td>3</td>
							<td>TB - Monthly</td>
							<td>03/04/2012</td>
							<td>Pending</td>
						</tr>
						<tr class="info">
							<td>4</td>
							<td>TB - Monthly</td>
							<td>04/04/2012</td>
							<td>Call in to confirm</td>
						</tr>
					</tbody>
				</table>
				<ul class="pagination">
					<li><a href="#">Prev</a></li>
					<li><a href="#">1</a></li>
					<li><a href="#">2</a></li>
					<li><a href="#">3</a></li>
					<li><a href="#">4</a></li>
					<li><a href="#">5</a></li>
					<li><a href="#">Next</a></li>
				</ul>
			</div>
		</div>
	</div>
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="${ctx}/validator/vendor/jquery/jquery.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="${ctx}/validator/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript"
		src="${ctx}/validator/dist/js/bootstrapValidator.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
		    // Generate a simple captcha
		    function randomNumber(min, max) {
		        return Math.floor(Math.random() * (max - min + 1) + min);
		    };
		    $('#captchaOperation').html([randomNumber(1, 100), '+', randomNumber(1, 200), '='].join(' '));
		
		    $('#register-form').bootstrapValidator({
		//        live: 'disabled',
		        message: 'This value is not valid',
		        feedbackIcons: {
		            valid: 'glyphicon glyphicon-ok',
		            invalid: 'glyphicon glyphicon-remove',
		            validating: 'glyphicon glyphicon-refresh'
		        },
		        fields: {
		            email: {
		                validators: {
		                	notEmpty: {
		                        message: '请输入邮箱'
		                    },
		                    emailAddress: {
		                        message: '请输入正确的邮箱'
		                    }
		                }
		            },
		            password: {
		                validators: {
		                    notEmpty: {
		                        message: '请输入登录密码'
		                    },
		                    different: {
		                        field: 'email',
		                        message: '密码不能和邮箱相同'
		                    }
		                }
		            },
		            confirmPassword: {
		                validators: {
		                	 notEmpty: {
			                        message: '请输入确认密码'
			                    },
		                    identical: {
		                        field: 'password',
		                        message: '密码与确认密码输入不一致'
		                    },
		                    different: {
		                        field: 'email',
		                        message: '密码不能和邮箱相同'
		                    }
		                }
		            },
		            blogname: {
		                validators: {
		                    notEmpty: {
		                        message: '请输入博客名称'
		                    }
		                }  
		            },
		            blogaddress: {
		                validators: {
		                    notEmpty: {
		                        message: '请输入博客地址博客名称'
		                    }
		                } 
		            },
		            captcha: {
		                validators: {
		                    callback: {
		                        message: 'Wrong answer',
		                        callback: function(value, validator) {
		                            var items = $('#captchaOperation').html().split(' '), sum = parseInt(items[0]) + parseInt(items[2]);
		                            return value == sum;
		                        }
		                    }
		                }
		            }
		        }
		    });
		
		    // Validate the form manually
		   // $('#validateBtn').click(function() {
		     //   $('#register-form').bootstrapValidator('validate');
		    //});
		
		    $('#resetBtn').click(function() {
		        $('#register-form').data('bootstrapValidator').resetForm(true);
		    });
		});
		</script>
</body>
</html>
