<html>
    <head>
        <title>Slam web</title>
    </head>
    <body>
        <font color="purple">
        <%@page import="java.sql.*" %>
        <%@page import="java.lang.*" %>
        <%
        String nick=request.getParameter("nick");
        String color=request.getParameter("color");
        String movie=request.getParameter("movie");
        String song=request.getParameter("song");
        String sign=request.getParameter("sign");
        String about_me=request.getParameter("about_me");
        String about_you=request.getParameter("about_you");
        String like=request.getParameter("like");
        String phy=request.getParameter("phy");
        String range=request.getParameter("rangeInput");
        String my_no=request.getParameter("my_no");
        String res=request.getParameter("response");
        String password=request.getParameter("password");
        String name=request.getParameter("name");
        Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
        Connection con=DriverManager.getConnection("jdbc:odbc:Slamweb");
        Statement smt=con.createStatement();
        Statement smt1=con.createStatement();
        Statement smt2=con.createStatement();
        ResultSet rst=smt.executeQuery("SELECT * FROM SIGNUP WHERE USER_NAME='"+name+"'");
            while(rst.next())
            { 
                String password1=rst.getString("PASSWORD");
                 if((password1.equals(password)))
                  {
                     smt1.executeUpdate("INSERT INTO INFO(ROLLNO,RESPOND,YOUR_NICK_NAME,COLOR,MOVIE,SONG,ZODIAC_SIGN,ABOUT_ME,ABOUT_YOU,LIKE,PHILOSOPHY,RANGE) VALUES('"+res+"','"+my_no+"','"+nick+"','"+color+"','"+movie+"','"+song+"','"+sign+"','"+about_me+"','"+about_you+"','"+like+"','"+phy+"','"+range+"')");
                     smt2.executeUpdate("UPDATE SHARE SET VALUET='YES' WHERE SHARE.RESPONSE='"+my_no+"' AND SHARE.REQUEST='"+res+"'");
                  %>  
                 <h1 align='center'>Successfully posted!</h1>
     <%  } } %>
     </font>
          <form action="main.jsp" method="get" align="right">
            <input type="hidden" name="password" value="<%= password%>" readonly>
            <input type="hidden" name="user_name" value="<%= name%>" readonly>
            <input type="submit" value="Back">
        </form>
    </body>
</html>
