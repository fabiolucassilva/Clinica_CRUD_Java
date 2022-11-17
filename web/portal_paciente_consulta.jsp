<%@page import="aplicacao.Medico"%>
<%@page import="java.util.ArrayList"%>
<%@page import="aplicacao.Consulta"%>
<%@page import="aplicacao.Consulta"%>
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
                      <a class="nav-link active" href="ListaConsultas">Listar Consulta</a>
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
                        <h1 style="margin-top: 35px; margin-bottom:-15px;">Marcar consulta:</h1>
                        
                        <br>
                        
                        <form action="MarcaConsulta" method="POST" class="formulario">
                        
                            <div class="mb-3">
                                <label for="data" class="form-label">Escolha uma data*</label>
                                <input type="date" name="data" class="form-control" required>
                            </div>
                            
                            <div class="mb-3">
                                <label for="hora" class="form-label">Escolha um horário*</label>
                                <input type="time" name="hora" class="form-control" required>
                            </div>
                            <div class="mb-3">
                                <label for="funcao" class="form-label">Escolha um Médico (Escpecialidade)*</label>
                                <select class="form-select" aria-label="Default select example" required>
                                    <option selected disabled value="">Escolha uma opção</option>
                                    <%
                                    ArrayList<Medico> ListaMedico = (ArrayList<Medico>) request.getAttribute("listaMedicos");

                                    if(ListaMedico.size()>0){
                                    
                                      for(int i = 0; i < ListaMedico.size() ; i++){
                                          Medico medic = ListaMedico.get(i);
                                    %>
                                    <option value="<%medic.getId();%>"><%out.print(medic.getNome());%> (<%out.print(medic.getTipoEspecialidade());%>)</option>
                                        <%}
                                    }%>
                                    
                                </select>
                            </div>

                            <div>
                                <input type="submit" value="Marcar consulta" class="btn btn-primary">
                            </div>
                            
                        </form>
                        
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

