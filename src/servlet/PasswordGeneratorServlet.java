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

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet(description = "servlet to create users", urlPatterns = { "/PasswordGeneratorServlet" })
public class PasswordGeneratorServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PasswordGeneratorServlet() {
        super();
    }
    
    /**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		final String email = request.getParameter("email");
		final String name = request.getParameter("name");
		RequestDispatcher rd;
		final String password = Util.PasswordGenerator.getPassword(Util.PasswordGenerator.MINUSCULAS+Util.PasswordGenerator.MAYUSCULAS+Util.PasswordGenerator.ESPECIALES,10);
		final String encryptPassword = UserLoginServlet.getEncryptPassword(password);
		try{
			Integer userId = (Integer) CommandExecutor.getInstance().executeDatabaseCommand(new command.RestoreClientPassword(email, encryptPassword));
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
						SendEmail.sendEmailPassword(propertiesFile, email, name, password, false, "contrato");
						System.out.println("Se envio correctamente " + password);
				    }
				}).start();
				
				rd = getServletContext().getRequestDispatcher("/passwordMessage.jsp");			
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
		doGet(request, response);
	}
}