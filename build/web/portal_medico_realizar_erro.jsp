<%@page import="aplicacao.TipoExame"%>
<%@page import="java.util.ArrayList"%>
<%@page import="aplicacao.Consulta"%>
<%@page contentType="text/html" pageEncoding="UTF-8" import="aplicacao.Medico" %>

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
        <% 
            Object logado = session.getAttribute("log");
        if (logado != null){
            String aux = (String) logado;
            
            if(aux.equals("log_paciente")){
                response.sendRedirect("portal_paciente.jsp");}
            else if(aux.equals("log_administrador")){
                response.sendRedirect("portal_administrador.jsp");
            }
            else if(aux.equals("log_medico")){ %>
        
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
                      <a class="nav-link active" href="ListaConsultas">Ver Consultas</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link active" href="ListaConsultasRealizar">Realizar Consulta</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link active" href="ListaConsultasEditar">Editar Consulta</a>
                    </li>
                  </ul>
                  <span class="navbar-text">
                    <a class="nav-link active" href="ProcessaLogout">
                        <button type="button" class="btn btn-primary">Logout</button>
                    </a>
                  </span>
                </div>
              </div>
            </nav>

            <div class="container">
                <div class="row align-items-start">
                  <div class="col">
                    <div class="info_user">
                        
                        <h1 style="margin-top: 35px; margin-bottom:-15px;">Realizar a consulta:</h1>
                        
                        <br>
                        
                        <div class="alert alert-danger d-flex align-items-center" role="alert">
                            <div>
                              Ops! Erro interno ao realizar a consulta.
                            </div>
                        </div>
                    </div>
                  </div>
                </div>
            </div>
                    
        <%}
        else{response.sendRedirect("login_restrito.html");}
        }else{response.sendRedirect("login_restrito.html");}%>
            <%--<jsp:forward page="login_restrito"/>--%>
        
        <script src="bootstrap/bootstrap.bundle.min.js"></script>
    </body>
</html>
