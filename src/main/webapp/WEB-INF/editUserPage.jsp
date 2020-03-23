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

Se kundens balance:
<form name="showBalance" action="FrontController" method="POST">
    <input type="hidden" name="taget" value="showBalance">
    <input type="hidden" name="IDUser1" value="${sessionScope.userID}">
    <input type="submit" value="Tryk her">
</form>

${requestScope.msgBalance}${requestScope.balance}
<br>

Tilføj penge til kundens konto
<br>
<br>
${requestScope.msg}

<form name="edit" action="FrontController" method="POST">
    <input type="hidden" name="taget" value="edit">
    <input type="hidden" name="IDUser2" value="${sessionScope.userID}">
    Indtast beløb:<br>
    <input type="number" name="amount">
    <br>

    <input type="submit" value="Tilføj">
</form>

<%@include file="../includes/footer.jsp" %>
