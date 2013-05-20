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

import domain.User;

/**
 * Servlet implementation class EditUserPasswordServlet
 */
@WebServlet(description = "servlet to edit user's password", urlPatterns = { "/EditUserPasswordServlet" })
public class EditUserPasswordServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditUserPasswordServlet() {
        super();
    }
    
    /**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try{
			HttpSession session = request.getSession(true);
			User user = (User) session.getAttribute("user");
			RequestDispatcher rd;
			   
			if(user != null){
				Long userId = user.getId();
				request.setAttribute("userId", userId);
				rd = getServletContext().getRequestDispatcher("/admin/editUserPassword.jsp");			
				rd.forward(request, response);
			} else {
				rd = getServletContext().getRequestDispatcher("/admin/index.jsp");			

				rd.forward(request, response);
			}
		} catch (Exception e) {
			throw new ServletException(e);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		RequestDispatcher rd;
		
		try{
			Integer userId = Integer.valueOf(request.getParameter("txtUserId"));
			String oldPassword = request.getParameter("txtOldPassword");
			String password = request.getParameter("txtPassword");
			String encryptOldPassword = UserLoginServlet.getEncryptPassword(oldPassword);
			String encryptPassword = UserLoginServlet.getEncryptPassword(password);
				
			User user = new User();
			user.setPassword(encryptPassword);
			user.setId(userId);
			
			Integer rowsUpdated = (Integer) CommandExecutor.getInstance().executeDatabaseCommand(new command.EditUserPassword(user, encryptOldPassword));
			
			if(rowsUpdated == 1){
				request.setAttribute("info", "Tu contrase�a fue modificada exitosamente.");
				request.setAttribute("error", "");
				rd = getServletContext().getRequestDispatcher("/admin/editUserPassword.jsp");			

				rd.forward(request, response);
			} 
			else if (rowsUpdated == -2){
				request.setAttribute("info", "");
				request.setAttribute("error", "La contrase�a anterior suministrada no es correcta. Por favor intente de nuevo.");
				request.setAttribute("userId", userId);
				rd = getServletContext().getRequestDispatcher("/admin/editUserPassword.jsp");		
				rd.forward(request, response);
			}
			else {
				request.setAttribute("info", "");
				request.setAttribute("error", "Ocurri� un error durante la modificaci�n de tu contrase�a. Por favor intente de nuevo y si el error persiste contacte a su administrador.");
				rd = getServletContext().getRequestDispatcher("/admin/editUserPassword.jsp");			

				rd.forward(request, response);
			}
			
		} catch (Exception e) {
			request.setAttribute("info", "");
			request.setAttribute("error", "Ocurri� un error durante la modificaci�n de tu contrase�a. Por favor intente de nuevo y si el error persiste contacte a su administrador.");
			rd = getServletContext().getRequestDispatcher("/admin/editUserPassword.jsp");			

			rd.forward(request, response);
		}
	}
}
