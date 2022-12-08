<%@page import="aplicacao.Administrador"%>
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
            else if(aux.equals("log_paciente")){
                response.sendRedirect("portal_paciente.jsp");
            }
            else if(aux.equals("log_administrador")){ %>
        
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
              <div class="container-fluid">
                <a class="navbar-brand" href="#">CLÍNICA GERAL</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
                  <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarText">
                  <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                      <a class="nav-link active" aria-current="page" href="portal_administrador.jsp">Perfil do Administrador</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link active" href="ListaMedicos">Cadastrar Médico</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link active" href="ListaPacientes">Cadastrar Pacientes</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link active" href="ListaAdministradores">Cadastrar Administradores</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link active" href="ListaTiposPlanos">Cadastrar Tipos de Plano de Saúde</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link active" href="ListaEspecialidades">Cadastrar as Especialidades Médicas</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link active" href="#">Visualizar consultas</a>
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
                        <%Administrador amdLogado = (Administrador) session.getAttribute("administrador");%>
                        <h1 style="margin-top: 35px; margin-bottom:-15px;">Visualizar consultas:</h1>
                        
                        <%
                                    ArrayList<Medico> ListaMedico = (ArrayList<Medico>) request.getAttribute("listaMedicos");
                                    %>
            <div class="container">
                            <div class="row align-items-start">
                              <div class="col">
                                <div class="info-user">
                                    <h3 style="margin-top: 35px; margin-bottom:15px;">Ver consultas de um médico:</h3>

                                    <form action="ListaConsultas" method="POST" class="formulario">
                                        <div class="mb-3">
                                            <label for="funcao" class="form-label">Escolha o médico para ver as consultas*</label>
                                            <select class="form-select" name="IdMedico" aria-label="Default select example" required>
                                                <option selected disabled value="">Escolha uma opção</option>
                                                <%
                                                if(ListaMedico.size()>0){

                                                  for(int i = 0; i < ListaMedico.size() ; i++){
                                                      Medico medic = ListaMedico.get(i);
                                                %>
                                                <option value="<%out.print(medic.getId());%>">ID <%out.print(medic.getId());%> (<%out.print(medic.getCpf());%> - <%out.print(medic.getNome());%>)</option>
                                                    <%}
                                                }%>

                                            </select>
                                        </div>
                                        <div>
                                            <input type="submit" value="Consultar" class="btn btn-primary">
                                        </div>
                                    </form>
                                    
                                </div>
                              </div>
                            </div>
                        </div>
                        
                        <div class="container">
                            <div class="row align-items-start">
                              <div class="col">
                                <div class="info-user">
                                    <h3 style="margin-top: 35px; margin-bottom:15px;">Todas as consultas:</h3>

                                    <br>

                                    <%
                                        ArrayList<Consulta> ListaConsulta = (ArrayList<Consulta>) request.getAttribute("listaConsultas");
                                    
                                        if(ListaConsulta.size()>0){
                                    %>

                                    <div class="table-responsive">
                                        <table class="table">
                                            <thead>
                                              <tr>
                                                <th scope="col">ID</th>
                                                <th scope="col">DATA</th>
                                                <th scope="col">DESCRIÇÃO</th>
                                                <th scope="col">REALIZADA</th>
                                                <th scope="col">ID MEDICO</th>
                                                <th scope="col">ID PACIENTE</th>
                                              </tr>
                                            </thead>
                                            <tbody>
                                              <%
                                                  for(int i = 0; i < ListaConsulta.size() ; i++){
                                                      Consulta consul = ListaConsulta.get(i);
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
                                        <div class="alert alert-primary" role="alert">
                                            Não existe nenhuma consulta cadastrada.
                                        </div>
                                      <%}%>
                                      <br>
                                </div>
                              </div>
                            </div>
                        </div>
                        
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

