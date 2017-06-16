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
<link href="${ctx}/css/jqGrid/ui.jqgrid.css" rel="stylesheet"/>
<link href="${ctx}/css/jqGrid/jquery-ui.css" rel="stylesheet"/>

<!-- DataTables JavaScript -->
	<script src="${ctx}/js/jquery/jquery.min.js"></script>
	<script src="${ctx}/js/bootstrap/bootstrap.min.js"></script>
	<script src="${ctx}/js/jqGrid/jquery.jqGrid.min.js"></script>
	<script src="${ctx}/js/jqGrid/grid.treegrid.js"></script>
	<script src="${ctx}/js/jqGrid/grid.locale-cn.js"></script>
	<script src="${ctx}/js/myJs/util.js"></script>
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    
    <style type="text/css">
	.ui-jqgrid tr.jqgrow td {
    font-weight: normal;
    overflow: hidden;
    white-space: pre;
    height: 42px;
    padding: 0 2px 0 2px;
    border-bottom-width: 1px;
    border-bottom-color: inherit;
    border-bottom-style: solid;
	}
	.ui-jqgrid .ui-jqgrid-htable th div {
    overflow: hidden;
    position: relative;
    text-align:center;
    height: 43px;
    line-height:43px;   
	}
	.ui-icon, .ui-widget-content .ui-icon {
    background-image: url("${ctx}/css/jqGrid/images/ui-icons_444444_256x240.png");
    margin-top: 2px;
	}
	</style>
<script type="text/javascript">
 
	$(document).ready(function() {

		jQuery("#treeTeable").jqGrid({
			url : '${ctx}/userCategory/getTreeList.json',
			datatype : "json",
			width : $(window).width() - 20,
			treeGrid : true,
			forceFit : true,
			treeGridModel : 'adjacency',
			shrinkToFit : true,
			ExpandColumn : 'name',
			colNames : [ 'id', '类型', '标签', '创建时间', '描述' ],
			ExpandColClick : true,
			mtype : "POST",
			colModel : [ {
				name : 'id',
				index : 'id',
				hidden : true
			}, {
				name : 'name',
				index : 'name',
				width : 80,
				align : 'center' ,
				sortable : false
			}, {
				name : 'tagList',
				index : 'tagList',
				width : 200,
				sortable : false
			}, {
				name : 'createTime',
				index : 'createTime',
				width : 80,
				align : 'center' ,
				sortable : false
			}, {
				name : 'description',
				index : 'description',
				width : 200,
				sortable : false
			}, ],
			pager : "false",
			jsonReader : {
				root : "jsonObject",
				repeatitems : false
			},
			treeReader : {
				level_field : "level",
				parent_id_field : "rid",
				leaf_field : "isLeaf",
				expanded_field : "expanded"
			},
			height : 'auto'
		});
		
		$("#treeTeable").closest(".ui-jqgrid-bdiv").css({ "overflow-x" : "hidden" });
		
		$('#addBtn').click(function () {  
			addView();  
	    });  
		
		$('#updateBtn').click(function () {  
			updateView();  
	    });  
	});

	function addView() {
		var id = jQuery("#treeTeable").jqGrid('getGridParam', 'selrow');
		if (checkNull(id)) {
			parent.swal({title: '操作失败',text: '请选择父节点', type :'error', confirmButtonText :'确定' });
		}else{
			parent.openDialog('first',800,250,'新增用户','${ctx}/userCategory/addView.html?parentId='+id);
		}
	}
	
	function updateView() {
		var id = jQuery("#treeTeable").jqGrid('getGridParam', 'selrow');
		if (checkNull(id)) {
			parent.swal({title: '操作失败',text: '请选择父节点', type :'error', confirmButtonText :'确定' });
		}else{
			parent.openDialog('first',800,250,'新增用户','${ctx}/userCategory/updateView.html?id='+id);
		}
	}
	
	
	function add(postData){
		 var rowData = jQuery("#treeTeable").jqGrid('getRowData',jQuery("#treeTeable").jqGrid('getGridParam','selrow'));
		 $.ajax({
	      		url:'${ctx}/userCategory/add.json',
	      		type:'post',
	      		dataType:'json',
	      		data:postData,
	      		success:function(data){
	      			console.info(data);
	      			jQuery("#treeTeable").jqGrid('addChildNode', data.id, rowData.id, data);  
	      			parent.closeDialog('first');
    		    	parent.swal({title: '保存成功', text: '正在刷新数据', type :'success', timer: 1000,showConfirmButton: false  });
	      		},
	      		error:function(data){
	      			parent.swal({title: '保存失败',text: '服务器傻掉啦~', type :'error', confirmButtonText :'确定' });
	      		}
	     });
	}
	

	function update(postData){
		 $.ajax({
	      		url:'${ctx}/userCategory/update.json',
	      		type:'post',
	      		dataType:'json',
	      		data:postData,
	      		success:function(data){
	      			console.info(data);
	      			jQuery("#treeTeable").jqGrid('setRowData', data.id, data);  
	      			parent.closeDialog('first');
    		    	parent.swal({title: '修改成功', text: '正在刷新数据', type :'success', timer: 1000,showConfirmButton: false  });
	      		},
	      		error:function(data){
	      			parent.swal({title: '修改失败',text: '服务器傻掉啦~', type :'error', confirmButtonText :'确定' });
	      		}
	     });
	}
</script>
</head>

<body style="padding:10px">
<input type="hidden" id="ctxValue" value="${ctx}">

	<h2>用户分类管理</h2>
	<div style="margin-top:20px;margin-bottom: 5px;padding-top:5px;border-top: 1px solid #e7e7e7 ;">
		<button type="button" id="addBtn" class="btn btn-primary">新增</button>
		<button type="button" id="updateBtn" class="btn btn-info">修改</button>
		<button type="button" id="delBtn" class="btn btn-danger">删除</button>
	</div>
	<table id="treeTeable"></table>
	<div style="height:40px"></div>
</body>
</html>
