<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../included.jsp" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">
		<title>菜单管理</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<style type="text/css">
		.tableForm {
	border-collapse: collapse;
	width: 100%;
}
.tableForm th {
	text-align: right;
	border: 1px solid #ccc;
	font-size: 13px;
}

.tableForm td {
	text-align: left;
	border: 1px solid #ccc;
}

.tableForm input {
	width: 96%;
}

.tableForm textarea {
	width: 96%;
}
		
		</style>
	</head>
	
	<script type="text/javascript" charset="utf-8">
	var treegrid;
	var iconData;
	$(function() {

		iconData = [ {
			value : '',
			text : '默认'
		}, {
			value : 'icon-add',
			text : 'icon-add'
		}, {
			value : 'icon-edit',
			text : 'icon-edit'
		}, {
			value : 'icon-remove',
			text : 'icon-remove'
		}, {
			value : 'icon-save',
			text : 'icon-save'
		}, {
			value : 'icon-cut',
			text : 'icon-cut'
		}, {
			value : 'icon-ok',
			text : 'icon-ok'
		}, {
			value : 'icon-no',
			text : 'icon-no'
		}, {
			value : 'icon-cancel',
			text : 'icon-cancel'
		}, {
			value : 'icon-reload',
			text : 'icon-reload'
		}, {
			value : 'icon-search',
			text : 'icon-search'
		}, {
			value : 'icon-print',
			text : 'icon-print'
		}, {
			value : 'icon-help',
			text : 'icon-help'
		}, {
			value : 'icon-undo',
			text : 'icon-undo'
		}, {
			value : 'icon-redo',
			text : 'icon-redo'
		}, {
			value : 'icon-back',
			text : 'icon-back'
		}, {
			value : 'icon-sum',
			text : 'icon-sum'
		}, {
			value : 'icon-tip',
			text : 'icon-tip'
		} ];

		treegrid = $('#treegrid').treegrid({
			url : 'menu!treegrid.action',
			toolbar : [ {
				text : '展开',
				iconCls : 'icon-redo',
				handler : function() {
					var node = treegrid.treegrid('getSelected');
					if (node) {
						treegrid.treegrid('expandAll', node.cid);
					} else {
						treegrid.treegrid('expandAll');
					}
				}
			}, '-', {
				text : '折叠',
				iconCls : 'icon-undo',
				handler : function() {
					var node = treegrid.treegrid('getSelected');
					if (node) {
						treegrid.treegrid('collapseAll', node.cid);
					} else {
						treegrid.treegrid('collapseAll');
					}
				}
			}, '-', {
				text : '刷新',
				iconCls : 'icon-reload',
				handler : function() {
					treegrid.treegrid('reload');
				}
			}, '-', {
				text : '增加',
				iconCls : 'icon-add',
				handler : function() {
					append();
				}
			}, '-', {
				text : '删除',
				iconCls : 'icon-remove',
				handler : function() {
					remove();
				}
			}, '-', {
				text : '编辑',
				iconCls : 'icon-edit',
				handler : function() {
					edit();
				}
			}, '-', {
				text : '取消选中',
				iconCls : 'icon-undo',
				handler : function() {
					treegrid.treegrid('unselectAll');
				}
			}, '-' ],
			title : '',
			iconCls : 'icon-save',
			fit : true,
			fitColumns : true,
			nowrap : false,
			animate : false,
			border : false,
			idField : 'cid',
			treeField : 'cname',
			frozenColumns : [ [ {
				title : 'cid',
				field : 'cid',
				width : 150,
				hidden : true
			}, {
				field : 'cname',
				title : '菜单名称',
				width : 180,
				formatter : function(value) {
					if (value) {
						return dj.fs('<span title="{0}">{1}</span>', value, value);
					}
				}
			} ] ],
			columns : [ [ {
				field : 'iconCls',
				title : '菜单图标',
				width : 70,
				formatter : function(value) {
					if (!value) {
						return '';
					} else {
						return dj.fs('<span class="{0}" style="display:inline-block;vertical-align:middle;width:16px;height:16px;"></span>', value);
					}
				}
			}, {
				field : 'curl',
				title : '菜单地址',
				width : 250,
				formatter : function(value) {
					if (value) {
						return dj.fs('<span title="{0}">{1}</span>', value, value);
					}
				}
			}, {
				field : 'cseq',
				title : '排序',
				width : 40
			}, {
				field : 'pid',
				title : '上级菜单ID',
				width : 150,
				hidden : true
			}, {
				field : 'pname',
				title : '上级菜单',
				width : 150
			} ] ],
			onContextMenu : function(e, row) {
				e.preventDefault();
				$(this).treegrid('unselectAll');
				$(this).treegrid('select', row.cid);
				$('#menu').menu('show', {
					left : e.pageX,
					top : e.pageY
				});
			},
			onLoadSuccess : function(row, data) {
				/*var t = $(this);
				if (data) {
					$(data).each(function(index, d) {
						if (this.state == 'closed') {
							t.treegrid('expandAll');
						}
					});
				}*/
			},
			onExpand : function(row) {
				treegrid.treegrid('unselectAll');
			},
			onCollapse : function(row) {
				treegrid.treegrid('unselectAll');
			}
		});

	});

	function edit() {
		var node = treegrid.treegrid('getSelected');
		if (node) {
			var p = parent.dj.dialog({
				title : '编辑菜单',
				href : '${pageContext.request.contextPath}/menu!menuEdit.do',
				width : 460,
				height : 220,
				buttons : [ {
					text : '编辑',
					handler : function() {
						var f = p.find('form');
						f.form('submit', {
							url : '${pageContext.request.contextPath}/menu!edit.do',
							success : function(d) {
								var json = $.parseJSON(d);
								if (json.success) {
									treegrid.treegrid('reload');
									p.dialog('close');
									parent.ctrlTree.tree('reload');/*刷新左侧菜单树*/
								}
								parent.dj.messagerShow({
									msg : json.msg,
									title : '提示'
								});
							}
						});
					}
				} ],
				onLoad : function() {
					var f = p.find('form');
					var pid = f.find('input[name=pid]');
					var iconCls = f.find('input[name=iconCls]');
					var iconCombo = iconCls.combobox({
						data : iconData,
						formatter : function(v) {
							return dj.fs('<span class="{0}" style="display:inline-block;vertical-align:middle;width:16px;height:16px;"></span>{1}', v.value, v.value);
						}
					});
					var ptree = pid.combotree({
						lines : true,
						url : '${pageContext.request.contextPath}/menu!doNotNeedSession_treeRecursive.do',
						onLoadSuccess : function() {
							parent.$.messager.progress('close');
						}
					});
					f.form('load', node);
				}
			});
		} else {
			parent.dj.messagerAlert('提示', '请选中要编辑的记录！', 'error');
		}
	}
	function append() {
		
		$(":input","#addMenu").not(":button",":submit",":reset","[type='hidden']").val("").removeAttr("checked").removeAttr("selected");
		
		
		// 让默认看不到的层显示出来   
	  	$('#dialog').show();
		
	  	// 弹出窗口
        $('#dialog').dialog({
        	// 标题
        	title:'菜单添加窗口',
        	// 是否是可折叠的
        	collapsible: true, 
        	// 是否可最小化窗口
			minimizable: false, 
			// 是否可最大化窗口
			maximizable: true,
			// 宽度 
			width: 500, 
			// 高度
			height: 300,
			// 模式窗口
			modal:true,
			// 窗口下的按钮
			buttons:[{
				text:'保存',
				iconCls:'icon-ok',
				handler:function(){
					var dataToSend=$("#addMenu").serialize();
					var isValid = $("#addMenu").form('validate');
					if(isValid){
						$.ajax({
					        url : actions,
					        data : dataToSend,
					        type : 'POST',
					        dataType : 'text',
					        success : function(data) {
					        	  $('#dialog').dialog('close');
	        					  $('#table').datagrid('load');
					        }
						});
					}
				}
			},{
				text:'取消',
				iconCls:'icon-cancel',
				handler:function(){
					$('#dialog').dialog('close');
				}
			}]
		});   
	
        $('#dialog').dialog('setTitle', "动态改变"); 
        $('.icon-ok').text("修改");

		$('input[name=iconCls]').combobox({
			data : iconData,
			formatter : function(v) {
				return formatCombobox('<span class="{0}" style="display:inline-block;vertical-align:middle;width:16px;height:16px;"></span>{1}', v.value, v.value);
			}
    	});
		$('input[name=pid]').combotree({
			lines : true,
			url : ''
		});
		 
		
	}

	function remove() {
		var node = treegrid.treegrid('getSelected');
		if (node) {
			parent.dj.messagerConfirm('询问', '您确定要删除【' + node.cname + '】？', function(b) {
				if (b) {
					$.ajax({
						url : '${pageContext.request.contextPath}/menu!delete.do',
						data : {
							cid : node.cid
						},
						cache : false,
						dataType : 'JSON',
						success : function(r) {
							if (r.success) {
								treegrid.treegrid('remove', r.obj);
								parent.ctrlTree.tree('reload');/*刷新左侧菜单树*/
							}
							parent.dj.messagerShow({
								msg : r.msg,
								title : '提示'
							});
						}
					});
				}
			});
		}
	}
