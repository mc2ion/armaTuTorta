package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import command.CommandExecutor;
import domain.Client;

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
		System.out.print("post" );
		final String email = request.getParameter("email");
		final String newPass = request.getParameter("txtNewPass");
		final String encryptPassword = UserLoginServlet.getEncryptPassword(newPass);
		HttpSession infoPage = request.getSession();
		Client client = (Client) infoPage.getAttribute("clientAux");
		System.out.println("email " + email);
		RequestDispatcher rd;	
		try{
			Integer userId = (Integer) CommandExecutor.getInstance().executeDatabaseCommand(new command.RestoreClientPassword(email, encryptPassword));
			if(userId > 0){
				request.setAttribute("message", "exitoso");
				request.setAttribute("clientInfo", client);
				rd = getServletContext().getRequestDispatcher("/editClientAccount.jsp");	
				infoPage.removeAttribute("clientAux");
				rd.forward(request, response);
			}
		} catch (Exception e) {
			System.out.println("No se creo");
		}		

	}
}