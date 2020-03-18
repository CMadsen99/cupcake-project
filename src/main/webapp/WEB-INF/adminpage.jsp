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
        <td><a href="FrontController?taget=redirect&destination=orderHistory" class="btn btn-primary btn-lg active" role="button" aria-pressed="true">Orderhistorik</a></td>
        <td><a href="FrontController?taget=redirect&destination=editUser" class="btn btn-primary btn-lg active" role="button" aria-pressed="true">Rediger kunde</a></td>
    </tr>
</c:forEach>
    </tbody>
</table>


