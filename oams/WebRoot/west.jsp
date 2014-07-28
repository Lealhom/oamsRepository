<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
*{margin:0;padding:0;border:0;}


#nav  li{
 float: left; width: 140px; margin-top: 5px;
}
#nav  a{
 display: block;width: 135px;text-align:left;padding-left:2px;
}
#nav  a:link  {
 	text-decoration:none;
}
#nav  a:visited  {
 	text-decoration:none;
}
#nav a:hover  {
 text-decoration:none;font-weight:normal;

}
#nav {
 left: auto;
}
</style>
<script type="text/javascript" charset="utf-8">
	
</script>
<div class="easyui-accordion" data-options="fit:true,border:false">
	<div title="系统管理" data-options="iconCls:'icon-ok'">
				<ul id="nav">
						<li><a class="easyui-linkbutton" data-options="iconCls:'icon-ok'" plain="true" href="javascript:void(0);"  onclick="addTab('菜单管理','/jsp/menu.jsp','icon-ok')">菜单管理</a></li>
						<li><a class="easyui-linkbutton" data-options="iconCls:'icon-ok'" plain="true" href="javascript:void(0);"  onclick="addTab('菜单管理1','/jsp/menu1.jsp','icon-ok')">菜单管理1</a></li>
						<li><a class="easyui-linkbutton" data-options="iconCls:'icon-ok'" plain="true" href="javascript:void(0);"  onclick="addTab('用户管理2','/jsp/user.jsp','icon-ok')">用户管理2</a></li>
				</ul>
			</div>
			<div title="办公管理" data-options="iconCls:'icon-ok'">
				<ul id="nav">
						<li><a class="easyui-linkbutton" data-options="iconCls:'icon-ok'" plain="true" href="javascript:void(0);"  onclick="addTab('用户管理3','','icon-ok')">用户管理3</a></li>
						<li><a class="easyui-linkbutton" data-options="iconCls:'icon-ok'" plain="true" href="javascript:void(0);"  onclick="addTab('用户管理4','','icon-ok')">用户管理4</a></li>
				</ul>
			</div>
			<div title="日志管理" data-options="iconCls:'icon-ok'">
				<ul id="nav">
						<li><a class="easyui-linkbutton" data-options="iconCls:'icon-ok'" plain="true" href="javascript:void(0);"  onclick="addTab('用户管理5','','icon-ok')">用户管理5</a></li>
						<li><a class="easyui-linkbutton" data-options="iconCls:'icon-ok'" plain="true" href="javascript:void(0);"  onclick="addTab('用户管理6','','icon-ok')">用户管理6</a></li>
				</ul>
			</div>
</div>