<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript" charset="utf-8">
function changeClock()  
{  
    var d = new Date();  
	 var year = d.getFullYear();
	 var month = d.getMonth() + 1;
	 var day = d.getDate();
	 var hour = d.getHours();
	 var minute = d.getMinutes();
	 var second = d.getSeconds();
	 if(month<10){
		 month = "0"+month;
	 }
	 if(day<10){
		 day = "0"+day;
	 }
	 if(hour<10){
		 hour = "0"+hour;
	 }
	 if(minute<10){
		 minute = "0"+minute;
	 }
	 if(second<10){
		 second = "0"+second;
	 }
    document.getElementById("clock").innerHTML = year + "-" + month + "-" + day + " " + hour + ":" + minute + ":" + second;  

}  
window.setInterval(changeClock, 1000);  

<%--
	function logout(b) {
		$('#sessionInfoDiv').html('');
		$.post('${pageContext.request.contextPath}/user!doNotNeedSession_logout.do', function() {
			if (b) {
				if (dj.isLessThanIe8()) {
					loginDialog.dialog('open');
				} else {
					location.replace('${pageContext.request.contextPath}/');
				}
			} else {
				loginDialog.dialog('open');
			}
		});
	}
	function showUserInfo() {
		var p = parent.dj.dialog({
			title : '用户信息',
			href : '${pageContext.request.contextPath}/user!doNotNeedAuth_userInfo.do',
			width : 490,
			height : 285,
			buttons : [ {
				text : '修改密码',
				handler : function() {
					var f = p.find('form');
					f.form('submit', {
						url : '${pageContext.request.contextPath}/user!doNotNeedAuth_editUserInfo.do',
						success : function(d) {
							var json = $.parseJSON(d);
							if (json.success) {
								p.dialog('close');
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
				var authIds = p.find('ul');
				var authIdsTree = authIds.tree({
					url : '${pageContext.request.contextPath}/auth!doNotNeedSession_treeRecursive.do',
					lines : true,
					checkbox : true,
					onLoadSuccess : function(node, data) {
						var f = p.find('form');
						var ids = f.find('input[name=authIds]').val();
						var idList = dj.getList(ids);
						if (idList.length > 0) {
							for ( var i = 0; i < idList.length; i++) {
								var n = authIdsTree.tree('find', idList[i]);
								authIdsTree.tree('check', n.target);
							}
						}
						authIdsTree.unbind();
					}
				});
			}
		});
	}
--%></script>
<style type="text/css">   
    .linear{   
        width:100%;   
        height:50px;   
        background: url(images/logo-bg.png);
        overflow: hidden;
        border:0;
        line-height: 20px;
    }   
</style> 
<div id="sessionInfoDiv" class="linear">
	<div style="margin-top:12px;margin-left:20px;font-family: 华文行楷;font-size: 25px; color: white"><b>OA 协同办公系统<b></b></div>
	<span style="position: absolute; right: 5px; bottom: 0px; ">
		<strong id="clock" style="color: #4F4F4F;"></strong>
		<a href="javascript:void(0);" class="easyui-menubutton" data-options="menu:'#layout_north_pfMenu',iconCls:'icon-panel'">
			<strong style="color: #4F4F4F;">更换皮肤</strong>
		</a>
		<a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-user'" onclick="showUserInfo();">
			<strong style="color: #4F4F4F;">个人信息</strong>
		</a>
		<a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-back'" onclick="$.messager.confirm('注销','您确定要退出么?',function(r){logout(true);});">
			<strong style="color: #4F4F4F;">注销</strong>
		</a>
	</span>
</div>
<div id="layout_north_pfMenu" style="width: 120px; display: none;">
	<div onclick="globalVar.changeTheme('default');">默认</div>
	<div onclick="globalVar.changeTheme('gray');">灰色</div>
	<div onclick="globalVar.changeTheme('metro');">白色</div>
	<div onclick="globalVar.changeTheme('cupertino');">浅蓝</div>
	<div onclick="globalVar.changeTheme('dark-hive');">黑色</div>
	<div onclick="globalVar.changeTheme('pepper-grinder');">银白</div>
	<div onclick="globalVar.changeTheme('sunny');">阳光</div>
</div>

