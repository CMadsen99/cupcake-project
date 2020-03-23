<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
          integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
</head>
<body>

<div class="container">

    <img src="images/headbanner.png" class="img-fluid mb-4"/>

<nav class="navbar navbar-expand-lg navbar btn-dark">
      <a class="navbar-brand" href="index.jsp" style="color:white">Forside</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarText">
        <ul class="navbar-nav mr-auto">
           <li class="nav-item">
                      <a class="nav-link" href="FrontController?taget=redirect&destination=adminpage" style="color:white">Kundeoplysninger</a>
                    </li>
            <%if ((session.getAttribute("email") != null)) { %>
             <li style="color:white" class="nav-item dropdown">
                    <a style="color:white" class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                      ${sessionScope.email}
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                      <a style="color:red" class="dropdown-item" href="FrontController?taget=logout&destination=index">Logud</a>
                    </div>
                  </li>
     <% } else { %>
             <li class="nav-item">
            <a class="nav-link" href="FrontController?taget=redirect&destination=signin" style="color:white">Login/Registrer</a>
          </li>
    <% } %>
        </ul>
        <a class="navbar-brand" href="FrontController?taget=redirect&destination=basket">
                 <img src="images/basket.png" alt="basket.jsp">
               </a>
      </div>
    </nav>
