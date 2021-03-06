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
        <th scope="col">Bruger ID</th>
        <th scope="col">Ordrepris</th>
        <th scope="col">Status</th>
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

<%@include file="../includes/footer.jsp" %>