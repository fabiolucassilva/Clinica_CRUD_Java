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
                      <a class="nav-link active" href="#">Cadastrar Administradores</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link active" href="ListaTiposPlanos">Cadastrar Tipos de Plano de Saúde</a>
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
                        <h1 style="margin-top: 35px; margin-bottom:-15px;">Cadastrar Administrador:</h1>
                        
                        <br>
                        
                        <div class="container">
                            <div class="row align-items-start">
                              <div class="col">
                                <div class="info-user">
                                    <h3 style="margin-top: 35px; margin-bottom:15px;">Lista de Administrador:</h3>

                                    <br>

                                    <%
                                    ArrayList<Administrador> ListaAdministrador = (ArrayList<Administrador>) request.getAttribute("listaAdministradores");
                                    
                                    if(ListaAdministrador.size()>0){
                                    %>

                                    <div class="table-responsive">
                                        <table class="table">
                                            <thead>
                                              <tr>
                                                <th scope="col">ID</th>
                                                <th scope="col">NOME</th>
                                                <th scope="col">CPF</th>
                                              </tr>
                                            </thead>
                                            <tbody>
                                              <%
                                                  for(int i = 0; i < ListaAdministrador.size() ; i++){
                                                      Administrador adm = ListaAdministrador.get(i);
                                              %>
                                              <tr>
                                                <th scope="row"> <%out.print(adm.getId());%> </th>
                                                <td> <%out.print(adm.getNome());%></td>
                                                <td> <%out.print(adm.getCpf());%> </td>
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
                                            Não existe nenhum paciente cadastrado.
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
                                    <h3 style="margin-top: 35px; margin-bottom:15px;">Inserir novo Administrador:</h3>

                                    <form action="" method="POST" class="formulario">
                                        <div class="mb-3">
                                            <label for="nome" class="form-label">Nome*</label>
                                            <input type="text" name="nome" class="form-control" required>
                                        </div>
                                        <div class="mb-3">
                                            <label for="crm" class="form-label">CPF*</label>
                                            <input type="text" name="crm" class="form-control" required>
                                        </div>
                                        <div class="mb-3">
                                            <label for="senha" class="form-label">Senha*</label>
                                            <input type="password" name="senha" class="form-control" required>
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
                                    <h3 style="margin-top: 35px; margin-bottom:15px;">Editar Administrador:</h3>

                                    <form action="" method="POST" class="formulario">
                                        <div class="mb-3">
                                            <label for="funcao" class="form-label">Escolha o paciente a ser Editado*</label>
                                            <select class="form-select" name="IdMedico" aria-label="Default select example" required>
                                                <option selected disabled value="">Escolha uma opção</option>
                                                <%
                                                if(ListaAdministrador.size()>0){

                                                  for(int i = 0; i < ListaAdministrador.size() ; i++){
                                                      Administrador adm = ListaAdministrador.get(i);
                                                %>
                                                <option value="<%out.print(adm.getId());%>">ID <%out.print(adm.getId());%> (<%out.print(adm.getCpf());%> - <%out.print(adm.getNome());%>)</option>
                                                    <%}
                                                }%>

                                            </select>
                                        </div>
                                        <div class="mb-3">
                                            <label for="nome" class="form-label">Nome*</label>
                                            <input type="text" name="nome" class="form-control" required>
                                        </div>
                                        <div class="mb-3">
                                            <label for="crm" class="form-label">CPF*</label>
                                            <input type="text" name="crm" class="form-control" required>
                                        </div>
                                        <div class="mb-3">
                                            <label for="senha" class="form-label">Senha*</label>
                                            <input type="password" name="senha" class="form-control" required>
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
                                    <h3 style="margin-top: 35px; margin-bottom:15px;">Excluir Administrador:</h3>

                                    <form action="" method="POST" class="formulario">
                                        <div class="mb-3">
                                            <label for="funcao" class="form-label">Escolha o administrador a ser Excluido*</label>
                                            <select class="form-select" name="IdMedico" aria-label="Default select example" required>
                                                <option selected disabled value="">Escolha uma opção</option>
                                                <%
                                                if(ListaAdministrador.size()>0){

                                                  for(int i = 0; i < ListaAdministrador.size() ; i++){
                                                      Administrador adm = ListaAdministrador.get(i);
                                                %>
                                                <option value="<%out.print(adm.getId());%>">ID <%out.print(adm.getId());%> (<%out.print(adm.getCpf());%> - <%out.print(adm.getNome());%>)</option>
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

