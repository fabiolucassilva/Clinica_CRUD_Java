<%-- 
    Document   : login
    Created on : 13/11/2022, 03:46:04
    Author     : Fábio Lucas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Formulário</title>
        <link href="bootstrap/bootstrap.min.css" rel="stylesheet">
        <link href="css/estilo.css" rel="stylesheet">
        
        <script>
            function mascara_cpf(){
                var cpf = document.getElementById('cpf');
                if(cpf.value.length === 3 || cpf.value.length === 7){
                    cpf.value += ".";
                }else if(cpf.value.length === 11){
                    cpf.value += "-";
                }
            }
        </script>
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
                  <a class="nav-link active" aria-current="page" href="index.html">Página Inicial</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link active" href="contato.html">Contato</a>
                </li>
              </ul>
              <span class="navbar-text">
                <a class="nav-link active" href="index.html">
                    <button type="button" class="btn btn-primary">Voltar</button>
                </a>
              </span>
            </div>
          </div>
        </nav>

        <div class="container">
            <form action="ProcessaLogin" method="POST" class="formulario">
                <div class="mb-3">
                    <label for="cpf" class="form-label">CPF*</label>
                    <input type="text" maxlength ="14" name="cpf" id="cpf" class="form-control" onkeyup="mascara_cpf()" required>
                </div>
                <div class="mb-3">
                    <label for="senha" class="form-label">Senha*</label>
                    <input type="password" name="senha" class="form-control" required>
                </div>
                <div class="mb-3">
                    <label for="funcao" class="form-label">Função*</label>
                    <select class="form-select" name="funcao" aria-label="Default select example" required>
                        <option selected disabled value="">Escolha uma opção</option>
                        <option value="1">Paciente</option>
                        <option value="2">Médico</option>
                        <option value="3">Administrador</option>
                    </select>
                </div>
                
                <% Object logado = session.getAttribute("log");
                if(logado != "paciente" || logado != "medico"){%>
                    <div class="alert alert-primary" role="alert">
                        O Logout foi realizado com sucesso
                    </div>
                <%}%>
                    <div>
                        <input type="submit" value="Entrar" class="btn btn-primary">
                    </div>
                
            </form>
            <%--<%Object logado = session.getAttribute("log");
              out.println(logado);%>--%>
        </div>

        <script src="bootstrap/bootstrap.bundle.min.js"></script>
        
    </body>

</html>
