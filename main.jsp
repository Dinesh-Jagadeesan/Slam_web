<html>
    <head>
        <title>
            Slam web
        </title>
    </head>
    <body>
        <font color="purple">
        <form action="index.jsp" method="get" align="right">
            <input type="submit" value="Logout">
        </form>
        <%@page import="java.sql.*" %>
        <%@page import="java.lang.*" %>
        <%
          try{
            String name=request.getParameter("user_name");
            String password=request.getParameter("password");
            String rollno=null;
            int a;
            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
            Connection con=DriverManager.getConnection("jdbc:odbc:Slamweb");
            Statement smt2=con.createStatement();
            Statement smt=con.createStatement();
            Statement smt1=con.createStatement();
            Statement smt3=con.createStatement();
            Statement smt4=con.createStatement();
            Statement smt5=con.createStatement();
            Statement smtt=con.createStatement();
            ResultSet rst=smtt.executeQuery("SELECT * FROM SIGNUP WHERE USER_NAME='"+name+"'");
            while(rst.next())
            {
                if(rst.getString("PASSWORD").equals(password))
                                       {}
                               else
                               { 
                    a=10/0; }
            }
            ResultSet rs=smt.executeQuery("SELECT * FROM SIGNUP WHERE USER_NAME='"+name+"' AND PASSWORD='"+password+"'");
            while(rs.next())
             {           
                                     rollno=rs.getString("ROLLNO");
                %>
                <h1>Welcome <% out.print(name); %></h1>
                <form id="form3" action="update.jsp" method="get">
                    <fieldset>
            <legend><h3>Your detail</h3></legend>
            <table border="0">
                  <tr>
                    <td>
        Name:</td><td><input type="text" name="name" value="<%= name%>"required></td></tr><tr><td>
        Password:</td><td><input type="password" name="password" value="<%= password%>" required></td></tr><tr><td>
        Rollno:</td><td><input type="text" name="rollno" style="text-transform:uppercase"value="<%= rollno%>" required></td></tr><tr><td>
        D.O.B:</td><td><input type="date" name="dob" placeholder="dd-mm-yyyy" value="<%= rs.getString("DOB")%>" required></td></tr><tr><td>
        Mobile:</td><td><input type="tel" name="telephone" value="<%= rs.getString("TELEPHONE")%>" required></td></tr><tr><td>
        E-mail:</td><td><input type="email" name="mail" value="<%= rs.getString("EMAIL")%>" required></td></tr><tr><td>
        Address:</td><td><textarea name="address" required><%= rs.getString("ADDRESS")%></textarea></td></tr><tr><td>
        <input type="radio" name="sex" value="Male" required>Male
        <input type="radio" name="sex" value="Female" required>Female</td></tr>
                </table>
            <input type="hidden" name="password_up" value="<%= password%>" readonly>
            <input type="hidden" name="name_up" value="<%= name%>" readonly>
            <input type="hidden" name="my_no" style="text-transform:uppercase" value="<%= rollno%>" readonly>
            <input type="submit" value="Update">
            <input type="reset" value="Clear"><br>
        </fieldset>
                </form>
        <form id="form4" action="requests.jsp" method="get">
            <h3>Request friends to share</h3>
            <p>Available friends</p>
            <select name="request">
                <%
                ResultSet rs1=smt1.executeQuery("SELECT * FROM SIGNUP");
                while(rs1.next())
                { 
                String rollno1=rs1.getString("ROLLNO");
                String name1=rs1.getString("USER_NAME");
                 if(!rollno1.equals(rollno)){
                   %>
                                 <option value="<%=rollno1%>"><%= name1%></option>
          <%    }} %>
            </select>
            <input type="hidden" name="my_no" style="text-transform:uppercase" value="<%= rollno%>" readonly>
            <input type="hidden" name="password" value="<%= password%>" readonly>
            <input type="hidden" name="name" value="<%= name%>" readonly>
            <input type="submit" value="Request">
        </form>
            <hr>
            <form id="form5" action="responses.jsp" method="get">
            <h3>Received request from friends</h3>
            <select name="response">
                <% String no="NO";
                ResultSet rs2=smt2.executeQuery("SELECT * FROM SHARE WHERE RESPONSE='"+rollno+"' AND VALUET='"+no+"'");
                while(rs2.next())
                { 
                     String rollno1=rs2.getString("REQUEST");
                 ResultSet rs4=smt3.executeQuery("SELECT * FROM SIGNUP WHERE ROLLNO='"+rollno1+"'");
                 while(rs4.next())
                       { 
                String name1=rs4.getString("USER_NAME");%>
                                 <option value="<%= rollno1%>"><%= name1%></option>
          <%     }}%>
            </select>
            <input type="hidden" name="my_no" style="text-transform:uppercase" value="<%= rollno%>" readonly>
           <input type="hidden" name="password" value="<%= password%>" readonly>
            <input type="hidden" name="name" value="<%= name%>" readonly>
            <input type="submit" value="Response">
        </form><hr>
           <form id="form6" action="view.jsp" method="get">
            <h3>View your wall</h3>
            <select name="response">
                <%String yes="YES";
                ResultSet rs3=smt4.executeQuery("SELECT * FROM SHARE WHERE REQUEST='"+rollno+"' AND VALUET='"+yes+"'");
                while(rs3.next())
                { 
                     String rollno2=rs3.getString("RESPONSE");
                 ResultSet rs5=smt5.executeQuery("SELECT * FROM SIGNUP WHERE ROLLNO='"+rollno2+"'");
                 while(rs5.next())
                       {  
                String name1=rs5.getString("USER_NAME");%>
                                 <option value="<%= rollno2%>"><%= name1%></option>
          <%     }}%>
            </select>
            <input type="hidden" name="my_no" style="text-transform:uppercase" value="<%= rollno%>" readonly>
           <input type="hidden" name="password" value="<%= password%>" readonly>
            <input type="hidden" name="name" value="<%= name%>" readonly>
            <input type="submit" value="View">
        </form>
              <%  }}
          catch(Exception e)
             { out.print("<h1 align='center'>Login failed!</h1><h1 align='center'>login with valid credentials</h1>");  }%>
        </font>
        </body>
</html>
