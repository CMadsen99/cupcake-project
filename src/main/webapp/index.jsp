<%@ page import="FunctionLayer.Toppings" %>
<%@ page import="FunctionLayer.Bottoms" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<title>Cupcake projekt</title>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<c:choose>
    <c:when test="${sessionScope.role=='admin'}">
        <%@include file="includes/headeradmin.inc"%>
    </c:when>
    <c:otherwise>
        <%@include file="includes/headercostumer.inc"%>
    </c:otherwise>
</c:choose>




<%!

    @Override
    public void jspInit() {
        Toppings.initToppings();
        Bottoms.initToppings();
    }

%>

<%

    request.setAttribute("toppings", Toppings.getToppings());
    request.setAttribute("bottoms", Bottoms.getBottoms());

%>


<h1 class="text-center mt-4">Velkommen til Olskers Cupcakes</h1>

<ul>
    <c:forEach var="topping" items="${toppings}">
        <li>${topping.name} ${topping.price}</li>
    </c:forEach>
</ul>

${sessionScope.role}



<div class="btn-group">
    <button type="button" class="btn btn-outline-dark dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Vælg bund</button>
    <div class="dropdown-menu">
        <a class="dropdown-item" href="#">Action</a>
        <a class="dropdown-item" href="#">Another action</a>
        <a class="dropdown-item" href="#">Something else here</a>
        <div class="dropdown-divider"></div>
        <a class="dropdown-item" href="#">Separated link</a>
    </div>
</div><!-- /btn-group -->


<div class="btn-group">
    <button type="button" class="btn btn-outline-dark dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Vælg topping</button>
    <div class="dropdown-menu">
        <a class="dropdown-item" href="#">Action</a>
        <a class="dropdown-item" href="#">Another action</a>
        <a class="dropdown-item" href="#">Something else here</a>
        <div class="dropdown-divider"></div>
        <a class="dropdown-item" href="#">Separated link</a>
    </div>
</div><!-- /btn-group -->

<div class="btn-group">
    <button type="button" class="btn btn-outline-dark dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Vælg antal</button>
    <div class="dropdown-menu">
        <a class="dropdown-item" href="#">Action</a>
        <a class="dropdown-item" href="#">Another action</a>
        <a class="dropdown-item" href="#">Something else here</a>
        <div class="dropdown-divider"></div>
        <a class="dropdown-item" href="#">Separated link</a>
    </div>
</div><!-- /btn-group -->


<c:if test = "${requestScope.error!= null}" >

    <h2>Error ! </h2>
    ${requestScope.error}

</c:if>

<%@include file="includes/footer.jsp"%>