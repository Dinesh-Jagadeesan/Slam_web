<html>
    <head>
        <title>Slam web</title>
        <script type="text/javascript">
    function updateTextInput(val) {
      document.getElementById('textInput').value=val; 
    }
  </script>
    </head>
    <body>
        <font color="purple">
        <%@page import="java.sql.*" %>
        <%@page import="java.lang.*" %>
        <%
        try{
        int a;
        String res=request.getParameter("response");
        String my_no=request.getParameter("my_no");
        String name=request.getParameter("name");
        String password=request.getParameter("password");
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
         {
                ResultSet rs=smt.executeQuery("SELECT * FROM SIGNUP WHERE ROLLNO='"+my_no+"'");
       while(rs.next())
       {
            ResultSet rs1=smt1.executeQuery("SELECT * FROM SIGNUP WHERE ROLLNO='"+res+"'"); 
            while(rs1.next())
            {%>
                <h1>Welcome to <%= rs1.getString("USER_NAME") %>'s wall </h1> <br>
          <%}
       } %>
       <form id="form6" action="post.jsp" method="get" align="center">
           <table border="0" align="center">
               <tr><td>
           Nick name:</td><td><input type="text" name="nick" placeholder="Friend's nick name" required></td></tr>
               <tr><td>My favorite color:</td><td><input type="text" name="color" required></td></tr>
               <tr><td>My favorite movie:</td><td><input type="text" name="movie" required></td></tr>
               <tr><td>My favorite song:</td><td><input type="text" name="song" required></td></tr>
               <tr><td>My zodiac sign:</td><td><input type="text" name="sign" required></td></tr>
               <tr><td>About me:</td><td><textarea name="about_me" cols="50" rows="10" required></textarea></td></tr>
               <tr><td>About you:</td><td><textarea name="about_you" cols="50" rows="10" required></textarea></td></tr>
               <tr><td>Why i like you:</td><td><textarea name="like" cols="50" rows="10" required></textarea></td></tr>
               <tr><td>My philosophy:</td><td><textarea name="phy" cols="50" rows="10" required></textarea></td></tr>
          <tr><td>Percentage i like you:</td><td>0<input type="range" name="rangeInput" min="0" max="100" onchange="updateTextInput(this.value);" required>100                                                       
    <input type="text" id="textInput" value=""></td></tr>
           </table>
           <input type="hidden" name="my_no" value="<%= my_no%>" style="text-transform:uppercase">
           <input type="hidden" name="response" value="<%= res%>">
           <input type="hidden" name="name" value="<%= name%>">
           <input type="hidden" name="password" value="<%= password%>">
           <input type="submit" name="submit" value="Submit">
           <input type="reset" name="clear" value="Clear">
       </form>
           <% } 
               
        
           }
           }      catch(Exception e)
                       {}%>
                       </font>
    </body>
</html>
