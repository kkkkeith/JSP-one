<%@ page contentType="text/html;charset=GB2312" %>
<%@ page import="mybean.data.DataByPage" %>
<%@ page import="com.sun.rowset.*" %>
<jsp:useBean id="dataBean" class="mybean.data.DataByPage" scope="session"/>
<html>
    <head><link rel="stylesheet" type="text/css" href="css.css"/></head>
    <body background=image/back.jpg>
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
<center>
<br>��ǰ��ʾ�������ǣ�
  <table border=2>
  <tr>
    <th>��Ʒ����</th>
    <th>��Ʒ��������</th>
    <th>��Ʒ����</th>
    <th>��Ʒ�ۼ�</th>
    <th>��Ʒʣ����</th>
    <th>��Ʒ������</th>
  </tr>
<jsp:setProperty name="dataBean" property="pageSize" param="pageSize"/>
<jsp:setProperty name="dataBean" property="currentPage" param="currentPage"/>
<%    
      CachedRowSetImpl rowSet=dataBean.getRowSet();
      if(rowSet==null) {
         out.print("û���κβ�ѯ��Ϣ���޷����");
         return;  
      }
      rowSet.last(); 
      int totalRecord=rowSet.getRow();
      out.println("ȫ����¼��"+totalRecord); //ȫ����¼��
      int pageSize=dataBean.getPageSize();  //ÿҳ��ʾ�ļ�¼��
      int totalPages = dataBean.getTotalPages();
      if(totalRecord%pageSize==0)
           totalPages = totalRecord/pageSize;//��ҳ��
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
         rowSet.absolute(index);  //��ѯλ���ƶ���currentPageҳ��ʼλ��
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
                     "<input  type ='submit'  value='�鿴ϸ��' ></form>";
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
 <br>ÿҳ�����ʾ<jsp:getProperty name="dataBean" property="pageSize"/>����Ϣ
 <br>��ǰ��ʾ��<Font color=blue>
     <jsp:getProperty name="dataBean" property="currentPage"/>
   </Font>ҳ,����
   <Font color=blue><jsp:getProperty name="dataBean" property="totalPages"/>
   </Font>ҳ��
<table>
  <tr><td><form action="" method=post>
          <input type=hidden name="currentPage" value=
         "<%=dataBean.getCurrentPage()-1 %>">
           <input class="button-d" type=submit name="g" value="��һҳ"></form></td>
      <td><form action="" method=post>
          <input type=hidden name="currentPage"
           value="<%=dataBean.getCurrentPage()+1 %>">
          <input class="button-d" type=submit name="g" value="��һҳ"></form></td></tr>
 <tr><td> <form action="" method=post>
          ÿҳ��ʾ<input type=text name="pageSize" value =1 size=3>
          ����¼<input class="button" type=submit name="g" value="ȷ��"></form></td>
      <td> <form action="" method=post>
           ����ҳ�룺<input type=text name="currentPage" size=2 >
           <input class="button" type=submit name="g" value="�ύ"></form></td></tr>
</table>
</center>
</body></html>
