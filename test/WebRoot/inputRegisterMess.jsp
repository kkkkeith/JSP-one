<%@ page contentType="text/html;charset=GB2312" %>
<jsp:useBean id="userBean" class="mybean.data.Register" scope="request"/>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css.css"/>
<title>注册页面</title>
</head>
<body background=image/back.jpg><Font size=4>
 <div id="nav">  
    <ul id="login">
		<li><a href="inputRegisterMess.jsp">注册</a></li>
		<li><a href="login.jsp">登录</a></li>
		<li><a href="#">功能</a>
		    <ul id="function">
		    	<li><a href="searchGood.jsp">查询</a></li>
		    	<li><a href="insert.jsp">添加</a></li>
		    	<li><a href="update.jsp">修改</a></li>
		    	<li><a href="delete.jsp">删除</a></li>
		    </ul>
		</li>
		<li><a href="exitServlet">退出</a></li>
	</ul>
</div>
<div align="center">
<form action="registerServlet" method="post" name=form>
<ul class="register">
    <li>*用户名称:<input type=text name="logname" ></li>
    <li>*用户密码:<input type=password name="password"></li>
    <li>*重复密码:<input type=password name="again_password"></li>
    <li>&nbsp联系电话:<input type=text name="phone"></li>
    <li>&nbsp邮寄地址:<input type=text name="address"></li>
    <li>&nbsp真实姓名:<input type=text name="realname"></li>
    <li>带*为必填项目&nbsp&nbsp<input class="button" type=submit name="g" value="提交"></li> 
</ul>
</form>
</div >
<div align="center">
<p> 注册反馈：
<jsp:getProperty name="userBean"  property="backNews" /> 
<table border=3>
     <tr><td>用户名称:</td>
     <td><jsp:getProperty name="userBean" property="logname"/></td>
     </tr>
     <tr><td>真实姓名:</td>
     <td><jsp:getProperty name="userBean" property="realname"/></td>
     </tr>
     <tr><td>邮寄地址:</td>
     <td><jsp:getProperty name="userBean" property="address"/></td>
     </tr>
     <tr><td>联系电话:</td>
     <td><jsp:getProperty name="userBean" property="phone"/></td>
     </tr>
</table></div >
</body></html>

