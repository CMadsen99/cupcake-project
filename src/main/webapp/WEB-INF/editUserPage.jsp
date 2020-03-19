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

Kundens balance er ${sessionScope.balance}
<br>

Tilføj penge til kundens konto
<br>
${sessionScope.msg}
<br>
<form name="edit" action="FrontController" method="POST">
    <input type="hidden" name="taget" value="edit">
    Indtast beløb:<br>
    <input type="number" name="amount">
    <br>

    <input type="submit" value="Submit">
</form>

</body>
</html>
