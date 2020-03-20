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



<form name="cupcake" method="post" action="#">
    <div class="btn-group">
        <select name="topping" class="mdb-select md-form">
            <option value="" disabled selected>Vælg din Topping</option>
            <c:forEach var="topping" items="${toppings}">
                <option value="${topping.name} ${topping.price}" datatype="${topping.price}"">${topping.name} ${topping.price}</option>
            </c:forEach>
        </select>
    </div><!-- /btn-group -->


    <div class="btn-group">
        <select name="bottom" class="mdb-select md-form">
            <option value="" disabled selected>Vælg din Bund</option>
            <c:forEach var="bottom" items="${bottoms}">
                <option value="${bottom.name} ${bottom.price}" datatype="${bottom.price}"">${bottom.name} ${bottom.price}</option>
            </c:forEach>
        </select>

        <div class="btn-group">
            <select name="quantity" class="mdb-select md-form">
                <option value="" disabled selected>Vælg Antal</option>
                <option value="1">1</option>
                <option value="2">2</option>
                <option value="3">3</option>
                <option value="4">4</option>
                <option value="5">5</option>
                <option value="6">6</option>
                <option value="7">7</option>
                <option value="8">8</option>
                <option value="9">9</option>
                <option value="10">10</option>
            </select>
        </div>
        <br>
    <input type="submit" name="submit" value="Select cupcake"/>



    <%
        String top=request.getParameter("topping");
        String bottom=request.getParameter("bottom");
        String quantity =request.getParameter("quantity");
        if (top + bottom !=null)
        {
            out.println("Selected Cupcake is : " + top + " " + bottom + " " + quantity  );
        } else {
            out.println("du har ikke valgt nogle cupcake");
        }
    %>
</div><!-- /btn-group -->
</form>



<c:if test = "${requestScope.error!= null}" >

    <h2>Error ! </h2>
    ${requestScope.error}

</c:if>

<%@include file="includes/footer.jsp"%>