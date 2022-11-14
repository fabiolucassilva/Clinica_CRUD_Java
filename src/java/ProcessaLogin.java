import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet(urlPatterns = {"/ProcessaLogin"})
public class ProcessaLogin extends HttpServlet {
    
    Connection con = null;
    
    public void init() throws ServletException{
        try{
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/clinica","root","");
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
            System.out.println("Não Foi possivel encontrar o Driver");
        } catch (SQLException ex){
            ex.printStackTrace();
            System.out.println("Não Foi possivel conectar ao Banco");
        }
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        response.sendRedirect("login.html");

    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        /*Pegando as info do form*/
        String cpf = request.getParameter("cpf");
        String senha = request.getParameter("senha");
        String funcao = request.getParameter("funcao");
        
        if (cpf.isEmpty() || senha.isEmpty() || funcao.isEmpty()){
            response.sendRedirect("login_vazio.html");
        }else{
            /*Adicionando atributos para jsp*/
            request.setAttribute("cpfrecebido", cpf);
            request.setAttribute("senharecebido", senha);
            
            if(request.getParameter("funcao").equals("1")){
                /*Paciente*/
                Connection conexao = null;
                try {
                    //Carrega o Driver JDBC na memória
                    Class.forName("com.mysql.jdbc.Driver"); //load driver                       
                    //Abre a conexão com o banco de dados via JDBC
                    conexao = DriverManager.getConnection("jdbc:mysql://localhost:3306/clinica", "root", "");

                    String sqlString = "select * from paciente where cpf = ? and senha =? limit 1";
                    PreparedStatement sql = conexao.prepareStatement(sqlString);
                    sql.setString(1, cpf);
                    sql.setString(2, senha);
                    ResultSet resultado = sql.executeQuery();
                    resultado.last();

                    if (resultado.getRow() > 0) {
                        HttpSession session = request.getSession();
                        session.setAttribute("log", "paciente");

                        request.setAttribute("funcaorecebido", "Paciente");

                        RequestDispatcher rd = request.getRequestDispatcher("/portal_paciente.jsp");
                        rd.forward(request, response);
                    }else{
                        response.sendRedirect("login_erro.html");
                    }
                } catch (ClassNotFoundException ex) {
                    /*Não foi possível encontrar o Driver*/
                    response.sendRedirect("login_erro_interno.html");
                } catch (SQLException ex) {
                    /*Não foi possível conectar ao banco*/
                    response.sendRedirect("login_erro_interno.html");
                }
            }else if(request.getParameter("funcao").equals("2")){
                /*Médico*/
                Connection conexao = null;
                try {
                    //Carrega o Driver JDBC na memória
                    Class.forName("com.mysql.jdbc.Driver"); //load driver                       
                    //Abre a conexão com o banco de dados via JDBC
                    conexao = DriverManager.getConnection("jdbc:mysql://localhost:3306/clinica", "root", "");

                    String sqlString = "select * from medico where cpf = ? and senha =? limit 1";
                    PreparedStatement sql = conexao.prepareStatement(sqlString);
                    sql.setString(1, cpf);
                    sql.setString(2, senha);
                    ResultSet resultado = sql.executeQuery();
                    resultado.last();

                    if (resultado.getRow() > 0) {
                        HttpSession session = request.getSession();
                        session.setAttribute("log", "medico");

                        request.setAttribute("funcaorecebido", "Médico");

                        RequestDispatcher rd = request.getRequestDispatcher("/portal_medico.jsp");
                        rd.forward(request, response);
                    }else{
                        response.sendRedirect("login_erro.html");
                    }
                } catch (ClassNotFoundException ex) {
                    /*Não foi possível encontrar o Driver*/
                    response.sendRedirect("login_erro_interno.html");
                } catch (SQLException ex) {
                    /*Não foi possível conectar ao banco*/
                    response.sendRedirect("login_erro_interno.html");
                }
            }else if(request.getParameter("funcao").equals("3")){
                /*Administrador*/
                response.sendRedirect("login_funcionalidade.html");
            }else{
                /*Nenhum*/
                response.sendRedirect("login_vazio.html");
            }
            
        }

    }
    
    
    public void destroy() {
        try {
            con.close();
        } catch (SQLException ex) {
            System.out.println("Não Foi possivel fechar o Banco");
        }
    }

}
