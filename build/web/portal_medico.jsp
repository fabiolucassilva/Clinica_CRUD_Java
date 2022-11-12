<%-- 
    Document   : portal_paciente
    Created on : 12/11/2022, 03:27:02
    Author     : Fábio Lucas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Clínica Geral</title>
        <link href="bootstrap/bootstrap.min.css" rel="stylesheet">
        <link href="css/estilo.css" rel="stylesheet">
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
          <div class="container-fluid">
            <a class="navbar-brand" href="#">CLÍNICA GERAL</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
              <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarText">
              <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                  <a class="nav-link active" aria-current="page" href="portal_medico.jsp">Perfil Médico</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link active" href="#">Ver Consultas</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link active" href="#">Realizar Consulta</a>
                </li>
              </ul>
              <span class="navbar-text">
                <a class="nav-link active" href="login.html">
                    <button type="button" class="btn btn-primary" href="index.html">Logout</button>
                </a>
              </span>
            </div>
          </div>
        </nav>
        
        <div class="container">
            <div class="row align-items-start">
              <div class="col">
                <div class="info-user">
                    <h1>PACIENTE</h1>
                    <p>
                        CPF: 
                        <%out.println(request.getAttribute("cpfrecebido"));%>
                    </p>
                    <p>
                        SENHA: 
                        <%out.println(request.getAttribute("senharecebido"));%>
                    </p>
                    <p>
                        FUNÇÃO: 
                        <%out.println(request.getAttribute("funcaorecebido"));%>
                    </p>
                </div>
              </div>
            </div>
        </div>
        
        <script src="bootstrap/bootstrap.bundle.min.js"></script>
    </body>
</html>
