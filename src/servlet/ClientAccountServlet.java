package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import command.CommandExecutor;
import domain.Client;


/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet(description = "servlet to create users", urlPatterns = { "/ClientAccountServlet" })
public class ClientAccountServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ClientAccountServlet() {
        super();
    }
    
    /**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String id = request.getParameter("id");
		RequestDispatcher rd;
		try{
			Client client = (Client) CommandExecutor.getInstance().executeDatabaseCommand(new command.SelectClient(id));
			if (client != null){
				System.out.println("consiguio");
				request.setAttribute("clientInfo", client);
				rd = getServletContext().getRequestDispatcher("/editClientAccount.jsp");			
				rd.forward(request, response);
			} 
		} catch (Exception e) {
			System.out.println("No se creo");
		}		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd;

		try{
			final String firstName = request.getParameter("txtName");
			final String lastName = request.getParameter("txtLastName");
			String identityCardNum = request.getParameter("txtCed");
			String identityCardId = request.getParameter("txtCedId");
			final String email = request.getParameter("txtEmail");
			String phoneNumber  = request.getParameter("txtPhone");
			String phoneMovNumber  = request.getParameter("txtMovPhone");
			String address = request.getParameter("txtDir");
			String typePers = request.getParameter("typePers");
		
			Client client = new Client();
			client.setFirstName(firstName);
			client.setLastName(lastName);
			client.setIdentityCard(identityCardId+identityCardNum);
			client.setEmail(email);
			client.setPhone(phoneNumber);
			client.setOtherPhone(phoneMovNumber);
			client.setAddress(address);
			client.setCompany(Integer.valueOf(typePers));
			String checkbox = request.getParameter("checkDir");
			
			if (checkbox != ""){
				String addressEnv = request.getParameter("txtDirEnv");
				client.setShippingAddress(addressEnv);
				client.setShippingAddress(1);
				
			}else{
				client.setShippingAddress(address);
				client.setShippingAddress(0);
			}
		
			Integer userId = (Integer) CommandExecutor.getInstance().executeDatabaseCommand(new command.EditClient(client));

			if(userId > 0){
				rd = getServletContext().getRequestDispatcher("/registroBienv.jsp");			
				rd.forward(request, response);
			} 
		} catch (Exception e) {
			System.out.println("No se creo");
		}
	}
}