<%@ page contentType="text/html;charset=GB2312" %>
<%@ page import="java.sql.*" %> 
<html>
<head>
<title>������Ʒ</title>
</head>
<body><center>
<form action="updateServlet?dataBase=good&tableName=goods"method=post>
�޸ļ�¼��
<table border = 1>
<tr><td> ��Ʒ���ƣ�</td><td><input type="text" name="Gname"></td></tr>
<tr><td>��Ʒ�������ڣ�</td><td><input type="text" name="Gdate"></td></tr>
<tr><td>��Ʒ���ۣ�</td><td><input type="text" name="Gbid"></td></tr>
<tr><td>��Ʒ�ۼۣ�</td><td><input type="text" name="Gprice"></td></tr>
<tr><td>��Ʒʣ������</td><td><input type="text" name="Gstorage"></td></tr>
<tr><td>��Ʒ��������</td><td><input type="text" name="Gsell"></td></tr>
</table>
<br/><input class="button" type = "submit" name="update" value="�޸�">
</form>
</center>
</body></html>