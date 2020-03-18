<%@ page import="FunctionLayer.UserList" %>
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

<%!

    @Override
    public void jspInit() {
        UserList.initUserList();
    }

%>

<%

    request.setAttribute("userList", UserList.getUserList());

%>

<table class="table mt-4">
    <thead>
    <tr>
        <th scope="col">Bruger ID</th>
        <th scope="col">Navn</th>
        <th scope="col">Email</th>
        <th scope="col">Ordrehistorik</th>
        <th scope="col">Rediger kunde</th>

    <a href="FrontController?taget=redirect&destination=editUser" class="stretched-link">Rediger kunnde</a>
        <br>
    <a href="FrontController?taget=redirect&destination=orderHistory" class="stretched-link">Orderhistorik</a>
    </tr>
    </thead>
    <tbody>
    <tr></tr>
    <c:forEach var="userList" items="${userList}">
        <li>${userList.id} ${userList.name} ${userList.email}</li>
    </c:forEach>
    </tbody>
</table>



