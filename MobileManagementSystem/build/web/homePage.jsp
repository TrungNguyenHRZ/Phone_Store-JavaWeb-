<%-- 
    Document   : homePage
    Created on : Jun 23, 2022, 9:26:04 PM
    Author     : MY PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Phone's Store Team 7</title>
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
        <c:if test="${requestScope.MSG!=null}">
            <strong><p style="color: green">${requestScope.MSG}</p></strong>
            </c:if>
        <h1></h1>
        <h2>
        </h2>
        <div class="container">
            <c:if test="${requestScope.LIST_PRODUCT == null}">
                <p class="fs-4 fw-bold text-danger">Not found Item</p>
            </c:if>
                
            <div class="row row-cols-1 row-cols-md-4 g-4">

                <c:if test="${requestScope.LIST_PRODUCT != null}">
                    <c:forEach var="list" items="${requestScope.LIST_PRODUCT}">
                        <div class="col">
                            <div class="card">
                                <img src="${list.imgPath}" class="card-img-top" width="100px" alt="...">
                                <div class="card-body">
                                    <h5 class="card-title">${list.productName}</h5>
                                    <p class="fs-4">$${list.price}</p>
                                    <p class="card-text">${list.description}</p>
                                    <a href="MainController?btnAction=viewProductDetail&productId=${list.productId}" class="btn btn-warning">View Detail</a>
                                    <a href="AddToCartServlet?productId=${list.productId}" class="btn btn-primary">Add To Cart</a>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </c:if>
            </div>
        </div>
        <div class="row">
            <br>
        </div>
        <footer>
            <%@include file="footer.jsp" %>
        </footer>

    </body>
</html>
