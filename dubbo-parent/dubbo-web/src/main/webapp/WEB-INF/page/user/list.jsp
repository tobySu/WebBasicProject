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
<link href="${ctx}/plugins/bootstrapTable/bootstrap-table.css" rel="stylesheet">
<link href="${ctx}/css/easyui/themes/gray/easyui.css"
          rel="stylesheet"></link>
<link href="${ctx}/css/easyui/themes/icon.css"
          rel="stylesheet"></link>
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<style type="text/css">
.form-group {
	margin: 5px 5px 5px 20px;
}


.padding-10{
	padding:10px;
}

.height-40{
	height:40px;
}


</style>
</head>

<body class="padding-10">
<input type="hidden" id="ctxValue" value="${ctx}">
	<div class="row">
		<form class="form-inline">
			<div class="form-group">
				<label for="account">用户账号：</label> <input type="text"
					class="form-control" id="account" placeholder="注册手机号" value="${userQuery.account}">
			</div>
			<div class="form-group">
				<label for="name">昵称:</label> <input type="text"
					class="form-control" id="name" placeholder="昵称" value="${userQuery.name}">
			</div>
			<div class="form-group">
				<label for="account">类型:</label> 
				 <select id="cc" name="category" class="form-control" style="height:34px;width:196px"></select>
			</div>
			<div class="form-group">
				<button type="button" id="searchBtn" class="btn btn-primary">查询</button>
				<button type="button" id="cancelBtn" class="btn btn-default">取消</button>
			</div>
		</form>
	</div>
	<div style="margin-top:20px;margin-bottom: 5px;padding-top:5px;border-top: 1px solid #e7e7e7 ;">
		<button type="button" id="addBtn" class="btn btn-primary">新增用户</button>
		<button type="button" id="delBtn" class="btn btn-danger">批量删除</button>
	</div>
	<table id="querylist">
	</table>
	<div class="height-40"></div>
 
	<!-- DataTables JavaScript -->
	<script src="${ctx}/js/jquery/jquery.min.js"></script>
	<script src="${ctx}/js/bootstrap/bootstrap.min.js"></script>
	<script src="${ctx}/plugins/bootstrapTable/bootstrap-table.js"></script>
	<script src="${ctx}/plugins/bootstrapTable/bootstrap-table-zh-CN.js"></script>
	<script src="${ctx}/js/easyui/jquery.easyui.min.js"></script>
    <script src="${ctx}/js/easyui/easyui-ch.js"></script>
	<script src="${ctx}/js/myJs/util.js"></script>
	<script src="${ctx}/js/myJs/user/list.js"></script>
</body>
</html>
