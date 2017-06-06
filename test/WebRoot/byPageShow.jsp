<%@ page contentType="text/html;charset=GB2312" %>
<%@ page import="mybean.data.DataByPage" %>
<%@ page import="com.sun.rowset.*" %>
<jsp:useBean id="dataBean" class="mybean.data.DataByPage" scope="session"/>
<html>
    <head><link rel="stylesheet" type="text/css" href="css.css"/></head>
    <body background=image/back.jpg>
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
<center>
<br>当前显示的内容是：
  <table border=2>
  <tr>
    <th>商品名称</th>
    <th>商品进货日期</th>
    <th>商品进价</th>
    <th>商品售价</th>
    <th>商品剩余量</th>
    <th>商品销售量</th>
  </tr>
<jsp:setProperty name="dataBean" property="pageSize" param="pageSize"/>
<jsp:setProperty name="dataBean" property="currentPage" param="currentPage"/>
<%    
      CachedRowSetImpl rowSet=dataBean.getRowSet();
      if(rowSet==null) {
         out.print("没有任何查询信息，无法浏览");
         return;  
      }
      rowSet.last(); 
      int totalRecord=rowSet.getRow();
      out.println("全部记录数"+totalRecord); //全部记录数
      int pageSize=dataBean.getPageSize();  //每页显示的记录数
      int totalPages = dataBean.getTotalPages();
      if(totalRecord%pageSize==0)
           totalPages = totalRecord/pageSize;//总页数
      else
           totalPages = totalRecord/pageSize+1;
      dataBean.setPageSize(pageSize);
      dataBean.setTotalPages(totalPages);
      if(totalPages>=1) {
         if(dataBean.getCurrentPage()<1)
              dataBean.setCurrentPage(dataBean.getTotalPages());
         if(dataBean.getCurrentPage()>dataBean.getTotalPages())
              dataBean.setCurrentPage(1);
         int index=(dataBean.getCurrentPage()-1)*pageSize+1;
         rowSet.absolute(index);  //查询位置移动到currentPage页起始位置
         boolean boo=true;
         for(int i=1;i<=pageSize&&boo;i++) { 
            
            String Gname=rowSet.getString(1);
            String Gdate=rowSet.getString(2);
            String Gbid=rowSet.getString(3);
            String Gprice=rowSet.getString(4);
            String Gsell=rowSet.getString(5);
            String Gstorage=rowSet.getString(6);
            String goods =
            "("+Gname+","+Gdate+","+Gbid+","+Gprice+","+Gsell+","+Gstorage+")";
            goods = goods.replaceAll("\\p{Blank}","");
            String detail="<form  action='showDetail.jsp' method = 'post'>"+
                     "<input type ='hidden' name='xijie' value= "+Gname+">"+
                     "<input  type ='submit'  value='查看细节' ></form>";
            out.print("<tr>");
            out.print("<td>"+Gname+"</td>");
            out.print("<td>"+Gdate+"</td>");
            out.print("<td>"+Gbid+"</td>");
            out.print("<td>"+Gprice+"</td>");
            out.print("<td>"+Gsell+"</td>");
            out.print("<td>"+Gstorage+"</td>");
            out.print("<td>"+detail+"</td>");
            out.print("</tr>");
            boo=rowSet.next();
         }
     }
%>
 </table>
 <br>每页最多显示<jsp:getProperty name="dataBean" property="pageSize"/>条信息
 <br>当前显示第<Font color=blue>
     <jsp:getProperty name="dataBean" property="currentPage"/>
   </Font>页,共有
   <Font color=blue><jsp:getProperty name="dataBean" property="totalPages"/>
   </Font>页。
<table>
  <tr><td><form action="" method=post>
          <input type=hidden name="currentPage" value=
         "<%=dataBean.getCurrentPage()-1 %>">
           <input class="button-d" type=submit name="g" value="上一页"></form></td>
      <td><form action="" method=post>
          <input type=hidden name="currentPage"
           value="<%=dataBean.getCurrentPage()+1 %>">
          <input class="button-d" type=submit name="g" value="下一页"></form></td></tr>
 <tr><td> <form action="" method=post>
          每页显示<input type=text name="pageSize" value =1 size=3>
          条记录<input class="button" type=submit name="g" value="确定"></form></td>
      <td> <form action="" method=post>
           输入页码：<input type=text name="currentPage" size=2 >
           <input class="button" type=submit name="g" value="提交"></form></td></tr>
</table>
</center>
</body></html>
