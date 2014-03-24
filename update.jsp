<html>
    <head>
        <title>Signup</title>
    </head>
    <body>
        <font color="purple">
        <%@page import="java.sql.*" %>
        <%@page import="java.lang.*" %>
        <%
        String name=request.getParameter("name");
        String password=request.getParameter("password");
        String name_up=request.getParameter("name_up");
        String my_no=request.getParameter("my_no");
        String password_up=request.getParameter("password_up");
        String rollno=request.getParameter("rollno");
        String dob=request.getParameter("dob");
        String telephone=request.getParameter("telephone");
        String mail=request.getParameter("mail");
        String address=request.getParameter("address");
        String sex=request.getParameter("sex");
        Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
        Connection con=DriverManager.getConnection("jdbc:odbc:Slamweb");
        Statement smt=con.createStatement();
        Statement smt1=con.createStatement();
        Statement smt2=con.createStatement();
        Statement smt3=con.createStatement();
        Statement smt4=con.createStatement();
        Statement smt5=con.createStatement();
         ResultSet rs=smt.executeQuery("SELECT * FROM SIGNUP");
        while(rs.next())
                {
                    if(rs.getString("USER_NAME").equals(name_up)&&rs.getString("PASSWORD").equals(password_up))
                     {
                        smt1.executeUpdate("UPDATE SIGNUP SET USER_NAME='"+name+"',PASSWORD='"+password+"',ROLLNO='"+rollno+"',DOB='"+dob+"',TELEPHONE='"+telephone+"',EMAIL='"+mail+"',ADDRESS='"+address+"',GENDER='"+sex+"' WHERE ROLLNO='"+my_no+"'");
                        smt2.executeUpdate("UPDATE INFO SET ROLLNO='"+rollno+"' WHERE ROLLNO='"+my_no+"'");
                        smt3.executeUpdate("UPDATE INFO SET RESPOND='"+rollno+"' WHERE RESPOND='"+my_no+"'");
                        smt4.executeUpdate("UPDATE SHARE SET REQUEST='"+rollno+"' WHERE REQUEST='"+my_no+"'");
                        smt5.executeUpdate("UPDATE SHARE SET RESPONSE='"+rollno+"' WHERE RESPONSE='"+my_no+"'");
                        out.print("<h1 align='center'>Updated successfully!</h1>");
                    }
        } %>
        </font>
        <form action="main.jsp" method="get" align="right">
            <input type="hidden" name="password" value="<%= password%>" readonly>
            <input type="hidden" name="user_name" value="<%= name%>" readonly>
            <input type="submit" value="Back">
        </form>
    </body>
</html>
