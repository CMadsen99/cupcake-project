<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<title>Cupcake projekt</title>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<c:choose>
    <c:when test="${sessionScope.role=='admin'}">
        <%@include file="includes/headeradmin.inc"%>
    </c:when>
    <c:otherwise>
        <%@include file="includes/headercostumer.inc"%>
    </c:otherwise>
</c:choose>

<table class="table mt-4">
    <thead>
    <tr>
        <th scope="col">Bruger ID</th>
        <th scope="col">Navn</th>
        <th scope="col">Email</th>
        <th scope="col">Ordrehistorik</th>
        <th scope="col">Rediger kunde</th>
    </tr>
    </thead>
    <tbody>
    <tr></tr>
    <c:forEach var="topping" items="${toppings}">
        <li>${topping.name} ${topping.price}</li>
    </c:forEach>
    </tbody>
</table>



