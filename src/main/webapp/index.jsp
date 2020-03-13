<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="includes/header.inc"%>


<h1 class="text-center">BMI beregner</h1>

<div class="row">

    <div class="col-lg-4"></div>

    <div class="col-lg-4">

        Her er et link til <a class="mb-4 mt-4" href="FrontController?height=170&weight=65&taget=resultat">resultatsiden</a>

        <form action="FrontController" method="post">

            <input type="hidden" name="taget" value="resultat"/>

            <div class="form-group">
                <label for="height">Indtast din højde i cm:</label>
                <input type="text" name="height" class="form-control" id="height" aria-describedby="heightHelp">
                <small id="heightHelp" class="form-text text-muted">Husk det er centimeter!!!</small>
            </div>
            <div class="form-group">
                <label for="weight">Indtast din vægt i kg:</label>
                <input type="text" name="weight" class="form-control" id="weight">
            </div>

            <div class="text-center">
                <button type="submit" class="btn btn-primary mt-4">Beregn BMI</button>
            </div>
        </form>
    </div>

    <div class="col-lg-4"></div>

</div>  <!-- row -->


<%@include file="includes/footer.inc"%>