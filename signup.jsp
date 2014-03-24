<html>
    <head>
        <title>Signup</title>
    </head>
    <body>
        <font color="purple">
        <%@page import="java.sql.*" %>
        <%@page import="java.lang.*" %>
        <%
        try
        {
        String name=request.getParameter("name");
        String password=request.getParameter("password");
        String rollno=request.getParameter("rollno");
        String dob=request.getParameter("dob");
        String telephone=request.getParameter("telephone");
        String mail=request.getParameter("mail");
        String address=request.getParameter("address");
        String sex=request.getParameter("sex");
        Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
        Connection con=DriverManager.getConnection("jdbc:odbc:Slamweb");
        Statement smt=con.createStatement();
        ResultSet rs=smt.executeQuery("SELECT * FROM SIGNUP");
        while(rs.next())
        {
             try
                {
                    if(rs.getString("USER_NAME").equals(name)&&rs.getString("ROLLNO").equals(rollno))
                        break;
                 }
                catch(Exception e1)
                {%>
                    <h1 align="center">User name already taken!Try different name</h1>
                    <h1 align="center">or</h1>
                <%  }
                break;
            }
         smt.executeUpdate("INSERT INTO SIGNUP(USER_NAME,PASSWORD,ROLLNO,DOB,TELEPHONE,ADDRESS,EMAIL,GENDER) VALUES('"+name+"','"+password+"','"+rollno+"','"+dob+"','"+telephone+"','"+address+"','"+mail+"','"+sex+"')");
         out.print("<h1 align='center'>Thank you for your registration</h1>");
         out.print("<h1 align='center'>Login using your user name and password</h1>");
        }
        catch(Exception e)
        { %>
            <h1 align="center">You are already a member</h1>
     <%   }
       %>
       </font> 
       <font color="purple">
        <form action="index.jsp" method="get" align="right">
            <input type="submit" value="Back">
        </form>
    </body>
</html>
