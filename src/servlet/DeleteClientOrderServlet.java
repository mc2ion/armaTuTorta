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
 * Servlet implementation class DeleteClientOrderServlet
 */
@WebServlet(description = "servlet to delete client orders", urlPatterns = { "/DeleteClientOrderServlet" })
public class DeleteClientOrderServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	/**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteClientOrderServlet() {
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
		Long clientId = Long.valueOf(request.getParameter("clientId"));
		
		try {
			HttpSession session = request.getSession();
			User user = (User)session.getAttribute("user");
			
			if(user != null){
				
				// perform delete order step
				Long orderId = Long.valueOf(request.getParameter("orderId"));
				Integer rowsUpdated = (Integer) CommandExecutor.getInstance().executeDatabaseCommand(new command.DeleteOrder(orderId));
				
				if(rowsUpdated == 1){
					
					request.setAttribute("info", "El pedido fue eliminado exitosamente.");
					request.setAttribute("error", "");
					//rd = getServletContext().getRequestDispatcher("/servlet/servlet.ListOrderStepsServlet?typeId="+orderTypeId);	
					rd = getServletContext().getRequestDispatcher("/ListClientOrdersServlet?clientId="+clientId);			

					rd.forward(request, response);
				} else {
					request.setAttribute("info", "");
					request.setAttribute("error", "Ocurrió un error durante la eliminación del pedido. Por favor intente de nuevo y si el error persiste contacte a su administrador.");
					//rd = getServletContext().getRequestDispatcher("/servlet/servlet.ListOrderStepsServlet?typeId="+orderTypeId);	
					rd = getServletContext().getRequestDispatcher("/ListClientOrdersServlet?clientId="+clientId);			

					rd.forward(request, response);
				}
			} else {
				rd = getServletContext().getRequestDispatcher("/admin/index.jsp");
				rd.forward(request, response);
			}
			
		} catch (Exception e) {
			request.setAttribute("info", "");
			request.setAttribute("error", "Ocurrió un error durante la eliminación del paso. Por favor intente de nuevo y si el error persiste contacte a su administrador.");
			//rd = getServletContext().getRequestDispatcher("/servlet/servlet.ListOrderStepsServlet?typeId="+orderTypeId);
			rd = getServletContext().getRequestDispatcher("/ListClientOrdersServlet?clientId="+clientId);				

			rd.forward(request, response);
		}
	}
}
