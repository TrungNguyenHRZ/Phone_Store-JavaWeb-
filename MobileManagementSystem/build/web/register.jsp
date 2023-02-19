<%-- 
    Document   : register
    Created on : Jul 18, 2022, 11:25:31 AM
    Author     : MY PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!-- CSS only -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
        <!-- JavaScript Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>

    </head>
    <body>
        <header>
            <%@include file="header.jsp" %>
        </header>
        <h1>Register</h1>
        <hr/>
        <div class="container">


            <form action="MainController" method="POST">
                <div class="mb-3">
                    <span for="inputEmail" class="form-label">Email:</span>
                </div>
                <input id="inputEmail" class="form-control" type="text" name="txtEmail" placeholder="Enter your email" value="">
                <br/>
                <div class="mb-3">
                    <span class="form-label">Full name:</span>
                </div>
                <input class="form-control" type="text" name="txtFullName" placeholder="Enter full name" value="">
                <br/>
                <div class="mb-3">
                    <span class="form-label">Password:</span>
                </div>
                <input class="form-control" type="password" name="txtPassword" placeholder="Enter new password" value=""><br/>
                <input class="btn btn-success" type="submit" name="btnAction" value="Register"><br/>
                Already registered? <a class="btn btn-primary" href="login.html">Sign In</a>
                <br>
                <c:if test="${requestScope.WARNING != null}">
                    <strong style="color: red">${requestScope.WARNING}</strong>
                </c:if>
            </form>
        </div>
        <footer>
            <%@include file="footer.jsp" %>
        </footer>
    </body>
</html>
