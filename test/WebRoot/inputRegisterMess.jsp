<%@ page contentType="text/html;charset=GB2312" %>
<jsp:useBean id="userBean" class="mybean.data.Register" scope="request"/>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css.css"/>
<title>ע��ҳ��</title>
</head>
<body background=image/back.jpg><Font size=4>
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
<form action="registerServlet" method="post" name=form>
<ul class="register">
    <li>*�û�����:<input type=text name="logname" ></li>
    <li>*�û�����:<input type=password name="password"></li>
    <li>*�ظ�����:<input type=password name="again_password"></li>
    <li>&nbsp��ϵ�绰:<input type=text name="phone"></li>
    <li>&nbsp�ʼĵ�ַ:<input type=text name="address"></li>
    <li>&nbsp��ʵ����:<input type=text name="realname"></li>
    <li>��*Ϊ������Ŀ&nbsp&nbsp<input class="button" type=submit name="g" value="�ύ"></li> 
</ul>
</form>
</div >
<div align="center">
<p> ע�ᷴ����
<jsp:getProperty name="userBean"  property="backNews" /> 
<table border=3>
     <tr><td>�û�����:</td>
     <td><jsp:getProperty name="userBean" property="logname"/></td>
     </tr>
     <tr><td>��ʵ����:</td>
     <td><jsp:getProperty name="userBean" property="realname"/></td>
     </tr>
     <tr><td>�ʼĵ�ַ:</td>
     <td><jsp:getProperty name="userBean" property="address"/></td>
     </tr>
     <tr><td>��ϵ�绰:</td>
     <td><jsp:getProperty name="userBean" property="phone"/></td>
     </tr>
</table></div >
</body></html>

