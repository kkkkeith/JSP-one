<%@ page contentType="text/html;charset=GB2312" %>
<%@ page import="java.sql.*" %> 
<jsp:useBean id="loginBean" class="mybean.data.Login" scope="session"/>
<html>
<head>
<title>登陆</title>
<link rel="stylesheet" type="text/css" href="css.css"/>
</head>
<body background=image/back.jpg><font size=4>
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
<form action="loginServlet" Method="post">
<ul class="register">
    <li>登录名称:<input type=text name="logname"></li>
    <li> 输入密码:<input type=password name="password"></li>
</ul>
<input class="button" type=submit name="g" value="提交">
</form>
</div >
<div align="center" >
<br>登录反馈信息:<jsp:getProperty name="loginBean" property="backNews"/>
<br>登录名称:<jsp:getProperty name="loginBean" property="logname"/>
</div>
</font>
</body></html>
