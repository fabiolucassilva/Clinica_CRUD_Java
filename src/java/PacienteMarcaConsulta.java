import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = {"/PacienteMarcaConsulta"})
public class PacienteMarcaConsulta extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        /*Pegando as info do form*/
        String data = request.getParameter("data");
        String hora = request.getParameter("hora");
        String IdMedico = request.getParameter("IdMedico");
        
        Connection conexao = null;
                try {
                    //Carrega o Driver JDBC na memória
                    Class.forName("com.mysql.jdbc.Driver"); //load driver                       
                    //Abre a conexão com o banco de dados via JDBC
                    conexao = DriverManager.getConnection("jdbc:mysql://localhost:3306/clinica", "root", "");
                    
                    RequestDispatcher rd = request.getRequestDispatcher("/portal_paciente_consulta_sucesso.jsp");
                    rd.forward(request, response);

                } catch (ClassNotFoundException ex) {
                    /*Não foi possível encontrar o Driver*/
                    response.sendRedirect("portal_paciente_consulta_erro.jsp");
                } catch (SQLException ex) {
                    /*Não foi possível conectar ao banco*/
                    response.sendRedirect("portal_paciente_realizar_erro.jsp");
                }
        
    }

}
