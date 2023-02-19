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
        <title>Product Detail</title>
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

        <h1>Product Detail</h1>
        <a href="MainController?btnAction=ViewProduct" class="btn btn-warning">Back</a>
        <hr/>
        <div class="container">
            <div class="row d-flex justify-content-center">
                <div class="col-md-10">
                    <div class="card">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="images p-3">
                                    <div class="text-center p-4"> <img id="main-image" src="${requestScope.PRODUCT.imgPath}" width="250" /> </div>
                                    <div class="thumbnail text-center"> <img onclick="change_image(this)" src="${requestScope.PRODUCT.imgPath}" width="70"> <img onclick="change_image(this)" src="${requestScope.PRODUCT.imgPath}" width="70"> </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="product p-4">
                                    <div class="mt-4 mb-3"> <span class="text-uppercase text-muted brand">${requestScope.PRODUCT.productName}</span>
                                        <h5 class="text-uppercase"></h5>
                                        <div class="price d-flex flex-row align-items-center"> <span class="act-price">$${requestScope.PRODUCT.price}</span>
                                        </div>
                                    </div>
                                    <p class="about">${requestScope.PRODUCT.description}</p>

                                    <div class="cart mt-4 align-items-center"> 
                                        <a href="AddToCartServlet?productId=${requestScope.PRODUCT.productId}" class="btn btn-danger text-uppercase mr-2 px-4">Add To Cart</a>
                                        <i class="fa fa-heart text-muted"></i> <i class="fa fa-share-alt text-muted"></i> </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <br><!-- comment -->
        </div>
        <footer>
            <%@include file="footer.jsp" %>
        </footer>
    </body>
</html>
