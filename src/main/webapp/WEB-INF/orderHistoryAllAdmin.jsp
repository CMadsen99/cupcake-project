<%@ page import="FunctionLayer.Toppings" %>
<%@ page import="FunctionLayer.Bottoms" %>
<%@ page import="FunctionLayer.OrderList" %>

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


<table class="table">
    <thead>
    <tr>
        <th scope="col">Ordre ID</th>
        <th scope="col">Bruger ID</th>
        <th scope="col">Ordrepris</th>
        <th scope="col">Status</th>
        <th scope="col">Fjern</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="orderList" items="${sessionScope.orderListAll}">

        <tr>
            <th scope="row">${orderList.order_id}</th>
            <td>${orderList.user_id}</td>
            <td>${orderList.cost}</td>
            <td>${orderList.paid}</td>
            <td>
                <form name="deleteOrder" action="FrontController" method="POST">
                    <input type="hidden" name="taget" value="deleteOrder">
                    <input type="hidden" name="idOrder" value="${orderList.order_id}">

                    <input type="submit" value="Slet ordre">
                </form>
            </td>

        </tr>
    </c:forEach>
    </tbody>
</table>


<%@include file="../includes/footer.jsp" %>

