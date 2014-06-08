<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
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
						if(rows.length!=1)
						{
							$.messager.alert('提示','请选中一条您要修改的记录'); 
						}else
						{
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
									deleteVar+=rows[i].code;
								}else
								{
									deleteVar+=rows[i].code+",";
								}
							}
							$.post("deletePersonServlet",{deleteIDs:deleteVar},function(result){
								var options=$('#table').datagrid('getPager').data("pagination").options;
								var currentPageNumber=options.pageNumber;
								var rowSize=$('#table').datagrid('getRows').length;
								if(currentPageNumber!=1 && rowSize==rows.length)
								{
									var queryParams = $('#table').datagrid('options').queryParams;  
									queryParams.previous = 'true';  
									$('#table').datagrid('reload');
									queryParams.previous = ''; 
								}else
								{
									$('#table').datagrid('reload');
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
							$('#addMenu').submit();
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
              
              // 表单提交
              $('#addMenu').form({  
              			// 表单提交的路径
    					url:"menu!add.action",  
    					// 表单提交前
    					onSubmit: function(){
    						  // 判断所有的验证是不是通过啦
    						  var isValid = $(this).form('validate');
							  return isValid;
    					},  
    					// 当请求成功以后
    					success:function(data){  
    						  $('#dialog').dialog('close');
        					  $('#table').datagrid('load');
        					  $('#addMenu').form("clear");
   				 		}  
			 }); 
			 
			 
			 
			 
			 function updatePerson(){
    			// 让默认看不到的层显示出来   
    		  	$('#updateDialog').show();
    		  	// 弹出窗口
                $('#updateDialog').dialog({
                	// 标题
                	title:'人员修改窗口',
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
							$('#updatePerson').submit();
						}
					},{
						text:'取消',
						iconCls:'icon-cancel',
						handler:function(){
							$('#updateDialog').dialog('close');
						}
					}]
				}); 
				
				var rows=$('#table').datagrid('getSelections');
			
				$('#updatePerson').form('load',{
							code:rows[0].code,
							name:rows[0].name,
							address:rows[0].address,
							country:rows[0].country,
							sex:rows[0].sex,
							basktball:rows[0].basktball,
							football:rows[0].football,
							pingpang:rows[0].pingpang,
							email:rows[0].email
				});
					 
              } 
			 
			  // 表单提交
              $('#updatePerson').form({  
              			// 表单提交的路径
    					url:"updatePersonServlet",  
    					// 表单提交前
    					onSubmit: function(){
    						  // 判断所有的验证是不是通过啦
    						  var isValid = $(this).form('validate');
							  return isValid;
    					},  
    					// 当请求成功以后
    					success:function(data){  
    					
    						 var mybasktball=$("#updatebasktball").attr("checked");
    						 var myfootball=$("#updatefootball").attr("checked");
    						 var mypingpang=$("#updatepingpang").attr("checked");
    						 
    						 if(mybasktball=='checked')
    						 {
    						 	mybasktball=true;
    						 }else
    						 {
    						 	mybasktball=false;
    						 }
    						 
    						 if(myfootball=='checked')
    						 {
    						 	myfootball=true;
    						 }else
    						 {
    						 	myfootball=false;
    						 }
    						 
    						 if(mypingpang=='checked')
    						 {
    						 	mypingpang=true;
    						 }else
    						 {
    						 	mypingpang=false;
    						 }
    						  
    						  $('#updateDialog').dialog('close');
        					  var rows=$('#table').datagrid('getSelections');
        					  var myindex = $('#table').datagrid('getRowIndex', rows[0]);
        					  $('#table').datagrid('updateRow',{
										index: myindex,
										row: {
											name:$("#updatename").val(),
											address:$("#updateaddress").val(),
											email:$("#updateemail").val(),
											country:$("#updatecountry").val(),
											basktball:mybasktball,
											football:myfootball,
											pingpang:mypingpang,
											sex:$("input[name='updatesex']:checked").val()
										}
							  });
        					  $('#table').datagrid('clearSelections');
   				 		}  
			 }); 
			  
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
				<table align="center">
					<tr>
						<td>
							菜单名称:
						</td>
						<td>
							<input class="easyui-validatebox" id="name" name="name"
								data-options="required:true,validType:'length[3,10]',missingMessage:'输入数据不能为空!',invalidMessage:'长度在3-10字符之间!',tipPosition:'right'"></input>
						</td>
					</tr>
					<tr>
						<td>
							菜单地址:
						</td>
						<td>
							<input class="easyui-validatebox" id="address" name="address"
								data-options="required:true,validType:'length[8,25]',missingMessage:'输入数据不能为空!',invalidMessage:'长度在8-25字符之间!',tipPosition:'right'"></input>
						</td>
					</tr>
					<tr>
						<td>
							菜单图标:
						</td>
						<td>
							<select id="country" class="easyui-combobox" name="country"
								style="width: 200px;">
								<option>
									中国
								</option>
								<option>
									英国
								</option>
								<option>
									美国
								</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>
							是否启用:
						</td>
						<td>
							<input type="radio" id="sex" name="sex" value="man"
								checked="checked" />
							是
							<input type="radio" id="sex" name="sex" value="woman" />
							否
						</td>
					</tr>
					<tr>
						<td>
							兴趣:
						</td>
						<td>
							<input type="checkbox" name="basktball" value="true" />
							篮球
							<input type="checkbox" name="football" value="true" />
							足球
							<input type="checkbox" name="pingpang" value="true" />
							乒乓球
						</td>
					</tr>
					<tr>
						<td>
							菜单序号:
						</td>
						<td>
							<input class="easyui-validatebox" id="email" name="email"
								data-options="required:true,validType:'email',missingMessage:'输入数据不能为空!',invalidMessage:'请输入合法邮箱!',tipPosition:'right'"></input>
						</td>
					</tr>
				</table>
			</form>
		</div>

		<div id="updateDialog" style="display: none;">
			<form id="updatePerson" method="post">
				<table align="center">
					<tr>
						<td>
							编号:
						</td>
						<td>
							<input class="easyui-validatebox" id="code" name="code"
								readonly="readonly"
								data-options="required:true,missingMessage:'输入数据不能为空!',tipPosition:'right'"></input>
						</td>
					</tr>
					<tr>
						<td>
							姓名:
						</td>
						<td>
							<input class="easyui-validatebox" id="updatename" name="name"
								data-options="required:true,validType:'length[3,10]',missingMessage:'输入数据不能为空!',invalidMessage:'长度在3-10字符之间!',tipPosition:'right'"></input>
						</td>
					</tr>
					<tr>
						<td>
							地址:
						</td>
						<td>
							<input class="easyui-validatebox" id="updateaddress"
								name="address"
								data-options="required:true,validType:'length[8,25]',missingMessage:'输入数据不能为空!',invalidMessage:'长度在8-25字符之间!',tipPosition:'right'"></input>
						</td>
					</tr>
					<tr>
						<td>
							国籍:
						</td>
						<td>
							<select id="updatecountry" class="easyui-combobox" name="country"
								style="width: 200px;">
								<option>
									中国
								</option>
								<option>
									英国
								</option>
								<option>
									美国
								</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>
							性别:
						</td>
						<td>
							<input type="radio" id="sex1" name="updatesex" value="man"
								checked="checked" />
							男
							<input type="radio" id="sex2" name="updatesex" value="woman" />
							女
						</td>
					</tr>
					<tr>
						<td>
							兴趣:
						</td>
						<td>
							<input type="checkbox" id="updatebasktball" name="basktball"
								value="true" />
							篮球
							<input type="checkbox" id="updatefootball" name="football"
								value="true" />
							足球
							<input type="checkbox" id="updatepingpang" name="pingpang"
								value="true" />
							乒乓球
						</td>
					</tr>
					<tr>
						<td>
							邮箱:
						</td>
						<td>
							<input class="easyui-validatebox" id="updateemail" name="email"
								data-options="required:true,validType:'email',missingMessage:'输入数据不能为空!',invalidMessage:'请输入合法邮箱!',tipPosition:'right'"></input>
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
