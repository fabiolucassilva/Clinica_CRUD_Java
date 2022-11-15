<%@page contentType="text/html" pageEncoding="UTF-8" import="aplicacao.Paciente" %>

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
            
            if(aux.equals("log_medico")){
                response.sendRedirect("portal_medico.jsp");}
        
            else if(aux.equals("log_paciente")){ %>
        
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
              <div class="container-fluid">
                <a class="navbar-brand" href="#">CLÍNICA GERAL</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
                  <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarText">
                  <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                      <a class="nav-link active" aria-current="page" href="portal_paciente.jsp">Perfil Cliente</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link active" href="#">Listar Consulta</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link active" href="#">Marcar Consulta</a>
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
                    <div class="info-user">
                        <%Paciente pacienteLogado = (Paciente) session.getAttribute("paciente");%>
                        <h1>Bem vindo(a), <%out.println(pacienteLogado.getNome());%></h1>
                        
                        <BR>
                        
                        <h3>DADOS CADASTRAIS:</h3>
                        
                        <BR>
                        
                        <p>
                            ID: <%out.println(pacienteLogado.getId());%>
                        </p>
                        <p>
                            NOME: <%out.println(pacienteLogado.getNome());%>
                        </p>
                        <p>
                            CPF: <%out.println(pacienteLogado.getCpf());%>
                        </p>
                        <p>
                            FUNÇÃO: Paciente
                        </p>
                        <p>
                            AUTORIZADO: <%out.println(pacienteLogado.getAutorizado());%>
                        </p>
                        <p>
                            ID TIPO PLANO: <%out.println(pacienteLogado.getTipoPlano());%>
                        </p>
                        
                    </div>
                  </div>
                </div>
            </div>
                        
        <%}else{response.sendRedirect("login_restrito.html");}
        }else{response.sendRedirect("login_restrito.html");}%>
            <%--<jsp:forward page="login_restrito"/>--%>
        
        <script src="bootstrap/bootstrap.bundle.min.js"></script>
    </body>
</html>

