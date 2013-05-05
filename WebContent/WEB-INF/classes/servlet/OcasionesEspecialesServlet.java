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

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import command.CommandExecutor;

import domain.Album;
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
		
		String path = request.getSession().getServletContext().getRealPath("/");
		path = path + "files\\pedidosOcasionesEspeciales";
		
		MultipartRequest multipart = new MultipartRequest(request, path,
					5*1024*1024, new DefaultFileRenamePolicy());
		
		HttpSession infoPage = request.getSession();
		Client client = (Client) infoPage.getAttribute("client");
		try{			
			String name = multipart.getParameter("txtName");
			String torta = multipart.getParameter("eventoT");
			String cupcakes = multipart.getParameter("eventoC");
			String gelatina = multipart.getParameter("eventoG");
			String invitados = multipart.getParameter("txtInv");
			String idea = multipart.getParameter("idea");
			File imageFile = multipart.getFile("txtImage");
			String image = "";
			if (imageFile != null)
				image = imageFile.getName();
			
			System.out.println("oca " + name + '/' + torta + '/' + cupcakes + '/' + gelatina + '/' + invitados  
					+  '/' + idea + '/' + image + '/' + client.getId());
//			
//			String dir = propertiesFile.getProperty("albumsDirectory") + propertiesFile.getProperty("fileSeparator") + album.getDirectory();
//			File file = new File(dir);				
//			
//			file.mkdir();
//			
//			int pointIndex = image.indexOf(".");
//			String extension = image.substring(pointIndex);
//
//			image = album.getId() + "_" + album.getName().toLowerCase().replace(" ", "_") + "_cover" + extension;
//			
//			File destination = new File(dir + propertiesFile.getProperty("fileSeparator") + image);
//				
//			imageFile.renameTo(destination);								
//			album.setImage(image);
//			rowsUpdated  = (Integer) CommandExecutor.getInstance().executeDatabaseCommand(new command.EditAlbum(album));
//				
//			if(rowsUpdated == 1){
//				request.setAttribute("info", "El álbum fue creado exitosamente.");
//				request.setAttribute("error", "");
//				rd = getServletContext().getRequestDispatcher("/ListAlbumsServlet");			
//				rd.forward(request, response);
//			} else {
//				request.setAttribute("info", "");
//				request.setAttribute("error", "Ocurrió un error durante la creación del álbum. Por favor intente de nuevo y si el error persiste contacte a su administrador.");
//				rd = getServletContext().getRequestDispatcher("/ListAlbumsServlet");			
//
//				rd.forward(request, response);
//			}			
		}catch (Exception e) {
			request.setAttribute("info", "");
			request.setAttribute("error", "Ocurrió un error durante la creación del álbum. Por favor intente de nuevo y si el error persiste contacte a su administrador.");
			rd = getServletContext().getRequestDispatcher("/ListAlbumsServlet");			

			rd.forward(request, response);
		}
	
	}
}
