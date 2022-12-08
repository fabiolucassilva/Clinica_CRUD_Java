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
                      <a class="nav-link active" href="#">Cadastrar Médico</a>
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
                        <h1 style="margin-top: 35px; margin-bottom:-15px;">Cadastrar Médico:</h1>
                        
                        <br>
                        
                        <div class="container">
                            <div class="row align-items-start">
                              <div class="col">
                                <div class="info-user">
                                    <h3 style="margin-top: 35px; margin-bottom:15px;">Lista de Médicos:</h3>

                                    <br>

                                    <%
                                    ArrayList<Medico> ListaMedico = (ArrayList<Medico>) request.getAttribute("listaMedicos");
                                    
                                    if(ListaMedico.size()>0){
                                    %>

                                    <div class="table-responsive">
                                        <table class="table">
                                            <thead>
                                              <tr>
                                                <th scope="col">ID</th>
                                                <th scope="col">NOME</th>
                                                <th scope="col">CRM</th>
                                                <th scope="col">ESTADO CRM</th>
                                                <th scope="col">CPF</th>
                                                <th scope="col">AUTORIZADO</th>
                                                <th scope="col">ID ESPECIALIDADE</th>
                                              </tr>
                                            </thead>
                                            <tbody>
                                              <%
                                                  for(int i = 0; i < ListaMedico.size() ; i++){
                                                      Medico medic = ListaMedico.get(i);
                                              %>
                                              <tr>
                                                <th scope="row"> <%out.print(medic.getId());%> </th>
                                                <td> <%out.print(medic.getNome());%></td>
                                                <td> <%out.print(medic.getCrm());%> </td>
                                                <td> <%out.print(medic.getEstadoCrm());%> </td>
                                                <td> <%out.print(medic.getCpf());%> </td>
                                                <td> <%out.print(medic.getAutorizado());%> </td>
                                                <td> <%out.print(medic.getTipoEspecialidade());%> </td>
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
                                            Não existe nenhum médico cadastrado.
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
                                    <h3 style="margin-top: 35px; margin-bottom:15px;">Inserir novo médico:</h3>

                                    <form action="" method="POST" class="formulario">
                                        <div class="mb-3">
                                            <label for="nome" class="form-label">Nome*</label>
                                            <input type="text" name="nome" class="form-control" required>
                                        </div>
                                        <div class="mb-3">
                                            <label for="crm" class="form-label">CRM*</label>
                                            <input type="text" name="crm" class="form-control" required>
                                        </div>
                                        <div class="mb-3">
                                            <label for="estado-crm" class="form-label">Estado CRM*</label>
                                            <select class="form-select" aria-label="Default select example" required>
                                                <option selected disabled value="">Escolha uma opção</option>
                                                <option value="1">AC</option>
                                                <option value="2">AL</option>
                                                <option value="3">AP</option>
                                                <option value="4">AM</option>
                                                <option value="5">BA</option>
                                                <option value="6">CE</option>
                                                <option value="7">DF</option>
                                                <option value="8">ES</option>
                                                <option value="9">GO</option>
                                                <option value="10">MA</option>
                                                <option value="11">MT</option>
                                                <option value="12">MS</option>
                                                <option value="13">MG</option>
                                                <option value="14">PA</option>
                                                <option value="15">PB</option>
                                                <option value="16">PR</option>
                                                <option value="17">PE</option>
                                                <option value="18">PI</option>
                                                <option value="19">RJ</option>
                                                <option value="20">RN</option>
                                                <option value="21">RS</option>
                                                <option value="22">RO</option>
                                                <option value="23">RR</option>
                                                <option value="24">SC</option>
                                                <option value="25">SP</option>
                                                <option value="26">SE</option>
                                                <option value="26">TO</option>
                                            </select>
                                        </div>
                                        <div class="mb-3">
                                            <label for="cpf" class="form-label">CPF*</label>
                                            <input type="text" name="cpf" class="form-control" required>
                                        </div>
                                        <div class="mb-3">
                                            <label for="senha" class="form-label">Senha*</label>
                                            <input type="password" name="senha" class="form-control" required>
                                        </div>
                                        <div class="mb-3">
                                            <label for="funcao" class="form-label">Especialidade*</label>
                                            <select class="form-select" aria-label="Default select example" required>
                                                <option selected disabled value="">Escolha uma opção</option>
                                                <option value="1">Oftamologia</option>
                                                <option value="2">Endocrinologia</option>
                                                <option value="3">Ortopedia</option>
                                            </select>
                                        </div>
                                        <div class="form-check">
                                              <input class="form-check-input" type="checkbox" value="" id="invalidCheck2">
                                              <label class="form-check-label" for="invalidCheck2">
                                                O Médico está autorizado
                                                <br>
                                                <br>
                                              </label>
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
                                    <h3 style="margin-top: 35px; margin-bottom:15px;">Editar médico:</h3>

                                    <form action="" method="POST" class="formulario">
                                        <div class="mb-3">
                                            <label for="funcao" class="form-label">Escolha o médico a ser Editado*</label>
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
                                        <div class="mb-3">
                                            <label for="nome" class="form-label">Nome*</label>
                                            <input type="text" name="nome" class="form-control" required>
                                        </div>
                                        <div class="mb-3">
                                            <label for="crm" class="form-label">CRM*</label>
                                            <input type="text" name="crm" class="form-control" required>
                                        </div>
                                        <div class="mb-3">
                                            <label for="estado-crm" class="form-label">Estado CRM*</label>
                                            <select class="form-select" aria-label="Default select example" required>
                                                <option selected disabled value="">Escolha uma opção</option>
                                                <option value="1">AC</option>
                                                <option value="2">AL</option>
                                                <option value="3">AP</option>
                                                <option value="4">AM</option>
                                                <option value="5">BA</option>
                                                <option value="6">CE</option>
                                                <option value="7">DF</option>
                                                <option value="8">ES</option>
                                                <option value="9">GO</option>
                                                <option value="10">MA</option>
                                                <option value="11">MT</option>
                                                <option value="12">MS</option>
                                                <option value="13">MG</option>
                                                <option value="14">PA</option>
                                                <option value="15">PB</option>
                                                <option value="16">PR</option>
                                                <option value="17">PE</option>
                                                <option value="18">PI</option>
                                                <option value="19">RJ</option>
                                                <option value="20">RN</option>
                                                <option value="21">RS</option>
                                                <option value="22">RO</option>
                                                <option value="23">RR</option>
                                                <option value="24">SC</option>
                                                <option value="25">SP</option>
                                                <option value="26">SE</option>
                                                <option value="26">TO</option>
                                            </select>
                                        </div>
                                        <div class="mb-3">
                                            <label for="cpf" class="form-label">CPF*</label>
                                            <input type="text" name="cpf" class="form-control" required>
                                        </div>
                                        <div class="mb-3">
                                            <label for="senha" class="form-label">Senha*</label>
                                            <input type="password" name="senha" class="form-control" required>
                                        </div>
                                        <div class="mb-3">
                                            <label for="funcao" class="form-label">Especialidade*</label>
                                            <select class="form-select" aria-label="Default select example" required>
                                                <option selected disabled value="">Escolha uma opção</option>
                                                <option value="1">Oftamologia</option>
                                                <option value="2">Endocrinologia</option>
                                                <option value="3">Ortopedia</option>
                                            </select>
                                        </div>
                                        <div class="form-check">
                                              <input class="form-check-input" type="checkbox" value="" id="invalidCheck2">
                                              <label class="form-check-label" for="invalidCheck2">
                                                O Médico está autorizado
                                                <br>
                                                <br>
                                              </label>
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
                                    <h3 style="margin-top: 35px; margin-bottom:15px;">Excluir médico:</h3>

                                    <form action="" method="POST" class="formulario">
                                        <div class="mb-3">
                                            <label for="funcao" class="form-label">Escolha o médico a ser Excluido*</label>
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

