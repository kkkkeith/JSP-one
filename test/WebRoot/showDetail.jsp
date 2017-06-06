<%@ page contentType="text/html;charset=GB2312" %>
<%@ page import="mybean.data.Login" %>
<%@ page import="java.sql.*" %>
<jsp:useBean id="loginBean" class="mybean.data.Login" scope="session"/>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css.css"/></head>
<body background=image/back.jpg><center>
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
<% if(loginBean==null){
        response.sendRedirect("login.jsp");//重定向到登录页面
   }
   else {
       boolean b =loginBean.getLogname()==null||
                  loginBean.getLogname().length()==0;
       if(b)
         response.sendRedirect("login.jsp");//重定向到登录页面
   }
	String Gname = request.getParameter("xijie"); 
	byte b[] = Gname.getBytes("ISO-8859-1");//汉字处理
	Gname = new String(b);
	out.print("<th>商品名称:"+Gname);
	if(Gname==null) {
	    out.print("没有商品名称，无法查看细节");
	    return;
	} 
   Connection con;
   Statement sql; 
   ResultSet rs;
   try {  Class.forName("com.mysql.jdbc.Driver");
   }
   catch(Exception e){} 
   String uri="jdbc:mysql://127.0.0.1/good";
   try{ 
     con=DriverManager.getConnection(uri,"root","123456");
     sql=con.createStatement();
     String cdn=
     "SELECT * FROM goods where Gname = '"+Gname+"'";
     rs=sql.executeQuery(cdn);
     out.print("<table border=2>");
     out.print("<tr>");
     out.print("<th>商品名称");
     out.print("<th>商品进货日期");
     out.print("<th>商品进价");
     out.print("<th>商品售价");
     out.print("<th> 商品剩余量");
     out.print("<th> 商品销售量");
     out.print("</tr>");
     String detailMess="";
     while(rs.next()){
    	  String name=rs.getString(1);
          String date=rs.getString(2);
          String bid=rs.getString(3);
          String price=rs.getString(4);
          String sell=rs.getString(5);
          String storage=rs.getString(6);
          String goods =
               "("+name+","+date+","+bid+","+price+","+sell+","+storage+")";
       out.print("<tr>");
       out.print("<td>"+name+"</td>");
       out.print("<td>"+date+"</td>");
       out.print("<td>"+bid+"</td>");
       out.print("<td>"+price+"</td>");
       out.print("<td>"+sell+"</td>");
       out.print("<td>"+storage+"</td>");
       out.print("</tr>");
     } 
     out.print("</table>");
     con.close();
  }
  catch(SQLException exp){}
%>
</center></body></html>
