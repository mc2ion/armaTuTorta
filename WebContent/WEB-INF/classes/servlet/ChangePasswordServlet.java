package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import command.CommandExecutor;
/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet(description = "servlet to create users", urlPatterns = { "/ChangePasswordServlet" })
public class ChangePasswordServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangePasswordServlet() {
        super();
    }
    
    /**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.print("Get" );
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		final String email = request.getParameter("email");
		final String newPass = request.getParameter("txtNewPass");
		final String oldPassword = request.getParameter("txtOldPass");
		
		final String encryptPassword = UserLoginServlet.getEncryptPassword(newPass);
		RequestDispatcher rd;	
		try{
			Integer userId = (Integer) CommandExecutor.getInstance().executeDatabaseCommand(new command.ChangeClientPassword(email, encryptPassword, oldPassword));
			if(userId > 0){
				request.setAttribute("editClient", "successPass");
				rd = getServletContext().getRequestDispatcher("/editClientMessage.jsp");			
				rd.forward(request, response);
			}else{
				request.setAttribute("editClient", "errorPass");
				rd = getServletContext().getRequestDispatcher("/editClientMessage.jsp");			
				rd.forward(request, response);
			}
		} catch (Exception e) {
			request.setAttribute("editClient", "errorPass");
			rd = getServletContext().getRequestDispatcher("/editClientMessage.jsp");			
			rd.forward(request, response);
		}		

	}
}