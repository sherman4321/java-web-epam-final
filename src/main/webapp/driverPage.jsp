<%--
  Created by IntelliJ IDEA.
  User: Lesha
  Date: 25.01.2020
  Time: 18:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Driver page</title>
</head>
<body>
<section>
    <h3>Driver page</h3>
    <%--<jsp:useBean id="session" scope="request" type="javax.servlet.http.HttpSession"/>--%>
    <tr>
        <td>Name: <c:out value="${sessionScope.userName}"/></td>
    </tr>
    <br>
    <td><a href="driver?action=driverOrders">Show orders</a></td>
    <br>
    <td><a href="app?action=changeName">Change username</a></td>
    <br>
    <td><a href="app?action=changePassword">Change password</a></td>
    <br>
    <td><a href="driver?action=currentOrder">Current order</a></td>
    <br>
    <td><a href="driver?action=logout">Log Out</a></td>
</section>
</body>
</html>
