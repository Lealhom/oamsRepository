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
		
	</head>
	<script type="text/javascript">
	
		$(function(){
		
			var searchBox=$('#message').searchbox({  
    				searcher:function(value,name){  
       					 var queryParams = $('#table').datagrid('options').queryParams; 
       					 queryParams.name="";
       					 queryParams.address="";
       					 if(name=='name')
       					 {
       					 	 queryParams.name = value;  
       					 }else if(name=='address')
       					 {	
       					 	 queryParams.address = value;  
       					 }
						
						 $('#table').datagrid('load');  
    				}, 
    				menu:'#option',  
    				prompt:'请输入数据'  
			});  
			
			// 生成表格
			$('#table').datagrid({
				// 表格的标题
				title:'菜单管理',
				// 表格标题前面的图标
				iconCls:'icon-save',
				// 宽度
				width:($(window).width()*0.97),
				// 高度
				height:($(window).height()*0.96),
				// 窗口是否可以收缩
				collapsible:true,
				// 请求数据的url
				url:'menu!list.action',
				// 行阴影，但目前看没有效果
				striped:true,
				// 拍序列
				sortName: 'orderNO',
				// 窗口自动大小
				fit:false,
				// 排序规则
				sortOrder: 'desc',
				// 本地排序，不是在服务器端排
				remoteSort: false,
				// 这个其实和column差不多，只不过是放在表格的左边
				frozenColumns:[[
	                {field:'ck',checkbox:true}
				]],
				// 标题
				columns:[[
					{title:'id',field:'id',width:150,align:'center',hidden:true},
					{title:'菜单名称',field:'name',width:150,align:'center',fit:true},
					{title:'菜单地址',field:'address',width:150,align:'center'},
					{title:'菜单图标',field:'icon',width:150,align:'center'},
					{title:'菜单序号',field:'orderNO',width:150,align:'center'}
				]],
				// 待选分页数据条数
				pageList : [5,10,20],  
				// 每页显示数据条数       
				pageSize : 5,
				// 分页
				pagination:true,
				// 在左侧是否显示行号
				rownumbers:true,
				// 工具栏
				toolbar:[{
					id:'add',
					// 工具条上显示的文字
					text:'添加',
					// 图标
					iconCls:'icon-add',
					// 单击图标时显示的事件
					handler:function(){
						addMenu();
					}
				},{
					id:'update',
					text:'修改',
					iconCls:'icon-edit',
					handler:function(){
						var rows=$('#table').datagrid('getSelections');
						if(rows.length==0)
						{
							$.messager.alert('提示','请选中一条您要修改的记录'); 
						}else if(rows.length>1){
							$.messager.alert('提示','只能同时修改一条记录'); 
						}else{
							updatePerson();
						}
					}
				},'-',{
					id:'delete',
					text:'删除',
					disabled:false,
					iconCls:'icon-remove',
					handler:function(){
						var rows=$('#table').datagrid('getSelections');
						var deleteVar="";
						if(rows.length==0)
						{
							$.messager.alert('提示','选中要删除的记录');  
						}else
						{
							for(var i=0;i<rows.length;i++)
							{
								if(i==(rows.length-1))
								{
									deleteVar+=rows[i].id;
								}else
								{
									deleteVar+=rows[i].id+",";
								}
							}
							$.ajax({
						        url : "menu!delete.action",
						        data : {ids : deleteVar},
						        type : 'POST',
						        dataType : 'text',
						        success : function(data) {
		        					  $('#table').datagrid('load');
						        }
						   	});
						}
					}
				},{
       				id:'search',
       				text:'全部数据',
       				iconCls:'icon-search',
       				handler:function(){
       					 var queryParams = $('#table').datagrid('options').queryParams;  
						 queryParams.name = ""; 
						 queryParams.address="";
						 $('#table').datagrid('load');
						 $('#message').searchbox('setValue', '');
       				} 
				}]
			});
			
			// 显示分页信息的底部显示栏
			var p = $('#table').datagrid('getPager');
			   
  			$(p).pagination({
  				// 每页显示多少条记录
				pageSize: 5,
       			// 显示分页信息的文字   
        		beforePageText: '第',
        		afterPageText: '页    共 {pages} 页',  
        		displayMsg: '当前显示 {from} - {to} 条记录   共 {total} 条记录'
    		}); 
    		
    		$(".datagrid-toolbar").append($("#testa")); 
    		
    		function addMenu(){
    			//清空表单信息
    			//$('#addMenu').form("clear");
    			//$('#addMenu')[0].reset();  
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
							        url : "menu!add.action",
							        data : dataToSend,
							        type : 'POST',
							        dataType : 'text',
							        success : function(data) {
							        	  $('#dialog').dialog('close');
			        					  $('#table').datagrid('load');
			        					  $('#addMenu').form("clear");
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
              } 
			 actions="menu!update.action";
			 function updatePerson(){
				 
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
	    		  	
				var rows=$('#table').datagrid('getSelections');
			
				$('#addMenu').form('load',{
							id:rows[0].id,
							name:rows[0].name,
							address:rows[0].address,
							icon:rows[0].icon,
							orderNO:rows[0].orderNO
				});
					 
              } 
			  
		});
	</script>
	<script type="text/javascript">
	function resizeGrid(){
	    $('#table').datagrid('resize', {
	        width: ($(window).width()*0.97),
	        height:($(window).height()*0.96)
	    });
	}
	</script>
	<body onresize="resizeGrid();">
		<div id="table"></div>

		<div id="dialog" style="display: none;">
			<form id="addMenu" method="post">
			<input type="hidden" id="id" name="id"/>
				<table align="center">
					<tr>
						<td>
							菜单名称:
						</td>
						<td>
							<input class="easyui-validatebox" id="name" name="name"
								data-options="required:true,validType:'length[3,10]',missingMessage:'输入数据不能为空1!',invalidMessage:'长度在3-10字符之间!',tipPosition:'right'"></input>
						</td>
					</tr>
					<tr>
						<td>
							菜单地址:
						</td>
						<td>
							<input class="easyui-validatebox" id="address" name="address"
								data-options="required:true,validType:'length[8,25]',missingMessage:'输入数据不能为空2!',invalidMessage:'长度在8-25字符之间!',tipPosition:'right'"></input>
						</td>
					</tr>
					<tr>
						<td>
							菜单图标:
						</td>
						<td>
							<input class="easyui-validatebox" id="icon" name="icon"
								data-options="required:true,validType:'length[8,25]',missingMessage:'输入数据不能为空3!',invalidMessage:'长度在8-25字符之间!',tipPosition:'right'"></input>
						</td>
					</tr>
					<tr>
						<td>
							菜单序号:
						</td>
						<td>
							<input class="easyui-validatebox" id="orderNO" name="orderNO"
								data-options="required:true,validType:'length[1,3]',missingMessage:'输入数据不能为空4!',invalidMessage:'长度在1-3字符之间!',tipPosition:'right'"></input>
						</td>
					</tr>
				</table>
			</form>
		</div>

		<div id="testa" align="right" style="margin-top: 3px;">
			<input id="message"></input>
			<div id="option" style="width: 120px">
				<div data-options="name:'name'">
					按菜单名查询
				</div>
				<div data-options="name:'address'">
					按菜单地址查询
				</div>
			</div>
		</div>

	</body>
</html>
