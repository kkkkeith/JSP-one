package myservlet.control;
import mybean.data.FunctionBean; //��������2�е�Javabeanģ��

import java.io.*;
import java.sql.*;

import javax.servlet.*;
import javax.servlet.http.*;
public class Insert extends HttpServlet{
   public void init(ServletConfig config) throws ServletException{
      super.init(config);
   }
   public void doPost(HttpServletRequest request,HttpServletResponse response)
               throws ServletException,IOException{
     FunctionBean resultBean=null;
      try{  resultBean=(FunctionBean)request.getAttribute("resultBean");
            if(resultBean==null){
                resultBean=new FunctionBean(); //����Javabean����
                request.setAttribute("resultBean",resultBean);
            }
      }
      catch(Exception exp){
            resultBean=new FunctionBean();  //����Javabean����
            request.setAttribute("resultBean",resultBean);
      } 
     try{  Class.forName("com.mysql.jdbc.Driver");
     }
     catch(Exception e){} 
     request.setCharacterEncoding("gb2312");
     String Gname = request.getParameter("Gname");
     String Gdate = request.getParameter("Gdate");
     String Gbid=request.getParameter("Gbid");
     String Gprice=request.getParameter("Gprice");
     String Gstorage=request.getParameter("Gstorage");
     String Gsell=request.getParameter("Gsell");
     String condition="insert into goods value"+"('"+Gname+"','"+Gdate+"','"+Gbid+"','"+Gprice+"','"+Gstorage+"','"+Gsell+"')";
     Connection con;
     Statement sql; 
     ResultSet rs;
     try{ 
    	 String uri="jdbc:mysql://127.0.0.1/good?"+
                 "user=root&password=123456&characterEncoding=gb2312";
          con=DriverManager.getConnection(uri);
          sql=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
                                 ResultSet.CONCUR_READ_ONLY);
          sql.executeUpdate(condition);
          rs=sql.executeQuery("SELECT * FROM goods");
          ResultSetMetaData metaData = rs.getMetaData();
          int columnCount = metaData.getColumnCount(); //�õ������������
          String []columnName = new String[columnCount];
          for(int i=0;i<columnName.length;i++) {
             columnName[i] = metaData.getColumnName(i+1); //�õ�����
          }
          resultBean.setColumnName(columnName);   //����Javabean����ģ��
          rs.last();
          int rowNumber=rs.getRow();  //�õ���¼��
          String [][] tableRecord=resultBean.getTableRecord();
          tableRecord = new String[rowNumber][columnCount];
          rs.beforeFirst();
          int i=0;
          while(rs.next()){
            for(int k=0;k<columnCount;k++) 
              tableRecord[i][k] = rs.getString(k+1);
            i++; 
          }
          resultBean.setTableRecord(tableRecord); //����Javabean����ģ��
          con.close();
          RequestDispatcher dispatcher=
          request.getRequestDispatcher("searchGood.jsp");
          dispatcher.forward(request,response);
     }
     catch(SQLException e){
          System.out.println(e);
          fail(request,response,"��Ӽ�¼ʧ��:"+e.toString());
     }  
   }
   public  void  doGet(HttpServletRequest request,HttpServletResponse response)
           throws ServletException,IOException{
       doPost(request,response);
   }
   public void fail(HttpServletRequest request,HttpServletResponse response,
                      String backNews) {
        response.setContentType("text/html;charset=GB2312");
        try {
         PrintWriter out=response.getWriter();
         out.println("<html><body>");
         out.println("<h2>"+backNews+"</h2>") ;
         out.println("����");
         out.println("<a href =insert.jsp>�����¼</a>");
         out.println("</body></html>");
        }
        catch(IOException exp){} 
    }
}
