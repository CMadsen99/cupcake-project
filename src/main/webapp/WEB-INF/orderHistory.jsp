<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<title>Cupcake projekt</title>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<c:choose>
    <c:when test="${sessionScope.role=='admin'}">
        <%@include file="../includes/headeradmin.inc"%>
    </c:when>
    <c:otherwise>
        <%@include file="../includes/headercostumer.inc"%>
    </c:otherwise>
</c:choose>
<h1 class="text-center mt-4">Ordre historik</h1>

<table class="table">
    <thead>
    <tr>
        <th scope="col">Order ID</th>
        <th scope="col">Kunde ID</th>
        <th scope="col">Order pirs</th>
        <th scope="col">Betalt</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="orderList" items="${sessionScope.orderList}">
        <%!%>
        <tr>
            <th scope="row">${orderList.order_id}</th>
            <td>${orderList.user_id}</td>
            <td>${orderList.cost}</td>
            <td>${orderList.paid}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>

<br>
<c:forEach var="orderList" items="${sessionScope.orderList}">
    ${orderList.order_id} ${orderList.user_id} ${orderList.cost} ${orderList.paid}
    <br>
</c:forEach>
</body>
</html>
