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
        <h1>Your Order Detail</h1>
        <h2>For order Id: ${requestScope.orderId}</h2>
        <a class="btn btn-warning" href="MainController?btnAction=viewProfile">Back</a>
        <div class="container">


            <div class="row">
                <br>
            </div>

            <div class="row">
                <p class="fs-4">Your Order Detail:</p>
            </div>
            <c:if test="${requestScope.ORDERDETAIL.size() eq '0'}">
                <p class="fs-4 fw-bold text-danger">You don't have any order</p>
            </c:if>
            <c:if test="${requestScope.ORDERDETAIL.size() ne '0'}">
                <table border="1" class="table table-striped table-hover">
                    <thead>
                        <tr>
                            <th>Order Id</th>
                            <th>Product Id</th>
                            <th>Quantity</th>
                            <th>Total</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="o" items="${requestScope.ORDERDETAIL}">
                            <tr>
                                <td>${o.orderId}</td>
                                <td>
                                    <a href="MainController?btnAction=viewProductDetail&productId=${o.productId}">${o.productId}</a>
                                </td>
                                <td>${o.quantity}</td>
                                <td>${o.total}</td>

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
