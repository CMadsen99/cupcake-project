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
order history
<br>
<c:forEach var="orderList" items="${sessionScope.orderList}">
    ${orderList.order_id} ${orderList.user_id} ${orderList.cost} ${orderList.paid}
    <br>
</c:forEach>
</body>
</html>
