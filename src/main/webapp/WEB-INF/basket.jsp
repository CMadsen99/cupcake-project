<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: jacobsimonsen
  Date: 13/03/2020
  Time: 15.16
  To change this template use File | Settings | File Templates.R
--%>
<title>Kurv</title>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<c:choose>
    <c:when test="${sessionScope.role=='admin'}">
        <%@include file="../includes/headeradmin.inc"%>
    </c:when>
    <c:otherwise>
        <%@include file="../includes/headercostumer.inc"%>
    </c:otherwise>
</c:choose>

<h1 class="text-center mt-4">Din indkøbskurv:</h1>

<table class="text-center mt-4" style="width:100%">
    <th></th> <!-- antal bestemmelse med hvor mange ting der er i kurv -->
        <th><h4>Topping</h4></th>
        <th><h4>Bund</h4></th>
        <th><h4>Antal</h4></th>
        <th><h4>Pris</h4></th>
    <th></th>
<c:forEach var="basket" items="${basket}">
    <tr>
        <td><li></li></td>
        <td>${basket.toppingName}</td>
    <td>${basket.bottomName}</td>
    <td>${basket.quantity} stk.</td>
    <td>${basket.price} kr.</td>
        <td><form name="editPage" action="FrontController" method="POST">
            <input type="hidden" name="idEdit" value="remove">

            <input type="submit" value="fjern denne cupcake">
        </form></td>
        </c:forEach>
    </tr>
    <tr>
    <td></td>
        <td></td>
        <td></td>
    <td><div class="mt-4"><h4>Pris i alt:</div></h4>
    <td><div class="mt-4"><h4>${sessionScope.totalPrice} kr.</div></td>
        <td><form class="mt-4" name="payOrder" action="FrontController" method="POST">
            <input type="hidden" name="taget" value="payOrder">
            <input type="hidden" name="usersID" value="${sessionScope.usersID}">

            <input type="submit" value="Betal">
        </form></td>
    </tr>
    </th>
</table>
</body>
</html>
