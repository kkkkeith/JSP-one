<%@ page contentType="text/html;charset=GB2312" %>
<HTML><HEAD>
<title>查询商品</title>
<link rel="stylesheet" type="text/css" href="css.css"/>
</HEAD>
<BODY background=image/back.jpg><font size=4>
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
<br>查询时可以输入商品名称及价格。<br>
<br>输入价格的数值在0至10之间<br>
例如 2-8 
<FORM action="searchByConditionServlet" Method="post" >
   <br>输入查询信息:<Input type=text name="searchMess"><br>
   <Input type =radio name="radio" value="Gname" checked="ok">商品名称
   <Input type =radio name="radio" value="Gprice">商品价格
   <br><Input class="button" type=submit name="g" value="提交">
</Form>
</div>
</Font></BODY></HTML>
