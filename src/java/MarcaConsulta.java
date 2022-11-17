import aplicacao.Medico;
import static com.sun.org.apache.xalan.internal.xsltc.compiler.util.Type.Int;
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
import javax.servlet.http.HttpSession;

@WebServlet(urlPatterns = {"/MarcaConsulta"})
public class MarcaConsulta extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        /*Pegando as info do form*/
        String idConsulta = request.getParameter("IdConsulta");
        String idTipoExame = request.getParameter("IdTipoExame");
        String desc = request.getParameter("desc");

            Connection conexao = null;
                try {
                    //Carrega o Driver JDBC na memória
                    Class.forName("com.mysql.jdbc.Driver"); //load driver                       
                    //Abre a conexão com o banco de dados via JDBC
                    conexao = DriverManager.getConnection("jdbc:mysql://localhost:3306/clinica", "root", "");
                    
                    String sqlSelectExame = "select * from exames";
                    PreparedStatement sqlIdExame = conexao.prepareStatement(sqlSelectExame);
                    ResultSet resultadoExame = sqlIdExame.executeQuery();
                    
                    int idExame = 1;
                    while (resultadoExame.next()){
                        idExame++;
                    }
                    
                    
                    String sqlInsertExame = "insert into exames(id,idtipoexame,idconsulta) values (?,?,?)";
                    PreparedStatement sqlExame = conexao.prepareStatement(sqlInsertExame);
                    
                    sqlExame.setInt(1, idExame);
                    sqlExame.setInt(2, 3);
                    sqlExame.setInt(3, 1);
                    
                    sqlExame.executeUpdate();
                    
                    String sqlUpdateConsultDesc = "update consulta set descricao = ? where id = ?";
                    PreparedStatement sqlConsultDesc = conexao.prepareStatement(sqlUpdateConsultDesc);
                    
                    sqlConsultDesc.setString(1, desc);
                    sqlConsultDesc.setInt(2, 1);
                    
                    sqlConsultDesc.executeUpdate();
                    
                    String sqlUpdateConsultReal = "update consulta set realizada = ? where id = ?";
                    PreparedStatement sqlConsultReal = conexao.prepareStatement(sqlUpdateConsultReal);
                    
                    sqlConsultReal.setString(1, "S");
                    sqlConsultReal.setInt(2, 1);
                    
                    sqlConsultReal.executeUpdate();
                    
                    RequestDispatcher rd = request.getRequestDispatcher("/portal_medico_realizar_sucesso.jsp");
                    rd.forward(request, response);

                } catch (ClassNotFoundException ex) {
                    /*Não foi possível encontrar o Driver*/
                    response.sendRedirect("portal_medico_realizar_erro.jsp");
                } catch (SQLException ex) {
                    /*Não foi possível conectar ao banco*/
                    response.sendRedirect("portal_medico_realizar_erro.jsp");
                }
        
        
    }

}