</script>
</head>
<body class="easyui-layout" data-options="fit:true">
	<div data-options="region:'center',border:false" style="overflow: hidden;">
		<table id="treegrid"></table>
	</div>

	<div id="dialog" style="display: none;">
		<form id="addMenu" method="post">
			<input type="hidden" id="id" name="id" />
			<table class="tableForm">
				<tr>
					<th>菜单名称</th>
					<td><input name="cname" class="easyui-validatebox"
						data-options="required:true,missingMessage:'请填写菜单名称'" 
						style="width:160px;"
						/></td>
					<th>排序</th>
					<td><input name="cseq" class="easyui-numberspinner"
						data-options="min:0,max:999,editable:false,required:true,missingMessage:'请选择菜单排序'"
						value="10" style="width:150px;" /></td>
				</tr>
				<tr>
					<th>上级菜单</th>
					<td><input name="pid" style="width:160px;" /></td>
					<th>菜单图标</th>
					<td><input name="iconCls" style="width:150px;" /></td>
				</tr>
				<tr>
					<th>菜单地址</th>
					<td colspan="3"><input name="curl" style="width:95%;" /></td>
					
				</tr>
			</table>
		</form>
	</div>


	<div id="menu" class="easyui-menu" style="width:120px;display: none;">
		<div onclick="append();" data-options="iconCls:'icon-add'">增加</div>
		<div onclick="remove();" data-options="iconCls:'icon-remove'">删除</div>
		<div onclick="edit();" data-options="iconCls:'icon-edit'">编辑</div>
	</div>
</body>
</html>
