<%@page import="aplicacao.TipoPlano"%>
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
                      <a class="nav-link active" href="#">Cadastrar Tipos de Plano de Saúde</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link active" href="ListaEspecialidades">Cadastrar as Especialidades Médicas</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link active" href="ListaMedicoEConsulta">Visualizar consultas</a>
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
                        <h1 style="margin-top: 35px; margin-bottom:-15px;">Cadastrar Tipo de Planos de Saúde:</h1>
                        
                        <br>
                        
                        <div class="container">
                            <div class="row align-items-start">
                              <div class="col">
                                <div class="info-user">
                                    <h3 style="margin-top: 35px; margin-bottom:15px;">Lista de Tipos de Planos de Saúde:</h3>

                                    <br>

                                    <%
                                    ArrayList<TipoPlano> ListaTipoPlano = (ArrayList<TipoPlano>) request.getAttribute("listaTipoPlanos");
                                    
                                    if(ListaTipoPlano.size()>0){
                                    %>

                                    <div class="table-responsive">
                                        <table class="table">
                                            <thead>
                                              <tr>
                                                <th scope="col">ID</th>
                                                <th scope="col">DESCRIÇÃO</th>
                                              </tr>
                                            </thead>
                                            <tbody>
                                              <%
                                                  for(int i = 0; i < ListaTipoPlano.size() ; i++){
                                                      TipoPlano tipoPlano = ListaTipoPlano.get(i);
                                              %>
                                              <tr>
                                                <th scope="row"> <%out.print(tipoPlano.getId());%> </th>
                                                <td> <%out.print(tipoPlano.getDesc());%></td>
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
                                            Não existe nenhum tipo de plano de saúde cadastrado.
                                        </div>
                                      <%}%>

                                </div>
                              </div>
                            </div>
                        </div>
                        
                        <div class="container">
                            <div class="row align-items-start">
                              <div class="col">
                                <div class="info-user">
                                    <h3 style="margin-top: 35px; margin-bottom:15px;">Inserir novo Tipo de Plano de Saúde:</h3>

                                    <form action="" method="POST" class="formulario">
                                        <div class="mb-3">
                                            <label for="nome" class="form-label">Nome*</label>
                                            <input type="text" name="nome" class="form-control" required>
                                        </div>
                                        <div class="mb-3">
                                            <label for="crm" class="form-label">Descrição*</label>
                                            <input type="text" name="crm" class="form-control" required>
                                        </div>
                                        <div>
                                            <input type="submit" value="Inserir" class="btn btn-primary">
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
                                    <h3 style="margin-top: 35px; margin-bottom:15px;">Editar Tipo de Plano de Saúde:</h3>

                                    <form action="" method="POST" class="formulario">
                                        <div class="mb-3">
                                            <label for="funcao" class="form-label">Escolha o Tipo de Plano de Saúde a ser Editado*</label>
                                            <select class="form-select" name="IdMedico" aria-label="Default select example" required>
                                                <option selected disabled value="">Escolha uma opção</option>
                                                <%
                                                if(ListaTipoPlano.size()>0){

                                                  for(int i = 0; i < ListaTipoPlano.size() ; i++){
                                                      TipoPlano tipoPlano = ListaTipoPlano.get(i);
                                                %>
                                                <option value="<%out.print(tipoPlano.getId());%>">ID <%out.print(tipoPlano.getId());%> (<%out.print(tipoPlano.getDesc());%>)</option>
                                                    <%}
                                                }%>

                                            </select>
                                        </div>
                                        <div class="mb-3">
                                            <label for="nome" class="form-label">Nome*</label>
                                            <input type="text" name="nome" class="form-control" required>
                                        </div>
                                        <div class="mb-3">
                                            <label for="crm" class="form-label">Descrição*</label>
                                            <input type="text" name="crm" class="form-control" required>
                                        </div>
                                        <div>
                                            <input type="submit" value="Editar" class="btn btn-primary">
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
                                    <h3 style="margin-top: 35px; margin-bottom:15px;">Excluir Tipo de Plano de Saúde:</h3>

                                    <form action="" method="POST" class="formulario">
                                        <div class="mb-3">
                                            <label for="funcao" class="form-label">Escolha o Tipo de Plano de Saúde a ser Excluido*</label>
                                            <select class="form-select" name="IdMedico" aria-label="Default select example" required>
                                                <option selected disabled value="">Escolha uma opção</option>
                                                <%
                                                if(ListaTipoPlano.size()>0){

                                                  for(int i = 0; i < ListaTipoPlano.size() ; i++){
                                                      TipoPlano tipoPlano = ListaTipoPlano.get(i);
                                                %>
                                                <option value="<%out.print(tipoPlano.getId());%>">ID <%out.print(tipoPlano.getId());%> (<%out.print(tipoPlano.getDesc());%>)</option>
                                                    <%}
                                                }%>

                                            </select>
                                        </div>
                                        <div>
                                            <input type="submit" value="Excluir" class="btn btn-primary">
                                        </div>
                                    </form>
                                    
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

