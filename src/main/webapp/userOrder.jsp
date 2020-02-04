<%--
  Created by IntelliJ IDEA.
  User: Lesha
  Date: 29.01.2020
  Time: 20:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Current order</title>
    <style><%@include file="bootstrap-4.4.1-dist/css/bootstrap.min.css"%></style>
    <style><%@include file="resources/css/userPage.css"%></style>
    <style><%@include file="resources/css/userOrder.css"%></style>
</head>
<body>
<nav class="navbar navbar-dark sticky-top bg-dark flex-md-nowrap p-0">
    <a class="navbar-brand col-sm-3 col-md-2 mr-0">BUBER</a>
</nav>

<nav class="col-md-2 d-none d-md-block bg-light sidebar">
    <div class="sidebar-sticky">
        <ul class="nav flex-column">
            <li class="nav-item">
                <a class="nav-link" href="app?action=userPage">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-home"><path d="M3 9l9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z"></path><polyline points="9 22 9 12 15 12 15 22"></polyline></svg>
                    Dashboard <span class="sr-only">(current)</span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="app?action=newOrder">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-file"><path d="M13 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V9z"></path><polyline points="13 2 13 9 20 9"></polyline></svg>
                    Make an order
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link active" href="app?action=userOrder">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-clipboard"><circle cx="9" cy="21" r="1"></circle><circle cx="20" cy="21" r="1"></circle><path d="M1 1h4l2.68 13.39a2 2 0 0 0 2 1.61h9.72a2 2 0 0 0 2-1.61L23 6H6"></path></svg>
                    Show current order
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="app?action=changeName">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-users"><path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path><circle cx="9" cy="7" r="4"></circle><path d="M23 21v-2a4 4 0 0 0-3-3.87"></path><path d="M16 3.13a4 4 0 0 1 0 7.75"></path></svg>
                    Change username
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="app?action=changePassword">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-settings"><line x1="18" y1="20" x2="18" y2="10"></line><line x1="12" y1="20" x2="12" y2="4"></line><line x1="6" y1="20" x2="6" y2="14"></line></svg>
                    Change password
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="app?action=drivers">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-truck"><polygon points="12 2 2 7 12 12 22 7 12 2"></polygon><polyline points="2 17 12 22 22 17"></polyline><polyline points="2 12 12 17 22 12"></polyline></svg>
                    Show drivers
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="hello?action=logout">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-log-out"><polygon points="12 2 2 7 12 12 22 7 12 2"></polygon><polyline points="2 17 12 22 22 17"></polyline><polyline points="2 12 12 17 22 12"></polyline></svg>
                    Log out
                </a>
            </li>
        </ul>
    </div>
</nav>
<jsp:useBean id="currentOrder" scope="request" type="by.epam.buber.entity.Order"/>
<jsp:useBean id="driverRequested" scope="request" type="java.lang.Boolean"/>
<form method="post" action="app?action=cancelOrder" class="current-order">
    <div class="col">
        <div class="col-md-5 mb-3 text-center">
        Coordinates: <c:out value="${currentOrder.coordinates}" />
        </div>
        <div class="col-md-4 mb-3 text-center">
        Address: <c:out value="${currentOrder.destinationPoint}" />
        </div>
        <div class="col-md-3 mb-3 text-center">
        Comment: <c:out value="${currentOrder.comment}"/>
        </div>
    </div>
        <c:if test = "${currentOrder.driverId != '0'}">
        <h1 class="header-text-center-green">Order have been accepted by driver</h1>
        </c:if>

        <c:if test="${currentOrder.driverId == '0'}">

        <c:choose>

        <c:when test="${driverRequested == true}">
        <h1 class="header-text-center">Driver has been selected, please, wait for acceptance</h1>
        </c:when>

        <c:otherwise>
        <h1 class="header-text-center-red">Driver hasn't been selected or denied your order</h1>
        </c:otherwise>

        </c:choose>

        </c:if>
        <c:choose>
        <c:when test="${currentOrder.started == '0'}">
        <button class="btn btn-lg btn-danger" type="submit">Cancel the order</button>
        <td><input type="hidden" value="${currentOrder.id}"  name="canceledOrder"/>
        </td>
        </c:when>
        <c:otherwise>
        <h1 class="header-text-center-green">Your trip has been started</h1>
        </c:otherwise>
        </c:choose>
</form>
</body>
</html>