<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String loginMsg = (String)session.getAttribute("loginMsg");
	if(loginMsg==null){
		loginMsg="";
	}
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>登录页面</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link href="css/login.css" type=text/css rel=stylesheet>
<script src="js/jquery-1.7.1.js" type="text/javascript"></script>
</head>
<script type="text/javascript">
function login(){

	if($("#username").val()==""){
		$("#loginTip").html("请输入用户名");
		return;
	}else if($("#password").val()==""){
		$("#loginTip").html("请输入密码");
		return;
	}else{
		$("#loginTip").html("");
		$("#loginForm").submit();
	}

}
</script>
<BODY id=userlogin_body>
	<DIV style="text-align: center;">
	<font style="font-family: 华文行楷" size="8" color="white" >OA 协同办公系统</font>
	<br></br>
	<br></br>
	</DIV>
	<DIV id=user_login>
		<DL>
			<DD id=user_top>
				<UL>
					<LI class=user_top_l></LI>
					<LI class=user_top_c></LI>
					<LI class=user_top_r></LI>
				</UL>
			<DD id=user_main>
				<UL>
					<LI class=user_main_l></LI>
					<LI class=user_main_c>
						<form id="loginForm" action="user!login.action" method="post">
							<DIV class=user_main_box>
								<UL>
									<LI class=user_main_text>用户名：</LI>
									<LI class=user_main_input><INPUT class=TxtUserNameCssClass
										id=username maxLength=20 name=username></LI>
								</UL>
								<UL>
									<LI class=user_main_text>密 码：</LI>
									<LI class=user_main_input><INPUT class=TxtPasswordCssClass
										id=password type=password name=password></LI>
								</UL>
								<UL>
									<li style="text-align:center;width:250px;">
									<font style="color: red;size: 12px;font-weight: bold;" id="loginTip"><%=loginMsg %></font>
									</li>
								</UL>
							</DIV>
						</form>
					</LI>
					<LI class=user_main_r><INPUT class=IbtnEnterCssClass
						style="BORDER-TOP-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-RIGHT-WIDTH: 0px"
						onclick="login()"
						type=image src="images/login/user_botton.gif" >
					</LI>
				</UL>
			<DD id=user_bottom>
				<UL >
					<LI class=user_bottom_l></LI>
					<LI class=user_bottom_c><SPAN style="MARGIN-TOP: 40px;display:none;">如果您尚未在本系统注册为用户，请先点此
							<A href="register.jsp">注册</A> 。</SPAN></LI>
					<LI class=user_bottom_r></LI>
				</UL>
			</DD>
		</DL>
	</DIV>
	
	<SPAN id=ValrUserName style="DISPLAY: none; COLOR: red"></SPAN>
	<SPAN id=ValrPassword style="DISPLAY: none; COLOR: red"></SPAN>
	<SPAN id=ValrValidateCode style="DISPLAY: none; COLOR: red"></SPAN>
	<DIV id=ValidationSummary1 style="DISPLAY: none; COLOR: red"></DIV>

	<DIV></DIV>

	</FORM>
</BODY>
</HTML>
