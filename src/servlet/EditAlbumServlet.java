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
import domain.User;

/**
 * Servlet implementation class EditDownloadAlbumServlet
 */
@WebServlet(description = "servlet to edit album", urlPatterns = { "/EditAlbumServlet" })
public class EditAlbumServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	/**
     * @see HttpServlet#HttpServlet()
     */
    public EditAlbumServlet() {
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
				Long albumId = Long.valueOf(request.getParameter("albumId"));
				Album albumInfo = (Album)CommandExecutor.getInstance().executeDatabaseCommand(new command.SelectAlbum(albumId));
				request.setAttribute("albumInfo", albumInfo);
				request.setAttribute("albumId", albumId);
				
				rd = getServletContext().getRequestDispatcher("/admin/editAlbum.jsp");			

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
		Properties propertiesFile = new Properties();
		propertiesFile.load( new FileInputStream( getServletContext().getInitParameter("properties") ) );
		MultipartRequest multipart = new MultipartRequest(request, propertiesFile.getProperty("albumsDirectory"), 5*1024*1024, new DefaultFileRenamePolicy());
				
		try{
			Long albumId = Long.valueOf(multipart.getParameter("txtAlbumId"));
			String name = multipart.getParameter("txtName");
			File imageFile = multipart.getFile("txtImage");
			String dir = propertiesFile.getProperty("albumsDirectory") + propertiesFile.getProperty("fileSeparator") + Album.getDirectory(albumId) + 
				propertiesFile.getProperty("fileSeparator");
			String image;
			
			try{
				image = imageFile.getName();
				
				int pointIndex = image.indexOf(".");
				String extension = image.substring(pointIndex);

				image = albumId + "_" + name.toLowerCase().replace(" ", "_") + "_cover" + extension;

				File destination = new File(dir + image);	
				String currentImage = multipart.getParameter("txtCurrentImage");
				File currentFile = new File(dir + currentImage);
				
				currentFile.delete();				
				imageFile.renameTo(destination);
				
			} catch (NullPointerException e){
				image = multipart.getParameter("txtCurrentImage");
				imageFile = new File(dir + image);
				
				int pointIndex = image.indexOf(".");
				String extension = image.substring(pointIndex);

				image = albumId + "_" + name.toLowerCase().replace(" ", "_") + "_cover" + extension;

				File destination = new File(dir + image);
				
				imageFile.renameTo(destination);
			}
			
			int isActive = 0;
			int isNew = 0;
			
			if (multipart.getParameter("txtIsActive") != null)
				isActive = 1;			
			
			if (multipart.getParameter("txtIsNew") != null)
				isNew = 1;	
			
			Album album = new Album();
			album.setId(albumId);
			album.setName(name);
			album.setImage(image);
			album.setActive(isActive);
			album.setNew(isNew);			
			
			Integer rowsUpdated = (Integer) CommandExecutor.getInstance().executeDatabaseCommand(new command.EditAlbum(album));
			
			if(rowsUpdated == 1){
				request.setAttribute("info", "El �lbum fue editado exitosamente.");
				request.setAttribute("error", "");
				rd = getServletContext().getRequestDispatcher("/ListAlbumsServlet");			

				rd.forward(request, response);
			} else {
				request.setAttribute("info", "");
				request.setAttribute("error", "Ocurri� un error durante la edici�n del �lbum. Por favor intente de nuevo y si el error persiste contacte a su administrador.");
				rd = getServletContext().getRequestDispatcher("/ListAlbumsServlet");			

				rd.forward(request, response);
			}
			
		} catch (Exception e) {
			request.setAttribute("info", "");
			request.setAttribute("error", "Ocurri� un error durante la edici�n del �lbum. Por favor intente de nuevo y si el error persiste contacte a su administrador.");
			rd = getServletContext().getRequestDispatcher("/ListAlbumsServlet");			

			rd.forward(request, response);
		}
	}
}
