import aplicacao.Consulta;
import aplicacao.Medico;
import aplicacao.TipoExame;
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


@WebServlet(urlPatterns = {"/ListaConsultasEditar"})
public class ListaConsultasEditar extends HttpServlet {
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

                    String sqlStringConsult = "select * from consulta where idmedico = ? and realizada = ?";
                    PreparedStatement sqlConsul = conexao.prepareStatement(sqlStringConsult);
                    sqlConsul.setInt(1, id);
                    sqlConsul.setString(2, "S");
                    ResultSet resultado_consulta = sqlConsul.executeQuery();
                    
                    String sqlStringTipoExame = "select * from tipoexame";
                    PreparedStatement sqlExa = conexao.prepareStatement(sqlStringTipoExame);
                    ResultSet resultado_exame = sqlExa.executeQuery();

                    if (resultado_consulta == null || resultado_exame == null) {
                        response.sendRedirect("portal_medico_editar_erro.jsp");
                    }else{

                        ArrayList<Consulta> ListaConsulta = new ArrayList<Consulta> ();

                        while (resultado_consulta.next()){
                            Consulta consulta = new Consulta(resultado_consulta.getInt("ID"),
                                    resultado_consulta.getString("DATA"),resultado_consulta.getString("DESCRICAO"), 
                                    resultado_consulta.getString("REALIZADA"),resultado_consulta.getInt("IDMEDICO"), 
                                    resultado_consulta.getInt("IDPACIENTE") );

                            ListaConsulta.add(consulta);
                        }
                        
                        request.setAttribute("listaConsultas", ListaConsulta);
                      

                        RequestDispatcher rd = request.getRequestDispatcher("/portal_medico_editar.jsp");
                        rd.forward(request, response);

                    }
                } catch (ClassNotFoundException ex) {
                    /*Não foi possível encontrar o Driver*/
                    response.sendRedirect("portal_medico_editar_erro.jsp");
                } catch (SQLException ex) {
                    /*Não foi possível conectar ao banco*/
                    response.sendRedirect("portal_medico_editar_erro.jsp");
                }
                
            } else{
                response.sendRedirect("login_funcionalidade.html");
            }
                   
        } else{
            response.sendRedirect("login_restrito.html");
        }
        
    }
}
