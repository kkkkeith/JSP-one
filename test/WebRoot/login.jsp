<%@ page contentType="text/html;charset=GB2312" %>
<%@ page import="java.sql.*" %> 
<jsp:useBean id="loginBean" class="mybean.data.Login" scope="session"/>
<html>
<head>
<title>��½</title>
<link rel="stylesheet" type="text/css" href="css.css"/>
</head>
<body background=image/back.jpg><font size=4>
 <div id="nav">  
    <ul id="login">
		<li><a href="inputRegisterMess.jsp">ע��</a></li>
		<li><a href="login.jsp">��¼</a></li>
		<li><a href="#">����</a>
		    <ul id="function">
		    	<li><a href="searchGood.jsp">��ѯ</a></li>
		        <li><a href="insert.jsp">���</a></li>
		        <li><a href="update.jsp">�޸�</a></li>
		        <li><a href="delete.jsp">ɾ��</a></li>
		    </ul>
		</li>
		<li><a href="exitServlet">�˳�</a></li>
	</ul>
</div>
<div align="center">
<form action="loginServlet" Method="post">
<ul class="register">
    <li>��¼����:<input type=text name="logname"></li>
    <li> ��������:<input type=password name="password"></li>
</ul>
<input class="button" type=submit name="g" value="�ύ">
</form>
</div >
<div align="center" >
<br>��¼������Ϣ:<jsp:getProperty name="loginBean" property="backNews"/>
<br>��¼����:<jsp:getProperty name="loginBean" property="logname"/>
</div>
</font>
</body></html>
