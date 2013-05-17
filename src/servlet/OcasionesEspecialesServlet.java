package servlet;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Util.SendEmail;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import command.CommandExecutor;

import domain.Client;

/**
 * Servlet implementation class ListStepOptionsServlet
 */
@WebServlet(description = "servlet to list step options", urlPatterns = { "/OcasionesEspecialesServlet" })
public class OcasionesEspecialesServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OcasionesEspecialesServlet() {
        super();
    }
    
    /**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
			RequestDispatcher rd = getServletContext().getRequestDispatcher("/ocasionesEspeciales.jsp");
			rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd;	
		final Properties propertiesFile = new Properties();
		propertiesFile.load( new FileInputStream( getServletContext().getInitParameter("properties") ) );
		String dirPath = propertiesFile.getProperty("pedidosOcasionesEspecialesDirectory");
	
		MultipartRequest multipart = new MultipartRequest(request, dirPath,
					5*1024*1024, new DefaultFileRenamePolicy());
		
		HttpSession infoPage = request.getSession();
		Client clientAux = (Client) infoPage.getAttribute("client");
		
		try{			
			String name = multipart.getParameter("txtName");
			String torta = multipart.getParameter("eventoT");
			String cupcakes = multipart.getParameter("eventoC");
			String gelatina = multipart.getParameter("eventoG");
			String invitados = multipart.getParameter("txtInv");
			String idea = multipart.getParameter("idea");
			String fecha = multipart.getParameter("txtFecha");
			
			
			File imageFile = multipart.getFile("txtImage");
			String image = "";
			boolean attach = false;
			if (imageFile != null){
				image = imageFile.getName();
				attach = true;		
			
			}
			final boolean attachment = attach;
			final  String[] productos = { torta, cupcakes, gelatina};
			
			final Client client = (Client) CommandExecutor.getInstance().executeDatabaseCommand(new command.SelectClient(Long.valueOf(clientAux.getId())));
			
			/* Creación del archivo para enviarlo por correo*/	
			String dir = dirPath;
			int pointIndex = image.indexOf(".");
			String extension = image.substring(pointIndex);
			String nameImg = image.substring(0,pointIndex);
			// Nombre del usuario actual
			image = nameImg.toLowerCase().replace(" ", "_") + "_" + client.getLastName() + extension;
			File destination = new File(dir + image);
			imageFile.renameTo(destination);
			final String[] datos = {name, invitados,  idea, fecha, dir + image};
			
			
			new Thread(new Runnable() {
			    public void run() {
		    		SendEmail.sendEmailOrderOcEsp(propertiesFile, "123", attachment, "contrato", datos, productos, client);
						
			    }
			}).start();
			
			rd = getServletContext().getRequestDispatcher("/ocaEspConfirmation.jsp");
			rd.forward(request, response);
		
		}catch (Exception e) {
			request.setAttribute("info", "");
			request.setAttribute("error", "Ocurrió un error durante la creación del álbum. Por favor intente de nuevo y si el error persiste contacte a su administrador.");
			rd = getServletContext().getRequestDispatcher("/ListAlbumsServlet");			

			rd.forward(request, response);
		}
	
	}
}
