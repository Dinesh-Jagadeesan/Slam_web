<html>
    <head>
        <title>Slam web</title>
    </head>
    <body>
        <font color="purple">
        <%@page import="java.sql.*" %>
        <%@page import="java.lang.*"%>
        <%
            String my_no=request.getParameter("my_no");
            String name=request.getParameter("name");
            String password=request.getParameter("password");
            String res=request.getParameter("response");
            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
            Connection con=DriverManager.getConnection("jdbc:odbc:Slamweb");
            Statement smt=con.createStatement();
            Statement smt1=con.createStatement();
            Statement smt2=con.createStatement();
            ResultSet rs=smt.executeQuery("SELECT * FROM SIGNUP WHERE USER_NAME='"+name+"'");
            while(rs.next())
            {
                String password1=rs.getString("PASSWORD");
         if((password1.equals(password)))
         {
                ResultSet rs1=smt1.executeQuery("SELECT * FROM SIGNUP WHERE ROLLNO='"+res+"'");
       while(rs1.next())
       { %>
       <h1>Welcome <%= name%></h1>
       <table border="0" align="center">
           <tr><td>
                   Name:</td><td><input type="text" name="name" value="<%= rs1.getString("USER_NAME")%>" readonly></td></tr><tr><td>
                   Rollno:</td><td><input type="text" name="rollno" value="<%= rs1.getString("ROLLNO")%>" readonly></td></tr><tr><td>
                   D.O.B:</td><td><input type="text" name="dob" value="<%= rs1.getString("DOB")%>" readonly></td></tr><tr><td>
        Mobile:</td><td><input type="text" name="telephone" value="<%= rs1.getString("TELEPHONE")%>" readonly></td></tr><tr><td>
        E-mail:</td><td><input type="text" name="email" value="<%= rs1.getString("EMAIL")%>" readonly></td></tr><tr><td>
                   Address:</td><td><textarea cols="50" rows="10" name="address" value="" readonly><%= rs1.getString("ADDRESS")%></textarea></td></tr>
         <%  
         ResultSet rs2=smt2.executeQuery("SELECT * FROM INFO WHERE ROLLNO='"+my_no+"' AND RESPOND='"+res+"'");
         while(rs2.next())
         { %>
             <tr><td>
                     Your Nick name:</td><td><input type="text" name="nick" value="<%= rs2.getString("YOUR_NICK_NAME")%>" readonly></td></tr>
               <tr><td>My favorite color:</td><td><input type="text" name="color" value="<%= rs2.getString("COLOR")%>" readonly></td></tr>
               <tr><td>My favorite movie:</td><td><input type="text" name="movie" value="<%= rs2.getString("MOVIE")%>" readonly></td></tr>
               <tr><td>My favorite song:</td><td><input type="text" name="song" value="<%= rs2.getString("SONG")%>" readonly></td></tr>
               <tr><td>My zodiac sign:</td><td><input type="text" name="sign" value="<%= rs2.getString("ZODIAC_SIGN")%>" readonly></td></tr>
               <tr><td>About me:</td><td><textarea cols="50" rows="10" name="about_me" value="" readonly><%= rs2.getString("ABOUT_ME")%></textarea></td></tr>
               <tr><td>Why i like you:</td><td><textarea cols="50" rows="10" name="about_me" value="" readonly><%= rs2.getString("LIKE")%></textarea></td></tr>
               <tr><td>My philosophy:</td><td><textarea cols="50" rows="10" name="about_me" value="" readonly><%= rs2.getString("PHILOSOPHY")%></textarea></td></tr>
               <tr><td>Percentage i like you:</td><td><input type="text" name="range" value="<%= rs2.getString("RANGE")%>" readonly></td></tr>
      <%   } %>
       </table>
      <% }
            }
               }
        %>
        </font>
         
    </body>
</html>
