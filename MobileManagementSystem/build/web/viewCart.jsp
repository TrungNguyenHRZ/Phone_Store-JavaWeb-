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
        <title>JSP Page</title>
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

        <h1>Cart</h1>
        <a href="MainController?btnAction=ViewProduct" class="btn btn-warning">Back</a>
        <hr/>
        <div class="container">


            <c:if test="${sessionScope.CART != null}">

                <table border="1" class="table table-striped table-hover">
                    <thead>
                        <tr>
                            <th>Product ID</th>
                            <th>Product Name</th>
                            <th>Price</th>
                            <th>Cate ID</th>
                            <th>Status</th>
                            <th>Images</th>
                            <th>Quantity</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="list" items="${sessionScope.CART}" varStatus="count"> 
                            <tr>
                        <form action="UpdateCart">
                            <td>
                                <input type="hidden" name="txtId" value="${list.value.productId}" readonly="" />
                                ${count.count}
                            </td>
                            <td>${list.value.productName}</td>
                            <td>${list.value.price}</td>
                            <td>${list.value.cateId}</td>
                            <td>${list.value.status}</td>
                            <td>
                                <img width="100px" height="100px" src="${list.value.imgPath}" alt="alt"/>
                            </td>
                            <td>
                                <input class="form-control" type="number" name="txtQuantity" value="${list.value.quantity}" />
                            </td>
                            <td>
                                <button class="btn btn-primary" type="submit" name="action" value="Update">Update</button>
                                <a class="btn btn-danger" href="MainController?btnAction=deleteCart&txtId=${list.value.productId}">Delete</a>
                            </td>
                        </form>
                        </tr>
                    </c:forEach>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td>
                            <div>
                                Total: $${sessionScope.TOTAL}
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td>
                            <div>
                                <a href="MainController?btnAction=Checkout" class="btn btn-success">Check out</a>
                            </div>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </c:if>
            <c:if test="${requestScope.WARNING != null}">
                <p class="fs-2 fw-bold text-danger">${requestScope.WARNING}</p>
            </c:if>
            <c:if test="${sessionScope.CART == null}">
                <p class="fs-1 fw-bold text-danger">Nothing in Cart</p>
            </c:if>
        </div>
        <div class="row">
            <br><!-- comment -->
        </div>
        <footer>
            <%@include file="footer.jsp" %>
        </footer>
    </body>
</html>
