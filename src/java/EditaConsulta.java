import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.Integer.parseInt;
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

@WebServlet(urlPatterns = {"/EditaConsulta"})
public class EditaConsulta extends HttpServlet {
protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        /*Pegando as info do form*/
        int idConsulta = parseInt(request.getParameter("IdConsulta"));
        String desc = request.getParameter("desc");
        String data_base = request.getParameter("data");
        String hora = request.getParameter("hora");
        String data_hora = data_base + " " + hora;
        
            Connection conexao = null;
                try {
                    //Carrega o Driver JDBC na memória
                    Class.forName("com.mysql.jdbc.Driver"); //load driver                       
                    //Abre a conexão com o banco de dados via JDBC
                    conexao = DriverManager.getConnection("jdbc:mysql://localhost:3306/clinica", "root", "");
                    
                    String sqlUpdateConsultDesc = "update consulta set descricao = ? where id = ?";
                    PreparedStatement sqlConsultDesc = conexao.prepareStatement(sqlUpdateConsultDesc);
                    sqlConsultDesc.setString(1, desc);
                    sqlConsultDesc.setInt(2, idConsulta);
                    sqlConsultDesc.executeUpdate();
                    
                    String sqlUpdateConsultData = "update consulta set data = ? where id = ?";
                    PreparedStatement sqlConsultData = conexao.prepareStatement(sqlUpdateConsultData);
                    sqlConsultData.setString(1, data_hora);
                    sqlConsultData.setInt(2, idConsulta);
                    sqlConsultData.executeUpdate();
                    
                    String sqlUpdateConsultReal = "update consulta set realizada = ? where id = ?";
                    PreparedStatement sqlConsultReal = conexao.prepareStatement(sqlUpdateConsultReal);
                    sqlConsultReal.setString(1, request.getParameter("realizada"));
                    sqlConsultReal.setInt(2, idConsulta);
                    sqlConsultReal.executeUpdate();
                    
                    RequestDispatcher rd = request.getRequestDispatcher("/portal_medico_editar_sucesso.jsp");
                    rd.forward(request, response);

                } catch (ClassNotFoundException ex) {
                    /*Não foi possível encontrar o Driver*/
                    response.sendRedirect("portal_medico_editar_erro.jsp");
                } catch (SQLException ex) {
                    /*Não foi possível conectar ao banco*/
                    response.sendRedirect("portal_medico_editar_erro.jsp");
                }

    }
}
