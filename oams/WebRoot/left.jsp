<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String role = (String)session.getAttribute("role");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<base href="<%=basePath%>"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<title>滑动菜单</title>
<link rel="stylesheet" href="css/menu.css" type="text/css" />
</style>
<script>
</script>
</head>
<body>
<div id="idSlideView3" class="sv3">
	<dl>
		<dt>
			<div class="panel-title">人员管理</div>

			<div class="panel-tool">
				<div class="panel-tool-collapse"></div>
			</div>
		</dt>
		<dd>
			<ul class="menu-wrap">
					<li>
							<a href="manage_user.jsp" style="padding-left: 20px;" target="rightFrame" >
								<img src="images/icons/asterisk_orange.png"/>用户管理
							</a>
					</li>
					<li>
							<a href="manage_teacher.jsp" style="padding-left: 20px;" target="rightFrame">
								<img src="images/icons/asterisk_orange.png"/>教师管理
							</a>
					</li>
					<li>
							<a href="manage_student.jsp" style="padding-left: 20px;" target="rightFrame">
								<img src="images/icons/asterisk_orange.png"/>学生管理
							</a>
					</li>
					
			</ul>
		</dd>
	</dl>
	
		<dl>
		<dt>
			<div class="panel-title" style="text-align:center;">数据管理</div>

			<div class="panel-tool">
				<div class="panel-tool-collapse"></div>
			</div>
		</dt>
		<dd>
			<ul class="menu-wrap">
					
					<li>
							<a href="manage_thesis.jsp" style="padding-left: 20px;" target="rightFrame">
								<img src="images/icons/asterisk_orange.png"/>论文管理
							</a>
					</li>
					
			</ul>
		</dd>
	</dl>
</div>
<script type="text/javascript">
function SlideView() {this.index.apply(this, arguments)}
SlideView.prototype = {
    index: function(el) {
        this.dls=document.getElementById(el).getElementsByTagName('dl');
		this.showI = -1;
        this.each=function (fn,$){
			for (var i = 0, j = this.dls.length; i < j; i++)fn.call($,this.dls[i],i,this);
			return $;
		};
        this.each(function (el,i,obj){
                if (i>0) {el.style.height='25px'};var dt=el.getElementsByTagName('dt')[0];
				dt.onclick=function (){
					if(obj.showI != i){
						obj.showI = i;
						obj.open(i);
					}else{
						obj.showI = -1;
						obj.close(i);
					}
				};
        },this);
    },
    open: function (p){
        var v=this.each(function (el,i){
			this.push(el.offsetHeight);
			el.className=p==i?'on':'';
		},[]);
        clearInterval(this.ooxx);
        this.ooxx=this.fx(function (f){
            this.each(function (el,i){
				var li_H = this.dls[i].getElementsByTagName('li').length * 28 + 30;
				this.dls[i].style.height=Math.round(f.apply(null,i==p?[v[i],li_H]:[v[i],25]))+'px';
			},this);
        },this)
    },
	close: function (p){
		var v=this.each(function (el,i){
			this.push(el.offsetHeight);
			el.className='';
		},[]);
		clearInterval(this.ooxx);
        this.ooxx=this.fx(function (f){
            this.each(function (el,i){
				this.dls[i].style.height=Math.round(f.apply(null,i==p?[v[i],25]:[v[i],25]))+'px';
			},this);
        },this)
	},
    fx:function (fn,b) {
        var D = Date, d = +new D, $,  z, q=function (f, t) {return + f + (t - f) * Math.pow(z, .6) }
        return $ = setInterval(function() {
            z = Math.min(1, (new D - d) / 320);
            if (false === fn.call(b, q, z) || z == 1)clearInterval($);
        }, 10);
    }
}
new SlideView( "idSlideView3");
/*+-----------------------------------------------
  |   当前选择的项目 
  +-----------------------------------------------+*/

function showSelect() {this.showItem.apply(this,arguments);}
showSelect.prototype = {
	showItem:function (elet){
		this.argu_a = document.getElementById(elet).getElementsByTagName("a");
		this.each = function(fn,objct){
			for (var i = 0; i < this.argu_a.length; i++){
				fn.call(objct,this.argu_a[i],this,i);	
			}
			return objct;
		};
		this.aLinks = this.each(function(eleta){
			this.push(eleta.getAttribute('href'));
			eleta.href = "javascript:void(0)";
		},[]);
		this.each(function (elet1,elet3,ii){
			elet1.onclick = function(){
				
				var url=elet3.aLinks[ii];
				
				var BrowserVer = {};
				var ua = navigator.userAgent.toLowerCase();
				if (window.ActiveXObject)
				{
					BrowserVer.ie = ua.match(/msie ([\d.]+)/)[1];
					var i=url.indexOf("http://");
				}
				parent.rightFrame.location = url;
				elet3.moveC();this.className = "selected";this.blur();return false;
			};
		},[]);
	},
	moveC: function(){
		this.each(function (elet2){
			elet2.className = "";
		},this);
	}
}
new showSelect("idSlideView3");
</script>
</body>
</html>