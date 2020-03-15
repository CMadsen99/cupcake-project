<title>Cupcake projekt</title>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="includes/header.inc"%>


<h1 class="text-center mt-4">Login her:</h1>



<div class="row">

    <div class="col-lg-4"></div>

    <div class="col-lg-4">


        <form action="FrontController" method="post">

            <input type="hidden" name="taget" value="resultat"/>

            <div class="form-group">
                <label for="email">intast e-mail:</label>
                <input type="text" name="email" class="form-control" id="email">

            </div>
            <div class="form-group">
                <label for="passsword">intast password:</label>
                <input type="password" name="password" class="form-control" id="passsword">
            </div>

            <div style="text-align: center">
                Hvis du ikke er medlem  <a href="signUp.jsp" class="button large hpbottom">registrer her:</a>
            </div>

            <div class="text-center">
                <button type="submit" class="btn btn-primary mt-4">Login</button>
            </div>
        </form>
    </div>

    <div class="col-lg-4"></div>

</div>  <!-- row -->


<%@include file="includes/footer.inc"%>