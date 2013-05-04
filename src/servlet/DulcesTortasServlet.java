package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import command.CommandExecutor;
import domain.Client;
import domain.StepOption;

/**
 * Servlet implementation class ListStepOptionsServlet
 */
@WebServlet(description = "servlet to list step options", urlPatterns = { "/DulcesTortasServlet" })
public class DulcesTortasServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DulcesTortasServlet() {
        super();
    }
    
    /**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			HttpSession session = request.getSession();
			Client user = (Client)session.getAttribute("client");
			
			if(user != null){
				// perform list user operations
				Integer stepId = Integer.valueOf(request.getParameter("stepId"));
				@SuppressWarnings("unchecked")
				ArrayList<StepOption> list = (ArrayList<StepOption>)CommandExecutor.getInstance().executeDatabaseCommand(new command.ListDulcesTortas(stepId));
				
				System.out.println("aqui");
				request.setAttribute("options", list);
				
				RequestDispatcher rd = getServletContext().getRequestDispatcher("/dulcesTortas.jsp");
				rd.forward(request, response);
			} else {
				System.out.println("aqui error");
				request.setAttribute("options", new ArrayList<StepOption>());
				RequestDispatcher rd = getServletContext().getRequestDispatcher("/dulcesTortas.jsp");
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
		doGet(request, response);
	}
}
