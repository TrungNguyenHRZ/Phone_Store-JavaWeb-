 <%-- 
    Document   : login
    Created on : Jun 21, 2022, 5:40:14 PM
    Author     : MY PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Phone's Store</title>
        <link rel="stylesheet" href="mycss.css">
        <!-- CSS only -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
        <!-- JavaScript Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>

    </head>
    <body>
        <header>
            <%@include file="header.jsp" %>
        </header>
        <h1>Login</h1>
        <hr/>

        <div class="container">
            <form action="MainController" method="POST" class="">
                Email:
                <input class="form-control" type="text" name="email" placeholder="Enter your email" value="" /><br/>
                Password:
                <input class="form-control" type="password" name="password" placeholder="Enter your password" value="" /><br/>
                <input class="btn btn-primary" type="submit" name="btnAction" value="Login"/>
                <p>Not registered? <a href="MainController?btnAction=RegisterPage">Create an account</a></p>
                <c:if test="${requestScope.MSG!=null}">
                    <strong><p style="color: red">${requestScope.MSG}</p></strong>
                    </c:if>
                    <c:if test="${requestScope.WARNING != null}">
                    <p class="fw-bold text-danger">${requestScope.WARNING}</p>
                </c:if>
            </form>
        </div>
        <footer>
            <%@include file="footer.jsp" %>
        </footer>
    </body>
</html>
