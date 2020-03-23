<%@ page import="FunctionLayer.Toppings" %>
<%@ page import="FunctionLayer.Bottoms" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<title>Cupcake projekt</title>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<c:choose>
    <c:when test="${sessionScope.role=='admin'}">
        <%@include file="includes/headeradmin.inc" %>
    </c:when>
    <c:otherwise>
        <%@include file="includes/headercostumer.inc" %>
    </c:otherwise>
</c:choose>
<h1 class="text-center mt-4">Order historik</h1>

<table class="table">
    <thead>
    <tr>
        <th scope="col">Order ID</th>
        <th scope="col">Topping</th>
        <th scope="col">Bund</th>
        <th scope="col">Pris i alt</th>
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

<%@include file="includes/footer.jsp" %>