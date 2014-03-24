<html>
    <head>
        <title>Slam web</title>
    </head>
    <body>
        <font color="purple">
        <%@page import="java.sql.*" %>
        <%@page import="java.lang.*" %>
        <%
            try{
             int b;
            String request1=request.getParameter("request");
            String my_no=request.getParameter("my_no");
            String name=request.getParameter("name");
            String password=request.getParameter("password");
            String request2,request3=null;
            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
            Connection con=DriverManager.getConnection("jdbc:odbc:Slamweb");
            Statement smt=con.createStatement();
            Statement smt1=con.createStatement();
            Statement smt2=con.createStatement();
            ResultSet rs2=smt2.executeQuery("SELECT * FROM SIGNUP WHERE USER_NAME='"+name+"'");
        while(rs2.next())
        {       
            String password1=rs2.getString("PASSWORD");
         if((password1.equals(password)))
         {  try{
            ResultSet rs=smt.executeQuery("SELECT * FROM SHARE WHERE REQUEST='"+my_no+"'");
            while(rs.next())
            {
                
                request3=rs.getString("RESPONSE");
                if(request1.equals(request3))
                {
                    int a=10/0;
                }
             }
             smt1.executeUpdate("INSERT INTO SHARE(REQUEST,RESPONSE,VALUET) VALUES('"+my_no+"','"+request1+"','NO')");
            out.print("<h1 align='center'>Request sent</h1>");} 
            catch(Exception e){out.print("<h1 align='center'>Already requested</h1>");}}
               
        
        } 
           }
             catch(Exception e){}
         %>
    </body>
</html>
