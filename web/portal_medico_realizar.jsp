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
                        
                        <%
                        ArrayList<Consulta> ListaConsulta = (ArrayList<Consulta>) request.getAttribute("listaConsultas");
                        
                        if(ListaConsulta.size()>0){
                        %>
                        
                        <form action="MarcaConsulta" method="POST" class="formulario">
                        
                            <div class="mb-3">
                                <label for="funcao" class="form-label">Id da Consulta que será realizada (data)*</label>
                                <select class="form-select" name="IdConsulta" aria-label="Default select example" required>
                                    <option selected disabled >Escolha uma opção</option>
                                    <%
                                    if(ListaConsulta.size()>0){
                                        
                                      for(int i = 0; i < ListaConsulta.size() ; i++){
                                          Consulta consult = ListaConsulta.get(i);
                                    %>
                                    <option value="<%out.print(consult.getId());%>"><%out.print(consult.getId());%> (<%out.print(consult.getData());%>)</option>
                                        <%}
                                    }%>
                                    
                                </select>
                            </div>
                            
                            <div class="mb-3">
                                <label for="funcao" class="form-label">Exame da Consulta que será realizada*</label>
                                <select class="form-select" name="IdTipoExame" aria-label="Default select example" required>
                                    <option selected disabled value="">Escolha uma opção</option>
                                    <%
                                    ArrayList<TipoExame> ListaTipoExame = (ArrayList<TipoExame>) request.getAttribute("listaTipoExame");
                        
                                    if(ListaTipoExame.size()>0){
                                        
                                      for(int i = 0; i < ListaTipoExame.size() ; i++){
                                          TipoExame tipoExame = ListaTipoExame.get(i);
                                    %>
                                    <option value="<%out.print(tipoExame.getId());%>"><%out.print(tipoExame.getDesc());%></option>
                                        <%}
                                    }%>
                                </select>
                            </div>
                            
                            <div class="mb-3">
                                <label for="desc" class="form-label">Descrição da Consulta que será realizada*</label>
                                <input type="text" name="desc" class="form-control" required>
                            </div>

                            <div>
                                <input type="submit" value="Realizar a consulta" class="btn btn-primary">
                            </div>
                            
                        </form>
                        
                        <%Medico pacienteLogado = (Medico) session.getAttribute("medico");%>
                        <h3 style="margin-top: 35px; margin-bottom:15px;">Consultas ainda não realizadas do(a) Médico(a) <%out.println(pacienteLogado.getNome());%>:</h3>
                        
                        <Br>
                        
                        <div class="table-responsive">
                            <table class="table">
                                <thead>
                                  <tr>
                                    <th scope="col">ID</th>
                                    <th scope="col">DATA</th>
                                    <th scope="col">DESCRIÇÃO</th>
                                    <th scope="col">REALIZADA</th>
                                    <th scope="col">ID MÉDICO</th>
                                    <th scope="col">ID PACIENTE</th>
                                  </tr>
                                </thead>
                                <tbody>
                                  <%
                                      for(int i = 0; i < ListaConsulta.size() ; i++){
                                          Consulta consul = ListaConsulta.get(0);
                                  %>
                                  <tr>
                                    <th scope="row"> <%out.print(consul.getId());%> </th>
                                    <td> <%out.print(consul.getData());%></td>
                                    <td> <%out.print(consul.getDesc());%> </td>
                                    <td> <%out.print(consul.getRealizada());%> </td>
                                    <td> <%out.print(consul.getIdMedico());%> </td>
                                    <td> <%out.print(consul.getIdPaciente());%> </td>
                                  </tr>
                                  <%
                                    }
                                  %>
                                </tbody>
                              </table>
                          </div>
                          <%    
                          }else{%>
                            <div class="alert alert-primary" role="alert" style="margin-top: 35px;">
                                Você não possui nenhuma consulta para ser realizada.
                            </div>
                          <%}%>
                          
                          <br>
                          <br>
                        
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
