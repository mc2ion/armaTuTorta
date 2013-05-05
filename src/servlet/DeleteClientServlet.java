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
 * Servlet implementation class DeleteClientServlet
 */
@WebServlet(description = "servlet to delete clients", urlPatterns = { "/DeleteClientServlet" })
public class DeleteClientServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	/**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteClientServlet() {
        super();
    }
    
    /**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		RequestDispatcher rd;
		
		try {
			HttpSession session = request.getSession();
			User user = (User)session.getAttribute("user");
			
			if(user != null){
				
				// perform delete client
				Long clientId = Long.valueOf(request.getParameter("clientId"));
				Integer rowsUpdated = (Integer) CommandExecutor.getInstance().executeDatabaseCommand(new command.DeleteClient(clientId));
				
				if(rowsUpdated == 1){
					
					request.setAttribute("info", "El cliente fue eliminado exitosamente.");
					request.setAttribute("error", "");
					rd = getServletContext().getRequestDispatcher("/ListClientsServlet");			

					rd.forward(request, response);
				} else {
					request.setAttribute("info", "");
					request.setAttribute("error", "Ocurri� un error durante la eliminaci�n del cliente. Por favor intente de nuevo y si el error persiste contacte a su administrador.");
					rd = getServletContext().getRequestDispatcher("/ListClientsServlet");	

					rd.forward(request, response);
				}
			} else {
				rd = getServletContext().getRequestDispatcher("admin/index.jsp");
				rd.forward(request, response);
			}
			
		} catch (Exception e) {			
			request.setAttribute("info", "");
			request.setAttribute("error", "Ocurri� un error durante la eliminaci�n del cliente. Por favor intente de nuevo y si el error persiste contacte a su administrador.");
			rd = getServletContext().getRequestDispatcher("/ListClientsServlet");			

			rd.forward(request, response);
		}
	}
	
}
