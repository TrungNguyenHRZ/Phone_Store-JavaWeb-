<%-- 
    Document   : header
    Created on : Jul 18, 2022, 6:35:23 PM
    Author     : MY PC
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
        <a class="navbar-brand" href="MainController?btnAction=ViewProduct"><img src="images/logo.jpg" width="50px" height="50px" alt="alt"/></a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link" href="MainController?btnAction=viewCart">
                        <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-cart" viewBox="0 0 16 16">
                            <path d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM3.102 4l1.313 7h8.17l1.313-7H3.102zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2z">View Cart</path>
                        </svg>
                        View Cart
                    </a>
                </li>
            </ul>
            <form class="d-flex" action="MainController">
                <input class="form-control me-2" type="search" name="keyword" value="${param.keyword}" placeholder="Search" aria-label="Search">
                    <button class="btn btn-outline-success" type="submit" name="btnAction" value="Search">Search</button>

                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <c:if test="${sessionScope.ACC != null}">
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                    Welcome, ${sessionScope.ACC.fullName}
                                </a>
                                <ul class="dropdown-menu" aria-labelledby="navbarDropdown">

                                    <li><a class="dropdown-item" href="MainController?btnAction=viewProfile">My Information</a></li>
                                    <li><hr class="dropdown-divider"></li>
                                    <li><a class="dropdown-item text-danger" href="MainController?btnAction=logout">Logout</a></li>

                                </ul>

                            </li>
                        </c:if>
                        <c:if test="${sessionScope.ACC == null}">
                            <li class="nav-item">
                                <a class="nav-link btn text-warning" href="MainController?btnAction=LoginPage">
                                    Login
                                </a>
                            </li>
                        </c:if>

                    </ul>
            </form>
        </div>
    </div>
</nav>

