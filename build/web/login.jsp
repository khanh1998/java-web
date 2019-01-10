<%-- 
    Document   : login
    Created on : Dec 13, 2018, 3:29:32 PM
    Author     : KHANHBQSE63463
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Login</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <%
            if (session.getAttribute("userId") != null) {
                response.sendRedirect("search");
            }
        %>

        <h1>Login</h1>
        <form action="login" method="POST">
            User Id <input type="text" name="UserId" value="" /><br>
            Password <input type="password" name="Password" value="" />
            <input type="submit" value="Login" />
        </form>
    </body>
</html>