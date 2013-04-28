package servlet;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Util.SendEmail;

import command.CommandExecutor;
import domain.Client;


/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet(description = "servlet to create users", urlPatterns = { "/RegisterServlet" })
public class RegisterServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
        super();
    }
    
    /**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

//		try{
//			HttpSession session = request.getSession(true);
//			User user = (User) session.getAttribute("user");
//			RequestDispatcher rd;
//
//			if(user != null){
//				int roleId = user.getRoleId();
//
//				if(roleId == 1 || roleId == 8){
//
//					ArrayList<UserRole> roleList = (ArrayList<UserRole>)CommandExecutor.getInstance().executeDatabaseCommand(new command.ListUserRoles());
//					request.setAttribute("userRoles", roleList);
//
//					ArrayList<UserRoom> roomList = (ArrayList<UserRoom>)CommandExecutor.getInstance().executeDatabaseCommand(new command.ListUserRooms());
//					request.setAttribute("userRooms", roomList);
//
//					ArrayList<Product> productList = (ArrayList<Product>)CommandExecutor.getInstance().executeDatabaseCommand(new command.ListActiveProducts());
//					request.setAttribute("products",  productList);
//
//					rd = getServletContext().getRequestDispatcher("/createUser.jsp");			
//
//					rd.forward(request, response);
//				} else {
//					request.setAttribute("error", "Usted no posee permisos para realizar esta operación");
//					rd = getServletContext().getRequestDispatcher("/mainMenu.jsp");
//					rd.forward(request, response);
//				}			
//			} else {
//				rd = getServletContext().getRequestDispatcher("/index.jsp");			
//
//				rd.forward(request, response);
//			}
//		} catch (Exception e) {
//			throw new ServletException(e);
//		}		
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
			String password =request.getParameter("txtPass");
			String encryptPassword = UserLoginServlet.getEncryptPassword(password);
			String phoneNumber  = request.getParameter("txtPhone");
			String phoneMovNumber  = request.getParameter("txtMovPhone");
			String address = request.getParameter("txtDir");
		
			Client client = new Client();
			client.setFirstName(firstName);
			client.setLastName(lastName);
			client.setIdentityCard(identityCardId+identityCardNum);
			client.setEmail(email);
			client.setPassword(encryptPassword);
			client.setPhone(phoneNumber);
			client.setOtherPhone(phoneMovNumber);
			client.setAddress(address);
			String checkbox = request.getParameter("checkDir");
			
			if (checkbox != ""){
				String addressEnv = request.getParameter("txtDirEnv");
				client.setShippingAddress(addressEnv);
				client.setShippingAddress(0);
				
			}else{
				client.setShippingAddress(address);
				client.setShippingAddress(1);
			}
		
			Integer userId = (Integer) CommandExecutor.getInstance().executeDatabaseCommand(new command.CreateClient(client));

			if(userId > 0){
				new Thread(new Runnable() {
				    public void run() {
				    	Properties propertiesFile = new Properties();
						String context = getServletContext().getInitParameter("properties");
						try {
							propertiesFile.load(new FileInputStream(context));
						} catch (FileNotFoundException e) {
							e.printStackTrace();
						} catch (IOException e) {
							e.printStackTrace();
						}
						SendEmail.sendEmail(propertiesFile, email, firstName + " " + lastName, false, "contrato");
				    }
				}).start();
				
				rd = getServletContext().getRequestDispatcher("/registroBienv.jsp");			
				rd.forward(request, response);
				
				
			} 
		} catch (Exception e) {
			System.out.println("No se creo");
		}
	}
}