<%@ page contentType="text/html;charset=GB2312" %>
<HTML><HEAD>
<title>��ѯ��Ʒ</title>
<link rel="stylesheet" type="text/css" href="css.css"/>
</HEAD>
<BODY background=image/back.jpg><font size=4>
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
<br>��ѯʱ����������Ʒ���Ƽ��۸�<br>
<br>����۸����ֵ��0��10֮��<br>
���� 2-8 
<FORM action="searchByConditionServlet" Method="post" >
   <br>�����ѯ��Ϣ:<Input type=text name="searchMess"><br>
   <Input type =radio name="radio" value="Gname" checked="ok">��Ʒ����
   <Input type =radio name="radio" value="Gprice">��Ʒ�۸�
   <br><Input class="button" type=submit name="g" value="�ύ">
</Form>
</div>
</Font></BODY></HTML>
