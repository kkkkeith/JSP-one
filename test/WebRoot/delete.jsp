<%@ page contentType="text/html;charset=GB2312" %>
<%@ page import="java.sql.*" %> 
<html>
<head>
<title>删除商品</title>
</head>
<body>
 <div class="del">
<form action="deleteServlet?dataBase=good&tableName=goods"method=post>
<p>请输入商品名称删除记录：</p>商品名称：<input type="text" name="Gname">
<input class="button" type = "submit" name="delete" value="删除"></div>
</form>
</body></html>