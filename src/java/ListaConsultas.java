import aplicacao.Consulta;
import aplicacao.Medico;
import aplicacao.Paciente;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.Integer.parseInt;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(urlPatterns = {"/ListaConsultas"})
public class ListaConsultas extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        
        Object logado = session.getAttribute("log");
        if (logado != null){
            String aux = (String) logado;
            
            int id;
            
            if(aux.equals("log_medico")){
                
                Medico medicoLogado = (Medico) session.getAttribute("medico");
                id = medicoLogado.getId();
                
                Connection conexao = null;
                try {
                    //Carrega o Driver JDBC na memória
                    Class.forName("com.mysql.jdbc.Driver"); //load driver                       
                    //Abre a conexão com o banco de dados via JDBC
                    conexao = DriverManager.getConnection("jdbc:mysql://localhost:3306/clinica", "root", "");

                    String sqlString = "select * from consulta where idmedico = ?";

                    PreparedStatement sql = conexao.prepareStatement(sqlString);
                    sql.setInt(1, id);

                    ResultSet resultado = sql.executeQuery();

                    if (resultado == null) {
                        response.sendRedirect("portal_medico_lista_erro.jsp");
                    }else{

                        ArrayList<Consulta> ListaConsulta = new ArrayList<Consulta> ();

                        while (resultado.next()){
                            Consulta consulta = new Consulta(resultado.getInt("ID"),resultado.getString("DATA"),
                                    resultado.getString("DESCRICAO"), resultado.getString("REALIZADA"),
                                    resultado.getInt("IDMEDICO"), resultado.getInt("IDPACIENTE") );

                            ListaConsulta.add(consulta);
                        }

                        request.setAttribute("listaConsultas", ListaConsulta);

                        RequestDispatcher rd = request.getRequestDispatcher("/portal_medico_lista.jsp");
                        rd.forward(request, response);

                    }
                } catch (ClassNotFoundException ex) {
                    /*Não foi possível encontrar o Driver*/
                    response.sendRedirect("portal_medico_lista_erro.jsp");
                } catch (SQLException ex) {
                    /*Não foi possível conectar ao banco*/
                    response.sendRedirect("portal_medico_lista_erro.jsp");
                }
                
            } else if(aux.equals("log_paciente")){
                
                Paciente pacienteLogado = (Paciente) session.getAttribute("paciente");
                id = pacienteLogado.getId();
                
                Connection conexao = null;
                try {
                    //Carrega o Driver JDBC na memória
                    Class.forName("com.mysql.jdbc.Driver"); //load driver                       
                    //Abre a conexão com o banco de dados via JDBC
                    conexao = DriverManager.getConnection("jdbc:mysql://localhost:3306/clinica", "root", "");

                    String sqlString = "select * from consulta where idpaciente = ?";

                    PreparedStatement sql = conexao.prepareStatement(sqlString);
                    sql.setInt(1, id);

                    ResultSet resultado = sql.executeQuery();

                    if (resultado == null) {
                        response.sendRedirect("portal_paciente_lista_erro.jsp");
                    }else{

                        ArrayList<Consulta> ListaConsulta = new ArrayList<Consulta> ();

                        while (resultado.next()){
                            Consulta consulta = new Consulta(resultado.getInt("ID"),resultado.getString("DATA"),
                                    resultado.getString("DESCRICAO"), resultado.getString("REALIZADA"),
                                    resultado.getInt("IDMEDICO"), resultado.getInt("IDPACIENTE") );

                            ListaConsulta.add(consulta);
                        }

                        request.setAttribute("listaConsultas", ListaConsulta);

                        RequestDispatcher rd = request.getRequestDispatcher("/portal_paciente_lista.jsp");
                        rd.forward(request, response);

                    }
                } catch (ClassNotFoundException ex) {
                    /*Não foi possível encontrar o Driver*/
                    response.sendRedirect("portal_paciente_lista_erro.jsp");
                } catch (SQLException ex) {
                    /*Não foi possível conectar ao banco*/
                    response.sendRedirect("portal_paciente_lista_erro.jsp");
                }
            }
            else if(aux.equals("log_administrador")){
                
                Connection conexao = null;
                try {
                    //Carrega o Driver JDBC na memória
                    Class.forName("com.mysql.jdbc.Driver"); //load driver                       
                    //Abre a conexão com o banco de dados via JDBC
                    conexao = DriverManager.getConnection("jdbc:mysql://localhost:3306/clinica", "root", "");

                    int idMedic = parseInt(request.getParameter("IdMedico"));
                    
                    String sqlString = "select * from consulta where idmedico = ?";

                    PreparedStatement sql = conexao.prepareStatement(sqlString);
                    sql.setInt(1, idMedic);

                    ResultSet resultado = sql.executeQuery();

                    if (resultado == null) {
                        response.sendRedirect("portal_medico_lista_erro.jsp");
                    }else{

                        ArrayList<Consulta> ListaConsulta = new ArrayList<Consulta> ();

                        while (resultado.next()){
                            Consulta consulta = new Consulta(resultado.getInt("ID"),resultado.getString("DATA"),
                                    resultado.getString("DESCRICAO"), resultado.getString("REALIZADA"),
                                    resultado.getInt("IDMEDICO"), resultado.getInt("IDPACIENTE") );

                            ListaConsulta.add(consulta);
                        }

                        request.setAttribute("listaConsultas", ListaConsulta);

                        RequestDispatcher rd = request.getRequestDispatcher("/portal_adm_consulta_medico.jsp");
                        rd.forward(request, response);

                    }
                } catch (ClassNotFoundException ex) {
                    /*Não foi possível encontrar o Driver*/
                    response.sendRedirect("portal_medico_lista_erro.jsp");
                } catch (SQLException ex) {
                    /*Não foi possível conectar ao banco*/
                    response.sendRedirect("portal_medico_lista_erro.jsp");
                }
                
            }else{
                response.sendRedirect("login_funcionalidade.html");
            }
                   
        } else{
            response.sendRedirect("login_restrito.html");
        }
        
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        
        Object logado = session.getAttribute("log");
        if (logado != null){
            String aux = (String) logado;
            
            int id;
            
            if(aux.equals("log_administrador")){
                
                Connection conexao = null;
                try {
                    //Carrega o Driver JDBC na memória
                    Class.forName("com.mysql.jdbc.Driver"); //load driver                       
                    //Abre a conexão com o banco de dados via JDBC
                    conexao = DriverManager.getConnection("jdbc:mysql://localhost:3306/clinica", "root", "");

                    id = parseInt(request.getParameter("IdMedico"));
                    
                    String sqlString = "select * from consulta where idmedico = ?";

                    PreparedStatement sql = conexao.prepareStatement(sqlString);
                    sql.setInt(1, id);

                    ResultSet resultado = sql.executeQuery();

                    if (resultado == null) {
                        response.sendRedirect("portal_medico_lista_erro.jsp");
                    }else{

                        ArrayList<Consulta> ListaConsulta = new ArrayList<Consulta> ();

                        while (resultado.next()){
                            Consulta consulta = new Consulta(resultado.getInt("ID"),resultado.getString("DATA"),
                                    resultado.getString("DESCRICAO"), resultado.getString("REALIZADA"),
                                    resultado.getInt("IDMEDICO"), resultado.getInt("IDPACIENTE") );

                            ListaConsulta.add(consulta);
                        }
                        
                        String sqlString2 = "select * from medico where id = ? limit 1";

                        PreparedStatement sql2 = conexao.prepareStatement(sqlString2);
                        sql2.setInt(1, id);

                        ResultSet resultado2 = sql2.executeQuery();
                        
                        resultado2.last();
                        
                        if (resultado2.getRow() > 0) {
                            Medico medico2 = new Medico(resultado2.getInt("ID"),resultado2.getString("NOME"),
                            resultado2.getString("CRM"), resultado2.getString("ESTADOCRM"),
                            resultado2.getString("CPF"),resultado2.getString("AUTORIZADO"),resultado2.getInt("IDESPECIALIDADE") );
                        
                        
                            request.setAttribute("medico", medico2);
                            request.setAttribute("listaConsultas", ListaConsulta);

                            RequestDispatcher rd = request.getRequestDispatcher("/portal_adm_consulta_medico.jsp");
                            rd.forward(request, response);
                        }else{
                            response.sendRedirect("portal_administrador.jsp");
                        }

                    }
                } catch (ClassNotFoundException ex) {
                    /*Não foi possível encontrar o Driver*/
                    response.sendRedirect("portal_medico_lista_erro.jsp");
                } catch (SQLException ex) {
                    /*Não foi possível conectar ao banco*/
                    response.sendRedirect("portal_medico_lista_erro.jsp");
                }
                
            }else{
                response.sendRedirect("login_funcionalidade.html");
            }
                   
        } else{
            response.sendRedirect("login_restrito.html");
        }
        
    }
    
}