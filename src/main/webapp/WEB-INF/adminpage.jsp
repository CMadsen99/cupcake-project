<%@ page import="FunctionLayer.UserList" %>
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

<%!

    @Override
    public void jspInit() {
        UserList.initUserList();
    }

%>

<%

    request.setAttribute("userList", UserList.getUserList());

%>

<table class="table">
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
    <c:forEach var="userList" items="${userList}">

        <tr>
            <th scope="row">${userList.id}</th>
            <td>${userList.name}</td>
            <td>${userList.email}</td>
            <td>
                <form name="orderview" action="FrontController" method="POST">
                    <input type="hidden" name="taget" value="orderview">
                    <input type="hidden" name="idOrder" value="${userList.id}">

                    <input type="submit" value="Ordrehistorik">
                </form>
            </td>
            <td>
                <form name="editPage" action="FrontController" method="POST">
                    <input type="hidden" name="taget" value="editPage">
                    <input type="hidden" name="idEdit" value="${userList.id}">

                    <input type="submit" value="Rediger kunde">
                </form>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>

<%@include file="../includes/footer.jsp" %>
