<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="included.jsp"  %>
<!DOCTYPE html>
<html>
<head>
<title>首页</title>
</head>
<body class="easyui-layout">
	<div data-options="region:'north',href:'${pageContext.request.contextPath}/north.jsp'" style="height: 50px;overflow: hidden;" ></div>
	<div data-options="region:'west',title:'功能导航',split:true,href:'${pageContext.request.contextPath}/west.jsp'" style="width: 150px;overflow: hidden;"></div>
    <div data-options="region:'east',title:'日历',split:true,href:'${pageContext.request.contextPath}/east.jsp'" style="width: 200px;overflow: hidden;"></div>
	<div data-options="region:'center',title:'欢迎使用OA协同办公系统',href:'${pageContext.request.contextPath}/center.jsp'" style="overflow: hidden;"></div>
	<div data-options="region:'south',href:'${pageContext.request.contextPath}/south.jsp'" style="height: 20px;overflow: hidden;"></div>
</body>
</html>