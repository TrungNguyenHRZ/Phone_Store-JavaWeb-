<%--
    Document   : viewCart
    Created on : Jul 12, 2022, 10:55:19 PM
    Author     : MY PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Profile</title>
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
        <h1>Your Profile</h1>
        <div class="container">
            <form action="MainController" method="POST" class="form-group bg-light ">
                <div class="mb-3">
                    <span class="form-label">Email</span>
                </div>
                <input type="hidden" name="txtId" value="${sessionScope.ACC.accId}">
                <input class="form-control" type="text" name="txtEmail" readonly="" value="${sessionScope.ACC.email}">
                <div class="mb-3">
                    <span class="form-label">Password</span>
                </div>
                <input class="form-control" type="password" name="txtPassword" value=""><!-- comment -->
                <div class="mb-3">
                    <span class="form-label">Re-Password</span>
                </div>
                <input class="form-control" type="password" name="txtRePassword" value=""><!-- comment -->
                <div class="mb-3">
                    <span class="form-label">FullName</span>
                </div>
                <input class="form-control" type="text" name="txtFullName" value="${sessionScope.ACC.fullName}">
                <div class="row">
                    <br>
                    <input type="hidden" name="method" value="post">
                </div>
                <div class="row">
                    <c:if test="${requestScope.WARNING != null}">
                        <p class="fs-4 fw-bold text-danger">${requestScope.WARNING}</p>
                    </c:if>
                </div>
                <button type="submit" name="btnAction" value="updateProfile" class="form-control btn btn-primary" >Update</button>
            </form>

            <div class="row">
                <br>
            </div>

            <div class="row">
                <p class="fs-4">Your Order:</p>
            </div>
            <c:if test="${requestScope.ORDER.size() eq '0'}">
                <p class="fs-4 fw-bold text-danger">You don't have any order</p>
            </c:if>
            <c:if test="${requestScope.ORDER.size() ne '0'}">
                <table border="1" class="table table-striped table-hover">
                    <thead>
                        <tr>
                            <th>Order Id</th>
                            <th>Date</th>
                            <th>Total</th>
                            <th>Action</th>

                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="o" items="${requestScope.ORDER}">
                            <tr>
                                <td>${o.orderId}</td>
                                <td>${o.date}</td>
                                <td>${o.total}</td>
                                <td>
                                    <a class="btn btn-success" href="MainController?btnAction=viewOrderDetail&orderId=${o.orderId}">View Detail</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>


            </c:if>

        </div>
        <div class="row">
            <br>
        </div>
        <footer>
            <%@include file="footer.jsp" %>
        </footer>
    </body>
</html>
