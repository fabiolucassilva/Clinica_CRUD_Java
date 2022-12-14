import aplicacao.Medico;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(urlPatterns = {"/ListaMedicos"})
public class ListaMedicos extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        
        Object logado = session.getAttribute("log");
        if (logado != null){
            String aux = (String) logado;
            
            if(aux.equals("log_medico")){
                response.sendRedirect("login_funcionalidade.html");
            } else{
                Connection conexao = null;
                try {
                    //Carrega o Driver JDBC na memória
                    Class.forName("com.mysql.jdbc.Driver"); //load driver                       
                    //Abre a conexão com o banco de dados via JDBC
                    conexao = DriverManager.getConnection("jdbc:mysql://localhost:3306/clinica", "root", "");

                    String sqlString = "select * from medico";

                    PreparedStatement sql = conexao.prepareStatement(sqlString);

                    ResultSet resultado = sql.executeQuery();

                    if (resultado == null) {
                        response.sendRedirect("portal_paciente_conulta_erro.jsp");
                    }else{

                        ArrayList<Medico> ListaMedico = new ArrayList<Medico> ();

                        while (resultado.next()){
                            Medico medico = new Medico(resultado.getInt("ID"),resultado.getString("NOME"),
                            resultado.getString("CRM"), resultado.getString("ESTADOCRM"),
                            resultado.getString("CPF"),resultado.getString("AUTORIZADO"),resultado.getInt("IDESPECIALIDADE") );
                        
                            ListaMedico.add(medico);
                        }

                        request.setAttribute("listaMedicos", ListaMedico);
                        
                        if(aux.equals("log_paciente")){
                            RequestDispatcher rd = request.getRequestDispatcher("/portal_paciente_consulta.jsp");
                            rd.forward(request, response);
                        }
                        if(aux.equals("log_administrador")){
                            RequestDispatcher rd = request.getRequestDispatcher("/portal_adm_medico.jsp");
                            rd.forward(request, response);
                        }

                    }
                } catch (ClassNotFoundException ex) {
                    /*Não foi possível encontrar o Driver*/
                    response.sendRedirect("portal_paciente_consulta_erro.jsp");
                } catch (SQLException ex) {
                    /*Não foi possível conectar ao banco*/
                    response.sendRedirect("portal_paciente_consulta_erro.jsp");
                }
            }
                   
        } else{
            response.sendRedirect("login_restrito.html");
        }
        
    }
}