$(document).ready(function() {
		   //注册表单验证
		    $('#register-form').bootstrapValidator({
		//        live: 'disabled',
		        message: 'This value is not valid',
		        feedbackIcons: {
		            valid: 'glyphicon glyphicon-ok',
		            invalid: 'glyphicon glyphicon-remove',
		            validating: 'glyphicon glyphicon-refresh'
		        },
		        fields: {
		        	username: {
		                validators: {
		                	notEmpty: {
		                        message: '请输入用户名'
		                    }
		                }
		            },
		            email: {
		                validators: {
		                	notEmpty: {
		                        message: '请输入邮箱'
		                    },
		                    emailAddress: {
		                        message: '请输入正确的邮箱'
		                    },
		                    callback: { 
		                    	message: '邮箱已经被注册,请直接登陆', 
		                    	callback: function (value, validator) { 
		                    		var res = true; 
		                    		if (value.match(/^[a-z0-9]+([._\\-]*[a-z0-9])*@([a-z0-9]+[-a-z0-9]*[a-z0-9]+.){1,63}[a-z0-9]+$/i)) {
		                    			$.ajax({ 
		                    			url: 'user/register/checkemail.do', 
		                    			type: 'post', 
		                    			dataType: 'json', 
		                    			async: false, 
		                    			data: {email: value}, 
		                    			success:
		                    				function (data) {
		                    				//alert(data.status);
		                    				if (data.status != 'success'){
		                    					res = false;
		                    					//alert(res);
		                    					} 
		                    				} 
		                    			}); 
		                    			//alert(res);
		                    			} return res; 
		                    	} 
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
		                    },
		                    callback: { 
		                    	message: '该地址已存在,请更换', 
		                    	callback: function (value, validator) { 
		                    		var res = true; 
		                    		$.ajax({ 
		                    			url: 'user/register/checkblogaddress.do', 
		                    			type: 'post', 
		                    			dataType: 'json', 
		                    			async: false, 
		                    			data: {blogaddress: value}, 
		                    			success:
		                    				function (data) {
		                    				//alert(data.status);
		                    				if (data.status != 'success'){
		                    					res = false;
		                    					//alert(res);
		                    					} 
		                    				} 
		                    			}); 
		                    		return res; 
		                    	} 
		                    }
		                } 
		            }
		        }
		    });
			//登陆表单验证
		    $('#login-form').bootstrapValidator({
				//        live: 'disabled',
				        message: '该数据不合法',
				        feedbackIcons: {
				            valid: 'glyphicon glyphicon-ok',
				            invalid: 'glyphicon glyphicon-remove',
				            validating: 'glyphicon glyphicon-refresh'
				        },
				        fields: {
				        	j_username: {
				                validators: {
				                	notEmpty: {
				                        message: '请输入用户名'
				                    }
				                }
				            },
				            j_password: {
				                validators: {
				                    notEmpty: {
				                        message: '请输入登录密码'
				                    },
				                    different: {
				                        field: 'email',
				                        message: '密码不能和邮箱相同'
				                    }
				                }
				            }

				        }
				    });
		  //找回密码
		    $('#email-form').bootstrapValidator({
				//        live: 'disabled',
				        message: '该数据不合法',
				        feedbackIcons: {
				            valid: 'glyphicon glyphicon-ok',
				            invalid: 'glyphicon glyphicon-remove',
				            validating: 'glyphicon glyphicon-refresh'
				        },
				        fields: {
				        	backemail: {
				        		 validators: {
					                	notEmpty: {
					                        message: '请输入邮箱'
					                    },
					                    emailAddress: {
					                        message: '请输入正确的邮箱'
					                    }
					                }
				            }
				        }
				    });
		    // Validate the form manually
		   // $('#validateBtn').click(function() {
		     //   $('#register-form').bootstrapValidator('validate');
		    //});
			//backemail email-form resetBak
			
		    $('#resetBtn').click(function() {
		        $('#register-form').data('bootstrapValidator').resetForm(true);
		    });
		    $('#loginReset').click(function() {
		        $('#login-form').data('bootstrapValidator').resetForm(true);
		    });
		    $('#resetBak').click(function() {
		        $('#email-form').data('bootstrapValidator').resetForm(true);
		    });
		});