import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet(urlPatterns = {"/ProcessaLogin"})
public class ProcessaLogin extends HttpServlet {


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
                if(cpf.equals("937.397.160-37")){
                    HttpSession session = request.getSession();
                    session.setAttribute("log", "paciente");
                    
                    request.setAttribute("funcaorecebido", "Paciente");
                
                    RequestDispatcher rd = request.getRequestDispatcher("/portal_paciente.jsp");
                    rd.forward(request, response);
                }else{
                    response.sendRedirect("login_erro.html");
                }
  
            }else if(request.getParameter("funcao").equals("2")){
                /*Médico*/
                if(cpf.equals("381.585.150-53") || cpf.equals("693.339.230-98")){
                    HttpSession session = request.getSession();
                    session.setAttribute("log", "medico");
                    
                    request.setAttribute("funcaorecebido", "Médico");
                    
                    RequestDispatcher rd = request.getRequestDispatcher("/portal_medico.jsp");
                    rd.forward(request, response);
                }else{
                    response.sendRedirect("login_erro.html");
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

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
