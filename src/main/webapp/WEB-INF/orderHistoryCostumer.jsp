<%@ page import="FunctionLayer.Toppings" %>
<%@ page import="FunctionLayer.Bottoms" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<title>Cupcake projekt</title>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<c:choose>
    <c:when test="${sessionScope.role=='admin'}">
        <%@include file="../includes/headeradmin.inc" %>
    </c:when>
    <c:otherwise>
        <%@include file="../includes/headercostumer.inc" %>
    </c:otherwise>
</c:choose>


<h1 class="text-center mt-4">Ordre historik</h1>

<table class="table">
    <thead>
    <tr>
        <th scope="col">Ordre ID</th>
        <th scope="col">Cost</th>
        <th scope="col">Paid</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="orderListCustomer" items="${sessionScope.orderListCustomer}">
        <%!%>
        <tr>
            <th scope="row">${orderListCustomer.order_id}</th>
            <td>${orderListCustomer.cost}</td>
            <td>${orderListCustomer.paid}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>

<%@include file="../includes/footer.jsp" %>