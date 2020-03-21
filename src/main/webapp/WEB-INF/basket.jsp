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
    <th>
    <th><h4>#</h4></th> <!-- antal bestemmelse med hvor mange ting der er i kurv -->
        <th><h4>Topping</h4></th>
        <th><h4>Bund</h4></th>
        <th><h4>Antal</h4></th>
        <th><h4>Pris</h4></th>

    <c:forEach var="basket" items="${basket}">
        <li>${basket.toppingName} ${basket.bottomName} ${basket.quantity} ${basket.price}</li>
    </c:forEach>
    </th>
</table>
<h4>Pris i alt</h4>

${sessionScope.totalPrice}
<br>

<form name="payOrder" action="FrontController" method="POST">
    <input type="hidden" name="taget" value="payOrder">
    <input type="hidden" name="usersID" value="${sessionScope.usersID}">

    <input type="submit" value="Betal">
</form>
</body>
</html>
