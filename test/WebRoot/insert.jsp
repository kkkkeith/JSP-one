<%@ page contentType="text/html;charset=GB2312" %>
<%@ page import="java.sql.*" %> 
<html>
<head>
<title>添加商品</title>
</head>
<body><center>
<form action="insertServlet?dataBase=good&tableName=goods"method=post>
添加新记录：
<table border = 1>
<tr><td> 商品名称：</td><td><input type="text" name="Gname"></td></tr>
<tr><td>商品进货日期：</td><td><input type="text" name="Gdate"></td></tr>
<tr><td>商品进价：</td><td><input type="text" name="Gbid"></td></tr>
<tr><td>商品售价：</td><td><input type="text" name="Gprice"></td></tr>
<tr><td>商品剩余量：</td><td><input type="text" name="Gstorage"></td></tr>
<tr><td>商品销售量：</td><td><input type="text" name="Gsell"></td></tr>
</table>
<br/><input class="button" type = "submit" name="insert" value="添加">

</form>
</center>
</body></html>