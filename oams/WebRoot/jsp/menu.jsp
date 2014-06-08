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
		<title>�˵�����</title>
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
    				prompt:'����������'  
			});  
			
			// ���ɱ��
			$('#table').datagrid({
				// ���ı���
				title:'�˵�����',
				// ������ǰ���ͼ��
				iconCls:'icon-save',
				// ���
				width:($(window).width()*0.97),
				// �߶�
				height:($(window).height()*0.96),
				// �����Ƿ��������
				collapsible:true,
				// �������ݵ�url
				url:'menu!list.action',
				// ����Ӱ����Ŀǰ��û��Ч��
				striped:true,
				// ������
				sortName: 'orderNO',
				// �����Զ���С
				fit:false,
				// �������
				sortOrder: 'desc',
				// �������򣬲����ڷ���������
				remoteSort: false,
				// �����ʵ��column��ֻ࣬�����Ƿ��ڱ������
				frozenColumns:[[
	                {field:'ck',checkbox:true}
				]],
				// ����
				columns:[[
					{title:'id',field:'id',width:150,align:'center',hidden:true},
					{title:'�˵�����',field:'name',width:150,align:'center',fit:true},
					{title:'�˵���ַ',field:'address',width:150,align:'center'},
					{title:'�˵�ͼ��',field:'icon',width:150,align:'center'},
					{title:'�˵����',field:'orderNO',width:150,align:'center'}
				]],
				// ��ѡ��ҳ��������
				pageList : [5,10,20],  
				// ÿҳ��ʾ��������       
				pageSize : 5,
				// ��ҳ
				pagination:true,
				// ������Ƿ���ʾ�к�
				rownumbers:true,
				// ������
				toolbar:[{
					id:'add',
					// ����������ʾ������
					text:'���',
					// ͼ��
					iconCls:'icon-add',
					// ����ͼ��ʱ��ʾ���¼�
					handler:function(){
						addMenu();
					}
				},{
					id:'update',
					text:'�޸�',
					iconCls:'icon-edit',
					handler:function(){
						var rows=$('#table').datagrid('getSelections');
						if(rows.length!=1)
						{
							$.messager.alert('��ʾ','��ѡ��һ����Ҫ�޸ĵļ�¼'); 
						}else
						{
							updatePerson();
						}
					}
				},'-',{
					id:'delete',
					text:'ɾ��',
					disabled:false,
					iconCls:'icon-remove',
					handler:function(){
						var rows=$('#table').datagrid('getSelections');
						var deleteVar="";
						if(rows.length==0)
						{
							$.messager.alert('��ʾ','ѡ��Ҫɾ���ļ�¼');  
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
       				text:'ȫ������',
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
			
			// ��ʾ��ҳ��Ϣ�ĵײ���ʾ��
			var p = $('#table').datagrid('getPager');
			   
  			$(p).pagination({
  				// ÿҳ��ʾ��������¼
				pageSize: 5,
       			// ��ʾ��ҳ��Ϣ������   
        		beforePageText: '��',
        		afterPageText: 'ҳ    �� {pages} ҳ',  
        		displayMsg: '��ǰ��ʾ {from} - {to} ����¼   �� {total} ����¼'
    		}); 
    		
    		$(".datagrid-toolbar").append($("#testa")); 
    		
    		function addMenu(){
    			// ��Ĭ�Ͽ������Ĳ���ʾ����   
    		  	$('#dialog').show();
    		  	// ��������
                $('#dialog').dialog({
                	// ����
                	title:'�˵���Ӵ���',
                	// �Ƿ��ǿ��۵���
                	collapsible: true, 
                	// �Ƿ����С������
					minimizable: false, 
					// �Ƿ����󻯴���
					maximizable: true,
					// ��� 
					width: 500, 
					// �߶�
					height: 300,
					// ģʽ����
					modal:true,
					// �����µİ�ť
					buttons:[{
						text:'����',
						iconCls:'icon-ok',
						handler:function(){
							$('#addMenu').submit();
						}
					},{
						text:'ȡ��',
						iconCls:'icon-cancel',
						handler:function(){
							$('#dialog').dialog('close');
						}
					}]
				});   
              } 
              
              // ���ύ
              $('#addMenu').form({  
              			// ���ύ��·��
    					url:"menu!add.action",  
    					// ���ύǰ
    					onSubmit: function(){
    						  // �ж����е���֤�ǲ���ͨ����
    						  var isValid = $(this).form('validate');
							  return isValid;
    					},  
    					// ������ɹ��Ժ�
    					success:function(data){  
    						  $('#dialog').dialog('close');
        					  $('#table').datagrid('load');
        					  $('#addMenu').form("clear");
   				 		}  
			 }); 
			 
			 
			 
			 
			 function updatePerson(){
    			// ��Ĭ�Ͽ������Ĳ���ʾ����   
    		  	$('#updateDialog').show();
    		  	// ��������
                $('#updateDialog').dialog({
                	// ����
                	title:'��Ա�޸Ĵ���',
                	// �Ƿ��ǿ��۵���
                	collapsible: true, 
                	// �Ƿ����С������
					minimizable: false, 
					// �Ƿ����󻯴���
					maximizable: true,
					// ��� 
					width: 500, 
					// �߶�
					height: 300,
					// ģʽ����
					modal:true,
					// �����µİ�ť
					buttons:[{
						text:'����',
						iconCls:'icon-ok',
						handler:function(){
							$('#updatePerson').submit();
						}
					},{
						text:'ȡ��',
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
			 
			  // ���ύ
              $('#updatePerson').form({  
              			// ���ύ��·��
    					url:"updatePersonServlet",  
    					// ���ύǰ
    					onSubmit: function(){
    						  // �ж����е���֤�ǲ���ͨ����
    						  var isValid = $(this).form('validate');
							  return isValid;
    					},  
    					// ������ɹ��Ժ�
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
							�˵�����:
						</td>
						<td>
							<input class="easyui-validatebox" id="name" name="name"
								data-options="required:true,validType:'length[3,10]',missingMessage:'�������ݲ���Ϊ��!',invalidMessage:'������3-10�ַ�֮��!',tipPosition:'right'"></input>
						</td>
					</tr>
					<tr>
						<td>
							�˵���ַ:
						</td>
						<td>
							<input class="easyui-validatebox" id="address" name="address"
								data-options="required:true,validType:'length[8,25]',missingMessage:'�������ݲ���Ϊ��!',invalidMessage:'������8-25�ַ�֮��!',tipPosition:'right'"></input>
						</td>
					</tr>
					<tr>
						<td>
							�˵�ͼ��:
						</td>
						<td>
							<select id="country" class="easyui-combobox" name="country"
								style="width: 200px;">
								<option>
									�й�
								</option>
								<option>
									Ӣ��
								</option>
								<option>
									����
								</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>
							�Ƿ�����:
						</td>
						<td>
							<input type="radio" id="sex" name="sex" value="man"
								checked="checked" />
							��
							<input type="radio" id="sex" name="sex" value="woman" />
							��
						</td>
					</tr>
					<tr>
						<td>
							��Ȥ:
						</td>
						<td>
							<input type="checkbox" name="basktball" value="true" />
							����
							<input type="checkbox" name="football" value="true" />
							����
							<input type="checkbox" name="pingpang" value="true" />
							ƹ����
						</td>
					</tr>
					<tr>
						<td>
							�˵����:
						</td>
						<td>
							<input class="easyui-validatebox" id="email" name="email"
								data-options="required:true,validType:'email',missingMessage:'�������ݲ���Ϊ��!',invalidMessage:'������Ϸ�����!',tipPosition:'right'"></input>
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
							���:
						</td>
						<td>
							<input class="easyui-validatebox" id="code" name="code"
								readonly="readonly"
								data-options="required:true,missingMessage:'�������ݲ���Ϊ��!',tipPosition:'right'"></input>
						</td>
					</tr>
					<tr>
						<td>
							����:
						</td>
						<td>
							<input class="easyui-validatebox" id="updatename" name="name"
								data-options="required:true,validType:'length[3,10]',missingMessage:'�������ݲ���Ϊ��!',invalidMessage:'������3-10�ַ�֮��!',tipPosition:'right'"></input>
						</td>
					</tr>
					<tr>
						<td>
							��ַ:
						</td>
						<td>
							<input class="easyui-validatebox" id="updateaddress"
								name="address"
								data-options="required:true,validType:'length[8,25]',missingMessage:'�������ݲ���Ϊ��!',invalidMessage:'������8-25�ַ�֮��!',tipPosition:'right'"></input>
						</td>
					</tr>
					<tr>
						<td>
							����:
						</td>
						<td>
							<select id="updatecountry" class="easyui-combobox" name="country"
								style="width: 200px;">
								<option>
									�й�
								</option>
								<option>
									Ӣ��
								</option>
								<option>
									����
								</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>
							�Ա�:
						</td>
						<td>
							<input type="radio" id="sex1" name="updatesex" value="man"
								checked="checked" />
							��
							<input type="radio" id="sex2" name="updatesex" value="woman" />
							Ů
						</td>
					</tr>
					<tr>
						<td>
							��Ȥ:
						</td>
						<td>
							<input type="checkbox" id="updatebasktball" name="basktball"
								value="true" />
							����
							<input type="checkbox" id="updatefootball" name="football"
								value="true" />
							����
							<input type="checkbox" id="updatepingpang" name="pingpang"
								value="true" />
							ƹ����
						</td>
					</tr>
					<tr>
						<td>
							����:
						</td>
						<td>
							<input class="easyui-validatebox" id="updateemail" name="email"
								data-options="required:true,validType:'email',missingMessage:'�������ݲ���Ϊ��!',invalidMessage:'������Ϸ�����!',tipPosition:'right'"></input>
						</td>
					</tr>
				</table>
			</form>
		</div>

		<div id="testa" align="right" style="margin-top: 3px;">
			<input id="message"></input>
			<div id="option" style="width: 120px">
				<div data-options="name:'name'">
					���˵�����ѯ
				</div>
				<div data-options="name:'address'">
					���˵���ַ��ѯ
				</div>
			</div>
		</div>

	</body>
</html>
