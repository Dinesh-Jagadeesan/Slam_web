<html>
    <head>
        <title>Slam web</title>
    </head>
    <body>
        <font color="purple">
        <h1 align="center">Welcome to Slam web</h1>
        <form id="form1" action="main.jsp" method="get">
            <fieldset>
                <legend><h3>Login</h3></legend>
                <table border="0">
                    <tr><td>
            User Name:</td><td><input type="text" name="user_name" placeholder="Name"></td></tr><tr>
            <td>Password:</td><td><input type="password" name="password" placeholder="Password"></td></tr>
                </table>
            <input type="submit" value="Login">
            <input type="reset" value="Clear"><br>
            </fieldset>
        </form>
        <br>
    <form id="from2" action="signup.jsp" method="get">
        <fieldset>
            <legend><h3>Signup</h3></legend>
            <table border="0">
                <tr>
                    <td>
        Name:</td><td><input type="text" name="name" required></td></tr><tr><td>
        Password:</td><td><input type="password" name="password" required></td></tr><tr><td>
        Rollno:</td><td><input type="text" name="rollno" style="text-transform:uppercase" required></td></tr><tr><td>
        D.O.B:</td><td><input type="date" name="dob" placeholder="dd-mm-yyyy" required></td></tr><tr><td>
        Mobile:</td><td><input type="tel" name="telephone" required></td></tr><tr><td>
        E-mail:</td><td><input type="email" name="mail" required></td></tr><tr><td>
        Address:</td><td><textarea name="address" required></textarea></td></tr><tr><td>
        <input type="radio" name="sex" value="Male" required>Male
        <input type="radio" name="sex" value="Female" required>Female</td></tr>
            </table>
            <input type="submit" value="Signup">
            <input type="reset" value="Clear"><br>
        </fieldset>
    </form>
        </font>
</body>
</html>
