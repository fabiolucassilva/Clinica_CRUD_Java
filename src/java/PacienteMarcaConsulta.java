import aplicacao.Paciente;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.Integer.parseInt;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(urlPatterns = {"/PacienteMarcaConsulta"})
public class PacienteMarcaConsulta extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        /*Pegando as info do form*/
        String data_base = request.getParameter("data");
        /*try {
            Date dataConsulta = (Date) new SimpleDateFormat("YYYY-MM-DD").parse(data_base);
        } catch (ParseException ex) {
            response.sendRedirect("portal_paciente_consulta_erro.jsp");
        }*/
        String hora = request.getParameter("hora");
        
        String medico = request.getParameter("IdMedico");
        int idMedico = parseInt(medico);
        
        Connection conexao = null;
                try {
                    //Carrega o Driver JDBC na memória
                    Class.forName("com.mysql.jdbc.Driver"); //load driver                       
                    //Abre a conexão com o banco de dados via JDBC
                    conexao = DriverManager.getConnection("jdbc:mysql://localhost:3306/clinica", "root", "");
                    
                    String sqlSelectConsulta = "select * from consulta";
                    PreparedStatement sqlIdConsulta = conexao.prepareStatement(sqlSelectConsulta);
                    ResultSet resultadoConsulta = sqlIdConsulta.executeQuery();
                    
                    int idConsulta = 1;
                    while (resultadoConsulta.next()){
                        idConsulta++;
                    }

                    HttpSession session = request.getSession();
                    Paciente pacienteLogado = (Paciente) session.getAttribute("paciente");
                    int idPaciente = pacienteLogado.getId();
                    
                    String sqlInsertConsulta = "insert into consulta(id,data,descricao,realizada,idmedico,idpaciente)"
                            + "values (?,?,?,?,?,?)";
                    PreparedStatement sqlConsulta = conexao.prepareStatement(sqlInsertConsulta);
                    
                    sqlConsulta.setInt(1, idConsulta);
                    sqlConsulta.setString(2, data_base);
                    sqlConsulta.setString(3, "");
                    sqlConsulta.setString(4, "N");
                    sqlConsulta.setInt(5, idMedico);
                    sqlConsulta.setInt(6, idPaciente);
                    
                    sqlConsulta.executeUpdate();
                    
                    RequestDispatcher rd = request.getRequestDispatcher("/portal_paciente_consulta_sucesso.jsp");
                    rd.forward(request, response);

                } catch (ClassNotFoundException ex) {
                    /*Não foi possível encontrar o Driver*/
                    response.sendRedirect("portal_paciente_consulta_erro.jsp");
                } catch (SQLException ex) {
                    /*Não foi possível conectar ao banco*/
                    response.sendRedirect("portal_paciente_consulta_erro.jsp");
                }
        
    }

}
