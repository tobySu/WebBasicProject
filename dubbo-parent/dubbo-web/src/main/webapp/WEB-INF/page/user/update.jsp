<%@page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/page/common/taglibs.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>后台管理</title>
<link href="${ctx}/css/bootstrap/bootstrap.min.css" rel="stylesheet">
<link href="${ctx}/css/bootstrap/bootstrapValidator.min.css" rel="stylesheet">

    <link href="${ctx}/css/easyui/themes/gray/easyui.css"
          rel="stylesheet"></link>
    <link href="${ctx}/css/easyui/themes/icon.css"
          rel="stylesheet"></link>
         

	<script src="${ctx}/js/jquery/jquery-1.10.2.min.js"></script>
	<script src="${ctx}/js/bootstrap/bootstrap.min.js"></script>
	<script src="${ctx}/js/bootstrap/bootstrapValidator.js"></script>
	<script src="${ctx}/js/easyui/jquery.easyui.min.js"></script>
    <script src="${ctx}/js/easyui/easyui-ch.js"></script>
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    
</head>

<body>
	<div class="container">
		<form id="defaultForm" style="width:100%""
			class="form-horizontal">
			<input type="hidden" name="id" value="${user.id}">
			<table style="width:100%">
				<tr>
					<td>
					<!-- 下面这个div必须要有，插件根据这个进行添加提示 -->
						<div class="form-group">
							<label class="col-sm-2 control-label">手机号<span style="color:red">*</span></label>
							<div class="col-sm-10">
								<input type="text" class="form-control" value="${user.account}" name="account" placeholder="请输入您的手机号"/>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<td>
					<!-- 下面这个div必须要有，插件根据这个进行添加提示 -->
						<div class="form-group">
							<label class="col-sm-2 control-label">昵称<span style="color:red">*</span></label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="name" value="${user.name}" placeholder="请输入您的昵称(6-20位数字或字符组成)"/>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div class="form-group">
							<label class="col-sm-2 control-label">分类<span style="color:white">*</span></label>
							<div class="col-sm-10">
								  <select id="cc" name="category" class="form-control" style="height:34px;width:100%">
								  	<option>${user.category}</option>
								  </select>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<td>
					<!-- 下面这个div必须要有，插件根据这个进行添加提示 -->
						<div class="form-group">
							<label class="col-sm-2 control-label">邮箱<span style="color:white">*</span></label>
							<div class="col-sm-10" style="text-align: center">
								<input type="text" class="form-control" name="mail" value="${user.mail}" placeholder="请输入您的邮箱"/>
							</div>
						</div>
					</td>
				</tr>
			</table>
			


			<div class="row">
				<div style="width:100%; text-align: center;margin-top:20px">
					<div class="form-group" style="margin:0 auto;">
						<button type="button" id="submitBtn" class="btn btn-primary"
							style="width:40%">确定</button>
						<button type="button" id="cancelBtn" class="btn btn-default"
							style="width:40%">取消</button>
					</div>
				</div>
			</div>
		</form>
	</div>
	
	
</body>
<script>
$(document).ready(function() {
	  $('#defaultForm').bootstrapValidator({
	        message: 'This value is not valid',
	        feedbackIcons: {
	            valid: 'glyphicon glyphicon-ok',
	            invalid: 'glyphicon glyphicon-remove',
	            validating: 'glyphicon glyphicon-refresh'
	        },
	        fields: {
	        	account :{
	        		validators: {
	        			notEmpty: {
	        				 message: '手机号不能为空哦~'
	        			},
	                    regexp: {
	                        regexp: /^1[3|4|5|7|8][0-9]{9}$/,
	                        message: '请输入正确的手机号'
	                    }
	                }
	        	},
	            name: {
	                validators: {
	                	notEmpty: {
	               		    message: '昵称不能为空哦~'
	      				},
	                    regexp: {
	                        regexp: /^(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{6,10}$/,
	                        message: '6-10位的字母或者数字,并且至少有一个数字或者字母'
	                    }
	                }
	            },
	            category: {
	                validators: {
	                    notEmpty: {
	                        message: '请选择分类'
	                    }
	                }
	            },mail:{
	            	 validators: {
	            		 regexp: {
	                         regexp: /^[A-Za-z0-9\u4e00-\u9fa5]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/,
	                         message: '请输入正确的邮箱格式'
	                     }
	                 } 
	            }
	           
	        }
    });
    
    $('#cancelBtn').click(function () {  
		parent.closeDialog('first');
    });  
    
    $('#submitBtn').click(function () {  
    	$('#defaultForm').data('bootstrapValidator').validate();
    	if(!$('#defaultForm').data('bootstrapValidator').isValid()){  
    		//parent.swal({title: '您填写的信息不完整',    text: '"*"号的列需要填写哦', type :'error', confirmButtonText :'确定' });
    	} else {
    		var postData = $('#defaultForm').serialize();
    		
    		$.ajax({
    			type : 'POST',
    			url : '${ctx}/user/update.json',
    			data : postData,
    			dataType : 'json',
    			success : function(result) {
    				parent.evalFun('refreshTable()');
    				parent.closeDialog('first');
    		    	parent.swal({title: '修改成功', text: '正在跳转', type :'success', timer: 1000,showConfirmButton: false  });
    			},
    			error : function(result) {
    				parent.swal({title: '修改失败',text: '服务器傻掉啦~', type :'error', confirmButtonText :'确定' });
    			}
    		});
    	  
    	}
    }); 
    
    
    $('#cc').combotree({
        url:'${ctx}/userCategory/getList.json',
        panelHeight:100
    });

});


</script>
</html>
