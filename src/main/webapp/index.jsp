<%@ page import="FunctionLayer.Toppings" %>
<%@ page import="FunctionLayer.Bottoms" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<title>Cupcake projekt</title>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<c:choose>
    <c:when test="${sessionScope.role=='admin'}">
        <%@include file="includes/headeradmin.inc" %>
    </c:when>
    <c:otherwise>
        <%@include file="includes/headercostumer.inc" %>
    </c:otherwise>
</c:choose>


<%!

    @Override
    public void jspInit() {
        Toppings.initToppings();
        Bottoms.initBottoms();
    }

%>

<%

    request.setAttribute("toppings", Toppings.getToppings());
    request.setAttribute("bottoms", Bottoms.getBottoms());

%>


<h1 class="text-center mt-4">Velkommen til Olskers Cupcakes</h1>

<h2 class="text-centet mt-4">${requestScope.ordered}</h2>


<form class="mt-4" name="cupcakeBasket" method="POST" action="FrontController">
    <input type="hidden" name="taget" value="cupcakeBasket">

    <table class="text-center mt-4" style="width:100%">
        <th>
        <th>
            <div class="btn-group mt-4">
                <select name="topping" class="mdb-select md-form">
                    <option value="" disabled selected>Vælg din Topping</option>
                    <c:forEach var="topping" items="${toppings}">
                        <option value="${topping.topping_id}" datatype="${topping.price}">${topping.name}
                            Pris: ${topping.price}</option>
                    </c:forEach>
                </select>
            </div>
        </th> <!-- antal bestemmelse med hvor mange ting der er i kurv -->
        <th>
            <div class="btn-group mt-4">
                <select name="bottom" class="mdb-select md-form">
                    <option value="" disabled selected>Vælg din Bund</option>
                    <c:forEach var="bottom" items="${bottoms}">
                        <option value="${bottom.bottom_id}" datatype="${bottom.price}">${bottom.name}
                            Pris: ${bottom.price}</option>
                    </c:forEach>
                </select>
            </div>
        </th>
        <th>
            <div class="btn-group mt-4">
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
        </th>
        <th><input class="mt-4" type="submit" name="submit" value="Vælg cupcake"/></th>
        <th>
            <div class="mt-4"> ${requestScope.selection}</div>
        </th>
        </th>
    </table>


    </div><!-- /btn-group -->
</form>

<c:if test="${requestScope.error!= null}">

    <h2>Error ! </h2>
    ${requestScope.error}

</c:if>

<%@include file="includes/footer.jsp" %>