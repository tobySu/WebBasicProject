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

	<script src="${ctx}/js/jquery/jquery-1.10.2.min.js"></script>
	<script src="${ctx}/js/bootstrap/bootstrap.min.js"></script>
	<script src="${ctx}/js/bootstrap/bootstrapValidator.js"></script>
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
			<input type="hidden" name="id" id="id" value="${userCategory.id}" />
			<table style="width:100%">
				<tr>
					<td>
					<!-- 下面这个div必须要有，插件根据这个进行添加提示 -->
						<div class="form-group">
							<label class="col-sm-2 control-label">分类名称<span style="color:red">*</span></label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="name" value="${userCategory.name}" placeholder="请输入要新增的分类名称"/>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<td>
					<!-- 下面这个div必须要有，插件根据这个进行添加提示 -->
						<div class="form-group">
							<label class="col-sm-2 control-label">标签<span style="color:red">*</span></label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="tagList"  value="${userCategory.tagList}" placeholder="请输入描述专属标签"/>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<td>
					<!-- 下面这个div必须要有，插件根据这个进行添加提示 -->
						<div class="form-group">
							<label class="col-sm-2 control-label"><span style="color:white">*</span>描述</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="description"  value="${userCategory.description}" placeholder="请输入您的描述（400字内）"/>
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
        	name :{
        		validators: {
        			notEmpty: {
        				 message: '分类名不能为空'
        			}
                }
        	},
        	tagList :{
        		validators: {
        			notEmpty: {
        				 message: '标签不能为空哦~'
        			}
                }
        	},
        	description:{
            	 validators: {
            		 stringLength: {/*长度提示*/
                         min: 0,
                         max: 400,
                         message: '描述只能是400个字内哦~'
                     }/*最后一个没有逗号*/
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
    		parent.swal({title: '您填写的信息不完整',    text: '"*"号的列需要填写哦', type :'error', confirmButtonText :'确定' });
    	} else {
    		var postData = $('#defaultForm').serialize();
    		parent.evalFun("update('"+postData+"');");
    	  
    	}
    }); 
    

});


</script>
</html>
