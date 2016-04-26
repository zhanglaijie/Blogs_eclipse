$(document).ready(function() {
		   //找回密码验证
		    $('#input-passwd').bootstrapValidator({
		    	// live: 'disabled',
		        message: 'This value is not valid',
		        feedbackIcons: {
		            valid: 'glyphicon glyphicon-ok',
		            invalid: 'glyphicon glyphicon-remove',
		            validating: 'glyphicon glyphicon-refresh'
		        },
		        fields: {
		        	email:{
		        		validators:{
		        			notEmpty:{
		        				message:'no'
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
		            confirmpassword: {
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
		            }
		        }
		    });
	    $('#pwdReset').click(function() {
	        $('#input-passwd').data('bootstrapValidator').resetForm(true);
	    });
	});